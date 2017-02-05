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
@TableName("t_berth_detail")
public class BerthDetail implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 泊位信息id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 船厂id */
	@TableField(value = "shipyard_id")
	private Integer shipyardId;

	/** 总长 */
	private Integer loa;

	/** 草案 */
	private Integer protocol;

	/** 能力 */
	private Integer capacity;

	/** 起重机 */
	private String cranes;


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

	public Integer getLoa() {
		return this.loa;
	}

	public void setLoa(Integer loa) {
		this.loa = loa;
	}

	public Integer getProtocol() {
		return this.protocol;
	}

	public void setProtocol(Integer protocol) {
		this.protocol = protocol;
	}

	public Integer getCapacity() {
		return this.capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public String getCranes() {
		return this.cranes;
	}

	public void setCranes(String cranes) {
		this.cranes = cranes;
	}

}
