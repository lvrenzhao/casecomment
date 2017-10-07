package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.mapper.*;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lvrenzhao on 2017/8/24.
 */
@Controller
@RequestMapping("/chosen")
public class XChosenController {
    @Resource
    private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private BdChosenMapper bdChosenMapper;

    @Resource
    private BdScoretablesMapper bdScoretablesMapper;

    @Resource
    private BdScoretableItemsMapper bdScoretableItemsMapper;

    @Resource
    private BdChosenMsgtoMapper bdChosenMsgtoMapper;

    @Resource
    private BdChosenCasesMapper bdChosenCasesMapper;

    @Resource
    private BdChosenGroupsMapper bdChosenGroupsMapper;

    @Resource
    private BdChosenProsMapper bdChosenProsMapper;

    @Resource
    private  BdCheckDistributionMapper bdCheckDistributionMapper;

    @Resource
    private BdChosenReadMapper bdChosenReadMapper;

    @Resource
    private BdChosenRejectReadMapper bdChosenRejectReadMapper;

    @RequestMapping("/pfb")
    public @ResponseBody Map pfb() {
        BdScoretables bean = new BdScoretables();
        bean.setLx("2");
        bean.setSfqy("1");
        return bean.toMap(bdScoretablesMapper.selectAll(bean));
    }
    @RequestMapping("/publish")
    public @ResponseBody String publish(BdChosen bean, @SessionScope("user")UserBean user) {
        if (user == null) {
            return "-1";
        }
        try {
            String chosenid = IdGen.uuid();
            bean.setChosenid(chosenid);
            bean.setFqr(user.getYhid());
            bean.setFqsj(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
            bean.setZt("0");
            bean.setSffp("0");
            bdChosenMapper.insert(bean);
            if(StringUtils.isNotBlank(bean.getMsgtoids()) && StringUtils.isNotBlank(bean.getMsgtonames())){
                String[] ids = bean.getMsgtoids().split(";");
                String[] names = bean.getMsgtonames().split(";");
                for(int i = 0 ; i < ids.length ; i ++){
                    BdChosenMsgto item = new BdChosenMsgto();
                    item.setMsgtoid(IdGen.uuid());
                    item.setChosenid(chosenid);
                    item.setProid(ids[i]);
                    item.setProname(names[i]);
                    bdChosenMsgtoMapper.insert(item);
                }
            }
            return "1";
        } catch (Exception ex) {
            return "-1";
        }
    }

    @RequestMapping("/verifylist")
    public @ResponseBody Map verifylist(@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        BdChosen bean = new BdChosen();
        bean.setZt("0");
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/verifyhistorylist")
    public @ResponseBody Map verifyhistorylist(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setShrmc(user.getYhid());
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/dovefify")
    public @ResponseBody String dovefify(String ggid,String passorreject,String shyj,@SessionScope("user")UserBean user) {
        BdChosen bean = bdChosenMapper.selectByPrimaryKey(ggid);
        if(bean != null){
            bean.setZt(passorreject);
            if("2".equals(passorreject)){
                bean.setShyj(shyj);
            }
            bean.setShr(user.getYhid());
            bean.setShsj(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
            bdChosenMapper.updateByPrimaryKey(bean);
            return "1";
        }
        return "0";
    }

    @RequestMapping("/getchosen")
    public @ResponseBody BdChosen getchosen(String ggid){
        return bdChosenMapper.selectByPrimaryKey(ggid);
    }

    @RequestMapping("/chosencases")
    public @ResponseBody Map chosencases(String ggid,String gsfy,String xz,String lx ,String groupid,String undisted) {
        BdChosenCases bean = new BdChosenCases();
        bean.setChosenid(ggid);
        bean.setGsfy(gsfy);
        bean.setXz(xz);
        bean.setPsgroupid(groupid);
        bean.setRemarks(undisted);
        return bean.toMap(bdChosenCasesMapper.selectAll(bean));
    }

    @RequestMapping("/groups")
    public @ResponseBody Map groups(String ggid) {
        BdChosenGroups bean = new BdChosenGroups();
        bean.setChosenid(ggid);
        return bean.toMap(bdChosenGroupsMapper.selectAll(bean));
    }

    @RequestMapping("/distgsfy")
    public @ResponseBody Map distgsfy(String ggid) {
        BdCheckDistribution bean = new BdCheckDistribution();
        return bean.toMap(bdCheckDistributionMapper.selectChosenByGsfy(ggid));
    }

    @RequestMapping("/distajxz")
    public @ResponseBody Map distajxz(String ggid) {
        BdCheckDistribution bean = new BdCheckDistribution();
        return bean.toMap(bdCheckDistributionMapper.selectChosenByXz(ggid));
    }

    @RequestMapping("/notice")
    public @ResponseBody Map notice(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("1");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/setread")
    public @ResponseBody String setread(String ggid,String type,@SessionScope("user")UserBean user) {
        if(StringUtils.isNotBlank(ggid) && "1".equals(type)){
            BdChosenRead bean = new BdChosenRead();
            bean.setChosenid(ggid);
            bean.setReadman(user.getYhid());
            List<BdChosenRead> records = bdChosenReadMapper.selectAll(bean);
            if(records==null || records.size() == 0){
                bean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bean.setReadid(IdGen.uuid());
                bean.setReadtime(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bdChosenReadMapper.insert(bean);
            }
            return "1";
        }else if (StringUtils.isNotBlank(ggid) && "2".equals(type)){
            BdChosenRejectRead bean = new BdChosenRejectRead();
            bean.setChosenid(ggid);
            bean.setReadman(user.getYhid());
            List<BdChosenRejectRead> records = bdChosenRejectReadMapper.selectAll(bean);
            if(records==null || records.size() == 0){
                bean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bean.setReadid(IdGen.uuid());
                bean.setReadtime(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bdChosenRejectReadMapper.insert(bean);
            }
            return "1";
        }
        return "0";
    }

    @RequestMapping("/verifing")
    public @ResponseBody Map verifing(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("0");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/reject")
    public @ResponseBody Map reject(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("2");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }


    @RequestMapping("/mystart")
    public @ResponseBody Map mystart(BdChosenCases bean ,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFqr(user.getYhid());
        return bean.toMap(bdChosenCasesMapper.selectAll(bean));
    }

    @RequestMapping("/allstart")
    public @ResponseBody Map allstart(BdChosenCases bean) {
        return bean.toMap(bdChosenCasesMapper.selectAll(bean));
    }

    @RequestMapping("/incases")
    public @ResponseBody Map incases(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("1");
        bean.setJzrq1(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/mysubmit")
    public @ResponseBody Map mysubmit(BdChosenCases bean,@SessionScope("user")UserBean user) {
        bean.setCreateBy(user.getYhid());
        return bean.toMap(bdChosenCasesMapper.selectAll(bean));
    }

    @RequestMapping("/tbal")
    public @ResponseBody String tbal(String ah,String tjly,String ggid,@SessionScope("user")UserBean user){

        BdMiddleCase bean = new BdMiddleCase();
        bean.setAh(ah);
        List<BdMiddleCase> bmcs = bdMiddleCaseMapper.selectAll(bean);
        if(bmcs == null || bmcs.size() == 0 ){
            return "0";
        }else if (bmcs.size() > 1){
            return "1";
        }else{
            BdChosenCases cbean = new BdChosenCases();
            cbean.setChosenid(ggid);
            cbean.setAh(ah);
            List<BdChosenCases> cs = bdChosenCasesMapper.selectAll(cbean);
            if(cs == null || cs.size() == 0){
                cbean.setCcid(IdGen.uuid());
                cbean.setAjid(bmcs.get(0).getAjid());
                cbean.setTjly(tjly);
                cbean.setTbrq(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                cbean.setCreateBy(user.getYhid());
                cbean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bdChosenCasesMapper.insert(cbean);
            }else{
                return "2";
            }
        }
        return "9";
    }

    @RequestMapping("/dfp")
    public @ResponseBody Map dfp(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setSffp("0");
        bean.setZt("1");
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }
    @RequestMapping("/yfp")
    public @ResponseBody Map yfp(BdChosen bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setSffp("1");
        return bean.toMap(bdChosenMapper.selectAll(bean));
    }

    @RequestMapping("/groupsave")
    public @ResponseBody int groupsave(BdChosenGroups team,@SessionScope("user")UserBean user){
        team.setTdcy(team.getTeamleadername()+";"+team.getTeammatenames());
        if(StringUtils.isNotBlank(team.getCgid())){
            bdChosenGroupsMapper.updateByPrimaryKey(team);
            bdChosenProsMapper.deleteByGroupId(team.getCgid());
        }else{
            team.setCgid(IdGen.uuid());
            bdChosenGroupsMapper.insert(team);
        }
        BdChosenPros teamleader = new BdChosenPros();
        teamleader.setCpid(IdGen.uuid());
        teamleader.setChosenid(team.getChosenid());
        teamleader.setGroupid(team.getCgid());
        teamleader.setProid(team.getTeamleaderid());
        teamleader.setSfzz("1");
        bdChosenProsMapper.insert(teamleader);
        if(StringUtils.isNotBlank(team.getTeammateids())){
            String[] teammates = team.getTeammateids().split(";");
            for(int si = 0 ; teammates!=null && si < teammates.length ; si++){
                BdChosenPros teammate = new BdChosenPros();
                teammate.setCpid(IdGen.uuid());
                teammate.setChosenid(team.getChosenid());
                teammate.setGroupid(team.getCgid());
                teammate.setProid(teammates[si]);
                teammate.setSfzz("0");
                bdChosenProsMapper.insert(teammate);
            }
        }

        return -1;
    }



    @RequestMapping("/groupdel")
    public @ResponseBody int groupdel(String groupid,@SessionScope("user")UserBean user){
        bdChosenCasesMapper.setGroupNull(groupid);
        bdChosenProsMapper.deleteByGroupId(groupid);
        bdChosenGroupsMapper.deleteByPrimaryKey(groupid);
        return 1;
    }

    @RequestMapping("/dodist")
    public @ResponseBody int dodist(String ids,String cgid,String ggid){
        if(StringUtils.isNotBlank(ids)){
            String[] cases = ids.split(";");
            for(int i = 0 ; cases != null && i < cases.length ; i ++){
                BdChosenCases bean = new BdChosenCases();
                bean.setAjid(cases[i]);
                bean.setChosenid(ggid);
                List<BdChosenCases> beans = bdChosenCasesMapper.selectAll(bean);
                if(beans != null && beans.size() > 0){
                    BdChosenCases xbean = beans.get(0);
                    xbean.setPsgroupid(cgid);
                    bdChosenCasesMapper.updateByPrimaryKey(xbean);
                }
            }
        }
        return 1;
    }

    @RequestMapping("/redodist")
    public @ResponseBody int redodist(String ccid,@SessionScope("user")UserBean user){
        bdChosenCasesMapper.setGroupNullByCCID(ccid);
        return 1;
    }
}
