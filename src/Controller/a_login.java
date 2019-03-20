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

import DB.DB;


@WebServlet("/a_login")
public class a_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String jspPageToForward = null;
		String info = null;
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		boolean flag = false;
		try{
			
						Connection con = DB.getConnection();
						Statement statement = con.createStatement();
						ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.admin");
						
						while(resultset.next()) { 
								
								if(name.equals(resultset.getString(1)) && password.equals(resultset.getString(2))) {
										flag = true;
										resultset.close();
								}
						}
		}

		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(flag == true) {
			
			jspPageToForward = "a_userinfo.jsp";
		} 
		if(flag == false){
			info = "invalid";
			request.setAttribute("info", info); 
			jspPageToForward = "a_login.jsp";
		}
	RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
	dispatcher.forward(request, response);	
		
	}

}
