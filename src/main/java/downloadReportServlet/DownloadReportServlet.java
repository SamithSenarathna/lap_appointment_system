package downloadReportServlet;

import java.io.IOException;
import java.io.InputStream;
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

@WebServlet("/DownloadReportServlet")
public class DownloadReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reportId = Integer.parseInt(request.getParameter("reportId"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            String sql = "SELECT report_file FROM Reports WHERE report_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reportId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                InputStream reportStream = rs.getBinaryStream("report_file");

                // Set response content type
                response.setContentType("application/pdf");

                // Set the content length of the file
                response.setContentLengthLong(rs.getBytes("report_file").length);

                // Set the header for the PDF attachment
                response.setHeader("Content-Disposition", "attachment; filename=\"report_" + reportId + ".pdf\"");

                // Write the file content to the response output stream
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = reportStream.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
                reportStream.close();
            } else {
                response.getWriter().println("No report found for the specified ID.");
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
