package com.hfl.dao.comment;

import com.hfl.bean.Comment;
import com.hfl.bean.Params;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016-9-16.
 */
public interface ICommentDao {

    /**
     * 查询所有
     */
    public List<HashMap<String , Object>> findComments(Params params);


    /**
     * 保存
     */
    public void saveComment(Comment comment);


    /**
     * 删除
     */
    public void deleteComment(Integer id);
}
