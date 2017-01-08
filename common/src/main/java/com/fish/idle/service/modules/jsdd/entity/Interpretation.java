package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.util.BaseEntity;

/**
 *
 *
 *
 */
@TableName("dd_interpretation")
public class Interpretation  extends BaseEntity {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**  */
    @TableField(value = "works_id")
    private Integer worksId;

    /**
     * 诠释者id
     */
    @TableField(value = "user_id")
    private Integer userId;

    /**  */
    private String type;

    /**
     * 诠释有递归
     */
    @TableField(value = "parent_id")
    private Integer parentId;

    /**
     * 想要的分数 选项20 50 100
     */
    @TableField(value = "score_demanded")
    private Integer scoreDemanded;

    /**
     * 诠释文字说明
     */
    private String description;

    /**
     * 是否提交成功
     */
    private Integer status;

    /**  */
    @TableField(value = "deal_date")
    private Date dealDate;

    /**  */
    @TableField(exist = false)
    private String picture;

    /**  */
    @TableField(value = "follow_count")
    private Integer followCount;
    /**
     * 诠释的图片
     */
    @TableField(exist = false)
    private List<Images> imagesList;
    /**
     * 诠释者
     */
    @TableField(exist = false)
    private AppUser appUser;
    public Integer getWorksId() {
        return this.worksId;
    }

    public void setWorksId(Integer worksId) {
        this.worksId = worksId;
    }

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getParentId() {
        return this.parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getScoreDemanded() {
        return this.scoreDemanded;
    }

    public void setScoreDemanded(Integer scoreDemanded) {
        this.scoreDemanded = scoreDemanded;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDealDate() {
        return this.dealDate;
    }

    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    public String getPicture() {
        return this.picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getFollowCount() {
        return this.followCount;
    }

    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Images> getImagesList() {
        return imagesList;
    }

    public void setImagesList(List<Images> imagesList) {
        this.imagesList = imagesList;
    }

    public AppUser getAppUser() {
        return appUser;
    }

    public void setAppUser(AppUser appUser) {
        this.appUser = appUser;
    }

}
