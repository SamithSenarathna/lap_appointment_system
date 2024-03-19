<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="makeAppointmentServlet.MakeAppointmentServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="time"],
        select,
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-btn {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <h1>Make Appointment</h1>
    <form action="MakeAppointmentServlet" method="post">
    
        <label for="patientName">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" required><br><br>
        
        <label for="age">Patient Age:</label>
        <input type="number" id="age" name="age" min="0" required><br><br>
        
        <label for="date">Appointment Date:</label>
        <input type="date" id="date" name="date" required><br><br>
        
        <label for="time">Appointment Time:</label>
        <input type="time" id="time" name="time" required><br><br>
        
        <label for="test">Select Test:</label>
        <select id="test" name="test" required>
            <option value="">Select Test</option>
            <option value="Blood Test">Blood Test</option>
            <option value="Urinalysis">Urinalysis</option>
            <option value="X-Ray">X-Ray</option>
            <!-- Add more test options as needed -->
        </select><br><br>
        
        <input type="submit" value="Submit">
    </form>
    <a href="home.jsp" class="back-btn">Back</a>
</body>
</html>
