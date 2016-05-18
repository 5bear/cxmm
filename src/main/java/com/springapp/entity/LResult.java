package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by ZhanShaoxiong on 2016/5/8.
 * 五分钟评测结果
 */
@Entity
public class LResult {
    private int id;
    private WxUser uid;
    private BodyCondition BCid;
    private int score;

    @Column
    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    public WxUser getUid() {
        return uid;
    }

    public void setUid(WxUser uid) {
        this.uid = uid;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "BCid")
    public BodyCondition getBCid() {
        return BCid;
    }

    public void setBCid(BodyCondition BCid) {
        this.BCid = BCid;
    }


}
