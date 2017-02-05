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
@TableName("t_repair_prog_detail_req")
public class RepairProgDetailReq implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修进度中修理要求和规格的id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** '要求描述/材料规格' */
	private String desc;

	/** 单位 */
	private String unit;

	/** 数量 */
	private Integer count;

	/** 维修进度详细的信息id */
	@TableField(value = "repair_prog_detail_id")
	private Integer repairProgDetailId;


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

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getRepairProgDetailId() {
		return this.repairProgDetailId;
	}

	public void setRepairProgDetailId(Integer repairProgDetailId) {
		this.repairProgDetailId = repairProgDetailId;
	}

}
