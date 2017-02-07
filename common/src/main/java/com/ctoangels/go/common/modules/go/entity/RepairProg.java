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
@TableName("t_repair_prog")
public class RepairProg implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修进度id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 维修单号 */
	@TableField(value = "order_no")
	private String orderNo;

	/** 船的id */
	@TableField(value = "ship_id")
	private Integer shipId;

	/** 公司id */
	@TableField(value = "company_id")
	private Integer companyId;

	/** 计划进厂日期 */
	@TableField(value = "s_start_date")
	private Date sStartDate;

	/** 计划天数 */
	@TableField(value = "s_days")
	private Integer sDays;

	/** 计划金额 */
	@TableField(value = "s_cost")
	private Integer sCost;

	/** 维修类型 */
	private String type;

	/** 询价id */
	@TableField(value = "enquiry_id")
	private Integer enquiryId;

	/** 创建时间 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 创建用户 */
	@TableField(value = "create_by")
	private String createBy;

	/** 修改时间 */
	@TableField(value = "update_date")
	private Date updateDate;

	/** 修改用户 */
	@TableField(value = "update_by")
	private String updateBy;

	/** 状态 */
	@TableField(value = "del_flag")
	private Integer delFlag;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getShipId() {
		return this.shipId;
	}

	public void setShipId(Integer shipId) {
		this.shipId = shipId;
	}

	public Integer getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Date getSStartDate() {
		return this.sStartDate;
	}

	public void setSStartDate(Date sStartDate) {
		this.sStartDate = sStartDate;
	}

	public Integer getSDays() {
		return this.sDays;
	}

	public void setSDays(Integer sDays) {
		this.sDays = sDays;
	}

	public Integer getSCost() {
		return this.sCost;
	}

	public void setSCost(Integer sCost) {
		this.sCost = sCost;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getEnquiryId() {
		return this.enquiryId;
	}

	public void setEnquiryId(Integer enquiryId) {
		this.enquiryId = enquiryId;
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

}
