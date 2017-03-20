package com.ctoangels.go.common.modules.go.entity;

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
@TableName("t_report")
public class Report implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 报告id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 任务id
     */
    @TableField(value = "task_id")
    private Integer taskId;

    /**
     * 公司id
     */
    @TableField(value = "company_id")
    private Integer companyId;

    /**
     * 发布时间
     */
    @TableField(value = "publish_time")
    private String publishTime;

    /**
     * 维修详单id
     */
    @TableField(value = "repair_prog_detail_id")
    private Integer repairProgDetailId;

    /**
     * 创建时间
     */
    @TableField(value = "generate_time")
    private String generateTime;

    /**
     * 是否发布 0未发布1 发布
     */
    @TableField(value = "is_publish")
    private Integer isPublish;

    /**
     * 天气
     */
    private String weather;

    /**
     * 温度
     */
    private String temperature;

    /**
     * 湿度
     */
    private String hnmiaity;

    /**
     * memo
     */
    private String memo;

    /**
     * 明日计划
     */
    @TableField(value = "tomorrow_plan")
    private String tomorrowPlan;

    /**
     * 今日工作
     */
    @TableField(value = "crew_job")
    private String crewJob;

    /**
     * 验船师状态
     */
    @TableField(value = "surveyor_status")
    private String surveyorStatus;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 更新者
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 状态0表示正常，1表示删除
     */
    @TableField(value = "del_flag")
    private Integer delFlag;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTaskId() {
        return this.taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getCompanyId() {
        return this.companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getPublishTime() {
        return this.publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getRepairProgDetailId() {
        return this.repairProgDetailId;
    }

    public void setRepairProgDetailId(Integer repairProgDetailId) {
        this.repairProgDetailId = repairProgDetailId;
    }

    public String getGenerateTime() {
        return this.generateTime;
    }

    public void setGenerateTime(String generateTime) {
        this.generateTime = generateTime;
    }

    public Integer getIsPublish() {
        return this.isPublish;
    }

    public void setIsPublish(Integer isPublish) {
        this.isPublish = isPublish;
    }

    public String getWeather() {
        return this.weather;
    }

    public void setWeather(String weather) {
        this.weather = weather;
    }

    public String getTemperature() {
        return this.temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getHnmiaity() {
        return this.hnmiaity;
    }

    public void setHnmiaity(String hnmiaity) {
        this.hnmiaity = hnmiaity;
    }

    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getTomorrowPlan() {
        return this.tomorrowPlan;
    }

    public void setTomorrowPlan(String tomorrowPlan) {
        this.tomorrowPlan = tomorrowPlan;
    }

    public String getCrewJob() {
        return this.crewJob;
    }

    public void setCrewJob(String crewJob) {
        this.crewJob = crewJob;
    }

    public String getSurveyorStatus() {
        return this.surveyorStatus;
    }

    public void setSurveyorStatus(String surveyorStatus) {
        this.surveyorStatus = surveyorStatus;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getDelFlag() {
        return this.delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

}
