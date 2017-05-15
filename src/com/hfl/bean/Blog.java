package com.hfl.bean;

import java.util.Date;

/**
 *  blog
 */
public class Blog {
    // 主键
    private Integer id;
    // 标题
    private String title;
    // 描述
    private String description;
    // 分类
    private Integer categoryId;
    // 封面图
    private String img;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;
    // 音乐播放地址
    private String musiclink;
    // 歌者
    private String musictor;
    // 音乐标题
    private String musictitle;
    // 音乐大小
    private Integer musicsize;
    // 音乐时长
    private String musictime;
    // 点击数
    private Integer hits;
    // 评论数
    private Integer comments;
    // 发布状态0未发布1发布
    private Integer status;
    // 删除状态0未删除1删除
    private Integer isDelete;
    /*是否置顶0否1是*/
    private Integer isTop;
    // 添加用户
    private Integer userId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getMusiclink() {
        return musiclink;
    }

    public void setMusiclink(String musiclink) {
        this.musiclink = musiclink;
    }

    public String getMusictor() {
        return musictor;
    }

    public void setMusictor(String musictor) {
        this.musictor = musictor;
    }

    public String getMusictitle() {
        return musictitle;
    }

    public void setMusictitle(String musictitle) {
        this.musictitle = musictitle;
    }

    public Integer getMusicsize() {
        return musicsize;
    }

    public void setMusicsize(Integer musicsize) {
        this.musicsize = musicsize;
    }

    public String getMusictime() {
        return musictime;
    }

    public void setMusictime(String musictime) {
        this.musictime = musictime;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
