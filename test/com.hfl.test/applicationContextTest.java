package com.hfl.test;

import com.hfl.bean.User;
import com.hfl.dao.blog.IBlogDao;
import com.hfl.dao.user.IUserDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.logicalcobwebs.proxool.ProxoolDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016-9-10.
 */
public class applicationContextTest {

    //④测试blog接口
    @Test
    public void login(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        System.out.println(context);
        IUserDao userDao = (IUserDao) context.getBean("IUserDao");
        System.out.println(userDao);
        User user = new User();
        user.setEmail("690328661@qq.com");
        user.setPassword("2cdldwr7gboW8prL9eZdsQ==");
        User user1 = userDao.findByMailAndPwd(user);
        System.out.println(user1.getEmail()+"==="+user.getPassword());

    }

    //④测试blog接口
    @Test
    public void testgetBlog(){
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        System.out.println(context);
        IBlogDao blogDao = context.getBean(IBlogDao.class);
        HashMap<String, Object> blog =  blogDao.getBlog(1);
        System.out.println(blog.get("title")+"==="+blog.get("username")+"==="+blog.get("musictor"));

    }


    //④测试blog接口
//    @Test
//    public void testBlog(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
//        System.out.println(context);
//        IBlogDao blogDao = context.getBean(IBlogDao.class);
//        List<HashMap<String, Object>> blogs =  blogDao.findBlogs();
//        for (HashMap<String, Object>  blog:blogs){
//            System.out.println(blog.get("title")+"==="+blog.get("username")+"==="+blog.get("musictor"));
//        }
//    }

    //③方式2（推荐: 面向接口方式  查询数据库数据）
//    @Test
//    public  void testSqlSessionFactory2() throws SQLException {
//        //测试配置文件是否导入
//        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
//        System.out.println(context);
//        //查询context注入的所有的bean
//        String[] names = context.getBeanDefinitionNames();
//        for(String name:names){
//            System.out.println(name+"====");
//        }
//        //IUserDao
//        IUserDao userDao = (IUserDao) context.getBean("IUserDao");
//        User user = new User();
//        user.setUsername("hfl");
//        user.setAge(20);
//        user.setIdcard("3716564065146");
//        user.setTel("15166963258");
//        userDao.saveUser(user);
//
//        System.out.println(userDao);
//        List<User> users = userDao.findUsers();
//        for(User user1:users){
//            System.out.println(user1.getAge()+"==="+user1.getUsername());
//        }
//
//    }


    //③方式1（不推荐:  查询数据库数据）
    @Test
    public  void testSqlSessionFactory() throws SQLException {
        //测试配置文件是否导入
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        System.out.println(context);
        SqlSessionFactory sessionFactory = (SqlSessionFactory) context.getBean("sqlSessionFactory");
        System.out.println(sessionFactory);
        SqlSession session =  sessionFactory.openSession(true);
        List<User>  users = session.selectList("com.hfl.dao.user.IUserDao.findUsers");
        for(User user:users){
           // System.out.println(user.getId()+"==="+user.getUsername());
        }
        session.close();
    }


    //②测试连接池
    @Test
    public  void testDataSource() throws SQLException {
        //测试配置文件是否导入
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        System.out.println(context);
        ProxoolDataSource dataSource   = (ProxoolDataSource) context.getBean("dataSource");
        System.out.println(dataSource);
        System.out.println(dataSource.getConnection() + "==" + dataSource.getDriver() + "==="+ dataSource.getUser() + "===" +dataSource.getPassword());
        //测试类
    }



    //①测试是否加载配置文件 测试是否可以加载bean
    @Test
    public  void testApplicationContext(){
        //测试配置文件是否导入
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
        System.out.println(context);

        //测试类
//        User user = context.getBean(User.class);
//        System.out.println(user.hashCode()+"==="+user.getId() + "=="+ user.getUsername() + "===" + user.getPassword());
//        User user2 = (User) context.getBean("user");
//        System.out.println(user2.hashCode()+"=="+user2.getId() + "=="+ user2.getUsername() + "=="  + user2.getPassword());
    }




}
