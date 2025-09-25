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

    @GetMapping("/home")
    public String home() {
        return "index";
    }

    @GetMapping("/tenses")
    public String showTenses(@RequestParam String mainTense, Model model) {
        model.addAttribute("mainTense", mainTense);
        return "tense";
    }

    @GetMapping("/quiz")
    public String startQuiz(@RequestParam(name = "mainTense") String mainTense,
                            @RequestParam(name = "subTense") String subTense,
                            Model model) {
        List<Question> questions = service.getQuestions(mainTense, subTense);
        model.addAttribute("questions", questions);
        model.addAttribute("mainTense", mainTense);
        model.addAttribute("subTense", subTense);
        return "quiz";
    }
    @GetMapping("/hint")
    public String showHintPage() {
        return "hint";
    }

    @PostMapping("/submit")
    public String submitAnswers(@RequestParam Map<String, String> params, Model model) {
        int score = 0;
        int totalQuestions = 0;
        List<Map<String, Object>> results = new ArrayList<>();

        for (String key : params.keySet()) {
            if (key.startsWith("q_")) {
                int questionId = Integer.parseInt(key.substring(2));
                String userAnswer = params.get(key).trim();

                // Fetch the correct answer from database
                Question question = service.getQuestionsById(questionId);
                if (question != null) {
                    String correctAnswer = question.getCorrectAnswer();
                    boolean isCorrect = userAnswer.equalsIgnoreCase(correctAnswer);

                    if (isCorrect) {
                        score++;
                    }

                    Map<String, Object> result = new HashMap<>();
                    result.put("questionText", question.getQuestionText());
                    result.put("userAnswer", userAnswer);
                    result.put("correctAnswer", correctAnswer);
                    result.put("status", isCorrect ? "correct" : "wrong");
                    result.put("questionNumber", totalQuestions + 1);
                    results.add(result);
                    totalQuestions++;
                }
            }
        }

        model.addAttribute("score", score);
        model.addAttribute("totalQuestions", totalQuestions);
        model.addAttribute("results", results);
        
        // Add parameters for "Try Again" functionality
        String mainTense = params.get("mainTense");
        String subTense = params.get("subTense");
        model.addAttribute("mainTense", mainTense);
        model.addAttribute("subTense", subTense);
        
        return "result";
    }
    
    // Optional: Endpoint to reset used questions for a specific tense
    @PostMapping("/reset-questions")
    public String resetQuestions(@RequestParam String mainTense, 
                               @RequestParam String subTense) {
        service.clearUsedQuestions(mainTense, subTense);
        return "redirect:/quiz?mainTense=" + mainTense + "&subTense=" + subTense;
    }
    
    // Optional: Endpoint to reset all used questions
    @PostMapping("/reset-all-questions")
    public String resetAllQuestions() {
        service.clearAllUsedQuestions();
        return "redirect:/";
    }
}