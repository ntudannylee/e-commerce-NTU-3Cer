package Controller;


import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import DB.DB;

@WebServlet("/update_User_info")

public class update_User_info extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected static void getuserinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String jspPageToForward = null;
		int result = 0;
		String submit = request.getParameter("submit");
		HttpSession session = request.getSession();
		
	if(submit.equals("更新資料")) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean subscn = request.getParameter("subscription") != null;
		int subscription = 0;
		
		if(subscn == true) {
			subscription = 1;
		} else {subscription = 0;}
		
		if(true) {
			try {
				Connection con = DB.getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement
						("Update customer Set email=?,name=?,phone=?,password=?,subscription=? Where customer_id='"+id+"'");
				ps.setString(1, email);
				ps.setString(2, name);
				ps.setString(3, phone);
				ps.setString(4, password);
				ps.setInt(5, subscription);
				result = ps.executeUpdate();
				if(result > 0) {
					jspPageToForward = "userinfo.jsp";
					session.setAttribute("name", name);
				} else { response.sendRedirect("sell.jsp?message=Some+Error+Occurred");}
			}
				
			catch(Exception e){e.printStackTrace();}
		} 
		
	}
	
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
	}
		
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		getuserinfo(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		getuserinfo(request, response);
	}

}
