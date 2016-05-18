package com.springapp.entity;

import javax.persistence.*;

/**
 * Created by shanh on 2016/5/7.
 */
@Entity
@Table(name = "news_status", schema = "cxmm", catalog = "")
public class NewsStatus {
    private int newsStatusId;
    private String name;

    @Id
    @Column(name = "news_status_id")
    public int getNewsStatusId() {
        return newsStatusId;
    }

    public void setNewsStatusId(int newsStatusId) {
        this.newsStatusId = newsStatusId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NewsStatus that = (NewsStatus) o;

        if (newsStatusId != that.newsStatusId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = newsStatusId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
