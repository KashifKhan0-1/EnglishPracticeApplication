package com.kashif.model;

import lombok.Data;

@Data //for some reason @Data annotation isn't working so i had to write setter getter methods manually 
public class Question {
    private int id;
	private String mainTense;
    private String subTense;
    private String questionText;
    private String correctAnswer;

    // getters and setters
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMainTense() {
		return mainTense;
	}
	public void setMainTense(String mainTense) {
		this.mainTense = mainTense;
	}
	public String getSubTense() {
		return subTense;
	}
	public void setSubTense(String subTense) {
		this.subTense = subTense;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public String getCorrectAnswer() {
		return correctAnswer;
	}
	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
}
