
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadTeamInfoServlet
 */
@WebServlet("/UploadTeamInfoServlet")
public class UploadTeamInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadTeamInfoServlet() {
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
		String field1 = cookie[0].getValue();
		String field3 = request.getParameter("field3");
		String field4 = request.getParameter("field4");
		String field5 = request.getParameter("field5");
		String field6 = request.getParameter("field6");
		String field7 = request.getParameter("field7");
		String field8 = request.getParameter("field8");
		String field9 = request.getParameter("field9");
		String field10 = request.getParameter("field10");
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con 
	                   .prepareStatement("insert into TeamInfoTable values(?,?,?,?,?,?,?,?,?)"); 
			st.setString(1, field1);
			st.setString(2, field3);
			st.setString(3, field4);
			st.setString(4, field5);
			st.setString(5, field6);
			st.setString(6, field7);
			st.setString(7, field8);
			st.setString(8, field9);
			st.setString(9, field10);
			  
            st.executeUpdate(); 
  
            st.close(); 
            con.close(); 
            request.getRequestDispatcher("UpdatedTeamInfo.jsp").forward(request, response);
	         
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

}
