package com.kashif.model;

import lombok.Data;

@Data 
public class Question {
    private int id;
    private String mainTense;
    private String subTense;
    private String questionText;
    private String correctAnswer;

    // getters and setters
}
