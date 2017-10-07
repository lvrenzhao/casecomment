package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdCheck;
import cn.gov.ahcourt.casecomment.bean.BdCheckCases;
import cn.gov.ahcourt.casecomment.bean.UserBean;
import cn.gov.ahcourt.casecomment.mapper.*;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lvrenzhao on 2017/8/24.
 */
@Controller
@RequestMapping("/mind")
public class XMindController {

    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private BdCheckCasesMapper bdCheckCasesMapper;

    @Resource
    private BdScoretablesMapper bdScoretablesMapper;

    @Resource
    private BdCheckMapper bdCheckMapper;

    @Resource
    private BdCheckDistributionMapper bdCheckDistributionMapper;

    @Resource
    private BdCheckGroupsMapper bdCheckGroupsMapper;

    @Resource
    private BdCheckProsMapper bdCheckProsMapper;

    @Resource
    private BdCheckReadMapper bdCheckReadMapper;

    @Resource
    private BdCheckRejectReadMapper bdCheckRejectReadMapper;

    @Resource
    private BdCheckLevelsMapper bdCheckLevelsMapper;

    @Resource
    private BdScoretableItemsMapper bdScoretableItemsMapper;


    @RequestMapping("badge_ajpc_sh")
    public @ResponseBody int badge_ajpc_sh(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdCheck bean = new BdCheck();
        bean.setZt("0");
        List<BdCheck> items = bdCheckMapper.selectAll(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_ajpc_gg")
    public @ResponseBody int badge_ajpc_gg(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdCheck bean = new BdCheck();
        bean.setZt("1");
        bean.setUserid(user.getYhid());
        List<BdCheck> items = bdCheckMapper.selectAll(bean);
        int count = 0;
        for(int i = 0 ; items != null && i < items.size(); i ++){
            if("0".equals(items.get(i).getSfyd())){
                count++;
            }
        }
        return count;
    }

    @RequestMapping("badge_ajpc_pc")
    public @ResponseBody int badge_ajpc_pc(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdCheckCases bean = new BdCheckCases();
        bean.setProid(user.getYhid());
        bean.setTasktype("1");
        List<BdCheckCases> items = bdCheckCasesMapper.selectWork(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_ajpc_reject")
    public @ResponseBody int badge_ajpc_reject(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdCheck bean = new BdCheck();
        bean.setZt("2");
        bean.setUserid(user.getYhid());
        List<BdCheck> items = bdCheckMapper.selectAll(bean);
        int count = 0;
        for(int i = 0 ; items != null && i < items.size(); i ++){
            if("0".equals(items.get(i).getSfyd2())){
                count++;
            }
        }
        return count;
    }

    @RequestMapping("badge_sjpx_sh")
    public @ResponseBody int badge_sjpx_sh(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_sjpx_gg")
    public @ResponseBody int badge_sjpx_gg(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_sjpx_px")
    public @ResponseBody int badge_sjpx_px(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_sjpx_fp")
    public @ResponseBody int badge_sjpx_fp(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_sjpx_reject")
    public @ResponseBody int badge_sjpx_reject(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_xxgk_xxsh")
    public @ResponseBody int badge_xxgk_xxsh(@SessionScope("user")UserBean user){
        return 2;
    }

    @RequestMapping("badge_xxgk_dwck")
    public @ResponseBody int badge_xxgk_dwck(@SessionScope("user")UserBean user){
        return 2;
    }


}
