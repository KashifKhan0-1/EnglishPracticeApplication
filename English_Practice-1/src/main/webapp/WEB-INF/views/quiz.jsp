<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <link rel="icon" type="image/x-icon" href="/images/logo.webp">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
    	.container-2{
    		justify-content: space-between;
		    display: flex;
		    align-items: self-end;
		}
		.submit-button{
			justify-content: end;
		    display: flex;
		    align-items: self-end;
		}
    </style>
</head>
<body class="bg-light">
				
<div class="container mt-5">
	<div class="container-2">
	    <h2>Answer the Questions - ${subTense}</h2>
	    <a href="hint" class="btn btn-outline-secondary m-2">Hint <i class="fa-regular fa-lightbulb"></i></i></a>
	</div>
    <form action="submit" method="post">
        <!-- Hidden fields to pass tense information -->
        <input type="hidden" name="mainTense" value="${mainTense}">
        <input type="hidden" name="subTense" value="${subTense}">
        
        <c:forEach var="q" items="${questions}" varStatus="status">
            <div class="mb-3">
                <label><b>${status.index + 1}. ${q.questionText}</b></label>
                <input type="text" class="form-control" name="q_${q.id}" placeholder="Type your answer here" required>
            </div>
        </c:forEach>
        <div class="submit-button">
       		<button type="submit" class="btn btn-success">Submit Answers</button>
        </div>
    </form>
</div>

</body>
</html>