package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fish.idle.service.util.BaseEntity;

/**
 * 作品等级
 */
@TableName("dd_works_level")
public class WorksLevel extends BaseEntity {

    /**
     * 作品Id
     */
    @TableField(value = "works_id")
    private Integer worksId;

    /**
     * 质地
     */
    private String zhidi;

    /**
     * 质地二
     */
    private String zhidi2;

    /**
     * 感官
     */
    private String ganguan;

    /**
     * 磨氏度
     */
    private String moshidu;

    /**
     * 血量
     */
    private String xueliang;

    /**
     * 血色
     */
    private String xuese;

    /**
     * 血形
     */
    private String xuexing;

    /**
     * 浓艳度
     */
    private String nongyandu;

    /**
     * 纯净度
     */
    private String chunjingdu;

    /**
     * 地色
     */
    private String dise;

    /**
     * 绺
     */
    private String liu;//活筋

    /**
     * 裂
     */
    private String lie;

    /**
     * 含血量原石
     */
    private String inithanxueliang;//印章

    /**
     * 印章含血面
     */
    private String hanxuemian;

    /**
     * 雕件含血量
     */
    private String hanxueliang;

    /** 含血方式 */
    private String hanxuefangshi;


    public Integer getWorksId() {
        return worksId;
    }

    public void setWorksId(Integer worksId) {
        this.worksId = worksId;
    }

    public String getZhidi() {
        return this.zhidi;
    }

    public void setZhidi(String zhidi) {
        this.zhidi = zhidi;
    }

    public String getZhidi2() {
        return this.zhidi2;
    }

    public void setZhidi2(String zhidi2) {
        this.zhidi2 = zhidi2;
    }

    public String getGanguan() {
        return this.ganguan;
    }

    public void setGanguan(String ganguan) {
        this.ganguan = ganguan;
    }

    public String getMoshidu() {
        return this.moshidu;
    }

    public void setMoshidu(String moshidu) {
        this.moshidu = moshidu;
    }

    public String getXueliang() {
        return this.xueliang;
    }

    public void setXueliang(String xueliang) {
        this.xueliang = xueliang;
    }

    public String getXuese() {
        return this.xuese;
    }

    public void setXuese(String xuese) {
        this.xuese = xuese;
    }

    public String getXuexing() {
        return this.xuexing;
    }

    public void setXuexing(String xuexing) {
        this.xuexing = xuexing;
    }

    public String getNongyandu() {
        return this.nongyandu;
    }

    public void setNongyandu(String nongyandu) {
        this.nongyandu = nongyandu;
    }

    public String getChunjingdu() {
        return this.chunjingdu;
    }

    public void setChunjingdu(String chunjingdu) {
        this.chunjingdu = chunjingdu;
    }

    public String getDise() {
        return this.dise;
    }

    public void setDise(String dise) {
        this.dise = dise;
    }

    public String getLiu() {
        return this.liu;
    }

    public void setLiu(String liu) {
        this.liu = liu;
    }

    public String getLie() {
        return this.lie;
    }

    public void setLie(String lie) {
        this.lie = lie;
    }

    public String getInithanxueliang() {
        return this.inithanxueliang;
    }

    public void setInithanxueliang(String inithanxueliang) {
        this.inithanxueliang = inithanxueliang;
    }

    public String getHanxuemian() {
        return this.hanxuemian;
    }

    public void setHanxuemian(String hanxuemian) {
        this.hanxuemian = hanxuemian;
    }

    public String getHanxueliang() {
        return this.hanxueliang;
    }

    public void setHanxueliang(String hanxueliang) {
        this.hanxueliang = hanxueliang;
    }

    public String getHanxuefangshi() {
        return this.hanxuefangshi;
    }

    public void setHanxuefangshi(String hanxuefangshi) {
        this.hanxuefangshi = hanxuefangshi;
    }


    public WorksLevel() {
    }

    public WorksLevel(Integer worksId) {
        this.worksId = worksId;
    }
}
