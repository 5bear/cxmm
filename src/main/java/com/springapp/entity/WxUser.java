package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Entity
public class WxUser {
    private int uid;
    private Long aid;//所属代理点0表示无代理点
    private String agent;//代理点名称
    private String openid;//微信标识
    private String name;
    private String phone;
    private String dateOfLogin;
    private String age;
    private String ExpectingDate;
    private int PregnancyWeek;
    private String Birthorder;
    private String height;
    private String AfterWeight;
    private String Weight;
    private int eutocia;
    private int feed;

    @Column(length = 45)
    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    @Column
    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    @Column
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column
    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    @Column
    public int getPregnancyWeek() {
        return PregnancyWeek;
    }

    public void setPregnancyWeek(int pregnancyWeek) {
        PregnancyWeek = pregnancyWeek;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Column(length = 45)
    public String getDateOfLogin() {
        return dateOfLogin;
    }

    public void setDateOfLogin(String dateOfLogin) {
        this.dateOfLogin = dateOfLogin;
    }
    @Column(length = 45)
    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
    @Column
    public String getExpectingDate() {
        return ExpectingDate;
    }

    public void setExpectingDate(String expectingDate) {
        ExpectingDate = expectingDate;
    }
    @Column
    public String getBirthorder() {
        return Birthorder;
    }

    public void setBirthorder(String birthorder) {
        Birthorder = birthorder;
    }
    @Column
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }
    @Column
    public String getAfterWeight() {
        return AfterWeight;
    }

    public void setAfterWeight(String afterWeight) {
        AfterWeight = afterWeight;
    }
    @Column
    public String getWeight() {
        return Weight;
    }

    public void setWeight(String weight) {
        Weight = weight;
    }
    @Column
    public int getEutocia() {
        return eutocia;
    }

    public void setEutocia(int eutocia) {
        this.eutocia = eutocia;
    }
    @Column
    public int getFeed() {
        return feed;
    }

    public void setFeed(int feed) {
        this.feed = feed;
    }


}
