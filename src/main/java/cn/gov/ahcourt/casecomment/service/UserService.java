package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.UserMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

	@Resource
	private UserMapper userMapper;


	public Map getlist(UserBean bean) {
		return bean.toMap(userMapper.selectList(bean));
	}


	public List<UserBean> select(UserBean bean) {
		return userMapper.select(bean);
	}

	public List<UserBean> selectList(UserBean bean) {
		return userMapper.selectList(bean);
	}

	public int update(UserBean bean) {
		return userMapper.updateByIdSelective(bean);
	}

	public UserBean getById(String yhid) {
		return userMapper.getById(yhid);
	}

//	public UserBean selectByKqh(String kqh) {
//		return userMapper.selectByGh(kqh);
//	}

	public UserBean getByzh(String zh) {
		UserBean bean = new UserBean();
		bean.setZh(zh);
//		bean.setZhzt("1");
		List<UserBean> list = userMapper.selectList(bean);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			return list.get(0);
		}
	}

	public int saveOrUpdate(UserBean bean, UserBean user) {
		int num = 0;
		if (bean.getYhid() != null && bean.getYhid() != "") {
			bean.setUpdateBy(user.getYgid());
			num = userMapper.updateByIdSelective(bean);
		} else {
			bean.setYhid(IdGen.uuid());
			bean.setCreateBy(user.getYgid());
			bean.setUpdateBy(user.getYgid());
			if (bean.getTx() == null || bean.getTx() == "") {

			}
			num = userMapper.insertSelective(bean);
		}
		return num;
	}

	public Map selectuserlist(UserBean bean) {
		return bean.toMap(userMapper.selectuserlist(bean));
	}

	public UserBean getUser(String yhid) {
		return userMapper.getUser(yhid);
	}


	public Map zhgllist(UserBean bean) {
		return bean.toMap(userMapper.zhgllist(bean));
	}

//	public UserBean selectByGh(String gh) {
//		return userMapper.selectByGh(gh);
//	}

	public List<UserBean> getlistbyzzjgid(String zzjgid) {
		return userMapper.getlistbyzzjgid(zzjgid);
	}

	public List<UserBean> getlistbyzzjgids(UserBean bean) {
		return userMapper.getlistbyzzjgids(bean);
	}

	@Transactional
	public int updatemm(UserBean user, UserBean userBean) {
		if (user.getYmm() != null && user.getYmm() != "" && user.getMm() != null && user.getMm() != "") {
			if (!user.getYmm().equals(userBean.getMm())) {
				return 9;// 原密码不对
			} else {
//				if (user.getYgid() != null && user.getYgid() != "") {
//					OAStaffBean staff = new OAStaffBean();
//					staff.setYgid(user.getYgid());
//					staff.setTx(user.getTx());
//					oAStaffMapper.updateByIdSelective(staff);
//				}
				userMapper.updateByIdSelective(user);
				return 1;// 修改密码
			}
		} else {
			if (user.getTx().equals(userBean.getTx())) {
				userMapper.updateByIdSelective(user);
				return 3;// 头像未修改
			} else {
//				if (user.getYgid() != null && user.getYgid() != "") {
//					OAStaffBean staff = new OAStaffBean();
//					staff.setYgid(user.getYgid());
//					staff.setTx(user.getTx());
//					oAStaffMapper.updateByIdSelective(staff);
//				}
				userMapper.updateByIdSelective(user);
				return 2;// 修改头像
			}
		}
	}
}
