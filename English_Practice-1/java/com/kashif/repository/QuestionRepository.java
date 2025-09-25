package com.kashif.repository;

import com.kashif.model.Question;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.util.*;

@Repository
public class QuestionRepository {

	private final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
    private final String USER = "mydb2pm";
    private final String PASS = "1234";

    public List<Question> getQuestions(String mainTense, String subTense) {
        List<Question> questions = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            String sql = "SELECT * FROM questions WHERE main_tense=? AND sub_tense=? ORDER BY RAND() LIMIT 10";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mainTense);
            ps.setString(2, subTense);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setMainTense(rs.getString("main_tense"));
                q.setSubTense(rs.getString("sub_tense"));
                q.setQuestionText(rs.getString("question_text"));
                q.setCorrectAnswer(rs.getString("correct_answer"));
                questions.add(q);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }
}
