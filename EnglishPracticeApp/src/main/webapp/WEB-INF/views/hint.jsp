<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>12 Tenses — Affirmative Forms</title>
	<link rel="icon" type="image/x-icon" href="/images/logo.webp">
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- On-page CSS (user preference) -->
  <style>
    :root{
      --card-bg: rgba(255,255,255,0.95);
      --accent: #007426;
      --soft: #dbffdb;
    }

    html,body{
      height:100%;
      margin:0;
      font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      background: linear-gradient(135deg, var(--soft), var(--accent));
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
    }

    .page-wrap{
      min-height:100%;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:3rem 1rem;
    }

    .card {
      width:100%;
      max-width:980px;
      border: none;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.12);
      background: var(--card-bg);
      overflow: hidden;
    }

    .card-header {
      background: transparent;
      border-bottom: none;
      padding: 1.5rem 1.5rem 0.5rem;
    }

    h1.title {
      font-size:1.5rem;
      margin:0;
      color: #064; /* darker greenish */
      letter-spacing:0.2px;
    }

    p.lead {
      margin:0.25rem 0 0.75rem;
      color:#084;
      opacity:0.85;
    }

    .table thead th {
      background: rgba(0,0,0,0.02);
      border-top: none;
    }

    .table td, .table th {
      vertical-align: middle;
      padding:0.85rem 1.75rem;
    }

    .example {
      font-style: italic;
      color: #333;
      opacity:0.9;
    }

    /* Make examples slightly smaller on very small devices */
    @media (max-width:576px){
      .example { font-size:0.95rem; }
      h1.title { font-size:1.25rem; }
    }

    /* Print-friendly */
    @media print {
      body { background: white !important; }
      .card { box-shadow: none; }
    }

    .btn-copy {
      background: #fff;
      border: 1px solid rgba(0,0,0,0.08);
      box-shadow: 0 3px 10px rgba(0,0,0,0.06);
    }
  </style>
</head>
<body>
  <div class="page-wrap">
    <div class="card">
      <div class="card-header d-flex align-items-start justify-content-between">
        <div>
          <h1 class="title">12 Tenses — Affirmative Forms</h1>
          <p class="lead">Compact reference of formulas and simple examples (affirmative only).</p>
        </div>

      </div>

      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover mb-0">
            <thead>
              <tr>
                <th style="width:26%;">Tense</th>
                <th style="width:40%;">Formula (Affirmative)</th>
                <th style="width:34%;">Example</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><strong>Present Simple</strong></td>
                <td>Subject + V1 (+s/es)</td>
                <td class="example">He plays football.</td>
              </tr>
              <tr>
                <td><strong>Present Continuous</strong></td>
                <td>Subject + is/are/am + V1 + ing</td>
                <td class="example">She is reading a book.</td>
              </tr>
              <tr>
                <td><strong>Present Perfect</strong></td>
                <td>Subject + has/have + V3</td>
                <td class="example">They have finished work.</td>
              </tr>
              <tr>
                <td><strong>Present Perfect Continuous</strong></td>
                <td>Subject + has/have + been + V1 + ing (since/for …)</td>
                <td class="example">I have been studying for 2 hours.</td>
              </tr>

              <tr>
                <td><strong>Past Simple</strong></td>
                <td>Subject + V2</td>
                <td class="example">She went home.</td>
              </tr>
              <tr>
                <td><strong>Past Continuous</strong></td>
                <td>Subject + was/were + V1 + ing</td>
                <td class="example">They were talking.</td>
              </tr>
              <tr>
                <td><strong>Past Perfect</strong></td>
                <td>Subject + had + V3</td>
                <td class="example">He had left early.</td>
              </tr>
              <tr>
                <td><strong>Past Perfect Continuous</strong></td>
                <td>Subject + had + been + V1 + ing (since/for …)</td>
                <td class="example">She had been working for 3 years.</td>
              </tr>

              <tr>
                <td><strong>Future Simple</strong></td>
                <td>Subject + will + V1</td>
                <td class="example">I will go tomorrow.</td>
              </tr>
              <tr>
                <td><strong>Future Continuous</strong></td>
                <td>Subject + will + be + V1 + ing</td>
                <td class="example">We will be traveling.</td>
              </tr>
              <tr>
                <td><strong>Future Perfect</strong></td>
                <td>Subject + will + have + V3</td>
                <td class="example">He will have finished by then.</td>
              </tr>
              <tr>
                <td><strong>Future Perfect Continuous</strong></td>
                <td>Subject + will + have + been + V1 + ing (since/for …)</td>
                <td class="example">I will have been working here for 5 years.</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="p-3 border-top small text-muted">
          Tip: Use this table as a quick reference. If your answer is marked wrong even though the grammar is correct, check for spelling
           mistakes or missing punctuation. Remember, a question may have multiple correct answers, but your response must match the formulas
            provided in the table above.
        </div>
      </div>
    </div>
  </div>

</body>
</html>
