package com.springapp.entity;

import javax.persistence.*;
import java.sql.Timestamp;


@Entity
public class Evaluation {
    private String guid;
    private String name = "";
    private String phone = "";
    private String age;
    private String ExpectingDate;
    private String Birthorder;
    private String height;
    private String AfterWeight;
    private String Weight;
    private int eutocia;
    private int feed;
    private String address = "";
    private String suggestion = "";
    private String notes = "";
    private EvaluationStatus evaluationStatus;
    private Timestamp time;//评估时间
    private Long timestamp;//用作比较
    private Club club;//外键所属会所

    @Column
    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    @Column(length = 10)
    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
    @Column(length = 10)
    public String getExpectingDate() {
        return ExpectingDate;
    }

    public void setExpectingDate(String expectingDate) {
        ExpectingDate = expectingDate;
    }
    @Column(length = 10)
    public String getBirthorder() {
        return Birthorder;
    }

    public void setBirthorder(String birthorder) {
        Birthorder = birthorder;
    }
    @Column(length = 10)
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }
    @Column(length = 10)
    public String getAfterWeight() {
        return AfterWeight;
    }

    public void setAfterWeight(String afterWeight) {
        AfterWeight = afterWeight;
    }
    @Column(length = 10)
    public String getWeight() {
        return Weight;
    }

    public void setWeight(String weight) {
        Weight = weight;
    }
    @Column()
    public int getEutocia() {
        return eutocia;
    }

    public void setEutocia(int eutocia) {
        this.eutocia = eutocia;
    }
    @Column()
    public int getFeed() {
        return feed;
    }

    public void setFeed(int feed) {
        this.feed = feed;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "club")
    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    @Column
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Id
    @Column(name = "guid")
    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "suggestion")
    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    @Basic
    @Column(name = "notes")
    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinColumn(name = "evaluation_status")
    public EvaluationStatus getEvaluationStatus() {
        return evaluationStatus;
    }

    public void setEvaluationStatus(EvaluationStatus evaluationStatus) {
        this.evaluationStatus = evaluationStatus;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Evaluation that = (Evaluation) o;

        if (evaluationStatus != that.evaluationStatus) return false;
        if (guid != null ? !guid.equals(that.guid) : that.guid != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = guid != null ? guid.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + evaluationStatus.getId();
        return result;
    }
}
