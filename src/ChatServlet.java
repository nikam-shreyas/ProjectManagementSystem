

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBPackage.DatabaseConnection;
/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choice = request.getParameter("choice");
			String msg = request.getParameter("texttosend");
			String project = request.getParameter("project");
			String res = "";
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement stmt = con.prepareStatement("insert into ChatsTable values(?,?,?,?)");
				java.sql.Date date=new java.sql.Date(new java.util.Date().getTime());
				java.sql.Time time=new java.sql.Time(new java.util.Date().getTime());
				System.out.println(date+"  "+time);
				stmt.setString(1, project);
				stmt.setDate(2, date);
				stmt.setTime(3, time);
				stmt.setString(4, "Guide: "+msg);
				stmt.executeUpdate();
				stmt.close();
				con.close();
				
				res += "<tr><td>"+date+"</td><td>"+time+"</td><td>Guide: "+msg+"</td></tr>";

				response.setContentType("text/html");
			    response.setCharacterEncoding("UTF-8");
				response.getWriter().write(res);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
