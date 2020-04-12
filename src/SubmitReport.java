

import DBPackage.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubmitReport
 */
@WebServlet("/SubmitReport")
public class SubmitReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubmitReport() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String content = request.getParameter("reportcontent");
		Cookie []cookie = request.getCookies();
		String userName = cookie[0].getValue();
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
	         String sql;
	         sql = "update ReportsTable set content='"+content+"' where id='"+userName+"'";
	         stmt.executeUpdate(sql);
	         con.close();
	         stmt.close();
	         PrintWriter pw = response.getWriter();
	         pw.write("Changes have been uploaded! <a href='ReportEditor.jsp'> Go Back</a>");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
