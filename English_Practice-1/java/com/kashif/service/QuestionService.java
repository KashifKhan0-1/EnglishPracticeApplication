package com.kashif.service;

import com.kashif.model.Question;
import com.kashif.repository.QuestionRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class QuestionService {

    private final QuestionRepository repo;

    public QuestionService(QuestionRepository repo) {
        this.repo = repo;
    }

    public List<Question> getQuestions(String mainTense, String subTense) {
        return repo.getQuestions(mainTense, subTense);
    }
}
