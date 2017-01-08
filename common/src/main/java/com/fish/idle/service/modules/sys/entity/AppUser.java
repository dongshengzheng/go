package com.fish.idle.service.modules.sys.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 *
 *
 */
@TableName("sys_app_user")
public class AppUser implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**  */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 登录名
     */
    @TableField(value = "login_name")
    private String loginName;

    /**
     * 登录密码
     */
    private String password;

    /**
     * 真实姓名
     */
    private String name;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 身份证
     */
    private String identification;

    /**
     * 是否公开
     */
    private Boolean pub;

    /**
     * 积分
     */
    private Integer score;

    /**
     * openId
     */
    @TableField(value = "open_id")
    private String openId;

    /**
     * 偏好
     */
    private String prefer;

    /**
     * 地址
     */
    private String address;

    /**
     * 头像图片地址
     */
    @TableField(value = "head_img_url")
    private String headImgUrl;


    /**
     * 逻辑删除标志
     */
    @TableField(value = "del_flag")
    private Integer delFlag = 0;

    /**
     * 最后登录时间
     */
    @TableField(value = "last_login")
    private Date lastLogin;

    // 业务字段
    /**
     * 粉丝数量，冗余字段
     */
    @TableField(exist = false)
    private int followCount;

    /**
     * 作品数量，冗余字段
     */
    @TableField(exist = false)
    private int worksCount;

    /**
     * 关注他人数量，冗余字段
     */
    @TableField(exist = false)
    private Integer focusOtherCount;

    /**
     * 收藏作品数量，冗余字段
     */
    @TableField(exist = false)
    private Integer collectionCount;

    //判断'我'是否关注了该用户
    @TableField(exist = false)
    private int follow;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return this.loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdentification() {
        return this.identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification;
    }

    public Boolean getPub() {
        return this.pub;
    }

    public void setPub(Boolean pub) {
        this.pub = pub;
    }

    public Integer getScore() {
        return this.score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getOpenId() {
        return this.openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getPrefer() {
        return this.prefer;
    }

    public void setPrefer(String prefer) {
        this.prefer = prefer;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHeadImgUrl() {
        return this.headImgUrl;
    }

    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public int getFollowCount() {
        return followCount;
    }

    public void setFollowCount(int followCount) {
        this.followCount = followCount;
    }

    public int getWorksCount() {
        return worksCount;
    }

    public void setWorksCount(int worksCount) {
        this.worksCount = worksCount;
    }

    public Integer getFocusOtherCount() {
        return focusOtherCount;
    }

    public void setFocusOtherCount(Integer focusOtherCount) {
        this.focusOtherCount = focusOtherCount;
    }

    public Integer getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(Integer collectionCount) {
        this.collectionCount = collectionCount;
    }

    public AppUser() {
    }

    public AppUser(Integer id) {
        this.id = id;
    }

    public AppUser(Integer id, String headImgUrl) {
        this.id = id;
        this.headImgUrl = headImgUrl;
    }

    public int getFollow() {
        return follow;
    }

    public void setFollow(int follow) {
        this.follow = follow;
    }
}
