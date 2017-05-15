package com.hfl.web.comment;

import com.hfl.bean.Comment;
import com.hfl.bean.Params;
import com.hfl.dao.comment.ICommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * 评论
 */
@Controller
@RequestMapping("/blog")
public class CommentController {

    @Autowired
    private ICommentDao commentDao;

    //查询所有的评论
    @ResponseBody
    @RequestMapping(value = "/loadComments" ,method = RequestMethod.POST)
    public List<HashMap<String , Object>> loadComments(Params params){
        params.setStatus(1);
        return commentDao.findComments(params);
    }


    //相似主题
    @ResponseBody
    @RequestMapping(value = "/saveComment" ,method = RequestMethod.POST)
    public Comment saveComment(Comment comment,HttpServletRequest request){
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        comment.setUserId(userId);
        comment.setStatus(1);
        commentDao.saveComment(comment);
        return  comment;
    }


}
