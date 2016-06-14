package com.springapp.entity;

import javax.persistence.*;

@Entity
public class Professor {
    private int id;
    private String name;
    private String phone;
    private String email;
    private String link1;
    @Basic
    @Column(name = "link2")
    public String getLink2() {
        return link2;
    }

    public void setLink2(String link2) {
        this.link2 = link2;
    }

    @Basic
    @Column(name = "link1")
    public String getLink1() {
        return link1;
    }

    public void setLink1(String link1) {
        this.link1 = link1;
    }

    @Basic
    @Column(name = "link3")
    public String getLink3() {
        return link3;
    }

    public void setLink3(String link3) {
        this.link3 = link3;
    }

    private String link2;
    private String link3;
    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @Basic
    @Column(name = "introduction")
    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    private String picture;
    private String title;
    private String introduction;

    private ProfessorStatus professor_status;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "picture")
    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Professor professor = (Professor) o;

        if (id != professor.id) return false;
        if (name != null ? !name.equals(professor.name) : professor.name != null) return false;
        if (phone != null ? !phone.equals(professor.phone) : professor.phone != null) return false;
        if (email != null ? !email.equals(professor.email) : professor.email != null) return false;
        if (link1 != null ? !link1.equals(professor.link1) : professor.link1 != null) return false;
        if (link2 != null ? !link2.equals(professor.link2) : professor.link2 != null) return false;
        if (link3 != null ? !link3.equals(professor.link3) : professor.link3 != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (link1 != null ? link1.hashCode() : 0);
        result = 31 * result + (link2 != null ? link2.hashCode() : 0);
        result = 31 * result + (link3 != null ? link3.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "professor_status")
    public ProfessorStatus getProfessor_status() {
        return professor_status;
    }

    public void setProfessor_status(ProfessorStatus professor_status) {
        this.professor_status = professor_status;
    }
}
