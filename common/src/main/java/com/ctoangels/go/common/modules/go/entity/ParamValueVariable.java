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
@TableName("t_param_value_variable")
public class ParamValueVariable implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 参数可变值id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 参数id */
	@TableField(value = "param_code")
	private Integer paramCode;

	/** 参数可选值 */
	@TableField(value = "param_val_variable")
	private String paramValVariable;

	/** 红本id */
	@TableField(value = "modle_id")
	private Integer modelId;

	/** 建立者 */
	@TableField(value = "create_by")
	private String createBy;

	/** 建立时间 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 修改者 */
	@TableField(value = "update_by")
	private String updateBy;

	/** 修改时间 */
	@TableField(value = "update_date")
	private Date updateDate;

	/** 状态 */
	@TableField(value = "del_flag")
	private Integer delFlag;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParamCode() {
		return this.paramCode;
	}

	public void setParamCode(Integer paramCode) {
		this.paramCode = paramCode;
	}

	public String getParamValVariable() {
		return this.paramValVariable;
	}

	public void setParamValVariable(String paramValVariable) {
		this.paramValVariable = paramValVariable;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}
}
