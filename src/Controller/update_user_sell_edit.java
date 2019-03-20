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


@WebServlet("/update_user_sell_edit")
@MultipartConfig(	
		fileSizeThreshold=1024*1024*1,  //1mb    if file size above 1mb it will be stored in disk, otherwise it will be stored in memory.
		maxFileSize=1024*1024*10,  		//10mb
		maxRequestSize=1024*1024*15 	//15mb
		)
public class update_user_sell_edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected static void update_sell_edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String jspPageToForward = null;
		int result = 0;
		
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String p_title = request.getParameter("p_title");
		String p_about = request.getParameter("p_about");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		int p_quantity = Integer.parseInt(request.getParameter("p_quantity"));
		String p_category =  request.getParameter("p_category");
		Part part = request.getPart("image");
		
		try {
				Connection con = DB.getConnection();
				PreparedStatement ps = (PreparedStatement) con.prepareStatement
						("Update product Set product_title=?,description=?,image=?,price=?,product_quantity=?,category=? Where product_id="+p_id);
				InputStream is = part.getInputStream();
				ps.setString(1, p_title);
				ps.setString(2, p_about);
				ps.setBlob(3, is);
				ps.setInt(4, p_price);
				ps.setInt(5, p_quantity);
				ps.setString(6, p_category);
				result = ps.executeUpdate();
				if(result > 0) {
					jspPageToForward = "user_sell_info.jsp";
				} else { response.sendRedirect("sell.jsp?message=Some+Error+Occurred");}
		} catch(Exception e){e.printStackTrace();}
		
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
	dispatcher.forward(request, response);	

	}
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		update_sell_edit(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		update_sell_edit(request, response);
	}

}
