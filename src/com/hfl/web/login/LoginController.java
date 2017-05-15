package com.hfl.web.login;

import com.hfl.bean.User;
import com.hfl.dao.user.IUserDao;
import com.hfl.util.TmStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private IUserDao userDao;


    @ResponseBody
    @RequestMapping(value = "/logined",method = RequestMethod.POST)
    public String login(User user, HttpServletRequest request){
        if(TmStringUtils.isEmpty(user.getEmail()))  return "email_null";
        if(TmStringUtils.isEmpty(user.getPassword())) return "password_null";
        user.setPassword(TmStringUtils.md5Base64(TmStringUtils.md5Base64("hfl_" + user.getPassword())));
        User thisUser = userDao.findByMailAndPwd(user);
        if(thisUser!=null){//如果存在
            //将用户信息放入到会话中...
            request.getSession().setAttribute("user", thisUser);
            request.getSession().setAttribute("userId", thisUser.getId());
            return "success";
        }else{//如果不存在，代码邮箱和密码输入有误
            return "fail";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    public String login( HttpServletRequest request){
        request.getSession().invalidate();
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/success",method = RequestMethod.POST)
    public User loginSuccess( HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        return user;
    }
}
