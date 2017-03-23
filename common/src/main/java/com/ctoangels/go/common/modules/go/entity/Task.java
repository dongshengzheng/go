package com.ctoangels.go.common.modules.go.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 *
 *
 */
@TableName("t_task")
public class Task implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 任务id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 船名称
     */
    @TableField(value = "ship_name")
    private String shipName;

    /**
     * 船厂名称
     */
    private String shipyard;

    /**
     * 船厂短名称
     */
    @TableField(value = "shipyard_short")
    private String shipyardShort;

    /**
     * 维修工程进度id
     */
    @TableField(value = "repair_prog_id")
    private Integer repairProgId;

    /**
     * 公司id
     */
    @TableField(value = "company_id")
    private Integer companyId;

    /**
     * 任务状态：1进行中，0已结束,2未开始
     */
    private Integer status;

    /**  */
    @TableField(exist = false)
    private List<TaskEmail> emailList;

    /**  */
    @TableField(value = "create_by")
    private String createBy;

    /**  */
    @TableField(value = "create_date")
    private Date createDate;

    /**  */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 修改时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 状态0表示正常，1表示删除
     */
    @TableField(value = "del_flag")
    private Integer delFlag;

    /**
     * 获取最大详单的id
     */
    @TableField(value = "max_prog_detail_id")
    private Integer maxProgDetailId;

    /**
     * 最近一次的报告
     */
    @TableField(exist = false)
    private Report latestReport;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShipName() {
        return this.shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipyard() {
        return this.shipyard;
    }

    public void setShipyard(String shipyard) {
        this.shipyard = shipyard;
    }

    public String getShipyardShort() {
        return this.shipyardShort;
    }

    public void setShipyardShort(String shipyardShort) {
        this.shipyardShort = shipyardShort;
    }

    public Integer getRepairProgId() {
        return this.repairProgId;
    }

    public void setRepairProgId(Integer repairProgId) {
        this.repairProgId = repairProgId;
    }

    public Integer getCompanyId() {
        return this.companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public Integer getMaxProgDetailId() {
        return this.maxProgDetailId;
    }

    public void setMaxProgDetailId(Integer maxProgDetailId) {
        this.maxProgDetailId = maxProgDetailId;
    }

    public List<TaskEmail> getEmailList() {
        return emailList;
    }

    public void setEmailList(List<TaskEmail> emailList) {
        this.emailList = emailList;
    }

    public Report getLatestReport() {
        return latestReport;
    }

    public void setLatestReport(Report latestReport) {
        this.latestReport = latestReport;
    }
}
