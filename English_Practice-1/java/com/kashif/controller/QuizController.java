package com.kashif.controller;

import com.kashif.model.Question;
import com.kashif.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class QuizController {

    private final QuestionService service;

    public QuizController(QuestionService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/tenses")
    public String showTenses(@RequestParam String mainTense, Model model) {
        model.addAttribute("mainTense", mainTense);
        return "tense";
    }

    @GetMapping("/quiz")
    public String startQuiz(@RequestParam String mainTense,
                            @RequestParam String subTense, Model model) {
        List<Question> questions = service.getQuestions(mainTense, subTense);
        model.addAttribute("questions", questions);
        return "quiz";
    }

    @PostMapping("/submit")
    public String submitAnswers(@RequestParam Map<String, String> params, Model model) {
        int score = 0;
        List<Map<String, String>> results = new ArrayList<>();

        for (String key : params.keySet()) {
            if (key.startsWith("q_")) {
                int id = Integer.parseInt(key.substring(2));
                String userAnswer = params.get(key).trim();

                // For simplicity: We'll fetch correct answer from DB again (can optimize later)
                String correct = "CorrectAnswerFromDB"; // TODO: fetch from DB
                boolean isCorrect = userAnswer.equalsIgnoreCase(correct);

                if (isCorrect) score++;

                Map<String, String> result = new HashMap<>();
                result.put("userAnswer", userAnswer);
                result.put("correctAnswer", correct);
                result.put("status", isCorrect ? "correct" : "wrong");
                results.add(result);
            }
        }

        model.addAttribute("score", score);
        model.addAttribute("results", results);
        return "result";
    }
}
