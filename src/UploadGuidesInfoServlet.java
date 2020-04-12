
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class UploadGuidesInfoServlet
 */
@WebServlet("/UploadGuidesInfoServlet")
public class UploadGuidesInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadGuidesInfoServlet() {
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
		Cookie cookie[] = request.getCookies();
		String userName = cookie[0].getValue();
		String pref1 = request.getParameter("field1").replace(" ", "_");
		String pref2 = request.getParameter("field2").replace(" ", "_");
		String pref3 = request.getParameter("field3").replace(" ", "_");
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			
			String sql = "select id from GuidesTable where name = '" + pref1 + "';";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.absolute(1);
			pref1 = rs.getString(1);
			stmt.close();
			
			sql = "select id from GuidesTable where name = '" + pref2 + "';";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.absolute(1);
			pref2 = rs.getString(1);
			stmt.close();
			
			sql = "select id from GuidesTable where name = '" + pref3 + "';";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.absolute(1);
			pref3 = rs.getString(1);
			stmt.close();
			
			PreparedStatement st = con 
					.prepareStatement("insert into GuidePreferences values(?,?,?,?,?,?,?,?,?)");
			st.setString(1, userName);
			st.setString(2, pref1);
			st.setString(3, "P");
			st.setString(4, pref2);
			st.setString(5, "P");
			st.setString(6, pref3);
			st.setString(7, "P");
			st.setString(8, request.getParameter("field4"));
			st.setString(9, request.getParameter("field5"));

			st.executeUpdate();
			
			st = con.prepareStatement("insert into CurrentAppliedGuide values(?,?)");
			st.setString(1, userName);
			st.setString(2, pref1);
			st.executeUpdate();
			
			st.close(); 
			con.close(); 
			request.getRequestDispatcher("UpdatedGuidePref.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
