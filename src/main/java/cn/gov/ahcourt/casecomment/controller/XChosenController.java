package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdChosen;
import cn.gov.ahcourt.casecomment.bean.BdChosenMsgto;
import cn.gov.ahcourt.casecomment.bean.BdScoretables;
import cn.gov.ahcourt.casecomment.bean.UserBean;
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

}
