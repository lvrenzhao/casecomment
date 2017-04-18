package cn.gov.ahcourt.casecomment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.gov.ahcourt.casecomment.bean.DictBean;
import cn.gov.ahcourt.casecomment.mapper.DictMapper;
import cn.gov.ahcourt.casecomment.utils.StringUtils;

@Service
public class DictService {

	@Resource
	private DictMapper dictMapper;

	public List<DictBean> selectList(DictBean record) {
		return dictMapper.selectList(record);
	}

	public DictBean selectById(String zdbh) {
		DictBean record = new DictBean();
		record.setZdbh(zdbh);
		List<DictBean> list = dictMapper.selectList(record);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public List<DictBean> selectListByParents(String parent_ids) {
		return dictMapper.selectListByParents(parent_ids);
	}

	public DictBean selectByName(String sjzdbh, String zdmc) {
		return dictMapper.selectByName(sjzdbh, zdmc);
	}

	public List<DictBean> selectListByGroup(String zdbh) {
		return dictMapper.selectListByGroup(zdbh);
	}

	public int insertSelective(DictBean record) {
		String zdbh = dictMapper.getNextId(record.getSjzdbh());
		if (StringUtils.isBlank(zdbh)) {
			zdbh = record.getSjzdbh() + "01";
		}
		record.setZdbh(zdbh);
		return dictMapper.insertSelective(record);
	}

	public int updateByIdSelective(DictBean record) {
		return dictMapper.updateByIdSelective(record);
	}

	public int deleteSelective(String zdbh) {
		DictBean entity = new DictBean();
		entity.setZdbh(zdbh);
		return dictMapper.deleteSelective(entity);
	}

	public String selectBhByNameSet(String sjzdbh, String zdmc) {
		return dictMapper.selectBhByNameSet(sjzdbh, zdmc);
	}

	public String getName(String dxbh) {
		return dictMapper.getName(dxbh);
	}

	public List<DictBean> selectListByP(String pid, String yhid, String xmid) {
		return dictMapper.selectListByP(pid, yhid, xmid);
	}

	public String getBl(DictBean dict) {
		return dictMapper.getBl(dict);
	}

	public List<DictBean> getBlList(DictBean dict) {
		return dictMapper.selectList(dict);
	}

	public DictBean selectOrInsertByName(String sjzdbh, String zdmc) {
		if (StringUtils.isNoneBlank(sjzdbh, zdmc)) {
			DictBean dict = dictMapper.selectByName(sjzdbh, zdmc);
			if (dict == null) {
				DictBean bean = new DictBean();
				bean.setSjzdbh(sjzdbh);
				bean.setZdmc(zdmc);
				insertSelective(bean);
				dict = dictMapper.selectByName(sjzdbh, zdmc);
			}
			return dict;
		}
		return null;
	}

}
