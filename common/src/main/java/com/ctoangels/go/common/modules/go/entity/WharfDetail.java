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
@TableName("t_wharf_detail")
public class WharfDetail implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 码头信息id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 船厂id */
	@TableField(value = "shipyard_id")
	private Integer shipyardId;

	/** 类型 */
	private String type;

	/** 姓名 */
	private String name;

	/** 能力 */
	private Integer capacity;

	/** 提升能力 */
	@TableField(value = "lift_capacity")
	private Integer liftCapacity;

	/** 维：长度 */
	private Integer lengh;

	/** 维：宽度 */
	private Integer width;

	/** '维：草案' */
	private Integer protocol;

	/** 起重机 */
	private String cranes;

	/** 备注 */
	private String remark;


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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCapacity() {
		return this.capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Integer getLiftCapacity() {
		return this.liftCapacity;
	}

	public void setLiftCapacity(Integer liftCapacity) {
		this.liftCapacity = liftCapacity;
	}

	public Integer getLengh() {
		return this.lengh;
	}

	public void setLengh(Integer lengh) {
		this.lengh = lengh;
	}

	public Integer getWidth() {
		return this.width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getProtocol() {
		return this.protocol;
	}

	public void setProtocol(Integer protocol) {
		this.protocol = protocol;
	}

	public String getCranes() {
		return this.cranes;
	}

	public void setCranes(String cranes) {
		this.cranes = cranes;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
