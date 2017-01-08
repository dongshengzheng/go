package com.fish.idle.service.modules.jsdd.entity;

/**
 * Created by szy on 01/12/2016.
 * 市
 */
public class City {
    private Integer id;

    private String cityid;

    private String city;

    private String father;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }
}
