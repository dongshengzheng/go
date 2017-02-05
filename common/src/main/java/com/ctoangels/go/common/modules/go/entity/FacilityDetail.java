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
@TableName("t_facility_detail")
public class FacilityDetail implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 起重机信息id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 船厂id */
	@TableField(value = "shipyard_id")
	private Integer shipyardId;

	/** 类型 */
	private String type;

	/** 能力 */
	private Integer capacity;

	/** 备注 */
	private String remark;

	/** 单元 */
	private String unit;

	/** 设施类型 */
	@TableField(value = "faci_category")
	private String faciCategory;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getShipyardId() {
		return this.shipyardId;
	}

	public void setShipyardId(Integer shipyardId) {
		this.shipyardId = shipyardId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getCapacity() {
		return this.capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getFaciCategory() {
		return this.faciCategory;
	}

	public void setFaciCategory(String faciCategory) {
		this.faciCategory = faciCategory;
	}

}
