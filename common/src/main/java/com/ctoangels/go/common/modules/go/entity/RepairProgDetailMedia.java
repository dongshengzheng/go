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
@TableName("t_repair_prog_detail_media")
public class RepairProgDetailMedia implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/**  */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/**  */
	@TableField(value = "repair_prog_detail_id")
	private Integer repairProgDetailId;

	/**  */
	private Integer type;

	/**  */
	private String oss;

	/**  */
	private String s3;

	/**  */
	private String filename;


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

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getOss() {
		return this.oss;
	}

	public void setOss(String oss) {
		this.oss = oss;
	}

	public String getS3() {
		return this.s3;
	}

	public void setS3(String s3) {
		this.s3 = s3;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
