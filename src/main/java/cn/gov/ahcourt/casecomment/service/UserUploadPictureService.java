package cn.gov.ahcourt.casecomment.service;

import cn.gov.ahcourt.casecomment.bean.UserBean;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lvrenzhao on 2017/10/29.
 */
@Service
public class UserUploadPictureService {
    public void uploads(MultipartFile[] files,HttpServletRequest request, HttpServletResponse response,UserBean user) throws Exception {
//        String path = request.getContextPath();
//        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
//                request.getServerPort() + path;
//        // 获取文件上传的真实路径
//        String uploadPath = request.getSession().getServletContext().getRealPath("/");
//        List<String> picPaths = new ArrayList<String>();
//        try {
//            String[] fileNames = new String[files.length];
//            int index = 0;
//            //上传文件过程
//            for (MultipartFile file : files) {
//                String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
//                destDir = "staticResource/user/picture/" + user.getYhid();
//                File destFile = new File(uploadPath + destDir);
//                if (!destFile.exists()) {
//                    destFile.mkdirs();
//                }
//                String fileNameNew = getFileNameNew() + "." + suffix;//
//                File f = new File(destFile.getAbsoluteFile() + File.separator + fileNameNew);
//                //如果当前文件已经存在了，就跳过。
//                if(f.exists()){
//                    continue;
//                }
//                file.transferTo(f);
//                f.createNewFile();
//                fileNames[index++] = basePath + destDir + fileNameNew;
//            }
//        } catch (Exception e) {
//            throw e;
//        }
    }

    /**
     * 为文件重新命名，命名规则为当前系统时间毫秒数
     * @return string
     */
    private String getFileNameNew() {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return fmt.format(new Date());
    }
}
