package com.hfl.web.blog;

import com.hfl.bean.Params;
import com.hfl.dao.blog.IBlogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.List;

/**
 * 博客
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private IBlogDao blogDao;


    @RequestMapping("/index")
    public String index(Model model ,Params params){
        model.addAttribute("blogs" , blogDao.findBlogs(params));
        return  "blog/index";
    }


    //查询出不是置顶的数据
    @ResponseBody
    @RequestMapping(value = "/loadData" ,method = RequestMethod.POST)
    public  List<HashMap<String , Object>>  loadData(Params params){
        params.setStatus(1);
        params.setIsDelete(0);
        params.setIsTop(0);
        return blogDao.findBlogs(params);
    }


    //查询出置顶的数据
    @ResponseBody
    @RequestMapping(value = "/loadDataTop" ,method = RequestMethod.POST)
    public  List<HashMap<String , Object>>  loadDataTop(Params params){
        params.setStatus(1);
        params.setIsDelete(0);
        params.setIsTop(1);
        return blogDao.findBlogs(params);
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable("id")Integer id , Model model){
        model.addAttribute("blog" , blogDao.getBlog(id));
        return  "blog/detail";
    }

    //相似主题
    @ResponseBody
    @RequestMapping(value = "/relation" ,method = RequestMethod.POST)
    public  List<HashMap<String , Object>>  relation(Params params){
        params.setStatus(1);
        params.setIsDelete(0);
        params.setPageSize(4);
        return blogDao.findBlogs(params);
    }


}
