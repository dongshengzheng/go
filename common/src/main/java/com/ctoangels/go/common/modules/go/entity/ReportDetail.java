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
@TableName("t_report_detail")
public class ReportDetail implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 详单的报告id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 是否外包 0不是1是
     */
    @TableField(value = "out_source")
    private Integer outSource;

    /**
     * 维修进度id
     */
    @TableField(value = "repair_prog_id")
    private Integer repairProgId;

    /**
     * 维修进度详单的id
     */
    @TableField(value = "repair_prog_detail_id")
    private Integer repairProgDetailId;

    /**
     * 维修进度详单
     */
    @TableField(exist = false)
    private RepairProgDetail repairProgDetail;

    /**
     * 报告id
     */
    @TableField(value = "report_id")
    private Integer reportId;


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

    /*工程进度状态*/
    @TableField(value = "task_status")
    private Integer taskStatus;

    /*是否已经提交状态*/
    @TableField(value = "submit_status")
    private Integer submitStatus;

    /*备注信息*/
    private String memo;


    /*图片集合*/
    @TableField(exist = false)
    private List<MemoMedia> imgList;

    /*语音集合*/
    @TableField(exist = false)
    private List<MemoMedia> mp3List;

    /*其他文件集合*/
    @TableField(exist = false)
    private List<MemoMedia> otherList;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOutSource() {
        return this.outSource;
    }

    public void setOutSource(Integer outSource) {
        this.outSource = outSource;
    }

    public Integer getRepairProgId() {
        return this.repairProgId;
    }

    public void setRepairProgId(Integer repairProgId) {
        this.repairProgId = repairProgId;
    }

    public Integer getRepairProgDetailId() {
        return this.repairProgDetailId;
    }

    public void setRepairProgDetailId(Integer repairProgDetailId) {
        this.repairProgDetailId = repairProgDetailId;
    }

    public Integer getReportId() {
        return this.reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
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
        return updateDate;
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

    public RepairProgDetail getRepairProgDetail() {
        return repairProgDetail;
    }

    public void setRepairProgDetail(RepairProgDetail repairProgDetail) {
        this.repairProgDetail = repairProgDetail;
    }

    public Integer getSubmitStatus() {
        return submitStatus;
    }

    public void setSubmitStatus(Integer submitStatus) {
        this.submitStatus = submitStatus;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Integer getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Integer taskStatus) {
        this.taskStatus = taskStatus;
    }

    public List<MemoMedia> getImgList() {
        return imgList;
    }

    public void setImgList(List<MemoMedia> imgList) {
        this.imgList = imgList;
    }

    public List<MemoMedia> getMp3List() {
        return mp3List;
    }

    public void setMp3List(List<MemoMedia> mp3List) {
        this.mp3List = mp3List;
    }

    public List<MemoMedia> getOtherList() {
        return otherList;
    }

    public void setOtherList(List<MemoMedia> otherList) {
        this.otherList = otherList;
    }
}
