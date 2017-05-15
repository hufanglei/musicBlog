package com.hfl.dao.user;

import com.hfl.bean.User;

import java.util.List;

/**
 * Created by Administrator on 2016-9-10.
 */
public interface  IUserDao {

    /**
     * 查询所有的用户信息
     */
    public List<User> findUsers();


    /**
     * 根据邮箱和密码查询User
     *
     */
    public User findByMailAndPwd(User user);

    /**
     * 保存用户信息
     */
    public void saveUser(User user);
}
