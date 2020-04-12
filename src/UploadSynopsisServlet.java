
import DBPackage.DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadSynopsisServlet
 */
@WebServlet("/UploadSynopsisServlet")
public class UploadSynopsisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadSynopsisServlet() {
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
		String field[] = new String[4];
		for(int i=0;i<4;i++) {
			field[i] = new String();
			String s="field"+(i+1);
			field[i]=request.getParameter(s);
		}
		String resh[] = new String[10];
		for(int i=0;i<10;i++) {
			String s = "resh"+(i+1);
			resh[i] = request.getParameter(s);
		}
		String ress[] = new String[10];
		for(int i=0;i<10;i++) {
			String s = "ress"+(i+1);
			ress[i] = request.getParameter(s);
		}
		String ref[] = new String[20];
		for(int i=0;i<20;i++) {
			String s = "ref"+(i+1);
			ref[i] = request.getParameter(s);
		}
		Cookie []cookie = request.getCookies();
		String userName = cookie[0].getValue();
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con 
					.prepareStatement("insert into SynopsisTable values(?,?,?,?,?,?)");
			st.setString(1, userName);
			for(int i=0;i<4;i++) {
				st.setString((i+2), field[i]);
			}
			st.setString(6, "P");
			st.executeUpdate();
			st = con 
					.prepareStatement("insert into HardwareReq values(?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, userName);
			for(int i=0;i<10;i++) {
				st.setString((i+2), resh[i]);
			}

			st.executeUpdate(); 

			st = con 
					.prepareStatement("insert into SoftwareReq values(?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, userName);
			for(int i=0;i<10;i++) {
				st.setString((i+2), ress[i]);
			}

			st.executeUpdate(); 

			st = con 
					.prepareStatement("insert into ReferencesTable values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, userName);
			for(int i=0;i<20;i++) {
				st.setString((i+2), ref[i]);
			}

			st.executeUpdate(); 


			st.close(); 
			con.close(); 
			request.getRequestDispatcher("UpdatedSynopsis.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		} 

	}

}
