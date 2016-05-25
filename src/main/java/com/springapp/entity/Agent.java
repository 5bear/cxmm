package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 * 代理点
 */
@Entity
public class Agent {
    private Long id;//主键
    private String recommend;//推荐人
    private String agent;//代理点名称
    private String phoneNum;
    private String openid;//微信标识
    private String email;
    private int userNum;
    private int canceNum;
    private int canheNum;
    private String qrcode;//二维码地址
    private String status;// 审核可用 结算  失效
    private String account;//一级代理点登陆账号
    private String password;

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
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    @Column(length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(length = 45)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    @Column(length = 45)
    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    @Column(length = 45)
    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @Column
    public int getUserNum() {
        return userNum;
    }

    public void setUserNum(int userNum) {
        this.userNum = userNum;
    }


    @Column(length = 45)
    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column
    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

}
