package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB;

/*
 * 1.收到使用者名字後，刪除該使用者資訊。
 * 2.收到訂單了流水號，刪除該訂單資訊。
 * 3.收到聯絡表單流水號，刪除該聯絡表單資訊。
 * 4.收到產品的id後，刪除該產品資訊。
 */
@WebServlet("/admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void adminn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String jspPageToForward = null;
		String name = request.getParameter("name");
		String pid = request.getParameter("pid");
		String cid = request.getParameter("cid");
		String prid = request.getParameter("prid");
//------------------------------------------------------
		if(name!=null) {
				try{
				Connection con = DB.getConnection();
				PreparedStatement ps =  con.prepareStatement("delete FROM `e-commerce`.customer where name='" + name+"'");
				int result = ps.executeUpdate();
					if(result > 0) {
						jspPageToForward = "a_userinfo.jsp";
						con.close();
					} 
				} 
				catch(Exception e){
				e.printStackTrace();
				}
		}
//------------------------------------------------------
				if(pid!=null) {
					int ppid = Integer.parseInt(pid);
						try{
						Connection con = DB.getConnection();
						PreparedStatement ps =  con.prepareStatement("delete FROM `e-commerce`.customer_order where customer_order_id=" + ppid);
						int result = ps.executeUpdate();
							if(result > 0) {
								jspPageToForward = "a_payment.jsp";
								con.close();
							} 
						} 
						catch(Exception e){
						e.printStackTrace();
						}
				}
//------------------------------------------------------
				if(cid!=null) {
					try{
					Connection con = DB.getConnection();
					PreparedStatement ps =  con.prepareStatement("delete FROM `e-commerce`.contact where contact_id=" + cid);
					int result = ps.executeUpdate();
						if(result > 0) {
							jspPageToForward = "a_contact.jsp";
							con.close();
						} 
					} 
					catch(Exception e){
					e.printStackTrace();
					}
			}
//------------------------------------------------------
				if(prid!=null) {
					int prrid = Integer.parseInt(prid);
						try{
						Connection con = DB.getConnection();
						PreparedStatement ps =  con.prepareStatement("delete FROM `e-commerce`.product where product_id=" + prrid);
						int result = ps.executeUpdate();
							if(result > 0) {
								jspPageToForward = "a_product.jsp";
								con.close();
							} 
						} 
						catch(Exception e){
						e.printStackTrace();
						}
				}
//------------------------------------------------------
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
	}
	
	
	
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		adminn(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		adminn(request, response);
	}

}
