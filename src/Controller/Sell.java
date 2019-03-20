package Controller;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.mysql.jdbc.PreparedStatement;

import DB.DB;
import Model.Account;

@WebServlet("/Sell")
@MultipartConfig(	
		fileSizeThreshold=1024*1024*1,  //1mb    if file size above 1mb it will be stored in disk, otherwise it will be stored in memory.
		maxFileSize=1024*1024*10,  		//10mb
		maxRequestSize=1024*1024*15 	//15mb
		)

// I save photo by saving as blob. I know path way is better but I don't have any time working on it. Maybe some other day.

public class Sell extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected static void SellRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String jspPageToForward = null;
		String submit = request.getParameter("submit");
		int result = 0;
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("name");
		
		if("開賣！".equals(submit)) {
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String about = request.getParameter("about");
		String category = request.getParameter("category");
		Part part = request.getPart("image");
		Account account = new Account();
		String productid = account.randomNum();
		
		if(part!=null && username != null) {
			
			try {
				
				Connection con = DB.getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into product values(?,?,?,?,NOW(),?,?,?,?)");
				InputStream is = part.getInputStream();
				ps.setString(1, productid);
				ps.setString(2, pname);
				ps.setString(3, about);
				ps.setBlob(4, is);
				ps.setInt(5, price);
				ps.setInt(6, quantity);
				ps.setString(7, category);
				ps.setString(8, username);
				result = ps.executeUpdate();
				
				if(result > 0) {
					jspPageToForward = "sell.jsp";
					request.setAttribute("id", productid);
				} else {
					response.sendRedirect("sell.jsp?message=Some+Error+Occurred");
				}
		
			}
			catch(Exception e){
				e.printStackTrace();
			}
		} else {
			jspPageToForward = "sell.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
		}
	}
	

	
		
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		SellRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		SellRequest(request, response);
	}

}
