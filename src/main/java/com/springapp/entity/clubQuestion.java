package com.springapp.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by 11369 on 2016/12/26.
 */
@Entity
public class clubQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String question;
    private int type;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
