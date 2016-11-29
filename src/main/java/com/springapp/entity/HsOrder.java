package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by 11369 on 2016/6/20.
 */
@Entity
public class HsOrder {
    private int id;
    private String guid;//会所评估标志
    private String date;
    private Long dateTime;//时间戳
    private String name;
    private String canceNum;//餐册
    private String canheNum;//餐盒数
    private String phoneNum;
    private String address;//收货地址
    private String orderNum;//订单号
    private String deliverStatus;//发货状态：未发货 已发货 已收货
    private String express;//快递公司
    private String expressNum;//快递编号
    private int[]canceNums;
    private int[]canheNums;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getDateTime() {
        return dateTime;
    }

    public void setDateTime(Long dateTime) {
        this.dateTime = dateTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCanceNum() {
        return canceNum;
    }

    public void setCanceNum(String canceNum) {
        this.canceNum = canceNum;
    }

    public String getCanheNum() {
        return canheNum;
    }

    public void setCanheNum(String canheNum) {
        this.canheNum = canheNum;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getDeliverStatus() {
        return deliverStatus;
    }

    public void setDeliverStatus(String deliverStatus) {
        this.deliverStatus = deliverStatus;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }

    public String getExpressNum() {
        return expressNum;
    }

    public void setExpressNum(String expressNum) {
        this.expressNum = expressNum;
    }

    @Transient
    public int[] getCanceNums() {
        return canceNums;
    }

    public void setCanceNums(int[] canceNums) {
        this.canceNums = canceNums;
    }
    @Transient
    public int[] getCanheNums() {
        return canheNums;
    }

    public void setCanheNums(int[] canheNums) {
        this.canheNums = canheNums;
    }
}
