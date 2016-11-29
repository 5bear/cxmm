package com.springapp.entity;

import net.sf.json.JSON;

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
    private String nickname;
    private int sex;
    private String language;
    private String city;
    private String province;
    private String country;
    private String headimgurl;
    /*private JSON[] privilege;*/
    private String phone;
    private String dateOfLogin;
    private String age;
    private String ExpectingDate;//预产期
    private int PregnancyWeek;
    private String Birthorder;
    private String height;
    private String AfterWeight;
    private String Weight;
    private int eutocia;
    private int feed;

    @Column(length = 45)
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Column
    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }
    @Column(length = 45)
    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
    @Column(length = 45)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    @Column(length = 45)
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
    @Column(length = 45)
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    @Column(length = 45)
    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }
  /*  @Transient
    public JSON[] getPrivilege() {
        return privilege;
    }

    public void setPrivilege(JSON[] privilege) {
        this.privilege = privilege;
    }*/

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
