package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DB;

/**
 * 此controller負責處理使用者登入或登出的行為;帳號核對
 */

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static void LoginRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		String jspPageToForward = null;
		String info = null;
		boolean flag = false;
		String submit = request.getParameter("submit");
		HttpSession session = request.getSession();
		
		
		if("登入".equals(submit)) {
			String iname = request.getParameter("name");
			String ipassword = request.getParameter("password");
			
			if(true) {
				try {
					Connection con = DB.getConnection();
					Statement statement = con.createStatement();
					ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.customer");
					
					while(resultset.next()) { 
							
							if(iname.equals(resultset.getString(3)) && ipassword.equals(resultset.getString(5))) {
									flag = true;
							}
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			if(flag == true) {
				
				session.setAttribute("name", iname);
				jspPageToForward = "index.jsp";
			} 
			if(flag == false){
				info = "invalid";
				request.setAttribute("info", info); 
				jspPageToForward = "login.jsp";
			}
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
	}
}

	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		LoginRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		LoginRequest(request, response);
	}

}
