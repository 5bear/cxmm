package com.springapp.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Entity
public class WxOrderinfo {
    private int id;
    private Date date;
    private String name;
    private int canceNum;//餐册
    private int canheNum;//餐盒数
    private String phoneNum;
    private String address;//收货地址
    private WxUser uid;
    private String payType;
    private String result;
    private String order;//订单号

    @Column
    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    @Column(length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column
    public int getCanceNum() {
        return canceNum;
    }

    public void setCanceNum(int canceNum) {
        this.canceNum = canceNum;
    }
    @Column
    public int getCanheNum() {
        return canheNum;
    }

    public void setCanheNum(int canheNum) {
        this.canheNum = canheNum;
    }
    @Column(length = 45)
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }
    @Column
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column()
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    public WxUser getUid() {
        return uid;
    }

    public void setUid(WxUser uid) {
        this.uid = uid;
    }

    @Column(length = 45)
    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    @Column(length = 45)
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
