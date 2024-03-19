package viewAppointments;

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

@WebServlet("/FetchAppointmentsServlet")
public class FetchAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String[]> appointmentList = new ArrayList<>();

        try {
            appointmentList = fetchAppointmentDataFromDatabase();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or query errors
        }

        // Set the attribute before forwarding the request
        request.setAttribute("appointmentList", appointmentList);
        request.getRequestDispatcher("view_appointments.jsp").forward(request, response);
    }

    private List<String[]> fetchAppointmentDataFromDatabase() throws SQLException {
        List<String[]> appointmentList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT appointment_id, user_id, patient_name, age, appointment_date, appointment_time, test_name FROM appointments";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String[] appointmentData = new String[7];
                appointmentData[0] = rs.getString("appointment_id");
                appointmentData[1] = rs.getString("user_id");
                appointmentData[2] = rs.getString("patient_name");
                appointmentData[3] = rs.getString("age");
                appointmentData[4] = rs.getString("appointment_date");
                appointmentData[5] = rs.getString("appointment_time");
                appointmentData[6] = rs.getString("test_name");
                appointmentList.add(appointmentData);
            }
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }

        return appointmentList;
    }
}
