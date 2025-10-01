<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Quiz Results</title>
    <link rel="icon" type="image/x-icon" href="/images/logo.webp">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        .correct { 
            background-color: #d4edda; 
            padding: 15px; 
            border-radius: 5px; 
            border-left: 5px solid #28a745;
            margin-bottom: 10px;
        }
        .wrong { 
            background-color: #f8d7da; 
            padding: 15px; 
            border-radius: 5px; 
            border-left: 5px solid #dc3545;
            margin-bottom: 10px;
        }
        .correct-answer-text { 
            font-size: 0.9em; 
            color: #721c24; 
            margin-top: 8px;
            font-weight: bold;
        }
        .score-display {
            font-size: 1.5em;
            font-weight: bold;
            color: #28a745;
        }
        .question-text {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .user-answer {
            color: #495057;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="text-center mb-4">
        <h2>Quiz Results</h2>
        <div class="score-display">
            Your Score: ${score} / ${totalQuestions}
        </div>
        <div class="mt-2">
            <c:choose>
                <c:when test="${score == totalQuestions}">
                    <span class="badge bg-success fs-6">Perfect! Excellent work!</span>
                </c:when>
                <c:otherwise>
                    <span class="badge bg-secondary fs-6">Keep practicing! You'll improve!</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <hr>
    
    <h4>Detailed Results:</h4>
    <c:forEach var="res" items="${results}" varStatus="status">
        <div class="${res.status}">
            <div class="question-text">Q${res.questionNumber}: ${res.questionText}</div>
            <div class="user-answer">Your Answer: "${res.userAnswer}"</div>
            <c:if test="${res.status eq 'wrong'}">
                <div class="correct-answer-text">Correct Answer: "${res.correctAnswer}"</div>
            </c:if>
            <c:if test="${res.status eq 'correct'}">
                <div style="color: #155724; margin-top: 5px;">✓ Correct!</div>
            </c:if>
        </div>
    </c:forEach>
    
    <div class="text-center mt-4">
        <a href="quiz?mainTense=${mainTense}&subTense=${subTense}" class="btn btn-warning btn-lg me-3">Try Again (Same Category)</a>
        <a href="/" class="btn btn-primary btn-lg">Choose Different Category</a>
    </div>
</div>

</body>
</html>