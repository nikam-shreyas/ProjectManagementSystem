
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GuidesServlet
 */
@WebServlet("/GuidesServlet")
public class GuidesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuidesServlet() {
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
		String guidesList ="";
		String val=request.getParameter("pg2");
		if(val.compareTo("false")==0) {
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
	         String sql;
	         sql = "select * from GuidesTable where grpcount < 4";
	         ResultSet rs = stmt.executeQuery(sql);
	         int count=0;
	         while(rs.next()){
	         count++;
	         guidesList += rs.getString("id")+"="+rs.getString("name")+"|";
	         }
	         
	         rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	
		Cookie cookie = new Cookie("guidesList",guidesList);
		response.addCookie(cookie);
		
		RequestDispatcher rd = request.getRequestDispatcher("UploadGuidePref.html");
		rd.forward(request,response);
		}
		else {
			request.getRequestDispatcher("UpdatedGuidePref.jsp").forward(request, response);
		}
	}

}
