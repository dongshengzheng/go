package com.fish.idle.service.modules.jsdd.entity;

/**
 * Created by szy on 01/12/2016.
 * 区
 */
public class Area {
    private Integer id;

    private String areaid;

    private String area;

    private String father;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }
}
