package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.*;
import cn.gov.ahcourt.casecomment.mapper.*;
import cn.gov.ahcourt.casecomment.utils.IdGen;
import cn.gov.ahcourt.casecomment.utils.SessionScope;
import cn.gov.ahcourt.casecomment.utils.StringUtils;
import com.alibaba.fastjson.JSONArray;
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
@RequestMapping("/case")
public class XCaseController {

    @Resource
	private BdMiddleCaseMapper bdMiddleCaseMapper;

    @Resource
    private BdMiddleFileMapper bdMiddleFileMapper;

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

    @RequestMapping("/list")
    public @ResponseBody Map list(BdMiddleCase bean) {
        //处理bean对象，转化为mabtis接受的querybean
        if(bean != null && StringUtils.isNotBlank(bean.getJoinedCaseIds())){
            bean.setJcs(bean.getJoinedCaseIds().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormAjxzUnSplited())){
            bean.setFormAjxz(bean.getFormAjxzUnSplited().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormAjlxUnSplited())){
            bean.setFormAjlx(bean.getFormAjlxUnSplited().split(";"));
        }
        if(bean != null && StringUtils.isNotBlank(bean.getFormGsfyUnlplited())){
            bean.setFormGsfy(bean.getFormGsfyUnlplited().split(";"));
        }
        return bean.toMap(bdMiddleCaseMapper.selectAll(bean));
    }

    @RequestMapping("/dovefify")
    public @ResponseBody String dovefify(String ggid,String passorreject,String shyj,@SessionScope("user")UserBean user) {
        BdCheck bean = bdCheckMapper.selectByPrimaryKey(ggid);
        if(bean != null){
            bean.setZt(passorreject);
            if("2".equals(passorreject)){
                bean.setShyj(shyj);
            }
            bean.setShr(user.getYhid());
            bean.setShsj(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
            bdCheckMapper.updateByPrimaryKey(bean);
            return "1";
        }
        return "0";
    }

    @RequestMapping("/setread")
    public @ResponseBody String setread(String ggid,String type,@SessionScope("user")UserBean user) {
        if(StringUtils.isNotBlank(ggid) && "3".equals(type)){
            BdCheckRead bean = new BdCheckRead();
            bean.setCheckid(ggid);
            bean.setReadman(user.getYhid());
            List<BdCheckRead> records = bdCheckReadMapper.selectAll(bean);
            if(records==null || records.size() == 0){
                bean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bean.setReadid(IdGen.uuid());
                bean.setReadtime(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bdCheckReadMapper.insert(bean);
            }
            return "1";
        }else if (StringUtils.isNotBlank(ggid) && "4".equals(type)){
            BdCheckRejectRead bean = new BdCheckRejectRead();
            bean.setCheckid(ggid);
            bean.setReadman(user.getYhid());
            List<BdCheckRejectRead> records = bdCheckRejectReadMapper.selectAll(bean);
            if(records==null || records.size() == 0){
                bean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bean.setReadid(IdGen.uuid());
                bean.setReadtime(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
                bdCheckRejectReadMapper.insert(bean);
            }
            return "1";
        }
        return "0";
    }

    @RequestMapping("/notice")
    public @ResponseBody Map notice(BdCheck bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("1");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/verifing")
    public @ResponseBody Map verifing(BdCheck bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("0");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/reject")
    public @ResponseBody Map reject(BdCheck bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setZt("2");
        bean.setUserid(user.getYhid());
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/verifylist")
    public @ResponseBody Map verifylist(@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        BdCheck bean = new BdCheck();
        bean.setZt("0");
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/verifyhistorylist")
    public @ResponseBody Map verifyhistorylist(BdCheck bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setShrmc(user.getYhid());
        return bean.toMap(bdCheckMapper.selectAll(bean));
    }

    @RequestMapping("/checkcases")
    public @ResponseBody Map checkcases(String ggid,String gsfy,String xz,String lx ,String groupid) {
        BdCheckCases bean = new BdCheckCases();
        bean.setCheckid(ggid);
        bean.setGsfy(gsfy);
        bean.setXz(xz);
        bean.setLx(lx);
        bean.setPsgroupid(groupid);
        return bean.toMap(bdCheckCasesMapper.selectAll(bean));
    }

    @RequestMapping("/worktodo")
    public @ResponseBody Map worktodo(BdCheckCases bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setProid(user.getYhid());
        bean.setTasktype("1");
        return bean.toMap(bdCheckCasesMapper.selectWork(bean));
    }
    @RequestMapping("/workdone")
    public @ResponseBody Map workdone(BdCheckCases bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setProid(user.getYhid());
        bean.setTasktype("2");
        return bean.toMap(bdCheckCasesMapper.selectWork(bean));
    }

    @RequestMapping("/mystart")
    public @ResponseBody Map mystart(BdCheckCases bean ,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        bean.setFqr(user.getYhid());
        return bean.toMap(bdCheckCasesMapper.selectAll(bean));
    }

    @RequestMapping("/allstart")
    public @ResponseBody Map allstart(BdCheckCases bean) {
        return bean.toMap(bdCheckCasesMapper.selectAll(bean));
    }

    @RequestMapping("/groups")
    public @ResponseBody Map groups(String ggid) {
        BdCheckGroups bean = new BdCheckGroups();
        bean.setCheckid(ggid);
        return bean.toMap(bdCheckGroupsMapper.selectAll(bean));
    }

    @RequestMapping("/dists")
    public @ResponseBody Map dists(String ggid,String lx) {
        BdCheckDistribution bean = new BdCheckDistribution();
        bean.setCheckid(ggid);
        if(StringUtils.isNotBlank(lx)){
            bean.setFbxlx(lx);
        }
        return bean.toMap(bdCheckDistributionMapper.selectAll(bean));
    }

    @RequestMapping("/levels")
    public @ResponseBody Map levels() {
        BdCheckLevels bean = new BdCheckLevels();
        return bean.toMap(bdCheckLevelsMapper.selectAll(bean));
    }

    @RequestMapping("/scores")
    public @ResponseBody Map scores(BdScoretables bean) {
        return bean.toMap(bdScoretablesMapper.selectAll(bean));
    }


    @RequestMapping("/scoresenable")
    public @ResponseBody int scoresenable(String tableid) {
        if(StringUtils.isNotBlank(tableid)){
            BdScoretables scoretables = bdScoretablesMapper.selectByPrimaryKey(tableid);
            scoretables.setSfqy("1".equals(scoretables.getSfqy())?"0":"1");
            return bdScoretablesMapper.updateByPrimaryKey(scoretables);
        }
        return -1;
    }


    @RequestMapping("/dellevel")
    public @ResponseBody int dellevel(String levelid) {
        return bdCheckLevelsMapper.deleteByPrimaryKey(levelid);
    }

    @RequestMapping("/delscore")
    public @ResponseBody int delscore(String tableid) {
        return bdScoretablesMapper.deleteByPrimaryKey(tableid);
    }

    @RequestMapping("/getscore")
    public @ResponseBody BdScoretables getscore(String tableid) {
        return bdScoretablesMapper.selectByPrimaryKey(tableid);
    }

    @RequestMapping("/getscoredetails")
    public @ResponseBody Map getscoredetails(String tableid) {
        BdScoretableItems bean = new BdScoretableItems();
        bean.setRemarks(tableid);
        return bean.toMap(bdScoretableItemsMapper.selectAll(bean));
    }

    @RequestMapping("/savescoretable")
    public @ResponseBody String savescoretable(BdScoretables bean,@SessionScope("user")UserBean user) {
        if(StringUtils.isNotBlank(bean.getTableid())){
            BdScoretables newbean = bdScoretablesMapper.selectByPrimaryKey(bean.getTableid());
            bean.setCreateDate(newbean.getCreateDate());
            bean.setCreateBy(newbean.getCreateBy());
            bean.setSfqy(newbean.getSfqy());
            bdScoretablesMapper.updateByPrimaryKey(bean);
        }else{
            String tableid = IdGen.uuid();
            bean.setSfqy("1");
            bean.setTableid(tableid);
            bean.setCreateBy(user.getYhid());
            bean.setCreateDate(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
            bdScoretablesMapper.insert(bean);
        }
        bdScoretableItemsMapper.deleteByTableid(bean.getTableid());
        if(StringUtils.isNotBlank(bean.getItemjson())){
            List<BdScoretableItems> items = JSONArray.parseArray(bean.getItemjson(),BdScoretableItems.class);
            if(items != null && items.size() > 0){
                for(int i = 0 ; i < items.size() ; i ++){
                    BdScoretableItems item = items.get(i);
                    item.setRemarks(bean.getTableid());
                    item.setItemid(IdGen.uuid());
                    bdScoretableItemsMapper.insert(item);
                }
            }
        }
        return "1";
    }


    @RequestMapping("/savelevel")
    public @ResponseBody int savelevel(BdCheckLevels bean) {
        if(StringUtils.isNotBlank(bean.getLevelid())){
            return bdCheckLevelsMapper.updateByPrimaryKey(bean);
        }else{
            bean.setLevelid(IdGen.uuid());
            return bdCheckLevelsMapper.insert(bean);
        }
    }

    @RequestMapping("/getcheck")
    public @ResponseBody BdCheck getcheck(String ggid){
        return bdCheckMapper.selectByPrimaryKey(ggid);
    }

    @RequestMapping("/random")
    public @ResponseBody Map random(BdMiddleCase bean) {
        //处理bean对象，转化为mabtis接受的querybean
        if(bean != null && StringUtils.isNotBlank(bean.getJoinedCaseIds())){
            bean.setJcs(bean.getJoinedCaseIds().split(";"));
        }
        return bean.toMap(bdMiddleCaseMapper.random(bean));
    }

    @RequestMapping("/related")
    public @ResponseBody Map related(String ajid) {
        if(StringUtils.isNotBlank(ajid)){
            BdMiddleCase item = bdMiddleCaseMapper.selectByPrimaryKey(ajid);
            if(item != null && StringUtils.isNotBlank(item.getRelatedcaseid())){
                BdMiddleCase bean = new BdMiddleCase();
                bean.setFormrelatedcaseid(item.getRelatedcaseid().split(";"));
                return bean.toMap(bdMiddleCaseMapper.selectAll(bean));
            }
        }
        return null;
    }

    @RequestMapping("/pcjl")
    public @ResponseBody Map pcjl(String ajid) {
        if(StringUtils.isNotBlank(ajid)){
            BdCheckCases bean = new BdCheckCases();
            bean.setAjid(ajid);
            bean.setIschecked("true");
            return bean.toMap(bdCheckCasesMapper.selectAll(bean));
        }
        return null;
    }

    @RequestMapping("/publish")
    public @ResponseBody String publish(BdCheck bean,@SessionScope("user")UserBean user) {
        if(user == null){
            return null;
        }
        //先保存公告；
        try {
            String checkid = IdGen.uuid();
            bean.setCheckid(checkid);
            bean.setFqr(user.getYhid());
            bean.setFqsj(DateFormatUtils.ISO_DATE_FORMAT.format(new Date()));
            bean.setZt("0");
            bdCheckMapper.insert(bean);
            //将案件分布情况保存
            if (StringUtils.isNotBlank(bean.getDistjson())) {
                List<BdCheckDistribution> dists = JSONArray.parseArray(bean.getDistjson(), BdCheckDistribution.class);
                for (int i = 0; dists != null && i < dists.size(); i++) {
                    BdCheckDistribution item = dists.get(i);
                    item.setCdid(IdGen.uuid());
                    item.setCheckid(checkid);
                    bdCheckDistributionMapper.insert(item);
                }
            }
            //将专家组和专家信息保存
            if(StringUtils.isNotBlank(bean.getTeamjson())){
                List<BdCheckGroups> teams = JSONArray.parseArray(bean.getTeamjson(),BdCheckGroups.class);
                for(int i = 0 ; teams!=null && i < teams.size(); i++){
                    BdCheckGroups team = teams.get(i);
                    team.setCgid(team.getId());
                    team.setCheckid(checkid);
                    team.setGroupname(team.getName());
                    team.setPcajs(team.getPc());
                    team.setTdcy(team.getTeamleadername()+";"+team.getTeammatenames());
                    bdCheckGroupsMapper.insert(team);
                    BdCheckPros teamleader = new BdCheckPros();
                    teamleader.setCpid(IdGen.uuid());
                    teamleader.setCheckid(checkid);
                    teamleader.setGroupid(team.getCgid());
                    teamleader.setProid(team.getTeamleaderid());
                    teamleader.setSfzz("1");
                    bdCheckProsMapper.insert(teamleader);
                    if(StringUtils.isNotBlank(team.getTeammateids())){
                        String[] teammates = team.getTeammateids().split(";");
                        for(int si = 0 ; teammates!=null && si < teammates.length ; si++){
                            BdCheckPros teammate = new BdCheckPros();
                            teammate.setCpid(IdGen.uuid());
                            teammate.setCheckid(checkid);
                            teammate.setGroupid(team.getCgid());
                            teammate.setProid(teammates[si]);
                            teammate.setSfzz("0");
                            bdCheckProsMapper.insert(teammate);
                        }
                    }
                }
            }
            //将案件信息保存
            if(StringUtils.isNotBlank(bean.getCasesjson())){
                List<BdCheckCases> cases = JSONArray.parseArray(bean.getCasesjson(),BdCheckCases.class);
                for(int i = 0 ; cases != null && i < cases.size(); i++){
                    BdCheckCases caseitem = cases.get(i);
                    caseitem.setCcid(IdGen.uuid());
                    caseitem.setPsgroupid(caseitem.getGroupid());
                    caseitem.setCheckid(checkid);
                    bdCheckCasesMapper.insert(caseitem);
                }
            }
            return "1";
        }catch (Exception ex){
            return "-1";
        }
    }

    @RequestMapping("/pfb")
    public @ResponseBody Map pfb() {
        BdScoretables bean = new BdScoretables();
        bean.setLx("1");
        bean.setSfqy("1");
        return bean.toMap(bdScoretablesMapper.selectAll(bean));
    }

    @RequestMapping("/files")
    public @ResponseBody Map files(String ajid){
        if(StringUtils.isNotBlank(ajid)){
            BdMiddleFile bean=  new BdMiddleFile();
            bean.setAjid(ajid);
            return bean.toMap(bdMiddleFileMapper.selectTree(bean));
        }
        return null;
    }


}
