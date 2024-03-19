package payBillServlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PayBillServlet")
public class PayBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/lab_appointment_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientName = request.getParameter("patientName");
        String testName = request.getParameter("testName");
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String billingDate = request.getParameter("billingDate");
        String paymentMethod = request.getParameter("paymentMethod");

        try {
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO Billing (patient_name, test_name, amount, billing_date, payment_method) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, patientName);
            pstmt.setString(2, testName);
            pstmt.setBigDecimal(3, amount);
            pstmt.setString(4, billingDate);
            pstmt.setString(5, paymentMethod);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or insertion errors
        }

        // Redirect to a confirmation page or home page
        response.sendRedirect("confirmation.jsp");
    }
}
