package cn.gov.ahcourt.casecomment.controller;

import cn.gov.ahcourt.casecomment.bean.BdScoretables;
import cn.gov.ahcourt.casecomment.mapper.BdMiddleCaseMapper;
import cn.gov.ahcourt.casecomment.mapper.BdScoretableItemsMapper;
import cn.gov.ahcourt.casecomment.mapper.BdScoretablesMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    private BdScoretablesMapper bdScoretablesMapper;
    @Resource
    private BdScoretableItemsMapper bdScoretableItemsMapper;

    @RequestMapping("/pfb")
    public @ResponseBody Map pfb() {
        BdScoretables bean = new BdScoretables();
        bean.setLx("2");
        bean.setSfqy("1");
        return bean.toMap(bdScoretablesMapper.selectAll(bean));
    }
}
