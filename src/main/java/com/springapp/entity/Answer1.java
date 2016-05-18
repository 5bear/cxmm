package com.springapp.entity;

import javax.persistence.*;

@Entity
@Table(name = "answer1", schema = "cxmm", catalog = "")
public class Answer1 {
    private int id;
    private String evaluationId;
    private int question1Id;
    private int answer;

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
    @Column(name = "question1_id")
    public int getQuestion1Id() {
        return question1Id;
    }

    public void setQuestion1Id(int question1Id) {
        this.question1Id = question1Id;
    }

    @Basic
    @Column(name = "answer")
    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Answer1 answer1 = (Answer1) o;

        if (id != answer1.id) return false;
        if (question1Id != answer1.question1Id) return false;
        if (answer != answer1.answer) return false;
        if (evaluationId != null ? !evaluationId.equals(answer1.evaluationId) : answer1.evaluationId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (evaluationId != null ? evaluationId.hashCode() : 0);
        result = 31 * result + question1Id;
        result = 31 * result + answer;
        return result;
    }
}
