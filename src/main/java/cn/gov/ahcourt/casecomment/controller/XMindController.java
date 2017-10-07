package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.*;
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
    private BdCheckCasesMapper bdCheckCasesMapper;


    @Resource
    private BdCheckMapper bdCheckMapper;


    @Resource
    private BdChosenMapper bdChosenMapper;

    @Resource
    private BdChosenCasesMapper bdChosenCasesMapper;


    @Resource
    private BdPublishMapper bdPublishMapper;

    @Resource
    private BdPublishReadMapper bdPublishReadMapper;




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
        if(user == null){
            return 0;
        }
        BdChosen bean = new BdChosen();
        bean.setZt("0");
        List<BdChosen> items = bdChosenMapper.selectAll(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_sjpx_gg")
    public @ResponseBody int badge_sjpx_gg(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdChosen bean = new BdChosen();
        bean.setZt("1");
        bean.setUserid(user.getYhid());
        List<BdChosen> items = bdChosenMapper.selectAll(bean);
        int count = 0;
        for(int i = 0 ; items != null && i < items.size(); i ++){
            if("0".equals(items.get(i).getSfyd())){
                count++;
            }
        }
        return count;
    }

    @RequestMapping("badge_sjpx_px")
    public @ResponseBody int badge_sjpx_px(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdChosenCases bean = new BdChosenCases();
        bean.setProid(user.getYhid());
        bean.setTasktype("1");
        List<BdChosenCases> items = bdChosenCasesMapper.selectWork(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_sjpx_fp")
    public @ResponseBody int badge_sjpx_fp(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdChosen bean = new BdChosen();
        bean.setSffp("0");
        bean.setZt("1");
        List<BdChosen> items = bdChosenMapper.selectAll(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_sjpx_reject")
    public @ResponseBody int badge_sjpx_reject(@SessionScope("user")UserBean user){
        if(user == null){
            return 0;
        }
        BdChosen bean = new BdChosen();
        bean.setZt("2");
        bean.setUserid(user.getYhid());
        List<BdChosen> items = bdChosenMapper.selectAll(bean);
        int count = 0;
        for(int i = 0 ; items != null && i < items.size(); i ++){
            if("0".equals(items.get(i).getSfyd2())){
                count++;
            }
        }
        return count;
    }

    @RequestMapping("badge_xxgk_xxsh")
    public @ResponseBody int badge_xxgk_xxsh(@SessionScope("user")UserBean user){
        if (user == null) {
            return 0;
        }
        BdPublish bean = new BdPublish();
        bean.setShr(user.getYhid());
        List<BdPublish> items = bdPublishMapper.selectVerifyList(bean);
        return items==null?0: items.size();
    }

    @RequestMapping("badge_xxgk_dwck")
    public @ResponseBody int badge_xxgk_dwck(@SessionScope("user")UserBean user){
        if (user == null) {
            return 0;
        }
        BdPublish bean = new BdPublish();
        bean.setCreateBy(user.getYhid());
        List<BdPublish> items = bdPublishMapper.selectUnwatchedList(bean);
        return items==null?0: items.size();
    }


}
