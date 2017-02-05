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
@TableName("t_repair_spec_detail_req")
public class RepairSpecDetailReq implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 修理要求/和材料规格的id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 要求描述/和材料规格 */
	private String desc;

	/** 单位 */
	private String unit;

	/** 数量 */
	private String count;

	/** 维修工程单范本的id */
	@TableField(value = "repair_spec_detail_id")
	private Integer repairSpecDetailId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getCount() {
		return this.count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public Integer getRepairSpecDetailId() {
		return this.repairSpecDetailId;
	}

	public void setRepairSpecDetailId(Integer repairSpecDetailId) {
		this.repairSpecDetailId = repairSpecDetailId;
	}

}
