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
@TableName("t_task_email")
public class TaskEmail implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 邮箱id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 邮箱地址 */
	private String email;

	/** 任务id */
	@TableField(value = "task_id")
	private Integer taskId;

	/** 创建者 */
	@TableField(value = "create_by")
	private String createBy;

	/** 更新时间 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 修改者 */
	@TableField(value = "update_by")
	private String updateBy;

	/** 修改时间 */
	@TableField(value = "update_date")
	private Date updateDate;

	/** 状态，0表示正常，1表示删除 */
	@TableField(value = "del_flag")
	private Integer delFlag;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getTaskId() {
		return this.taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
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

}
