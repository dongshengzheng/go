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
@TableName("t_repair_spec_item")
public class RepairSpecItem implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 维修工程详情的id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 维修详单的id
     */
    @TableField(value = "repair_spec_detail_id")
    private Integer repairSpecDetailId;

    /**
     * 维修详单的name
     */
    @TableField(exist = false)
    private String proName;

    /**
     * 维修项目类型
     */
    private String catagory;

    /**
     * 项目号
     */
    private String code;

    /**
     * 维修类容
     */
    private String content;

    /**
     * 单位
     */
    private String unit;

    /**
     * 数量
     */
    private Integer count;

    /**
     * 备注
     */
    private String remark;

    /**
     * 维修信息
     */
    private String info;

    /**
     * 父项目号
     */
    @TableField(value = "parent_code")
    private String parentCode;

    /**
     * 判断是否有儿子
     */
    private Integer children;

    /**
     * 维修工程的id
     */
    @TableField(value = "repair_spec_id")
    private Integer repairSpecId;

    /**
     * 是否需要维修的状态
     */
    private Integer status;

    /**
     * 是否需要复制
     */
    private Integer copy;

    /*排序*/
    private Integer sort;

    @TableField(exist = false)
    private List<Param> paramList;

    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 创建用户
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 修改时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 修改用户
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 状态
     */
    @TableField(value = "del_flag")
    private Integer delFlag = 0;

    /**
     * 参数1的值
     */
    @TableField(value = "param1_val")
    private String param1Val;

    /**
     * 参数1的描述
     */
    @TableField(value = "param1_des")
    private String param1Des;

    /**
     * 参数2的值
     */
    @TableField(value = "param2_val")
    private String param2Val;

    /**
     * 参数2的描述
     */
    @TableField(value = "param2_des")
    private String param2Des;

    /**
     * 参数3的值
     */
    @TableField(value = "param3_val")
    private String param3Val;

    /**
     * 参数3的描述
     */
    @TableField(value = "param3_des")
    private String param3Des;

    /**
     * 参数4的值
     */
    @TableField(value = "param4_val")
    private String param4Val;

    /**
     * 参数4的描述
     */
    @TableField(value = "param4_des")
    private String param4Des;

    /**
     * 参数5的值
     */
    @TableField(value = "param5_val")
    private String param5Val;

    /**
     * 参数5的描述
     */
    @TableField(value = "param5_des")
    private String param5Des;

    /**
     * 参数6的值
     */
    @TableField(value = "param6_val")
    private String param6Val;

    /**
     * 参数6的描述
     */
    @TableField(value = "param6_des")
    private String param6Des;

    /**
     * 参数7的值
     */
    @TableField(value = "param7_val")
    private String param7Val;

    /**
     * 参数7的描述
     */
    @TableField(value = "param7_des")
    private String param7Des;

    /**
     * 参数8的值
     */
    @TableField(value = "param8_val")
    private String param8Val;

    /**
     * 参数8的描述
     */
    @TableField(value = "param8_des")
    private String param8Des;

    /*判断是红本的数据，还是自定义的数据1：红本数据；0自定义数据*/
    private Integer src;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRepairSpecDetailId() {
        return this.repairSpecDetailId;
    }

    public void setRepairSpecDetailId(Integer repairSpecDetailId) {
        this.repairSpecDetailId = repairSpecDetailId;
    }

    public String getCatagory() {
        return this.catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public Integer getCount() {
        return this.count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getRepairSpecId() {
        return this.repairSpecId;
    }

    public void setRepairSpecId(Integer repairSpecId) {
        this.repairSpecId = repairSpecId;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getParam1Val() {
        return this.param1Val;
    }

    public void setParam1Val(String param1Val) {
        this.param1Val = param1Val;
    }

    public String getParam1Des() {
        return this.param1Des;
    }

    public void setParam1Des(String param1Des) {
        this.param1Des = param1Des;
    }

    public String getParam2Val() {
        return this.param2Val;
    }

    public void setParam2Val(String param2Val) {
        this.param2Val = param2Val;
    }

    public String getParam2Des() {
        return this.param2Des;
    }

    public void setParam2Des(String param2Des) {
        this.param2Des = param2Des;
    }

    public String getParam3Val() {
        return this.param3Val;
    }

    public void setParam3Val(String param3Val) {
        this.param3Val = param3Val;
    }

    public String getParam3Des() {
        return this.param3Des;
    }

    public void setParam3Des(String param3Des) {
        this.param3Des = param3Des;
    }

    public String getParam4Val() {
        return this.param4Val;
    }

    public void setParam4Val(String param4Val) {
        this.param4Val = param4Val;
    }

    public String getParam4Des() {
        return this.param4Des;
    }

    public void setParam4Des(String param4Des) {
        this.param4Des = param4Des;
    }

    public String getParam5Val() {
        return this.param5Val;
    }

    public void setParam5Val(String param5Val) {
        this.param5Val = param5Val;
    }

    public String getParam5Des() {
        return this.param5Des;
    }

    public void setParam5Des(String param5Des) {
        this.param5Des = param5Des;
    }

    public String getParam6Val() {
        return this.param6Val;
    }

    public void setParam6Val(String param6Val) {
        this.param6Val = param6Val;
    }

    public String getParam6Des() {
        return this.param6Des;
    }

    public void setParam6Des(String param6Des) {
        this.param6Des = param6Des;
    }

    public String getParam7Val() {
        return this.param7Val;
    }

    public void setParam7Val(String param7Val) {
        this.param7Val = param7Val;
    }

    public String getParam7Des() {
        return this.param7Des;
    }

    public void setParam7Des(String param7Des) {
        this.param7Des = param7Des;
    }

    public String getParam8Val() {
        return this.param8Val;
    }

    public void setParam8Val(String param8Val) {
        this.param8Val = param8Val;
    }

    public String getParam8Des() {
        return this.param8Des;
    }

    public void setParam8Des(String param8Des) {
        this.param8Des = param8Des;
    }

    public List<Param> getParamList() {
        return paramList;
    }

    public void setParamList(List<Param> paramList) {
        this.paramList = paramList;
    }

    public Integer getChildren() {
        return children;
    }

    public void setChildren(Integer children) {
        this.children = children;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public Integer getCopy() {
        return copy;
    }

    public void setCopy(Integer copy) {
        this.copy = copy;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

<<<<<<< HEAD
    public Integer getSrc() {
        return src;
    }

    public void setSrc(Integer src) {
        this.src = src;
=======
    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
>>>>>>> 35ad2f50109154258969fbd7ed06209d2c16edaf
    }
}
