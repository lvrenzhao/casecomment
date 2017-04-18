package cn.gov.ahcourt.casecomment.service;

import java.util.List;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.SettingBean;
import cn.gov.ahcourt.casecomment.bean.SettingKeys;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.SettingMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SettingService {

	@Resource
	private SettingMapper settingMapper;

	public List<SettingBean> selectList(SettingBean bean) {
		return settingMapper.selectList(bean);
	}

	public SettingBean selectByPrimaryKey(String szid) {
		return settingMapper.selectByPrimaryKey(szid);
	}

	public SettingBean selectByKey(String key) {
		return settingMapper.selectByKey(key);
	}

	public int insertSelective(SettingBean bean) {
		return settingMapper.insertSelective(bean);
	}

	public int updateByKeySelective(SettingBean bean) {
		return settingMapper.updateByKeySelective(bean);
	}

	public int deleteByPrimaryKey(String szid) {
		return settingMapper.deleteByPrimaryKey(szid);
	}

	@Transactional
	public int set(UserBean user, SettingKeys setting, String value) {
		settingMapper.deleteBySetKey(setting.getKey());
		SettingBean bean = new SettingBean();
		bean.setSzid(IdGen.uuid());
		bean.setSetkey(setting.getKey());
		bean.setSetvalue(value);
		bean.setMs(setting.getMs());
		bean.setCreate_by(user.getYhid());
		bean.setUpdate_by(user.getYhid());
		return settingMapper.insertSelective(bean);
	}

	@Transactional
	public int set(UserBean user, String key, String value, String ms) {
		settingMapper.deleteBySetKey(key);
		SettingBean bean = new SettingBean();
		bean.setSzid(IdGen.uuid());
		bean.setSetkey(key);
		bean.setSetvalue(value);
		bean.setMs(ms);
		bean.setCreate_by(user.getYhid());
		bean.setUpdate_by(user.getYhid());
		return settingMapper.insertSelective(bean);
	}

	public SettingBean get(SettingKeys setting) {
		SettingBean bean = new SettingBean();
		bean.setSetkey(setting.getKey());
		List<SettingBean> list = settingMapper.selectList(bean);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public SettingBean get(String key) {
		SettingBean bean = new SettingBean();
		bean.setSetkey(key);
		List<SettingBean> list = settingMapper.selectList(bean);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public SettingBean selectCount(String setkey, String create_by) {
		return settingMapper.selectCount(setkey, create_by);
	}

}
