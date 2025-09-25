package com.kashif.service;

import com.kashif.model.Question;
import com.kashif.repository.QuestionRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Set;

@Service
public class QuestionServiceImpl implements QuestionService {

    private final QuestionRepository repo;

    public QuestionServiceImpl(QuestionRepository repo) {
        this.repo = repo;
    }

    @Override
    public List<Question> getQuestions(String mainTense, String subTense) {
        return repo.getQuestions(mainTense, subTense);
    }

    @Override
    public List<Question> getQuestionsExcluding(String mainTense, String subTense, Set<Integer> excludeIds) {
        return repo.getQuestionsExcluding(mainTense, subTense, excludeIds);
    }

    @Override
    public Question getQuestionsById(int id) {
        return repo.getQuestionsById(id);
    }

    @Override
    public void clearUsedQuestions(String mainTense, String subTense) {
        repo.clearUsedQuestions(mainTense, subTense);
    }

    @Override
    public void clearAllUsedQuestions() {
        repo.clearAllUsedQuestions();
    }
}