<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointments</title>
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
        
        table {
            width: 60%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 20%;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
        
        th {
            background-color: #007bff;
            color: #fff;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>View Appointments</h1>
    <!-- Display appointment information -->
    <table border="1">
        <thead>
            <tr>
                <th>Appointment ID</th>
                <th>User ID</th>
                <th>Patient Name</th>
                <th>Age</th>
                <th>Date</th>
                <th>Time</th>
                <th>Test Name</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_appointment_system", "root", "");
                String sql = "SELECT appointment_id, user_id, patient_name, age, appointment_date, appointment_time, test_name FROM appointments";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int appointmentId = rs.getInt("appointment_id");
                    int userId = rs.getInt("user_id");
                    String patientName = rs.getString("patient_name");
                    int age = rs.getInt("age");
                    String appointmentDate = rs.getString("appointment_date");
                    String appointmentTime = rs.getString("appointment_time");
                    String testName = rs.getString("test_name");
            %>
                <tr>
                    <td><%= appointmentId %></td>
                    <td><%= userId %></td>
                    <td><%= patientName %></td>
                    <td><%= age %></td>
                    <td><%= appointmentDate %></td>
                    <td><%= appointmentTime %></td>
                    <td><%= testName %></td>
                </tr>
            <% 
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
            %>
        </tbody>
    </table>
</body>
</html>
