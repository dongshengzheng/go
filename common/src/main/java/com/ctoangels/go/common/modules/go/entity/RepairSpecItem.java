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
@TableName("t_repair_spec_item")
public class RepairSpecItem implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修工程详情的id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 维修工程的id */
	@TableField(value = "repair_spec_detail_id")
	private Integer repairSpecDetailId;

	/** 维修项目类型 */
	private String catagory;

	/** 项目号 */
	private String code;

	/** 维修类容 */
	private String content;

	/** 单位 */
	private String unit;

	/** 数量 */
	private Integer count;

	/** 备注 */
	private String remark;

	/** 维修信息 */
	private String info;

	/** 父id */
	private Integer parentid;

	/** 维修工程的id */
	@TableField(value = "repair_spec_id")
	private Integer repairSpecId;

	/** 是否需要维修的状态 */
	private Integer status;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRepairSpecDetailId() {
		return this.repairSpecDetailId;
	}

	public void setRepairSpecDetailId(Integer repairSpecDetailId) {
		this.repairSpecDetailId = repairSpecDetailId;
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

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
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

	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Integer getRepairSpecId() {
		return this.repairSpecId;
	}

	public void setRepairSpecId(Integer repairSpecId) {
		this.repairSpecId = repairSpecId;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
