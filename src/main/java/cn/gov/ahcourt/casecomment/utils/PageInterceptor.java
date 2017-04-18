package cn.gov.ahcourt.casecomment.utils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.springframework.util.StringUtils;

import cn.gov.ahcourt.casecomment.bean.BaseEntity;
import cn.gov.ahcourt.casecomment.utils.Order.Direction;

@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }) })
public class PageInterceptor implements Interceptor {
	private static final Log logger = LogFactory.getLog(PageInterceptor.class);
	private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
	private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();
	private static String defaultDialect = "mysql"; // 数据库类型(默认为mysql)
	private static String defaultPageSqlId = ".*Page$"; // 需要拦截的ID(正则匹配)
	private static String defaultInsertSqlId = "^insert.*"; // 插入方法的ID(正则匹配)
	private static String defaultUpdateSqlId = "^update.*"; // 更新方法的ID(正则匹配)
	private static String dialect = ""; // 数据库类型(默认为mysql)
	private static String pageSqlId = ""; // 需要拦截的ID(正则匹配)
	private static String insertSqlId = ""; // 插入方法的ID(正则匹配)
	private static String updateSqlId = ""; // 更新方法的ID(正则匹配)

	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
		MetaObject metaStatementHandler = MetaObject.forObject(statementHandler, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
		// 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环可以分离出最原始的的目标类)
		while (metaStatementHandler.hasGetter("h")) {
			Object object = metaStatementHandler.getValue("h");
			metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
		}
		// 分离最后一个代理对象的目标类
		while (metaStatementHandler.hasGetter("target")) {
			Object object = metaStatementHandler.getValue("target");
			metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
		}
		Configuration configuration = (Configuration) metaStatementHandler.getValue("delegate.configuration");
		dialect = configuration.getVariables().getProperty("dialect");
		if (null == dialect || "".equals(dialect)) {
			logger.warn("Property dialect is not setted,use default 'mysql' ");
			dialect = defaultDialect;
		}
		pageSqlId = configuration.getVariables().getProperty("pageSqlId");
		if (null == pageSqlId || "".equals(pageSqlId)) {
			logger.warn("Property pageSqlId is not setted,use default '" + defaultPageSqlId + "' ");
			pageSqlId = defaultPageSqlId;
		}
		insertSqlId = configuration.getVariables().getProperty("insertSqlId");
		if (null == insertSqlId || "".equals(insertSqlId)) {
			logger.warn("Property insertSqlId is not setted,use default '" + defaultInsertSqlId + "' ");
			insertSqlId = defaultInsertSqlId;
		}
		updateSqlId = configuration.getVariables().getProperty("updateSqlId");
		if (null == updateSqlId || "".equals(updateSqlId)) {
			logger.warn("Property updateSqlId is not setted,use default '" + defaultUpdateSqlId + "' ");
			updateSqlId = defaultUpdateSqlId;
		}
		MappedStatement mappedStatement = (MappedStatement) metaStatementHandler.getValue("delegate.mappedStatement");
		if (mappedStatement.getId().matches(insertSqlId)) {
			Object param = metaStatementHandler.getValue("delegate.boundSql.parameterObject");
			if (param instanceof BaseEntity && param != null) {
				BaseEntity page = (BaseEntity) param;
				Field field = page.getClass().getDeclaredField("create_date");
				field.setAccessible(true);
				field.set(page, TimeUtils.format());
			}
		} else if (mappedStatement.getId().matches(updateSqlId)) {
			Object param = metaStatementHandler.getValue("delegate.boundSql.parameterObject");
			if (param instanceof BaseEntity && param != null) {
				BaseEntity page = (BaseEntity) param;
				Field field = page.getClass().getDeclaredField("update_date");
				field.setAccessible(true);
				field.set(page, TimeUtils.format());
			}
		} else if (mappedStatement.getId().matches(pageSqlId)) {
			BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");
			Object parameterObject = boundSql.getParameterObject();
			if (parameterObject != null) {
				Object param = metaStatementHandler.getValue("delegate.boundSql.parameterObject");
				if (param instanceof BaseEntity && param != null) {
					BaseEntity page = (BaseEntity) param;
					String sql = boundSql.getSql();
					Connection connection = (Connection) invocation.getArgs()[0];
					// 获取数据范围
					setRoleRange(connection, page, mappedStatement.getId());
					// 重写sql
					String pageSql = buildPageSql(sql, page);
					metaStatementHandler.setValue("delegate.boundSql.sql", pageSql);
					// 采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
					metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
					metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);
					if (!page.noRows()) {
						// 重设分页参数里的总页数等
						setPageParameter(sql, connection, mappedStatement, boundSql, page);
					}
				}
			}
		}
		// 将执行权交给下一个拦截器
		return invocation.proceed();
	}

	private void setRoleRange(Connection connection, BaseEntity page, String mapperid) {
		if (!page.noRole()) {
			String sql = "SELECT MAX(srg.sjqx) from sd_menu_grid smg INNER JOIN sd_role_gridrange srg  ON smg.cdbgid = srg.bgid INNER JOIN sd_user su ON FIND_IN_SET(srg.jsid,REPLACE(su.jsid,';',',')) WHERE smg.bgcxffid = '"
					+ mapperid + "' and  su.yhid = '" + page.getScopeId() + "'";
			PreparedStatement countStmt = null;
			ResultSet rs = null;
			try {
				countStmt = connection.prepareStatement(sql);
				rs = countStmt.executeQuery();
				if (rs.next()) {
					int scopetype = rs.getInt(1);
					if (scopetype != 0) {
						page.setScopeType(scopetype);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 从数据库里查询总的记录数并计算总页数，回写进分页参数<code>PageParameter</code>,这样调用者就可用通过 分页参数
	 * <code>PageParameter</code>获得相关信息。
	 * 
	 * @param sql
	 * @param connection
	 * @param mappedStatement
	 * @param boundSql
	 * @param page
	 */
	private void setPageParameter(String sql, Connection connection, MappedStatement mappedStatement, BoundSql boundSql, BaseEntity page) {
		StringBuilder pageSql = new StringBuilder(sql);
		pageSql = buildSqlByRole(pageSql, page);
		// 记录总记录数
		String countSql = "select count(0) from (" + pageSql.toString() + ") as total";
		PreparedStatement countStmt = null;
		ResultSet rs = null;
		try {
			countStmt = connection.prepareStatement(countSql);
			// 由于该物理分页不支持mybatis的<foreach>标签，so对该分页做一下更改
			BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), sql, boundSql.getParameterMappings(), boundSql.getParameterObject());
			Field metaParamsField = ReflectUtil.getFieldByFieldName(boundSql, "metaParameters");
			if (metaParamsField != null) {
				MetaObject mo = (MetaObject) ReflectUtil.getValueByFieldName(boundSql, "metaParameters");
				ReflectUtil.setValueByFieldName(countBS, "metaParameters", mo);
			}
			setParameters(countStmt, mappedStatement, countBS, boundSql.getParameterObject());

			rs = countStmt.executeQuery();
			int totalCount = 0;
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
			page.setTotalCount(totalCount);
			int totalPage = totalCount / page.getRows() + ((totalCount % page.getRows() == 0) ? 0 : 1);
			page.setTotalPage(totalPage);

		} catch (SQLException e) {
			logger.error("Ignore this exception", e);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error("Ignore this exception", e);
			}
			try {
				countStmt.close();
			} catch (SQLException e) {
				logger.error("Ignore this exception", e);
			}
		}

	}

	/**
	 * 对SQL参数(?)设值
	 * 
	 * @param ps
	 * @param mappedStatement
	 * @param boundSql
	 * @param parameterObject
	 * @throws SQLException
	 */
	private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql, Object parameterObject) throws SQLException {
		ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, boundSql);
		parameterHandler.setParameters(ps);
	}

	/**
	 * 根据数据库类型，生成特定的分页sql
	 * 
	 * @param sql
	 * @param page
	 * @return
	 */
	private String buildPageSql(String sql, BaseEntity page) {
		if (page != null) {
			StringBuilder pageSql = new StringBuilder();
			if ("mysql".equals(dialect)) {
				pageSql = buildPageSqlForMysql(sql, page);
			} else if ("oracle".equals(dialect)) {
				pageSql = buildPageSqlForOracle(sql, page);
			} else {
				return sql;
			}
			return pageSql.toString();
		} else {
			return sql;
		}
	}

	/**
	 * mysql的分页语句
	 * 
	 * @param sql
	 * @param page
	 * @return String
	 */
	public StringBuilder buildPageSqlForMysql(String sql, BaseEntity page) {
		StringBuilder pageSql = new StringBuilder(100);
		pageSql.append(sql);
		if (!page.noOrder()) {
			Order order = new Order(page.getSidx(), Direction.fromString(page.getSord()), null);
			pageSql.append(" order by " + order.toString());
		}
		if (!page.noPage()) {
			pageSql = buildSqlByRole(pageSql, page);
			String beginrow = String.valueOf((page.getPage() - 1) * page.getRows());
			pageSql.append(" limit " + beginrow + "," + page.getRows());
		} else if (!page.noRows()) {
			pageSql = buildSqlByRole(pageSql, page);
			pageSql.append(" limit " + page.getRows());
		} else {
			pageSql = buildSqlByRole(pageSql, page);
		}
		return pageSql;
	}

	/**
	 * 参考hibernate的实现完成oracle的分页
	 * 
	 * @param sql
	 * @param page
	 * @return String
	 */
	public StringBuilder buildPageSqlForOracle(String sql, BaseEntity page) {
		StringBuilder pageSql = new StringBuilder(100);
		String beginrow = String.valueOf((page.getPage() - 1) * page.getRows());
		String endrow = String.valueOf(page.getPage() * page.getRows());

		pageSql.append("select * from ( select temp.*, rownum row_id from ( ");
		pageSql.append(sql);
		if (!StringUtils.isEmpty(page.getSidx()) && !StringUtils.isEmpty(page.getSord())) {
			Order order = new Order(page.getSidx(), Direction.fromString(page.getSord()), null);
			pageSql.append(" order by " + order.toString());
		}
		pageSql.append(" ) temp where rownum <= ").append(endrow);
		pageSql.append(") where row_id > ").append(beginrow);
		return pageSql;
	}

	public StringBuilder buildSqlByRole(StringBuilder sql, BaseEntity page) {
		if (!page.noRole()) {
			StringBuilder pageSql = new StringBuilder(100);
			switch (page.getScopeType()) {
			case 1:
				pageSql.append("SELECT temps.* FROM (");
				pageSql.append(sql);
				pageSql.append(") temps ");
				pageSql.append(" WHERE FIND_IN_SET('" + page.getScopeId() + "',temps.scopeId)");
				break;
			case 2:
				pageSql.append("SELECT temps.* FROM (");
				pageSql.append(sql);
				pageSql.append(") temps ");
				pageSql.append("INNER JOIN sd_user su ON temps.scopeId = su.yhid ");
				pageSql.append("WHERE su.zzid = (SELECT su_temp.zzid FROM sd_user su_temp WHERE FIND_IN_SET('" + page.getScopeId() + "',su_temp.yhid))");
				break;
			case 3:
				pageSql.append("SELECT temps.* FROM (");
				pageSql.append(sql);
				pageSql.append(") temps ");
				pageSql.append("INNER JOIN sd_user su ON temps.scopeId = su.yhid ");
				pageSql.append("INNER JOIN sd_organization so ON so.zzjgid = su.zzid ");
				pageSql.append("WHERE FIND_IN_SET(so.zzjgid,fn_get_childs((SELECT su_temp.zzid FROM sd_user su_temp WHERE FIND_IN_SET('" + page.getScopeId() + "',su_temp.yhid))))");
				break;
			// case 4:
			// pageSql.append("SELECT temps.* FROM (");
			// pageSql.append(sql);
			// pageSql.append(") temps ");
			// pageSql.append("INNER JOIN sd_user su ON temps.scopeId = su.id
			// ");
			// pageSql.append("INNER JOIN sd_office so ON so.id = su.office_id
			// ");
			// pageSql.append("INNER JOIN sd_company sc ON sc.id = so.company_id
			// ");
			// pageSql.append("WHERE sc.id LIKE CONCAT((SELECT
			// su_temp.company_id FROM sd_user su_temp WHERE su_temp.id = '" +
			// page.getScopeId() + "'),'%')");
			// break;
			default:
				pageSql = sql;
				break;
			}
			return pageSql;
		} else {
			return sql;
		}
	}

	public Object plugin(Object target) {
		// 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的次数
		if (target instanceof StatementHandler) {
			return Plugin.wrap(target, this);
		} else {
			return target;
		}
	}

	public void setProperties(Properties properties) {
	}

}