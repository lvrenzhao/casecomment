package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.mapper.*;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lvrenzhao on 2017/8/24.
 */

@Controller
@RequestMapping("/static")
public class XStaticsController {

    @Resource
    private BdCheckMapper bdCheckMapper;

    @Resource
    private BdCheckCasesMapper bdCheckCasesMapper;

    @Resource
    private BdChosenCasesMapper bdChosenCasesMapper;

    @Resource
    private BdChosenMapper bdChosenMapper;

    @Resource
    private SdProfessionalMapper sdProfessionalMapper;

    @RequestMapping("/checkreport")
    public @ResponseBody Map checkreport(BdCheck bean, @SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFlag("1");
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/chosenreport")
    public @ResponseBody Map chosenreport(BdChosen bean, @SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFlag("1");
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/topcheck")
    public @ResponseBody Map topcheck(BdCheckCases bean){
        return bean.toMap(bdCheckCasesMapper.selectTop(bean));
    }

    @RequestMapping("/topchosen")
    public @ResponseBody Map topchosen(BdChosenCases bean){
        return bean.toMap(bdChosenCasesMapper.selectTop(bean));
    }

    @RequestMapping("/checkdata")
    public @ResponseBody Map checkdata(String type,String kssj,String jssj){
        BdCheckCases bean = new BdCheckCases();
        if(StringUtils.isNotBlank(kssj) && StringUtils.isNotBlank(jssj)) {
            bean.setFqsj1(kssj);
            bean.setFqsj2(jssj);
        }
        if("1".equals(type)){
            List<Map> list= bdCheckCasesMapper.selectReportXz(bean);
            HashMap map = new HashMap();
            map.put("data",list);
            return map;
        }else if ("2".equals(type)){
            List<Map> list= bdCheckCasesMapper.selectReportLx(bean);
            HashMap map = new HashMap();
            map.put("data",list);
            return map;
        }
        return null;
    }

    @RequestMapping("/checkdatabyggid")
    public @ResponseBody Map checkdatabyggid(String type,String ggid){
        if("1".equals(type)){
            List<Map> list= bdCheckCasesMapper.selectReportXzByGGID(ggid);
            HashMap map = new HashMap();
            map.put("data",list);
            return map;
        }else if ("2".equals(type)){
            List<Map> list= bdCheckCasesMapper.selectReportLxByGGID(ggid);
            HashMap map = new HashMap();
            map.put("data",list);
            return map;
        }
        return null;
    }

    @RequestMapping("/checkpros")
    public @ResponseBody Map checkpros(String ggid){
        SdProfessional bean = new SdProfessional();
        return bean.toMap(sdProfessionalMapper.selectForActive(ggid));
    }

    @RequestMapping("/quality")
    public @ResponseBody Map quality(String ggid){
        List<Map> list= bdCheckCasesMapper.selectQuality(ggid);
        HashMap map = new HashMap();
        map.put("data",list);
        return map;
    }

}
