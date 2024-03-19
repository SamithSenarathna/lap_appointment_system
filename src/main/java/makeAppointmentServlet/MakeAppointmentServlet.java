package makeAppointmentServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MakeAppointmentServlet")
public class MakeAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId"); // Get the user ID from the session

        List<String[]> userAppointments = getUserAppointments(userId); // Retrieve appointments for the logged-in user

        request.setAttribute("userAppointments", userAppointments);
        request.getRequestDispatcher("view_appointments.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId"); // Assuming "userId" is the attribute name storing the user ID

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String patientName = request.getParameter("patientName");
        int age = Integer.parseInt(request.getParameter("age"));
        String testName = request.getParameter("test");

        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO Appointments (user_id, patient_name, age, appointment_date, appointment_time, test_name) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, patientName);
            pstmt.setInt(3, age);
            pstmt.setString(4, date);
            pstmt.setString(5, time);
            pstmt.setString(6, testName);

            pstmt.executeUpdate();

            conn.close();

            response.sendRedirect("appointment_success.jsp"); // Redirect to success page after successful appointment
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    private List<String[]> getUserAppointments(int userId) {
        List<String[]> userAppointments = new ArrayList<>(); // Initialize the list

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT patient_name, age, appointment_date, appointment_time, test_name FROM Appointments WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // Retrieve appointment details from the result set
                String patientName = rs.getString("patient_name");
                int age = rs.getInt("age");
                String date = rs.getString("appointment_date");
                String time = rs.getString("appointment_time");
                String testName = rs.getString("test_name");

                // Create an array containing appointment details
                String[] appointmentDetails = {patientName, String.valueOf(age), date, time, testName};
                userAppointments.add(appointmentDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // You can handle this exception according to your application's requirements
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace(); // You can handle this exception according to your application's requirements
            }
        }

        return userAppointments;
    }
}
