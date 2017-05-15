package com.hfl.web.admin;

import com.hfl.bean.Blog;
import com.hfl.bean.Params;
import com.hfl.bean.User;
import com.hfl.dao.admin.IAdminBlogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016-9-28.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private IAdminBlogDao adminBlogDao;

    @RequestMapping("/index")
    public String index(Model model,Params params){
        params.setIsDelete(0);
        model.addAttribute("itemCount" ,adminBlogDao.countBlogs(params));
        model.addAttribute("blogs" , adminBlogDao.findBlogs(params));
        return "admin/index";
    }

    //分页加载数据
    @ResponseBody
    @RequestMapping("/loadTemplate")
    public Map<String, Object> loadTemplate(Params params){
        params.setIsDelete(0);
        Map<String , Object> map = new HashMap();
        map.put("itemCount", adminBlogDao.countBlogs(params));
        map.put("blogs", adminBlogDao.findBlogs(params));
        return map;
    }

    //添加数据
    @RequestMapping("/add")
    public String add(){
        return "/admin/add";
    }

    //更新数据
    @RequestMapping("/edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id){
         model.addAttribute("blog" , adminBlogDao.getBlog(id));
        return "admin/add";
    }



    //保存内容
    @ResponseBody
    @RequestMapping("/save")
    public String save(HttpSession session ,Blog blog){
        User user = (User) session.getAttribute("user");
        blog.setHits(0);
        blog.setIsDelete(0);
        blog.setStatus(1);
        blog.setComments(0);
        blog.setIsTop(0);
        blog.setUserId(user.getId());
        adminBlogDao.saveBlog(blog);
        return "success";
    }
    //更新内容
    @ResponseBody
    @RequestMapping("/update")
    public String update(Blog blog){
        try {
            adminBlogDao.updateBlog(blog);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    //删除
    @ResponseBody
    @RequestMapping("/delete")
    public String delete(Blog blog){
        try{
            blog.setIsDelete(1);
            adminBlogDao.updateBlog(blog);
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return "fail";
        }
    }
    //修改状态
    @ResponseBody
    @RequestMapping("/status")
    public String status(Blog blog){
        try{
            blog.setStatus(blog.getStatus());
            adminBlogDao.updateBlog(blog);
            return "success";
        }catch(Exception e){
            e.printStackTrace();
            return "fail";
        }
    }



}
