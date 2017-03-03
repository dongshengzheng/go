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
@TableName("t_repair_prog_item")
public class RepairProgItem implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 维修进度项目id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 维修进度详细信息id
     */
    @TableField(value = "repair_prog_detail_id")
    private Integer repairProgDetailId;

    /**
     * 维修进度详细信息id
     */
    @TableField(exist = false)
    private String proOrderNo;

    /**
     * 维修项目类型
     */
    private String catagory;

    /**
     * 项目号
     */
    private String code;

    /**
     * 维修类容
     */
    private String content;

    /**
     * 单位
     */
    private String unit;

    /**
     * 数量
     */
    private String count;

    /**
     * 备注
     */
    private String remark;

    /**
     * 父项目号
     */
    @TableField(value = "parent_code")
    private Integer parent_code;

    /**
     * 维修信息
     */
    private String info;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 任务状态
     */
    @TableField(value = "task_status")
    private Integer taskStatus;

    /**
     * 维修进度id
     */
    @TableField(value = "repair_prog_id")
    private Integer repairProgId;

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
    private Integer delFlag = 0;

    /*判断是红本的数据，还是自定义的数据1：红本数据；0自定义数据*/
    private Integer src;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRepairProgDetailId() {
        return this.repairProgDetailId;
    }

    public void setRepairProgDetailId(Integer repairProgDetailId) {
        this.repairProgDetailId = repairProgDetailId;
    }

    public String getCatagory() {
        return this.catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUnit() {
        return this.unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getCount() {
        return this.count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Integer taskStatus) {
        this.taskStatus = taskStatus;
    }

    public Integer getRepairProgId() {
        return this.repairProgId;
    }

    public void setRepairProgId(Integer repairProgId) {
        this.repairProgId = repairProgId;
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

    public Integer getParent_code() {
        return parent_code;
    }

    public void setParent_code(Integer parent_code) {
        this.parent_code = parent_code;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getProOrderNo() {
        return proOrderNo;
    }

    public void setProOrderNo(String proOrderNo) {
        this.proOrderNo = proOrderNo;
    }

    public Integer getSrc() {
        return src;
    }

    public void setSrc(Integer src) {
        this.src = src;
    }
}
