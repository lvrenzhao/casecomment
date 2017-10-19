package cn.gov.ahcourt.casecomment.scheduled;

import cn.gov.ahcourt.casecomment.utils.StringUtils;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import org.apache.axiom.om.OMElement;
import org.apache.commons.codec.binary.Base64;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
import javax.xml.bind.Element;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lvrenzhao on 2017/10/12.
 */
@Service
public class CaseFileFetcher {
    @Resource
    private WSService wsService;

    static BASE64Encoder encoder = new sun.misc.BASE64Encoder();
    static BASE64Decoder decoder = new sun.misc.BASE64Decoder();


    public void doJob(String path){
        try {
//            String xml = wsService.wsGetOneFileContent(0, "2017/1201/145100000065779/Z_1/20170626.085335.538_0026.JPG", "ahgy_ftp", "340000");
//            String content = getFileContent(xml);
//            String recontent = new String(Base64.decodeBase64(content));
//            byte[] files = recontent.getBytes();
//            try{
//                File file  = new File(path+"1.JPG");
//                if(file.exists()){
//                    file.delete();
//                }
//                FileOutputStream fos = new FileOutputStream(file);
//                fos.write(files,0,files.length);
//                fos.flush();
//                fos.close();
//            } catch(Exception ex) {
//                ex.printStackTrace();
//            }

//            int i1 = xml.indexOf("FileContent");
//            int i2 = xml.lastIndexOf("FileContent");
//            System.out.println(i1);
//            System.out.println(i2);
//            Document document = DocumentHelper.parseText(xml);
//            org.dom4j.Element root = document.getRootElement();
//            System.out.println("当前节点的名称：" + root.getName());
        }catch (Exception ex){
            ex.printStackTrace();
        }
//        OMElement xml = wsService.wsGetOneFileContent(0,"2017/1201/145100000065779/Z_1/20170626.085335.538_0026.JPG","ahgy_ftp","340000");
//        OMElement item = (OMElement)xml.getFirstElement().getText();
//        Iterator iterator = item.getChildElements();
//        while(iterator.hasNext()){
//            OMElement i = (OMElement)iterator.next();
//            System.out.println(i.getQName().toString());
//        }

//            //了解档案的分布式规则。
            String ah = "(2015)皖法赔字第00017号";
            String fycode= "340000";
            String xml = wsService.wsGetOneFileInfo(0,ah,fycode);//invokeFileInfoByAh(getFbsxhByFyCode(fycode),ah,fycode);
            System.out.println(xml);

//            //tif
//            String xml = wsService.wsGetOneFileContent(0,"2017/1201/145100000065779/Z_1/20170626.085335.538_0026.JPG","ahgy_ftp","340000");
//            String content = getFileContent(xml);
//            String recontent = new String(Base64.decodeBase64(content.getBytes()));
//            System.out.println(recontent);


//            try {
//                byte[] files = content.getBytes("UTF-8");
//
//                byte[] bytes1 = decoder.decodeBuffer(base64String);
//
//                ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
//                BufferedImage bi1 =ImageIO.read(bais);
//                File w2 = new File("c://QQ.bmp");//可以是jpg,png,gif格式
//                ImageIO.write(bi1, "jpg", w2);//不管输出什么格式图片，此处不需改动
//            } catch (IOException e) {
//                e.printStackTrace();
//            }

//            try{
//                File file  = new File(path);
//                if(file.exists()){
//                    file.delete();
//                }
//                FileOutputStream fos = new FileOutputStream(file);
//                fos.write(files,0,files.length);
//                fos.flush();
//                fos.close();
//            } catch(Exception ex) {
//                ex.printStackTrace();
//            }



//            System.out.println(files.length);
//            XStream xstream = new XStream(new DomDriver());
//            Element obj = (Element)xstream.fromXML(xml);
//            byte[] file =
//            System.out.println(xml);
//        }catch (Exception ex){
//            ex.printStackTrace();
//        }
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
