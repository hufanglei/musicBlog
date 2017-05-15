package com.hfl.web.upload;

import com.hfl.util.TmStringUtils;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @ResponseBody
    @RequestMapping(value = "/file")
    public String tzupload(
            @RequestParam("doc") MultipartFile file, HttpServletRequest request,HttpServletResponse response)
            throws IllegalStateException, IOException, JSONException {

        String oldFile = request.getParameter("oldName");
        File targetFile  = null;
        String oldName = null;
        String newName = null;
        String ext = null;
        String fpath = null;
        String url = null;
        if(TmStringUtils.isNotEmpty(oldFile)){
            oldName = file.getOriginalFilename();
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            targetFile =  new File(rootPath, oldFile);
            ext = oldFile.substring(oldFile.lastIndexOf(".")+1);
            url = oldFile;
            File pfile = targetFile.getParentFile();
            if(!pfile.exists())pfile.mkdirs();
        }else{
            oldName = file.getOriginalFilename();
            String directory = request.getParameter("dir");
            if(TmStringUtils.isEmpty(directory))directory = "blog";
            ext = oldName.substring(oldName.lastIndexOf(".")+1);
            //日期路径
            String ymd = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
            fpath = "resources/"+directory+"/"+ymd;
            //获取服务器的路径
            String dirPath =request.getSession().getServletContext().getRealPath("/")+fpath;
            //图片重命名
            newName = UUID.randomUUID().toString()+"."+ext;
            //获取上传的图片具体路径
            targetFile = new File(dirPath, newName);
            //获取父目录
            File pfile = new File(targetFile.getPath());
            //判断如果目录不存在，先创建
            if(!pfile.exists())pfile.mkdirs();
            url = fpath+"/"+newName;
        }


//        String oldName = file.getOriginalFilename();
//        String directory = request.getParameter("dir");
//        if(TmStringUtils.isEmpty(directory))directory = "blog";
//        String ext = oldName.substring(oldName.lastIndexOf(".")+1);
//        //日期路径
//        String ymd = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
//        String fpath = "resources/"+directory+"/"+ymd;
//        //获取服务器的路径
//
//        String dirPath =request.getSession().getServletContext().getRealPath("/")+fpath;
//        //图片重命名
//        String newName = UUID.randomUUID().toString()+"."+ext;
//        //获取上传的图片具体路径
//        File targetFile = new File(dirPath, newName);
//        //获取父目录
//        File pfile = new File(targetFile.getPath());
//        //判断如果目录不存在，先创建
//        if(!pfile.exists())pfile.mkdirs();


        //上传文件到目标文件夹--文件的赋值
        file.transferTo(targetFile);// 文件上传
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("name", oldName);// 文件的原始名称
        map.put("newName", newName);// 文件的新名称
        map.put("ext", ext);// 文件的后缀
        map.put("size", file.getSize());// 文件的真实大小
        map.put("url",url);// 获取文件的具体服务器的目录
        return JSONUtil.serialize(map);
    }
}
