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
@TableName("t_repair_prog_item")
public class RepairProgItem implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修进度项目id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 维修进度详细信息id */
	@TableField(value = "repair_prog_detail_id")
	private Integer repairProgDetailId;

	/** 维修项目类型 */
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

	/** 父id */
	private Integer parentid;

	/** 维修信息 */
	private String info;

	/** 任务状态 */
	@TableField(value = "task_status")
	private String taskStatus;

	/** 维修进度id */
	@TableField(value = "repair_prog_id")
	private Integer repairProgId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRepairProgDetailId() {
		return this.repairProgDetailId;
	}

	public void setRepairProgDetailId(Integer repairProgDetailId) {
		this.repairProgDetailId = repairProgDetailId;
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

	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTaskStatus() {
		return this.taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public Integer getRepairProgId() {
		return this.repairProgId;
	}

	public void setRepairProgId(Integer repairProgId) {
		this.repairProgId = repairProgId;
	}

}
