package com.kashif.service;

import com.kashif.model.Question;
import java.util.List;
import java.util.Set;

public interface QuestionService {
    List<Question> getQuestions(String mainTense, String subTense);
    List<Question> getQuestionsExcluding(String mainTense, String subTense, Set<Integer> excludeIds);
    Question getQuestionsById(int id);
    void clearUsedQuestions(String mainTense, String subTense);
    void clearAllUsedQuestions();
}