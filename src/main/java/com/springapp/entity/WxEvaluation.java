package com.springapp.entity;


import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Entity
public class WxEvaluation {
    private Long id;//主键
    private WxUser uid;//外键1 用户
    private String name;
    private String phone;
    private String address;
    private EvaluationStatus evaluation_status;//外键2
    private String time;//评估时间

    @Column
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    @Column(length =100)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    public WxUser getUid() {
        return uid;
    }

    public void setUid(WxUser uid) {
        this.uid = uid;
    }

    @Column(length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Column(length = 20)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "evaluation_status")
    public EvaluationStatus getEvaluation_status() {
        return evaluation_status;
    }

    public void setEvaluation_status(EvaluationStatus evaluation_status) {
        this.evaluation_status = evaluation_status;
    }


}
