<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>English Tense Practice</title>
    <link rel="icon" type="image/x-icon" href="/images/logo.webp">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
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
            background: url('/images/bg.jpg') center/cover;
            opacity: 0.1;
            z-index: -1;
        }

        .container {
            max-width: 1200px;
            width: 90%;
            margin: 0 auto;
            padding: 2rem;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 0.8s ease-out;
        }

        .header h1 {
            font-size: 3.0rem;
            font-weight: 700;
            color: white;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.2rem;
            color: rgba(255,255,255,0.9);
            margin-bottom: 2rem;
        }

        .tense-selection {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
            animation: fadeInUp 0.8s ease-out forwards;
 			opacity: 0;
        }

        .tense-card {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 2.5rem 2rem;
            text-align: center;
            transition: transform 0.6s ease, box-shadow 0.6s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
            text-decoration: none;
            color: inherit;
            animation: fadeInUp 0.8s ease-out forwards;
            opacity: 0;
            transform: translateY(30px);
        }

        .tense-card:nth-child(1) { animation-delay: 0.2s ; }
        .tense-card:nth-child(2) { animation-delay: 0.4s; }
        .tense-card:nth-child(3) { animation-delay: 0.6s; }

        .tense-card:hover {
            transform: translateY(-6px) scale(1.03) !important;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            color: inherit;
            text-decoration: none;
        }

        .tense-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: block;
        }

        .past-card .tense-icon { 
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .present-card .tense-icon { 
            background: linear-gradient(45deg, #26de81, #20bf6b);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .future-card .tense-icon { 
            background: linear-gradient(45deg, #ffa726, #ff7043);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .tense-title {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: #2c3e50;
        }

        .tense-description {
            font-size: 1rem;
            color: #7f8c8d;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .tense-examples {
            background: rgba(52, 73, 94, 0.05);
            border-radius: 10px;
            padding: 1rem;
            font-size: 0.9rem;
            color: #34495e;
            font-style: italic;
        }

        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 3rem;
        }

        .stat-card {
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.2);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: white;
            display: block;
        }

        .stat-label {
            color: rgba(255,255,255,0.8);
            font-size: 0.9rem;
            margin-top: 0.5rem;
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


        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
            }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.5rem;
            }
            
            .tense-selection {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
            .tense-card {
                padding: 2rem 1.5rem;
            }
            
            .tense-icon {
                font-size: 3rem;
            }
            
            .tense-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
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

    <div class="container">
        <div class="header">
            <h1>English Tense Practice</h1>
            <p>Master English grammar through interactive practice</p>
        </div>

        <div class="tense-selection">
            <a href="tenses?mainTense=Past" class="tense-card past-card">
                <i class="fas fa-history tense-icon"></i>
                <h2 class="tense-title">Past Tense</h2>
                <p class="tense-description">
                    Practice actions that happened in the past. Learn past simple, past continuous, past perfect and past perfect continuous tenses.
                </p>
                <div class="tense-examples">
                    "I <strong>walked</strong> to school yesterday"
                </div>
            </a>

            <a href="tenses?mainTense=Present" class="tense-card present-card">
                <i class="fas fa-clock tense-icon"></i>
                <h2 class="tense-title">Present Tense</h2>
                <p class="tense-description">
                    Master current actions and habits. Focus on present simple present, present continuous, present perfect and present perfect continuous tenses.
                </p>
                <div class="tense-examples">
                    "She <strong>is reading</strong> a book right now"
                </div>
            </a>

            <a href="tenses?mainTense=Future" class="tense-card future-card">
                <i class="fas fa-rocket tense-icon"></i>
                <h2 class="tense-title">Future Tense</h2>
                <p class="tense-description">
                    Explore actions that will happen. Practice future simple, future continuous, future perfect and future perfect continuous tenses.
                </p>
                <div class="tense-examples">
                    "We <strong>will travel</strong> to Paris next month"
                </div>
            </a>
        </div>

    </div>

</body>
</html>
