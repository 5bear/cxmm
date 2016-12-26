package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by 11369 on 2016/12/26.
 */
@Entity
public class ClubResult {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String evaluationId;
    private int bid; //体质
    private String bodyCondition;//体质类型
   /*
    气虚质  1
    阳虚质  2
    阴虚质  3
    痰湿质  4
    特禀质  5
    平和质  6
    血瘀质  7
    湿热质  8
    气郁质  9

    */
    private int score;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(String evaluationId) {
        this.evaluationId = evaluationId;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Transient
    public String getBodyCondition() {
        switch (bid){
            case 1:
                bodyCondition = "气虚质";
                break;
            case 2:
                bodyCondition = "阳虚质";
                break;
            case 3:
                bodyCondition = "阴虚质";
                break;
            case 4:
                bodyCondition = "痰湿质";
                break;
            case 5:
                bodyCondition = "特禀质";
                break;
            case 6:
                bodyCondition = "平和质";
                break;
            case 7:
                bodyCondition = "血瘀质";
                break;
            case 8:
                bodyCondition = "湿热质";
                break;
            case 9:
                bodyCondition = "气郁质";
                break;
            default:
                break;
        }
        return bodyCondition;
    }
    public void setBodyCondition(String bodyCondition) {
        this.bodyCondition = bodyCondition;
    }
}
