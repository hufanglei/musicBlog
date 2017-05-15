package com.hfl.web.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016-9-10.
 */
@Controller
@RequestMapping("/user")
public class UserController {



    /**
     * 进入首页的方法
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        System.out.println("我是一个方法奥===");
        return "index";
    }

}
