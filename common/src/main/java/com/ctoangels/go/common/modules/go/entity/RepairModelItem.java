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
@TableName("t_repair_model_item")
public class RepairModelItem implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修红本项目id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** '维修项目类型' */
	private String catagory;

	/** 项目号 */
	private String code;

	/** 维修类容 */
	private String content;

	/** 单位 */
	private String unit;

	/** 数量 */
	private String count;

	/** 备注 */
	private String remark;

	/** 维修信息 */
	private String info;

	/** 父id */
	private String parentid;

	/** 状态 */
	private String status;

	/** 维修红本id */
	@TableField(value = "repair_model_id")
	private Integer repairModelId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCatagory() {
		return this.catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getParentid() {
		return this.parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getRepairModelId() {
		return this.repairModelId;
	}

	public void setRepairModelId(Integer repairModelId) {
		this.repairModelId = repairModelId;
	}

}
