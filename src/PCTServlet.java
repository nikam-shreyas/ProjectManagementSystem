
import DBPackage.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PCTServlet
 */
@WebServlet("/PCTServlet")
public class PCTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PCTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "wtl";
		String userid = "root";
		String password = "Password_1234";
		String proj_name = "";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		PreparedStatement st = null;
		String sql;

		try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();

			proj_name = request.getParameter("proj_name").trim();
			String status = request.getParameter("status").trim();
			sql = "";
			System.out.println(status + "\n" + proj_name);
			if(status.compareTo("A") == 0)
			{
				sql = "update SynopsisTable set status = 'A' where id = '" + proj_name +"';";
				statement.executeUpdate(sql);
				statement.close();
				
				java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
				sql = "insert into PrivateNoticeTable values(?,?,?);";
				st = connection.prepareStatement(sql);
				st.setDate(2, date);
				st.setString(1, proj_name);
				st.setString(3, "The Project Coordination Team has approved your Project Synopsis. You can now apply for a project guide");
				st.executeUpdate();
				
			}	
			else
			{
				java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
				sql = "insert into PrivateNoticeTable values(?,?,?);";
				st = connection.prepareStatement(sql);
				st.setDate(2, date);
				st.setString(1, proj_name);
				st.setString(3, "The Project Coordination Team has rejected your Project Synopsis. Review and refill the Project Synopsis Application");
				st.executeUpdate();
				
				sql = "delete from SynopsisTable where id = '" + proj_name +"';";
				st = connection.prepareStatement(sql);
				st.executeUpdate();
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String greetings = proj_name;

		response.setContentType("text/plain");
		response.getWriter().write(greetings);
	}
	
	
}
