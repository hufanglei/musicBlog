package com.hfl.core.filter;

import com.hfl.bean.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2016-9-28.
 */
public class LoginInterceptor  implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String requestType = request.getHeader("X-Requested-With");
        if (user == null){
            //如果是ajax输入标志位
            if (requestType != null && requestType.equals("XMLHttpRequest")) {
                //用response的流进行输出。
                response.getWriter().print("logout");
            }else{
                //正常通过浏览器，a连接程序的window.location.href调转的地址就直接返回到首页
                response.sendRedirect(request.getContextPath());//首页居多
            }
            return false;
        }else{
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
