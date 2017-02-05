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
@TableName("t_enquiry")
public class Enquiry implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 询价id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 询价标题 */
	private String title;

	/** 供应商 */
	private String supplier;

	/** 报价日期 */
	@TableField(value = "quote_date")
	private Date quoteDate;

	/** 报价总额 */
	@TableField(value = "quote_totle_price")
	private String quoteTotlePrice;

	/** 其他费用 */
	@TableField(value = "other_price")
	private String otherPrice;

	/** 折扣率 */
	private String discount;

	/** 支付方式 */
	private String payment;

	/** 发票类型 */
	@TableField(value = "invoice_type")
	private String invoiceType;

	/** 维修工程单的id */
	@TableField(value = "t_repair_spec_id")
	private Integer tRepairSpecId;

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

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSupplier() {
		return this.supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Date getQuoteDate() {
		return this.quoteDate;
	}

	public void setQuoteDate(Date quoteDate) {
		this.quoteDate = quoteDate;
	}

	public String getQuoteTotlePrice() {
		return this.quoteTotlePrice;
	}

	public void setQuoteTotlePrice(String quoteTotlePrice) {
		this.quoteTotlePrice = quoteTotlePrice;
	}

	public String getOtherPrice() {
		return this.otherPrice;
	}

	public void setOtherPrice(String otherPrice) {
		this.otherPrice = otherPrice;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getPayment() {
		return this.payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getInvoiceType() {
		return this.invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public Integer getTRepairSpecId() {
		return this.tRepairSpecId;
	}

	public void setTRepairSpecId(Integer tRepairSpecId) {
		this.tRepairSpecId = tRepairSpecId;
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
