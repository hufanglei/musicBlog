package com.hfl.dao.admin;

import com.hfl.bean.Blog;
import com.hfl.bean.Params;

import java.util.HashMap;
import java.util.List;

/**
 *
 */
public interface IAdminBlogDao {

    /**
     * 查询所有的博客信息
     */
    public List<HashMap<String , Object>> findBlogs(Params params);

    /**
     * 查询博客的总数
     */
    public int countBlogs(Params params);

    /**
     * 根据id查询博客信息
     */
    public HashMap<String , Object> getBlog(Integer id);

    /**
     * 保存博客信息
     */
    public void saveBlog(Blog blog);

    /**
     * 更新博客信息
     */
    public void updateBlog(Blog blog);

    /**
     * 删除博客信息
     */
    public void deleteBlog(Integer id);
}
