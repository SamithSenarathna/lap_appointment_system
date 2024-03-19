<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        form {
            display: inline;
        }
        .back-button {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Manage Users</h1>
    
    <!-- Form to add a new user -->
    <h2>Add User</h2>
    <form action="ManageUsersServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="role">Role:</label>
        <select id="role" name="role">
            <option value="admin">Admin</option>
            <option value="Patient">Patient</option>
            <option value="Doctor">Doctor</option>
        </select><br><br>
        
        <input type="submit" value="Add User">
    </form>
    
    <!-- View Users Table -->
    <h2>View Users</h2>
    <table border="1">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Action</th> <!-- Add a column for the delete action -->
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
                String sql = "SELECT user_id, username, email, role FROM users";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int userId = rs.getInt("user_id");
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
            %>
                <tr>
                    <td><%= userId %></td>
                    <td><%= username %></td>
                    <td><%= email %></td>
                    <td><%= role %></td>
                    <td>
                        <!-- Delete button -->
                        <form action="DeleteUserServlet" method="post">
                            <input type="hidden" name="userId" value="<%= userId %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
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
    
    <!-- Back Button -->
    <div class="back-button">
        <a href="adminhome.jsp">Back to Admin Home</a>
    </div>
</body>
</html>
