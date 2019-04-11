package com.briup.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.briup.service.UserLoginService;

/**
 * @author yyj
 * @version CreateTime：2019年3月19日 下午2:06:54
 * 
 */
@Controller
public class FileController {
	@Autowired
	private UserLoginService userLoginService;
	// 日志
	Logger log = LoggerFactory.getLogger(FileController.class);

    @RequestMapping(value="/{formName}")
    public String loginForm(@PathVariable String formName){

        return formName;

    }

    @RequestMapping(value="/gotoActionTeacher",method=RequestMethod.POST)
    public String uploadTeacher(@RequestParam("file") MultipartFile file,
            HttpServletRequest request){

        if (!file.isEmpty()) {


            String storePath= "E:\\项目\\湖北学生课程管理毕设\\bs\\StudentTest\\src\\main\\webapp\\file";//存放我们上传的文件路径

            String fileName = file.getOriginalFilename();

            File filepath = new File(storePath, fileName);

            if (!filepath.getParentFile().exists()) {

                filepath.getParentFile().mkdirs();//如果目录不存在，创建目录

            }
            try {
                file.transferTo(new File(storePath+File.separator+fileName));//把文件写入目标文件地址

            } catch (Exception e) {

                e.printStackTrace();

                return "Error";
              
            }

            return "CommitPointAndUploadWork";//返回到成功页面

        }else {

            return "Error";//返回到失败的页面
        }
    }
    
    @RequestMapping(value="/gotoAction",method=RequestMethod.POST)
    public String uploadStu(@RequestParam("file") MultipartFile file,
            HttpServletRequest request){

        if (!file.isEmpty()) {


            String storePath= "E:\\项目\\湖北学生课程管理毕设\\bs\\StudentTest\\src\\main\\webapp\\file";//存放我们上传的文件路径

            String fileName = file.getOriginalFilename();

            File filepath = new File(storePath, fileName);

            if (!filepath.getParentFile().exists()) {

                filepath.getParentFile().mkdirs();//如果目录不存在，创建目录

            }

            try {
                file.transferTo(new File(storePath+File.separator+fileName));//把文件写入目标文件地址

            } catch (Exception e) {

                e.printStackTrace();

                return "Error";
              
            }

            return "SelectHomework";//返回到成功页面

        }else {

            return "Error";//返回到失败的页面
        }
    }
    
    @RequestMapping(value="/download",method=RequestMethod.GET) //匹配的是href中的download请求
    public ResponseEntity<byte[]> download(HttpServletRequest request,@RequestParam("filename") String filename,
            Model model) throws IOException{
        
        String downloadFilePath="E:\\eclipse\\workspace\\StudentTest\\src\\main\\webapp\\file\\";//从我们的上传文件夹中去取
        
        File file = new File(downloadFilePath+File.separator+filename);//新建一个文件
        
        HttpHeaders headers = new HttpHeaders();//http头信息
        
        String downloadFileName = new String(filename.getBytes("UTF-8"),"iso-8859-1");//设置编码
        
        headers.setContentDispositionFormData("attachment", downloadFileName);
        
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        
        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
        
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
        
    }
    
}