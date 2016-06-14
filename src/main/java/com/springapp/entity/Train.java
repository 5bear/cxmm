package com.springapp.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ZhanShaoxiong on 2016/5/10.
 * 培训报名
 */
@Entity
public class Train {
    private Long id;
    private String name;
    private String sex;
    private String phoneNum;
    private String address;
    private String remo;//自我介绍
    private String status;
    private Date trainTime;
    private Long timestamp;
    private Date licenseTime;//发证时间
    private String licenseNum;//证书编号

    @Column
    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column(length = 10)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
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
    @Column
    public String getRemo() {
        return remo;
    }

    public void setRemo(String remo) {
        this.remo = remo;
    }
    @Column
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    @Column
    public Date getTrainTime() {
        return trainTime;
    }

    public void setTrainTime(Date trainTime) {
        this.trainTime = trainTime;
    }

    @Column()
    public Date getLicenseTime() {
        return licenseTime;
    }

    public void setLicenseTime(Date licenseTime) {
        this.licenseTime = licenseTime;
    }
    @Column()
    public String getLicenseNum() {
        return licenseNum;
    }

    public void setLicenseNum(String licenseNum) {
        this.licenseNum = licenseNum;
    }
}
