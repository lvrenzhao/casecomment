package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.utils.StringUtils;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.bind.Element;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
@Service
public class CaseFileFetcher {
    @Resource
    private WSService wsService;

    public void doJob(){
        try{
//            //了解档案的分布式规则。
//            String ah = "(2017)皖刑终4号";
//            String fycode= "340000";
//            String xml = wsService.invokeFileInfoByAh(getFbsxhByFyCode(fycode),ah,fycode);
//            System.out.println(xml);

            //tif
            String xml = wsService.wsGetOneFileContent(0,"2017/1201/145100000065779/Z_1/20170626.085335.226_0006.tif","ahgy_ftp","340000");
            String content = getFileContent(xml);
            String recontent = new String(Base64.decodeBase64(content.getBytes()));
            System.out.println(recontent);
//            XStream xstream = new XStream(new DomDriver());
//            Element obj = (Element)xstream.fromXML(xml);
//            byte[] file =
//            System.out.println(xml);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }


    public String getFileContent(String text){
        Pattern pattern = Pattern.compile("(?<=<FileContent>)[\\s\\S]+(?=</FileContent>)");//("(?<=<c)\\d+(?=>)");//("^<Data\\w*>$");//(?<=\<)\.*(?=\>)
        Matcher matcher = pattern.matcher(text);
        if(matcher.find()){
            try{
                return new String(matcher.group());
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return "";
    }
}
