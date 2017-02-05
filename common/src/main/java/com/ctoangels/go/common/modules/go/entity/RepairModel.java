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
@TableName("t_repair_model")
public class RepairModel implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修红本id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/**  */
	private String name;

	/** 维修类型 */
	private String desc;

	/** 红本版本号 */
	private String version;

	/** 创建时间 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 创建用户 */
	@TableField(value = "create_user")
	private String createUser;

	/** 修改时间 */
	@TableField(value = "modify_date")
	private Date modifyDate;

	/** 修改用户 */
	@TableField(value = "modify_user")
	private String modifyUser;

	/** 状态 */
	private String status;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return this.desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getVersion() {
		return this.version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getModifyDate() {
		return this.modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getModifyUser() {
		return this.modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
