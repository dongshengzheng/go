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
@TableName("t_ship")
public class Ship implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 船的id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 公司id */
	@TableField(value = "company_id")
	private Integer companyId;

	/** 船的imo号 */
	private String imo;

	/** 船名 */
	private String name;

	/** 船舶类型 */
	private String type;

	/** 船级社 */
	@TableField(value = "ship_class")
	private String shipClass;

	/** 船的建造者 */
	private String builder;

	/**  */
	@TableField(value = "build_year")
	private Date buildYear;

	/** 船舶呼号 */
	@TableField(value = "call_sign")
	private String callSign;

	/** 公司名称 */
	@TableField(value = "company_name")
	private String companyName;

	/** 吃水 */
	private String draft;

	/** 载重吨 */
	private String dwt;

	/** 注册总吨 */
	private String grt;

	/** 型深 */
	private String depth;

	/** 船宽 */
	private String beam;

	/** 船长 */
	private String loa;

	/** 坞检时间 */
	private String dd;

	/** 特检时间 */
	private String ss;

	/** 主机：厂家 */
	@TableField(value = "me_maker")
	private String meMaker;

	/** 主机：型号 */
	@TableField(value = "me_type")
	private String meType;

	/** 主机：马力/转速 */
	@TableField(value = "me_bhp_rpm")
	private String meBhpRpm;

	/** 主机：数量 */
	@TableField(value = "me_qty")
	private Integer meQty;

	/** 主机：缸径 */
	@TableField(value = "me_cyl_bore")
	private String meCylBore;

	/** 辅机：厂家 */
	@TableField(value = "aux_maker")
	private String auxMaker;

	/** 辅机：型号 */
	@TableField(value = "aux_type")
	private String auxType;

	/** 辅机：额定功率 */
	@TableField(value = "aux_rated_or")
	private String auxRatedOr;

	/** 辅机：数量 */
	@TableField(value = "aux_qty")
	private Integer auxQty;

	/** 辅机：缸径 */
	@TableField(value = "aux_cyl_bore")
	private String auxCylBore;

	/** 锅炉：厂家 */
	@TableField(value = "boiler_maker")
	private String boilerMaker;

	/** 锅炉：型号 */
	@TableField(value = "boiler_type")
	private String boilerType;

	/** 锅炉：工作压力 */
	@TableField(value = "boiler_pressure")
	private String boilerPressure;

	/** 锅炉：数量 */
	@TableField(value = "boiler_qty")
	private Integer boilerQty;

	/** 锅炉：热交换面积 */
	@TableField(value = "boiler_heating_area")
	private String boilerHeatingArea;

	/** 锅炉：蒸发量 */
	@TableField(value = "boiler_evaporation")
	private String boilerEvaporation;

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

	private Integer sw;

	private String mac;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getImo() {
		return this.imo;
	}

	public void setImo(String imo) {
		this.imo = imo;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getShipClass() {
		return this.shipClass;
	}

	public void setShipClass(String shipClass) {
		this.shipClass = shipClass;
	}

	public String getBuilder() {
		return this.builder;
	}

	public void setBuilder(String builder) {
		this.builder = builder;
	}

	public Date getBuildYear() {
		return this.buildYear;
	}

	public void setBuildYear(Date buildYear) {
		this.buildYear = buildYear;
	}

	public String getCallSign() {
		return this.callSign;
	}

	public void setCallSign(String callSign) {
		this.callSign = callSign;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getMeMaker() {
		return this.meMaker;
	}

	public void setMeMaker(String meMaker) {
		this.meMaker = meMaker;
	}

	public String getMeType() {
		return this.meType;
	}

	public void setMeType(String meType) {
		this.meType = meType;
	}

	public String getMeBhpRpm() {
		return this.meBhpRpm;
	}

	public void setMeBhpRpm(String meBhpRpm) {
		this.meBhpRpm = meBhpRpm;
	}

	public Integer getMeQty() {
		return this.meQty;
	}

	public void setMeQty(Integer meQty) {
		this.meQty = meQty;
	}


	public String getAuxMaker() {
		return this.auxMaker;
	}

	public void setAuxMaker(String auxMaker) {
		this.auxMaker = auxMaker;
	}

	public String getAuxType() {
		return this.auxType;
	}

	public void setAuxType(String auxType) {
		this.auxType = auxType;
	}

	public String getAuxRatedOr() {
		return this.auxRatedOr;
	}

	public void setAuxRatedOr(String auxRatedOr) {
		this.auxRatedOr = auxRatedOr;
	}

	public Integer getAuxQty() {
		return this.auxQty;
	}

	public void setAuxQty(Integer auxQty) {
		this.auxQty = auxQty;
	}


	public String getBoilerMaker() {
		return this.boilerMaker;
	}

	public void setBoilerMaker(String boilerMaker) {
		this.boilerMaker = boilerMaker;
	}

	public String getBoilerType() {
		return this.boilerType;
	}

	public void setBoilerType(String boilerType) {
		this.boilerType = boilerType;
	}

	public String getBoilerPressure() {
		return this.boilerPressure;
	}

	public void setBoilerPressure(String boilerPressure) {
		this.boilerPressure = boilerPressure;
	}

	public Integer getBoilerQty() {
		return this.boilerQty;
	}

	public void setBoilerQty(Integer boilerQty) {
		this.boilerQty = boilerQty;
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

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getSs() {
		return ss;
	}

	public void setSs(String ss) {
		this.ss = ss;
	}


	public String getDraft() {
		return draft;
	}

	public void setDraft(String draft) {
		this.draft = draft;
	}

	public String getDwt() {
		return dwt;
	}

	public void setDwt(String dwt) {
		this.dwt = dwt;
	}

	public String getGrt() {
		return grt;
	}

	public void setGrt(String grt) {
		this.grt = grt;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getBeam() {
		return beam;
	}

	public void setBeam(String beam) {
		this.beam = beam;
	}

	public String getLoa() {
		return loa;
	}

	public void setLoa(String loa) {
		this.loa = loa;
	}

	public String getMeCylBore() {
		return meCylBore;
	}

	public void setMeCylBore(String meCylBore) {
		this.meCylBore = meCylBore;
	}

	public String getAuxCylBore() {
		return auxCylBore;
	}

	public void setAuxCylBore(String auxCylBore) {
		this.auxCylBore = auxCylBore;
	}

	public String getBoilerHeatingArea() {
		return boilerHeatingArea;
	}

	public void setBoilerHeatingArea(String boilerHeatingArea) {
		this.boilerHeatingArea = boilerHeatingArea;
	}

	public String getBoilerEvaporation() {
		return boilerEvaporation;
	}

	public void setBoilerEvaporation(String boilerEvaporation) {
		this.boilerEvaporation = boilerEvaporation;
	}


	public Integer getSw() {
		return sw;
	}

	public void setSw(Integer sw) {
		this.sw = sw;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}
}
