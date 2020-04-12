
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String userPwd=request.getParameter("userPwd");
		String userName=request.getParameter("userId");
		String rePwd=request.getParameter("rePwd");
		boolean valid = false;
		if(userPwd.compareTo(rePwd)==0) {
			valid = true;
		}
		if(!userName.contains("2K")||userName.length()!=11) {
			RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.html");
			PrintWriter pw=response.getWriter();
			pw.write("<p style='display:none' id='valid'>Invalid1</p>");
			rd.include(request, response);
		}
		else if(!valid) {
			RequestDispatcher rd=request.getRequestDispatcher("ForgotPassword.html");
			PrintWriter pw=response.getWriter();
			pw.write("<p style='display:none' id='valid'>Invalid2</p>");
			rd.include(request, response);
		}
		else {
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				Statement stmt = con.createStatement();
				String sql;
				sql = "update UserValidationTable set password='"+userPwd+"' where id='"+userName+"';";
				stmt.executeUpdate(sql);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			RequestDispatcher rd=request.getRequestDispatcher("LoginPage.html");
			rd.forward(request, response);
		}
	}
}
