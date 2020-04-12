
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuideResponseServlet
 */
@WebServlet("/GuideResponseServlet")
public class GuideResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GuideResponseServlet() {
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
		System.out.println("Hello");
		Cookie cookie[] = request.getCookies();
		String currentUser = cookie[0].getValue();

		String project = request.getParameter("userName").trim();
		String status = request.getParameter("status").trim();

		if(project == null || "".equals(project)){
			project = "Guest";
		}

		


		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = null;
			System.out.println(currentUser +"\n"+status);
			
			if(status.compareTo("A") == 0)
			{
				System.out.println("Hello");
				st = con.prepareStatement("insert into Projects values(?,?);");
				st.setString(1, project);
				st.setString(2, currentUser);
				st.executeUpdate();
				st = con.prepareStatement("update GuidesTable set grpcount = grpcount+1 where id = '"+currentUser+"';");
				st.executeUpdate();
				
				st = con.prepareStatement("delete from GuidePreferences where id = '"+project+"';");
				st.executeUpdate();
				st.close();
				
				st = con.prepareStatement("delete from CurrentAppliedGuide where id = '"+project+"';");
				st.executeUpdate();
				st.close();
				
				st = con.prepareStatement("select name from GuidesTable where id = '" + currentUser + "';");
				ResultSet rs = st.executeQuery();
				rs.next();
				String prof_name = rs.getString("name");
				
				java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
				st = con.prepareStatement("insert into PrivateNoticeTable values(?,?,?);");
				st.setDate(2, date);
				st.setString(1, project);
				st.setString(3, prof_name +" has accepted your project. Upload your project report.");
				st.executeUpdate();
			}
			else
			{
				PreparedStatement st1 = null;
				ResultSet rs = null;
				String sql = "select * from GuidePreferences where id = '" + project + "';";
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				rs.absolute(1);
				if(rs.getString("pref1").compareTo(currentUser) == 0)
				{
					sql = "update GuidePreferences set status1 = 'R' where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
					
					sql = "update CurrentAppliedGuide set guide = (select pref2 from GuidePreferences where id = '"+project+"') where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
				}
				else if(rs.getString("pref2").compareTo(currentUser) == 0)
				{
					sql = "update GuidePreferences set status2 = 'R' where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
					
					sql = "update CurrentAppliedGuide set guide = (select pref3 from GuidePreferences where id = '"+project+"') where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
				}
				else
				{
					sql = "update GuidePreferences set status3 = 'R' where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
					
					sql = "delete from CurrentAppliedGuide where id = '"+project+"';";
					st1 = con.prepareStatement(sql);
					st1.executeUpdate();
					
					java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
					sql = "insert into PrivateNoticeTable values(?,?,?);";
					st1 = con.prepareStatement(sql);
					st1.setDate(2, date);
					st1.setString(1, project);
					st1.setString(3, "No guide has been allocated to your project yet. Refill your guide preferences.");
					st1.executeUpdate();
				}

				st1 = con.prepareStatement(sql);
				st1.executeUpdate();
				st1.close();
				stmt.close();
				st1.close();
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 


		String greetings = project;

		response.setContentType("text/plain");
		response.getWriter().write(greetings);
	}

}
