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
@TableName("t_memo_media")
public class MemoMedia implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 分类id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** memo id */
	@TableField(value = "report_detail_memo_id")
	private Integer reportDetailMemoId;

	/** 媒体类型 */
	private String type;

	/** 文件名称 */
	private String filename;

	/** 录音时间 */
	@TableField(value = "record_time")
	private Integer recordTime;

	/** 阿里云路径 */
	private String oss;

	/** 亚马孙路径 */
	private String s3;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getReportDetailMemoId() {
		return this.reportDetailMemoId;
	}

	public void setReportDetailMemoId(Integer reportDetailMemoId) {
		this.reportDetailMemoId = reportDetailMemoId;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(Integer recordTime) {
		this.recordTime = recordTime;
	}


	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOss() {
		return oss;
	}

	public void setOss(String oss) {
		this.oss = oss;
	}

	public String getS3() {
		return s3;
	}

	public void setS3(String s3) {
		this.s3 = s3;
	}
}
