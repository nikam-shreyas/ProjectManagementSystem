
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControlServlet
 */
@WebServlet("/ControlServlet")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
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
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con 
					.prepareStatement("update DeadlinesTable set deadline=?,buttonstate=? where name='TeamInfo'");
			st.setString(1, request.getParameter("d1"));
			st.setString(2, request.getParameter("switch1"));
			st.executeUpdate();
			
			st = con.prepareStatement("update DeadlinesTable set deadline=?,buttonstate=? where name='Synopsis'");
			st.setString(1, request.getParameter("d2"));
			st.setString(2, request.getParameter("switch2"));
			st.executeUpdate();
			st = con 
					.prepareStatement("update DeadlinesTable set deadline=?,buttonstate=? where name='Guide'");
			st.setString(1, request.getParameter("d3"));
			st.setString(2, request.getParameter("switch3"));
			st.executeUpdate();
			st = con 
					.prepareStatement("update DeadlinesTable set deadline=?,buttonstate=? where name='Report'");
			st.setString(1, request.getParameter("d4"));
			st.setString(2, request.getParameter("switch4"));
			st.executeUpdate();
			
			
			java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
			st = con 
					.prepareStatement("insert into PublicNoticeTable values(?,'Submission deadlines changed. Please check updated deadlines.', null, null)");
			st.setDate(1, (java.sql.Date) date);
			st.executeUpdate();
			System.out.println(date);
			
			con.close();
			st.close();
			RequestDispatcher rd = request.getRequestDispatcher("ControlPage.html");
			PrintWriter pw = response.getWriter();
			pw.write("<script>alert('Settings changed!');</script>");
			rd.include(request, response);
			

		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

}
