package com.ctoangels.go.common.modules.go.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 *
 *
 */
@TableName("t_param")
public class Param implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 参数id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 项目编号
     */
    @TableField(value = "item_code")
    private String itemCode;

    /**
     * 参数编号
     */
    @TableField(value = "param_code")
    private String paramCode;

    /**
     * 参数名称
     */
    private String name;

    /**
     * 参数单位
     */
    private String unit;

    /**
     * 参数的类型
     */
    private String type;

    private List<ParamValueVariable> paramValueVariableList;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 修改者
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 修改者
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 状态
     */
    @TableField(value = "del_flag")
    private Integer delFlag;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemCode() {
        return this.itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getParamCode() {
        return this.paramCode;
    }

    public void setParamCode(String paramCode) {
        this.paramCode = paramCode;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return this.unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
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

    public List<ParamValueVariable> getParamValueVariableList() {
        return paramValueVariableList;
    }

    public void setParamValueVariableList(List<ParamValueVariable> paramValueVariableList) {
        this.paramValueVariableList = paramValueVariableList;
    }
}
