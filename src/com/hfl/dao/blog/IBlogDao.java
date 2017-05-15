package com.hfl.dao.blog;

import com.hfl.bean.Blog;
import com.hfl.bean.Params;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016-9-16.
 */
public interface IBlogDao {

    /**
     * 查询所有的博客信息
     */
    public List<HashMap<String , Object>> findBlogs(Params params);

    /**
     * 根据id查询博客信息
     * @param id
     * @return
     */
    public HashMap<String , Object> getBlog(Integer id);

    /**
     * 保存博客信息
     */
    public Blog saveBlog(Blog blog);

    /**
     * 更新博客信息
     */
    public void updateBlog(Blog blog);

    /**
     * 删除博客信息
     */
    public void deleteBlog(Integer id);
}
