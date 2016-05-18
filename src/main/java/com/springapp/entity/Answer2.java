package com.springapp.entity;

import javax.persistence.*;

@Entity
@Table(name = "answer2", schema = "cxmm", catalog = "")
public class Answer2 {
    private int id;
    private String evaluationId;
    private int question2Id;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "evaluation_id")
    public String getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(String evaluationId) {
        this.evaluationId = evaluationId;
    }

    @Basic
    @Column(name = "question2_id")
    public int getQuestion2Id() {
        return question2Id;
    }

    public void setQuestion2Id(int question2Id) {
        this.question2Id = question2Id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Answer2 answer2 = (Answer2) o;

        if (id != answer2.id) return false;
        if (question2Id != answer2.question2Id) return false;
        if (evaluationId != null ? !evaluationId.equals(answer2.evaluationId) : answer2.evaluationId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (evaluationId != null ? evaluationId.hashCode() : 0);
        result = 31 * result + question2Id;
        return result;
    }
}
