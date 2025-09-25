package com.kashif.repository;

import com.kashif.model.Question;
import org.springframework.stereotype.Repository;
import java.sql.*;
import java.util.*;

@Repository
public class QuestionRepository {

	private final String URL = "jdbc:mysql://localhost:3306/englishpracticedb?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	private final String USER = "root";
    private final String PASS = "@MILEstone123#";

    // Store recently used question IDs for each user session
    private Map<String, Set<Integer>> userUsedQuestions = new HashMap<>();
    
    public List<Question> getQuestions(String mainTense, String subTense) {
        return getQuestionsExcluding(mainTense, subTense, new HashSet<>());
    }

    public List<Question> getQuestionsExcluding(String mainTense, String subTense, Set<Integer> excludeIds) {
        List<Question> questions = new ArrayList<>();
        String sessionKey = mainTense + "_" + subTense;
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            // First, get total count of available questions
            String countSql = "SELECT COUNT(*) FROM questions WHERE maintense=? AND subtense=?";
            PreparedStatement countPs = conn.prepareStatement(countSql);
            countPs.setString(1, mainTense);
            countPs.setString(2, subTense);
            ResultSet countRs = countPs.executeQuery();
            int totalQuestions = 0;
            if (countRs.next()) {
                totalQuestions = countRs.getInt(1);
            }
            
            // Get previously used questions for this session
            Set<Integer> usedQuestions = userUsedQuestions.getOrDefault(sessionKey, new HashSet<>());
            usedQuestions.addAll(excludeIds);
            
            // If we've used most questions, reset the used questions set
            if (usedQuestions.size() >= totalQuestions - 5) {
                usedQuestions.clear();
                userUsedQuestions.put(sessionKey, usedQuestions);
            }
            
            // Build exclusion clause
            StringBuilder sql = new StringBuilder("SELECT * FROM questions WHERE maintense=? AND subtense=?");
            
            if (!usedQuestions.isEmpty()) {
                sql.append(" AND id NOT IN (");
                sql.append("?,".repeat(usedQuestions.size()));
                sql.setLength(sql.length() - 1); // Remove last comma
                sql.append(")");
            }
            
            sql.append(" ORDER BY ID LIMIT 10");
            
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            ps.setString(1, mainTense);
            ps.setString(2, subTense);
            
            // Set excluded IDs in prepared statement
            int paramIndex = 3;
            for (Integer excludeId : usedQuestions) {
                ps.setInt(paramIndex++, excludeId);
            }
            
            ResultSet rs = ps.executeQuery();
            Set<Integer> newUsedIds = new HashSet<>();
            
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setMainTense(rs.getString("maintense"));
                q.setSubTense(rs.getString("subtense"));
                q.setQuestionText(rs.getString("questiontext"));
                q.setCorrectAnswer(rs.getString("correctanswer"));
                questions.add(q);
                newUsedIds.add(q.getId());
            }
            
            // Update used questions for this session
            usedQuestions.addAll(newUsedIds);
            userUsedQuestions.put(sessionKey, usedQuestions);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    public Question getQuestionsById(int id) {
        Question question = null;
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            String sql = "SELECT * FROM questions WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                question = new Question();
                question.setId(rs.getInt("id"));
                question.setMainTense(rs.getString("maintense"));
                question.setSubTense(rs.getString("subtense"));
                question.setQuestionText(rs.getString("questiontext"));
                question.setCorrectAnswer(rs.getString("correctanswer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return question;
    }
    
    // Method to clear used questions for a specific session (optional)
    public void clearUsedQuestions(String mainTense, String subTense) {
        String sessionKey = mainTense + "_" + subTense;
        userUsedQuestions.remove(sessionKey);
    }
    
    // Method to clear all used questions (optional)
    public void clearAllUsedQuestions() {
        userUsedQuestions.clear();
    }
}