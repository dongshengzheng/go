package com.fish.idle.service.modules.jsdd.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fish.idle.service.util.BaseEntity;

import java.util.Date;

/**
 *
 * 评估报告
 *
 */
@TableName("dd_report")
public class Report extends BaseEntity {
	/** 作品Id */
	@TableField(value = "works_id")
	private Integer worksId;

	/** 作品编号 */
	@TableField(value = "works_no")
	private String worksNo;
	/** 评估报告内容 */
	private String des;

	/** 认证报告 */
	private String certify;

	/** 价值有效时间 */
	@TableField(value = "valid_time")
	private Date validTime;

	public Integer getWorksId() {
		return this.worksId;
	}

	public void setWorksId(Integer worksId) {
		this.worksId = worksId;
	}

	public String getWorksNo() {
		return this.worksNo;
	}

	public void setWorksNo(String worksNo) {
		this.worksNo = worksNo;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getCertify() {
		return certify;
	}

	public void setCertify(String certify) {
		this.certify = certify;
	}

	public Date getValidTime() {
		return validTime;
	}

	public void setValidTime(Date validTime) {
		this.validTime = validTime;
	}

	public Report() {
	}

	public Report(Integer worksId) {
		this.worksId = worksId;
	}
}
