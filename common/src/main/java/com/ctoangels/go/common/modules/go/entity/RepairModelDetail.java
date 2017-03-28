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
@TableName("t_repair_model_detail")
public class RepairModelDetail implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 维修工程范本的id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 船名 */
	@TableField(value = "ship_name")
	private String shipName;

	/** 项目号 */
	private String code;

	/** 项目分类 */
	private String catagory;

	/** 项目单号 */
	@TableField(value = "pro_order_no")
	private String proOrderNo;

	/** 项目名称 */
	@TableField(value = "pro_name")
	private String proName;

	/** 项目描述 */
	@TableField(value = "pro_desc")
	private String proDesc;

	/** 设备名称 */
	@TableField(value = "faci_name")
	private String faciName;

	/** 设备类型 */
	@TableField(value = "faci_type")
	private String faciType;

	/** 厂家/国家 */
	@TableField(value = "faci_src")
	private String faciSrc;

	/** 设备信息：序列号 */
	@TableField(value = "faci_no")
	private String faciNo;

	/** 设备信息：相关参数 */
	@TableField(value = "faci_param")
	private String faciParam;

	/** 维修部位 */
	@TableField(value = "repair_position")
	private String repairPosition;

	/** 维修详细位置 */
	@TableField(value = "repair_position_desc")
	private String repairPositionDesc;

	/** 损坏程度 */
	private String damage;

	/** 修理工艺 */
	@TableField(value = "repair_tech")
	private String repairTech;

	/** 详细修理工艺 */
	@TableField(value = "repair_tech_desc")
	private String repairTechDesc;

	/** 创建时间 */
	@TableField(value = "create_date")
	private Date createDate;

	/** 创建用户 */
	@TableField(value = "create_by")
	private String createBy;

	/** 修改时间 */
	@TableField(value = "update_date")
	private Date updateDate;

	/** 修改用户 */
	@TableField(value = "update_by")
	private String updateBy;

	/** 状态 */
	@TableField(value = "del_flag")
	private Integer delFlag;


	/** 公司id */
	@TableField(value = "company_id")
	private Integer companyId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShipName() {
		return this.shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCatagory() {
		return this.catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String getProOrderNo() {
		return this.proOrderNo;
	}

	public void setProOrderNo(String proOrderNo) {
		this.proOrderNo = proOrderNo;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProDesc() {
		return this.proDesc;
	}

	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}

	public String getFaciName() {
		return this.faciName;
	}

	public void setFaciName(String faciName) {
		this.faciName = faciName;
	}

	public String getFaciType() {
		return this.faciType;
	}

	public void setFaciType(String faciType) {
		this.faciType = faciType;
	}

	public String getFaciSrc() {
		return this.faciSrc;
	}

	public void setFaciSrc(String faciSrc) {
		this.faciSrc = faciSrc;
	}

	public String getFaciNo() {
		return this.faciNo;
	}

	public void setFaciNo(String faciNo) {
		this.faciNo = faciNo;
	}

	public String getFaciParam() {
		return this.faciParam;
	}

	public void setFaciParam(String faciParam) {
		this.faciParam = faciParam;
	}

	public String getRepairPosition() {
		return this.repairPosition;
	}

	public void setRepairPosition(String repairPosition) {
		this.repairPosition = repairPosition;
	}

	public String getRepairPositionDesc() {
		return this.repairPositionDesc;
	}

	public void setRepairPositionDesc(String repairPositionDesc) {
		this.repairPositionDesc = repairPositionDesc;
	}

	public String getDamage() {
		return this.damage;
	}

	public void setDamage(String damage) {
		this.damage = damage;
	}

	public String getRepairTech() {
		return this.repairTech;
	}

	public void setRepairTech(String repairTech) {
		this.repairTech = repairTech;
	}

	public String getRepairTechDesc() {
		return this.repairTechDesc;
	}

	public void setRepairTechDesc(String repairTechDesc) {
		this.repairTechDesc = repairTechDesc;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Integer getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}



	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
}
