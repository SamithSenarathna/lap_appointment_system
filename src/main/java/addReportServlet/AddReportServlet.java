package addReportServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddReportServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 10 MB max file size
public class AddReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String patientName = request.getParameter("patientName");
        Part filePart = request.getPart("reportFile");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            String sql = "INSERT INTO Reports (user_id, patient_name, report_file, report_date) VALUES (?, ?, ?, CURDATE())";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, patientName);
            pstmt.setBinaryStream(3, filePart.getInputStream(), (int) filePart.getSize()); // Set the file content as a binary stream
            pstmt.executeUpdate();
            conn.close();

            response.sendRedirect("report_success.jsp"); // Redirect to success page after successful report submission
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
