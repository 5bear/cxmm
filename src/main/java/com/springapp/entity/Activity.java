package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
@Entity
public class Activity {
    private int id;
    private String title;
    private String content;
    private String url;
    private Timestamp createtime;
    private String showPicture;
    private String summary;
    public String newsStatusE;

    @Column
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @Column
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    @Column
    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }
    @Column
    public String getShowPicture() {
        return showPicture;
    }

    public void setShowPicture(String showPicture) {
        this.showPicture = showPicture;
    }
    @Column
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
    @Column
    public String getNewsStatusE() {
        return newsStatusE;
    }

    public void setNewsStatusE(String newsStatusE) {
        this.newsStatusE = newsStatusE;
    }
}
