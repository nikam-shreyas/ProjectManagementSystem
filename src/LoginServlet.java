
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String userPwd=request.getParameter("userPwd");
		String userName=request.getParameter("userId");
		Cookie cookie = new Cookie("userId",userName);
		String role = "";
		response.addCookie(cookie);
		boolean valid = false;
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
	         String sql;
	         sql = "SELECT * FROM UserValidationTable where id = '"+userName+"'";
	         ResultSet rs = stmt.executeQuery(sql);
	         String pwd = null;
	         while(rs.next()){
	            pwd  = rs.getString("password");
	         if(pwd!=null && pwd.compareTo(userPwd)==0) {
	        	 valid = true;
	        	 role = rs.getString("role");
	        	 break;
	         }
	         }
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(!userName.contains("2K")||userName.length()!=11||!valid) {
			RequestDispatcher rd=request.getRequestDispatcher("LoginPage.html");
			PrintWriter pw=response.getWriter();
			pw.write("<p style='display:none' id='valid'>Invalid</p>");
			rd.include(request, response);
		}
		else {
			RequestDispatcher rd = null;
			if(role.compareTo("student") == 0)		
				rd = request.getRequestDispatcher("HomePage.jsp");		
			else if(role.compareTo("guide") == 0)
				rd = request.getRequestDispatcher("GuideHome.jsp");
			else if(role.compareTo("pct") == 0)
				rd = request.getRequestDispatcher("PCTHome.jsp");
			else
				rd = request.getRequestDispatcher("ForgotPassword.html");
			rd.forward(request, response);
		}
	}

}
