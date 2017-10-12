package cn.gov.ahcourt.casecomment.bean;

import cn.gov.ahcourt.casecomment.scheduled.WSService;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
public class test {
    public static void main(String [] args){
//        // 要验证的字符串
//        String str = "<Data Count=\"MzgwNTc=\">dasdasdasfasdasd";
//        // 正则表达式规则
//        String regEx = "<Data Count\\w*";
//        // 编译正则表达式
//        Pattern pattern = Pattern.compile(regEx);
//        // 忽略大小写的写法
//        // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
//        Matcher matcher = pattern.matcher(str);
//        // 查找字符串中是否有匹配正则表达式的字符/字符串
//        boolean rs = matcher.find();
//        System.out.println(rs);
//        getTeacherList("<Data Count=\"MzgwNTc=\">da<c1212>sdasdasfasdasd/>");
        int i = WSService.getAllCount("</Result><Data Count=\"OTE=\" ><EAJ>");
        System.out.println(i);
    }

//    public static List<String> getTeacherList(String managers){
//        List<String> ls=new ArrayList<String>();
//        Pattern pattern = Pattern.compile("(?<=<Data Count=\")\\S+(?=\"/>)");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
//        Matcher matcher = pattern.matcher(managers);
//        while(matcher.find()) {
//            ls.add(matcher.group());
//            System.out.println(matcher.group());
//        }
//        return ls;
//    }
}
