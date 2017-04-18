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
@TableName("t_enquiry_req")
public class EnquiryReq implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/**  */
	@TableId(type = IdType.AUTO)
	private Integer id;

	private String code;

	/**  */
	private String category;

	/**  */
	private String content;

	/**  */
	private String unit;

	/**  数量*/
	private String count;

	/** 单价 */
	private String tariff;

	/**总价  */
	private String total;

	/**  备注*/
	private String remark;

	/*系数*/
	private String discount;

	/**  */
	@TableField(value = "create_by")
	private String createBy;

	/**  */
	@TableField(value = "create_date")
	private Date createDate;

	/**  */
	@TableField(value = "update_by")
	private String updateBy;

	/**  */
	@TableField(value = "update_date")
	private Date updateDate;

	/**  */
	@TableField(value = "del_flag")
	private Integer delFlag;

	/**  */
	@TableField(value = "enquiry_id")
	private Integer enquiryId;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTariff() {
		return tariff;
	}

	public void setTariff(String tariff) {
		this.tariff = tariff;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public Integer getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(Integer enquiryId) {
		this.enquiryId = enquiryId;
	}
}
