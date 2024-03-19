<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, java.io.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Reports</title>
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
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #007bff;
            color: #fff;
            text-align: left;
        }

        td {
            text-align: center;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
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
    <h1>Download Reports</h1>
    <table>
        <thead>
            <tr>
                <th>Report ID</th>
                <th>User ID</th>
                <th>Patient Name</th>
                <th>Report Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_appointment_system", "root", "");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM Reports";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int reportId = rs.getInt("report_id");
                        int userId = rs.getInt("user_id");
                        String patientName = rs.getString("patient_name");
                        Date reportDate = rs.getDate("report_date");
            %>
                <tr>
                    <td><%= reportId %></td>
                    <td><%= userId %></td>
                    <td><%= patientName %></td>
                    <td><%= reportDate %></td>
                    <td><a href="DownloadReportServlet?reportId=<%= reportId %>">Download</a></td>
                </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
    <a href="home.jsp" class="back-btn">Back</a>
</body>
</html>
