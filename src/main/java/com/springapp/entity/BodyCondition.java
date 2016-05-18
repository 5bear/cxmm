package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 */
@Entity
public class BodyCondition {
    private int BCid;

    @Column(length = 4)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getBCid() {
        return BCid;
    }

    public void setBCid(int BCid) {
        this.BCid = BCid;
    }
    @Column(length = 45)
    public String getTendency() {
        return tendency;
    }

    public void setTendency(String tendency) {
        this.tendency = tendency;
    }

    private String name;
    private String tendency;
}
