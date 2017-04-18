package cn.gov.ahcourt.casecomment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.gov.ahcourt.casecomment.bean.MenuBean;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.MenuMapper;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class MenuService {

	@Resource
	private MenuMapper menuMapper;


	public List<Map<String, Object>> selectTreeList(MenuBean menu) {
		return menuMapper.selectTreeList(menu);
	}

	public MenuBean getById(String cdid) {
		return menuMapper.getById(cdid);
	}

	public int deleteById(String cdid) {
		String ids = menuMapper.getIds(cdid);
		String[] cdids = ids.split(",");

		return menuMapper.deleteById(cdids);
	}

	@Transactional
	public int saveOrupdateMenu(MenuBean menu, UserBean user) {
		int flag = 0;
		if (menu.getCdid() != null && menu.getCdid() != "") {
			menu.setUpdateBy(user.getYhid());
			flag = menuMapper.updateByIdSelective(menu);
		} else {
			menu.setCdid(IdGen.uuid());
			menu.setCreateBy(user.getYhid());
			menu.setUpdateBy(user.getYhid());
			flag = menuMapper.insertSelective(menu);
		}
		return flag;
	}

	public List<MenuBean> getMenusByParentID(String menuid,String roleids){
		return menuMapper.getMenusByParentID(menuid,roleids);
	}
	
	public List<MenuBean> getMenusByParentName(String menuid,String roleids){
		return menuMapper.getMenusByParentName(menuid,roleids);
	}

	public int move(UserBean user, String[] ids, String targetid, String type) {
		int count = 0;
		for (String id : ids) {
			count += menuMapper.updateMove(id, targetid, type, user.getYhid());
		}
		return count;
	}
}
