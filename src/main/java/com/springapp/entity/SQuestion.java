package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 * 1min
 */
@Entity
public class SQuestion {
    private int id;

    @Column
    public int getTID() {
        return TID;
    }

    public void setTID(int TID) {
        this.TID = TID;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(length = 60)
    public String getTContent() {
        return TContent;
    }

    public void setTContent(String TContent) {
        this.TContent = TContent;
    }

    @Column
    public int getCID() {
        return CID;
    }

    public void setCID(int CID) {
        this.CID = CID;
    }

    @Column(length = 60)
    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "BCid")
    public BodyCondition getBCid() {
        return BCid;
    }

    public void setBCid(BodyCondition BCid) {
        this.BCid = BCid;
    }

    private int TID;
    private String TContent;
    private int CID;
    private String choice;
    private BodyCondition BCid;
}
