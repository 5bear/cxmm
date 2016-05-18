package com.springapp.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "professor_status", schema = "cxmm", catalog = "")
public class ProfessorStatus {
    private int professorStatusId;
    private String name;
    private Set<Professor> professors;

    @Id
    @Column(name = "professor_status_id")
    public int getProfessorStatusId() {
        return professorStatusId;
    }

    public void setProfessorStatusId(int professorStatusId) {
        this.professorStatusId = professorStatusId;
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

        ProfessorStatus that = (ProfessorStatus) o;

        if (professorStatusId != that.professorStatusId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = professorStatusId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "professor_status")
    public Set<Professor> getProfessors() {
        return professors;
    }

    public void setProfessors(Set<Professor> professors) {
        this.professors = professors;
    }
}
