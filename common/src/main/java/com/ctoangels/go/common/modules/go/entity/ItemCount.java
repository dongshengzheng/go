package com.ctoangels.go.common.modules.go.entity;

/**
 * Created by lenovo on 2017/2/21.
 */
public class ItemCount {

    private String catagory;

    private Integer allCount;

    private Integer complete;

    private Integer notComplete;

    private Integer cancel;

    private String per;


    public ItemCount() {
    }

    public Integer getAllCount() {
        return allCount;
    }

    public void setAllCount(Integer allCount) {
        this.allCount = allCount;
    }

    public Integer getComplete() {
        return complete;
    }

    public void setComplete(Integer complete) {
        this.complete = complete;
    }

    public Integer getNotComplete() {
        return notComplete;
    }

    public void setNotComplete(Integer notComplete) {
        this.notComplete = notComplete;
    }

    public Integer getCancel() {
        return cancel;
    }

    public void setCancel(Integer cancel) {
        this.cancel = cancel;
    }


    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    public String getPer() {
        return per;
    }

    public void setPer(String per) {
        this.per = per;
    }
}
