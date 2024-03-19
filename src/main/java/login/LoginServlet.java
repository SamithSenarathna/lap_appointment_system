package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean authenticated = false;
        int userId = -1; // Initialize userId to a default value
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT user_id FROM users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                authenticated = true;
                userId = rs.getInt("user_id"); // Retrieve the user ID from the result set
            }

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        if (authenticated) {
            // Set the user ID attribute in the session
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);

            // Check the role of the user
            if (isDoctor(userId)) {
                response.sendRedirect("dochome.jsp"); // Redirect to doctor's home page
            } else if (isPatient(userId)) {
                response.sendRedirect("home.jsp"); // Redirect to patient's home page
            } else if (isAdmin(userId)) {
                response.sendRedirect("adminhome.jsp"); // Redirect to admin's home page
            } else {
                // Handle unknown role or other cases
                response.sendRedirect("home.jsp"); // Redirect to a default home page
            }
        } else {
            response.sendRedirect("login.jsp?error=true"); // Redirect back to login with error parameter
        }

    }

    private boolean isDoctor(int userId) {
        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM users WHERE user_id = ? AND role = 'DOCTOR'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            boolean isDoctor = rs.next();

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();

            return isDoctor;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    private boolean isPatient(int userId) {
        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM users WHERE user_id = ? AND role = 'PATIENT'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            boolean isPatient = rs.next();

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();

            return isPatient;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    private boolean isAdmin(int userId) {
        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT * FROM users WHERE user_id = ? AND role = 'ADMIN'";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            boolean isAdmin = rs.next();

            // Close resources
            rs.close();
            pstmt.close();
            conn.close();

            return isAdmin;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
