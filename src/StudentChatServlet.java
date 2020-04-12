
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentChatServlet
 */
@WebServlet("/StudentChatServlet")
public class StudentChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentChatServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice = request.getParameter("choice");
		Cookie cookie[] = request.getCookies();
		String project = cookie[0].getValue();
		System.out.println("Student side invoked");
		if(choice.compareTo("load") == 0)
		{
			response.setContentType("text/plain;charset=UTF-8"); 
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				Statement stmt = con.createStatement();
				String sql;
				sql = "SELECT * FROM ChatsTable where id = '"+project+"'";
				ResultSet rs = stmt.executeQuery(sql);

				// List to hold Student objects 
				ArrayList<String> date = new ArrayList<String>(); 
				ArrayList<String> time = new ArrayList<String>(); 
				ArrayList<String> msg = new ArrayList<String>(); 

				while(rs.next())
				{
					date.add( rs.getString("msg_date")); 
					time.add( rs.getString("msg_time")); 
					msg.add( rs.getString("msg")); 
				}

				stmt.close();
				con.close();

				// Setting the attribute of the request object 
				// which will be later fetched by a JSP page 
				request.setAttribute("date", date); 
				request.setAttribute("time", time); 
				request.setAttribute("msg", msg); 
				request.setAttribute("project", project);

				// Creating a RequestDispatcher object to dispatch 
				// the request the request to another resource 
				RequestDispatcher rd =  
						request.getRequestDispatcher("StudentProjChat.jsp"); 

				// The request will be forwarded to the resource  
				// specified, here the resource is a JSP named, 
				// "stdlist.jsp" 
				rd.forward(request, response); 


			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		else
		{
			String msg = request.getParameter("text_to_send");
			String res = "";

			try {
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement stmt = con.prepareStatement("insert into ChatsTable values(?,?,?,?)");
				java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
				java.sql.Time time=new java.sql.Time(new java.util.Date().getTime());
				System.out.println("student serv: "+date+"  "+time);
				stmt.setString(1, project);
				stmt.setDate(2, date);
				stmt.setTime(3, time);
				stmt.setString(4, "Project Team> "+msg);
				stmt.executeUpdate();
				stmt.close();
				con.close();

				res += "<tr><td style='width: 100px;'>"+date+"</td><td  style='width: 100px;'>"+time+"</td><td>Project Team> "+msg+"</td></tr>";

				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(res);

			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
