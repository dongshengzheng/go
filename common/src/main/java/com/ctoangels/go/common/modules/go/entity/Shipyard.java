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
@TableName("t_shipyard")
public class Shipyard implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 船厂id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 公司id */
	@TableField(value = "company_id")
	private Integer companyId;

	/** 船厂名称 */
	private String name;

	/** 船厂简介 */
	private String desc;

	/** 短名称 */
	@TableField(value = "short_name")
	private String shortName;

	/** 集团公司 */
	@TableField(value = "group_company")
	private String groupCompany;

	/** 国家 */
	private String country;

	/** 区域 */
	private String area;

	/** 位置 */
	private String location;

	/** 地址 */
	private String address;

	/** 经度 */
	private String longitude;

	/** 纬度 */
	private String latitude;

	/** 电话 */
	private String tel;

	/** 电子邮件 */
	private String email;

	/** 网站 */
	private String website;

	/** 船厂logo */
	private String logo;

	/** 创建时间 */
	@TableField(value = "create_date")
	private String createDate;

	/** 创建用户 */
	@TableField(value = "create_user")
	private String createUser;

	/** 修改时间 */
	@TableField(value = "modify_date")
	private String modifyDate;

	/** 修改用户 */
	@TableField(value = "modify_user")
	private String modifyUser;

	/** 状态 */
	private Integer status;


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

	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getGroupCompany() {
		return this.groupCompany;
	}

	public void setGroupCompany(String groupCompany) {
		this.groupCompany = groupCompany;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getModifyDate() {
		return this.modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getModifyUser() {
		return this.modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}