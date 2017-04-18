package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.mapper.FlowConfigMapper;
import cn.gov.ahcourt.casecomment.mapper.FlowHistoryMapper;
import cn.gov.ahcourt.casecomment.mapper.FlowJobMapper;
import cn.gov.ahcourt.casecomment.mapper.FlowMapper;
import cn.gov.ahcourt.casecomment.utils.FlowTypes;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.TimeUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class FlowService {

	@Resource
	private FlowMapper flowMapper;
	@Resource
	private FlowHistoryMapper flowHistoryMapper;
	@Resource
	private FlowJobMapper flowJobMapper;
	@Resource
	private FlowConfigMapper flowConfigMapper;
	@Resource
	private UserService userService;

//	@Resource
//	private BusinessProjectMapper businessProjectMapper;
//	@Resource
//	private ProjectTaskMapper projectTaskMapper;
//	@Resource
//	private ProjectTeamMapper projectTeamMapper;

	/**
	 * 公共流程service提供的审核方法，任何审核操作逻辑几种在此。
	 * 
	 * @return
	 */
	@Transactional
	public FlowResult verify(String jobid, String passOrReject, String advice, UserBean user) {
		FlowResult result = new FlowResult();
		if (user == null) {
			result.setResult(false);
			result.setErrorMsg("用户不存在");
			return result;
		}
		FlowJobBean job = flowJobMapper.selectById(jobid);
		if (job == null) {
			result.setResult(false);
			result.setErrorMsg("审核任务不存在");
		} else {
			result.setJob(job);
			boolean sfjs = false;
			// 审核不通过
			if ("10502".equals(passOrReject)) {
				// 退回到申请人
				if (0 == job.getShbtgthbz()) {
					sfjs = true;
				} else {
					// 退回上一环节
					FlowConfigBean configBean = null;
					List<FlowConfigBean> configarr = flowConfigMapper.selectPrev(job.getLcpzid());
					if (configarr != null) {
						for (FlowConfigBean config : configarr) {
							List<Map<String, Object>> rolelist = flowMapper.selectFlowRole(config.getId());
							if (rolelist == null || rolelist.size() > 0 && flowMapper.checkFlowConfig(job.getShnrid(), job.getSqr(), job.getLcmk(), rolelist) == 1) {
								configBean = config;
								break;
							}
						}
					}
					if (configBean == null) {
						sfjs = true;
					} else {
						flowMapper.updateJob(jobid, configBean, user.getYhid());
					}
				}
			} else if ("10501".equals(passOrReject)) {
				// 审核最后一步
				if ("1".equals(job.getSfzhyb())) {
					sfjs = true;
				} else {
					// 更新到下一个环节
					if ("0".equals(job.getLcbb())) {// 非配置流程
//						if (FlowTypes.成果审核.getCode().equals(job.getLcmk())) {
//							String zjid = null;
//							ProjectTaskBean rw = projectTaskMapper.selectByPrimaryKey(job.getShnrid());
//							BusinessProjectBean project = businessProjectMapper.selectById(rw.getXmid());
//							if (StringUtils.isBlank(project.getSszj())) {
//								zjid = flowMapper.getzj(job.getShnrid());
//								if (user.getYhid().equals(zjid)) {
//									zjid = null;
//								}
//							} else {
//								zjid = project.getSszj();
//							}
//							if (StringUtils.isBlank(zjid)) {
//								result.setResult(false);
//								result.setErrorMsg("专家组为空或没有符合条件的专家");
//								return result;
//							} else if (flowMapper.updatenextcgsh(job.getShnrid(), zjid, user.getYhid()) > 0) {
//								ProjectTaskBean task = projectTaskMapper.selectByPrimaryKey(job.getShnrid());
//								UserBean zj = userService.getById(zjid);
//								ProjectTeamBean bean = new ProjectTeamBean();
//								bean.setCyid(IdGen.uuid());
//								bean.setCreate_by(user.getYhid());
//								bean.setUpdate_by(user.getYhid());
//								bean.setXmid(task.getXmid());
//								bean.setGw("专家");
//								bean.setYhid(zjid);
//								bean.setYhm(zj.getXm());
//								bean.setMs("成果审核专家");
//								bean.setSfcshry("1");
//								projectTeamMapper.insertSelective(bean);
//							} else {
//								result.setResult(false);
//								result.setErrorMsg("更新失败");
//								return result;
//							}
//						}
					} else {
						// 进行下一环节
						FlowConfigBean configBean = null;
						int bzxh = job.getDqbz();
						while (configBean == null) {
							List<FlowConfigBean> configarr = flowConfigMapper.selectByXh(job.getLcmk(), job.getLcbb(), ++bzxh);
							if (configarr == null || configarr.size() == 0) {
								break;
							}
							for (FlowConfigBean config : configarr) {
								List<Map<String, Object>> rolelist = flowMapper.selectFlowRole(config.getId());
								if (rolelist == null || rolelist.size() > 0 && flowMapper.checkFlowConfig(job.getShnrid(), job.getSqr(), job.getLcmk(), rolelist) == 1) {
									configBean = config;
									break;
								}
							}
						}
						if (configBean == null) {
							sfjs = true;
						} else {
							flowMapper.updateJob(jobid, configBean, user.getYhid());
						}
					}
				}
			}
			result.setSfjs(sfjs);
			if (sfjs) {// 删除job
				flowJobMapper.delete(job.getId());
			}
			// 插入历史数据
			FlowHistoryBean history = new FlowHistoryBean();
			history.setId(IdGen.uuid());
			history.setShnrid(job.getShnrid());
			history.setLcmk(job.getLcmk());
			history.setShjg(passOrReject);
			history.setShyj(advice);
			history.setBzxh(job.getDqbz());
			history.setSfzhyb(job.getSfzhyb());
			history.setShhj(job.getDqbzmc());
			history.setShr(user.getYhid());
			history.setCreate_by(user.getYhid());
			history.setCreate_date(TimeUtils.format());
			history.setUpdate_by(user.getYhid());
			flowHistoryMapper.insertSelective(history);
			result.setResult(true);
		}
		return result;
	}

	/**
	 * 初次提交审核调用的方法
	 * 
	 * @param entityid
	 * @param lcmk
	 *            审核类型(对应审核流程类型码表)
	 * @return
	 */
	@Transactional
	public FlowResult firstVerify(String entityid, String lcmk, UserBean user) {
		FlowResult result = new FlowResult();
		if (user == null) {
			result.setResult(false);
			result.setErrorMsg("用户不存在");
		} else if (lcmk == null) {
			result.setResult(false);
			result.setErrorMsg("流程类型不存在");
		} else {
			flowMapper.deleteOld(entityid, lcmk);
			FlowConfigBean configBean = null;
			int bzxh = 1;
			int lcbb = flowConfigMapper.selectDqbb(lcmk);
			if (lcbb > 0) {
				while (configBean == null) {
					List<FlowConfigBean> configarr = flowConfigMapper.selectByXh(lcmk, String.valueOf(lcbb), bzxh++);
					if (configarr == null || configarr.size() == 0) {
						break;
					}
					for (FlowConfigBean config : configarr) {
						List<Map<String, Object>> rolelist = flowMapper.selectFlowRole(config.getId());
						if (rolelist == null || rolelist.size() == 0 || flowMapper.checkFlowConfig(entityid, user.getYhid(), lcmk, rolelist) == 1) {
							configBean = config;
							break;
						}
					}
				}
				if (configBean != null) {
					result.setResult(true);
					flowMapper.insertJob(entityid, configBean, user.getYhid());
				} else {
					result.setResult(false);
					result.setType(14902);
					result.setErrorMsg("不满足流程定义的条件，无法提交");
				}
			} else {
				result.setResult(false);
				result.setType(14901);
				result.setErrorMsg("流程未定义，新建失败");
			}
		}
		return result;
	}

	/**
	 * 初次提交审核调用的方法
	 * 
	 * @param entityid
	 * @param flowType
	 *            审核类型(自定义审核流程类型)
	 * @return
	 */
	public FlowResult firstVerify(String entityid, FlowTypes flowType, UserBean user) {
		FlowResult result = new FlowResult();
		if (user == null) {
			result.setResult(false);
			result.setErrorMsg("用户不存在");
		} else {
			switch (flowType) {
			case 成果审核:
				flowJobMapper.deleteByshnrid(entityid);
				FlowJobBean bean = new FlowJobBean();
				bean.setId(IdGen.uuid());
				bean.setLcmk(flowType.getCode());
				bean.setShnrid(entityid);
				bean.setDqbz(2);
				bean.setLcbb("0");
				bean.setDqbzmc("二审");
				bean.setShbtgthbz(0);
				bean.setShztlx("2");
				bean.setSfzhyb("0");
				bean.setCreate_by(user.getYhid());
				bean.setUpdate_by(user.getYhid());
				if (flowJobMapper.insertbyRw(bean) > 0) {
					result.setResult(true);
				} else {
					result.setResult(false);
					result.setErrorMsg("任务创建失败");
				}
				break;
			default:
				result.setResult(false);
				result.setErrorMsg("流程类型不存在");
				break;
			}
		}
		return result;
	}

	public List<FlowHistoryBean> historyList(String shnrid, String lcmk) {
		FlowHistoryBean bean = new FlowHistoryBean();
		bean.setShnrid(shnrid);
		bean.setLcmk(lcmk);
		return flowHistoryMapper.selectList(bean);
	}

}
