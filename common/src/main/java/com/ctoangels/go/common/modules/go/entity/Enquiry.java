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

	/** 维修船厂id */
	@TableField(value = "private_shipyard_id")
	private Integer privateShipyardId;

	/** 维修船厂名称 */
	@TableField(value = "private_shipyard_name")
	private String privateShipyardName;

	/** 维修工程单的id */
	@TableField(value = "repair_spec_id")
	private Integer repairSpecId;

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

	/** 文件名称 */
	@TableField(value = "file_name")
	private String fileName;

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

	public Integer getPrivateShipyardId() {
		return privateShipyardId;
	}

	public void setPrivateShipyardId(Integer privateShipyardId) {
		this.privateShipyardId = privateShipyardId;
	}

	public String getPrivateShipyardName() {
		return privateShipyardName;
	}

	public void setPrivateShipyardName(String privateShipyardName) {
		this.privateShipyardName = privateShipyardName;
	}

	public Integer getRepairSpecId() {
		return repairSpecId;
	}

	public void setRepairSpecId(Integer repairSpecId) {
		this.repairSpecId = repairSpecId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
