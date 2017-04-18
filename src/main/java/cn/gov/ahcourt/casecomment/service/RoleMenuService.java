package cn.gov.ahcourt.casecomment.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.gov.ahcourt.casecomment.bean.RoleMenuBean;
import cn.gov.ahcourt.casecomment.mapper.RoleMenuMapper;

@Service
public class RoleMenuService {

	@Resource
	RoleMenuMapper rolemenuMapper;

	@Transactional
	public int insertSelective(String jsid, String cdids, HttpSession httpSession) {
		int num = rolemenuMapper.deleteSelective(jsid);
		if (num == 0 && cdids == "") {
			num = -1;
		} else {
			String[] cdid = cdids.split(";");
			if (cdid[0] != null && cdid[0] != "") {
				List<RoleMenuBean> list = new ArrayList<RoleMenuBean>();
				for (int i = 0; i < cdid.length; i++) {
					RoleMenuBean bean = new RoleMenuBean();
					bean.setCdid(cdid[i]);
					bean.setJsid(jsid);
					list.add(bean);
					bean.setCreateBy((String) httpSession.getAttribute("userid"));
					bean.setUpdateBy((String) httpSession.getAttribute("userid"));

				}
				num += rolemenuMapper.insertSelective(list);
			}
		}
		return num;
	}
}
