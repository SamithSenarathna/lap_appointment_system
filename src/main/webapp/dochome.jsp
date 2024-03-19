<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .welcome-message {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
        <h1>Welcome, Dr. <%= username %></h1>
        <% } else { %>
        <h1>Welcome</h1>
        <% } %>
        <div class="welcome-message">
            <p>Manage your appointments and patient information.</p>
        </div>
        <a href="view_appointments.jsp" class="btn">View Appointments</a>
        <a href="add_reports.jsp" class="btn">Add reports</a>
        <a href="login.jsp" class="btn">Logout</a>
    </div>
</body>
</html>
