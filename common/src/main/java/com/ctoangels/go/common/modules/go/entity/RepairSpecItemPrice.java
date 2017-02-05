package com.ctoangels.go.common.modules.go.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("t_repair_spec_item_price")
public class RepairSpecItemPrice implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 每个项目的价格id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 单价 */
	@TableField(value = "unit_price")
	private String unitPrice;

	/** 总价 */
	@TableField(value = "total_price")
	private String totalPrice;

	/** 备注 */
	private String remark;

	/** 维修工程单项目id */
	@TableField(value = "repair_spec_item_id")
	private Integer repairSpecItemId;

	/** 询价的id */
	@TableField(value = "enquiry_id")
	private Integer enquiryId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getRepairSpecItemId() {
		return this.repairSpecItemId;
	}

	public void setRepairSpecItemId(Integer repairSpecItemId) {
		this.repairSpecItemId = repairSpecItemId;
	}

	public Integer getEnquiryId() {
		return this.enquiryId;
	}

	public void setEnquiryId(Integer enquiryId) {
		this.enquiryId = enquiryId;
	}

}
