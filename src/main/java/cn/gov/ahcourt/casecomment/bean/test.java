package cn.gov.ahcourt.casecomment.bean;

import cn.gov.ahcourt.casecomment.scheduled.WSService;
import cn.gov.ahcourt.casecomment.utils.MapKeyComparator;
import org.apache.commons.codec.binary.Base64;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
public class test {
    public static void main(String [] args){

        Map<Integer,Object> sortedMap = new TreeMap<Integer, Object>(new MapKeyComparator());
        sortedMap.put(9,"9");
        sortedMap.put(1,"1");
        sortedMap.put(29,"29");
        sortedMap.put(2,"2");
        sortedMap.put(8,"8");
        sortedMap.put(21,"21");

        System.out.println(sortedMap.size());


//        List<Integer> pageSplit = new ArrayList<Integer>();
//        pageSplit.add(8);
//        pageSplit.add(2);
//        pageSplit.add(3);
//        pageSplit.add(11);
//        pageSplit.add(9);
//        Integer[] is = pageSplit.toArray(new Integer[]{});
//        Arrays.sort(is);
//        System.out.println(is.length);
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
//        int i = WSService.getAllCount("</Result><Data Count=\"OTE=\" ><EAJ>");
//        String i = getAllCount("<FileContent>jdslafjasldkfjlsad</FileContent>");
//        System.out.println(i);
//        getTeacherList("<?xml version=\"1.0\" encoding=\"utf-8\"?><Response><Result><Code>MA==</Code><Msg /></Result><Data Count=\"MjMz\"><R><AHDM>MTQ1MTAwMDAwMDYzNTc5</AHDM><AH>KDIwMTYp55qW5rCR57uIOTIz5Y+3</AH><FY>QzAw</FY></R><R><AHDM>MTQ1MTAwMDAwMDY4OTQ0</AHDM><AH>KDIwMTcp55qW6KGM57uINDAy5Y+3</AH><FY>QzAw</FY></R><R><AHDM>MTQ1MTAwMDAwMDYyNDEw</AHDM><AH>KDIwMTYp55qW5rCR57uINzg25Y+3</AH><FY>QzAw</FY></R><R><AHDM>MTQ1MTAwMDAwMDY1Mjgz</AHDM><AH>KDIwMTYp55qW5YiR55SzMTMz5Y+3</AH><FY>QzAw</FY></R><R><AHDM>MTQ1MTAwMDAwMDY0ODAx</AHDM><AH>KDIwMTYp55qW5rCR57uIMTA1NeWPtw==</AH><FY>QzAw</FY></R><R><AHDM>MTQ1MTAwMDAwMDY0OTA4</AHDM><AH>KDIwMTYp55qW5rCR55SzMTE2MOWPtw==</AH><FY>QzAw</FY></R></Data></Response>");
    }

    public static List<String> getTeacherList(String managers){
        List<String> ls=new ArrayList<String>();
        Pattern pattern = Pattern.compile("(?<=<AHDM>)\\S{1,40}(?=</AHDM>)");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
        Matcher matcher = pattern.matcher(managers);
        while(matcher.find()) {
            ls.add(matcher.group());
            System.out.println(matcher.group());
        }
        return ls;
    }

}
