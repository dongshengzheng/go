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
@TableName("t_repair_prog_detail")
public class RepairProgDetail implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 维修进度详细信息id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 维修进度id
     */
    @TableField(value = "repair_prog_id")
    private Integer repairProgId;

    /**
     * 项目号
     */
    private String code;

    /**
     * 项目分类
     */
    private String catagory;

    /**
     * 项目名称
     */
    @TableField(value = "pro_name")
    private String proName;

    /**
     * 工程描述
     */
    @TableField(value = "pro_desc")
    private String proDesc;

    /**
     * 设备名称
     */
    @TableField(value = "faci_name")
    private String faciName;

    /**
     * 设备名称
     */
    @TableField(value = "faci_type")
    private String faciType;

    /**
     * 序列号
     */
    @TableField(value = "faci_no")
    private String faciNo;

    /**
     * 相关参数
     */
    @TableField(value = "faci_param")
    private String faciParam;

    /**
     * 厂家/国家
     */
    @TableField(value = "faci_src")
    private String faciSrc;

    /**
     * 维修部位
     */
    @TableField(value = "repair_position")
    private String repairPosition;

    /**
     * 维修详细位置
     */
    @TableField(value = "repair_position_desc")
    private String repairPositionDesc;

    /**
     * 损坏程度
     */
    private String damage;

    /**
     * 修理工艺
     */
    @TableField(value = "repair_tech")
    private String repairTech;

    /**
     * 详细修理工艺
     */
    @TableField(value = "repair_tech_desc")
    private String repairTechDesc;

    /**
     * 船名
     */
    @TableField(value = "ship_name")
    private String shipName;

    /**
     * 项目单号
     */
    @TableField(value = "pro_order_no")
    private String proOrderNo;


    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 创建用户
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 修改时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 修改用户
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 状态
     */
    @TableField(value = "del_flag")
    private Integer delFlag;

    /**
     * 任务状态
     */
    @TableField(value = "task_status")
    private Integer taskStatus;

    /**
     * 任务状态
     */
    @TableField(value = "view_catagory")
    private String viewCatagory;


    /** 脚手架数量*/
    @TableField(value = "scaffold_num")
    private String scaffoldNum;

    /** 填表人角色*/
    @TableField(value = "preparer_role")
    private Integer preparerRole;

    /** 填表人*/
    private String preparer;

    /** 船员主管角色*/
    @TableField(value = "director_role")
    private Integer directorRole;

    /** 船员主管*/
    private String director;

    /** 机务*/
    private String engineer;



    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRepairProgId() {
        return this.repairProgId;
    }

    public void setRepairProgId(Integer repairProgId) {
        this.repairProgId = repairProgId;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCatagory() {
        return this.catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getProName() {
        return this.proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProDesc() {
        return this.proDesc;
    }

    public void setProDesc(String proDesc) {
        this.proDesc = proDesc;
    }

    public String getFaciName() {
        return this.faciName;
    }

    public void setFaciName(String faciName) {
        this.faciName = faciName;
    }

    public String getFaciType() {
        return this.faciType;
    }

    public void setFaciType(String faciType) {
        this.faciType = faciType;
    }

    public String getFaciNo() {
        return this.faciNo;
    }

    public void setFaciNo(String faciNo) {
        this.faciNo = faciNo;
    }

    public String getFaciParam() {
        return this.faciParam;
    }

    public void setFaciParam(String faciParam) {
        this.faciParam = faciParam;
    }

    public String getFaciSrc() {
        return this.faciSrc;
    }

    public void setFaciSrc(String faciSrc) {
        this.faciSrc = faciSrc;
    }

    public String getRepairPosition() {
        return this.repairPosition;
    }

    public void setRepairPosition(String repairPosition) {
        this.repairPosition = repairPosition;
    }

    public String getRepairPositionDesc() {
        return this.repairPositionDesc;
    }

    public void setRepairPositionDesc(String repairPositionDesc) {
        this.repairPositionDesc = repairPositionDesc;
    }

    public String getDamage() {
        return this.damage;
    }

    public void setDamage(String damage) {
        this.damage = damage;
    }

    public String getRepairTech() {
        return this.repairTech;
    }

    public void setRepairTech(String repairTech) {
        this.repairTech = repairTech;
    }

    public String getRepairTechDesc() {
        return this.repairTechDesc;
    }

    public void setRepairTechDesc(String repairTechDesc) {
        this.repairTechDesc = repairTechDesc;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Integer getDelFlag() {
        return this.delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getProOrderNo() {
        return proOrderNo;
    }

    public void setProOrderNo(String proOrderNo) {
        this.proOrderNo = proOrderNo;
    }


    public Integer getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Integer taskStatus) {
        this.taskStatus = taskStatus;
    }

    public String getViewCatagory() {
        return viewCatagory;
    }

    public void setViewCatagory(String viewCatagory) {
        this.viewCatagory = viewCatagory;
    }

    public String getScaffoldNum() {
        return scaffoldNum;
    }

    public void setScaffoldNum(String scaffoldNum) {
        this.scaffoldNum = scaffoldNum;
    }

    public Integer getPreparerRole() {
        return preparerRole;
    }

    public void setPreparerRole(Integer preparerRole) {
        this.preparerRole = preparerRole;
    }

    public String getPreparer() {
        return preparer;
    }

    public void setPreparer(String preparer) {
        this.preparer = preparer;
    }

    public Integer getDirectorRole() {
        return directorRole;
    }

    public void setDirectorRole(Integer directorRole) {
        this.directorRole = directorRole;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getEngineer() {
        return engineer;
    }

    public void setEngineer(String engineer) {
        this.engineer = engineer;
    }
}
