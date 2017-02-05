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
@TableName("t_repair_spec")
public class RepairSpec implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修工程单id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 维修单号 */
	@TableField(value = "order_no")
	private String orderNo;

	/** spec name */
	private String name;

	/** 船id */
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

	/** 创建日期 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 创建用户 */
	@TableField(value = "create_user")
	private String createUser;

	/** 修改日期 */
	@TableField(value = "modify_date")
	private Date modifyDate;

	/** 修改用户 */
	@TableField(value = "modify_user")
	private String modifyUser;

	/** 状态 */
	private Integer status;


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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getModifyDate() {
		return this.modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getModifyUser() {
		return this.modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
