package com.exam.model;

public class Question {
    private int id;
    private String text, opA, opB, opC, opD, answer;

    public Question(int id, String t, String a, String b, String c, String d, String ans) {
        this.id = id; this.text = t; this.opA = a; this.opB = b; this.opC = c; this.opD = d; this.answer = ans;
    }

    // Getters are required for JSP access
    public int getId() { return id; }
    public String getText() { return text; }
    public String getOpA() { return opA; }
    public String getOpB() { return opB; }
    public String getOpC() { return opC; }
    public String getOpD() { return opD; }
    public String getAnswer() { return answer; }
}