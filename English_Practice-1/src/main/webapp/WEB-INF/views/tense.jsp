<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Select Tense</title>
    <link rel="icon" type="image/x-icon" href="/images/logo.webp">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<style>
	body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    margin: 0;
    padding: 0;
    position: relative;
    overflow-x: hidden;
}

body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('/images/bg.jpg') center/cover no-repeat;
    opacity: 0.1;
    z-index: -1;
}

.mt-4 {
    background: rgba(255,255,255,0.8);
    backdrop-filter: blur(12px);
    border-radius: 20px;
    padding: 3rem 2rem;
    box-shadow: 0 15px 40px rgba(0,0,0,0.2);
    animation: fadeIn 1s ease-out;
    text-align: center;
}

h1 {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 2rem;
    text-shadow: 2px 2px 5px rgba(0,0,0,0.2);
    color: #ffffff;
    animation: fadeIn 1s ease-out;
}

/* White full-width buttons with hover slide effect */
.btn-primary {
    position: relative;
    display: inline-block;
    width: 400px; /* long buttons */
    max-width: 80%; /* responsive */
    padding: 0.8rem 1.5rem;
    margin: 0.5rem;
    font-size: 1.1rem;
    font-weight: 600;
    color: #333;
    background: #ffffff;
    border: none;
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

/* Sliding hover effect using pseudo-element */
.btn-primary::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.05);
    transition: all 0.5s ease;
}

.btn-primary:hover::before {
    left: 100%;
}

.btn-primary:hover {
    transform: translateX(10px); /* slide on X-axis */
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    background-color: #667eea;
}

.floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .floating-element {
            position: absolute;
            color: rgba(255,255,255,0.1);
            font-size: 1.5rem;
            animation: float 6s ease-in-out infinite;
        }

			.floating-element:nth-child(1) { top: 13%; left: 5%; animation-delay: 0s; }
			.floating-element:nth-child(2) { top: 16%; left: 90%; animation-delay: 2s; }
			.floating-element:nth-child(3) { top: 20%; left: 70%; animation-delay: 4s; }
			.floating-element:nth-child(4) { top: 15%; left: 20%; animation-delay: 1s; }
				.floating-element:nth-child(5) { top: 65%; left: 92%; animation-delay: 3s; }
				.floating-element:nth-child(6) { top: 60%; left: 5%; animation-delay: 5s; }
				.floating-element:nth-child(7) { top: 40%; left: 95%; animation-delay: 6s; }
				.floating-element:nth-child(8) { top: 85%; left: 2%; animation-delay: 7s; }



/* fade-in animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Responsive fixes for tablets and smaller */
@media (max-width: 768px) {
    h1 { 
        font-size: 2rem; 
    }
    .btn-primary { 
        width: 90%; 
        margin: 0.5rem 0; 
        font-size: 1rem;
        padding: 0.7rem 1rem;
    }
}

/* Extra responsive fixes for small mobile screens */
@media (max-width: 480px) {
    h1 { 
        font-size: 1.6rem; 
    }
    .btn-primary { 
        width: 95%; 
        font-size: 0.95rem;
        padding: 0.6rem 0.8rem;
    }
}


</style>
<body class="bg-light">
    <div class="floating-elements">
        <div class="floating-element">📚</div>
        <div class="floating-element">✏️</div>
        <div class="floating-element">🎯</div>
        <div class="floating-element">💡</div>
	        <div class="floating-element">📚</div>
	        <div class="floating-element">✏️</div>
	        <div class="floating-element">🎯</div>
	        <div class="floating-element">💡</div>      	
    </div>
	<div class="container text-center mt-5">
	    <h1>You Selected: ${mainTense} Tense</h1>
	    <div class="mt-4">
	        <a href="quiz?mainTense=${mainTense}&subTense=${mainTense} Simple" class="btn btn-primary m-2">${mainTense} Simple</a><br>
	        <a href="quiz?mainTense=${mainTense}&subTense=${mainTense} Continuous" class="btn btn-primary m-2">${mainTense} Continuous</a><br>
	        <a href="quiz?mainTense=${mainTense}&subTense=${mainTense} Perfect" class="btn btn-primary m-2">${mainTense} Perfect</a><br>
	        <a href="quiz?mainTense=${mainTense}&subTense=${mainTense} Perfect Continuous" class="btn btn-primary m-2">${mainTense} Perfect Continuous</a>
	    </div>
	</div>

</body>
</html>
