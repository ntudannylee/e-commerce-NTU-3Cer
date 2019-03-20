package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DB;
import Model.Account;
/*
 * 這個後臺接收來自payment.jsp的資訊，並將資訊放在payment table內，完成動作後將使用者的cart清除。
 */

@WebServlet("/payment")
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String jspPageToForward = null;
		String card  = request.getParameter("card");
		String about = request.getParameter("about");
		String type = request.getParameter("type");
		Account account = new Account();
		String a = account.randomNum();
		int serialnumber = Integer.parseInt(a);
		HttpSession session = request.getSession();
		String cid = session.getAttribute("c_id").toString();
		if(cid==null) {cid="0";}
		int c_id = Integer.parseInt(cid); 
		String oid = session.getAttribute("order_id").toString();
		if(oid==null) {oid ="0";}
		int order_id = Integer.parseInt(oid); 
		String f_sum = session.getAttribute("f_sum").toString();
		if(f_sum==null) {f_sum = "0";}
		int f_f_sum = Integer.parseInt(f_sum);
		if(type.equals("7-11")){
			f_f_sum -= 150;
		}
		boolean flag = false;
		if(flag == false){
			
			try{
				Connection con = DB.getConnection();
						
						PreparedStatement ps = con.prepareStatement("insert into `e-commerce`.payment values(?,?,?,?,?,?,?)");
						ps.setInt(1, serialnumber);
						ps.setInt(2, f_f_sum);
						ps.setString(3, type);
						ps.setInt(4,c_id);
						ps.setInt(5,order_id);
						ps.setString(6,about);
						ps.setString(7,card);
						
						int i = ps.executeUpdate();
							if(i > 0) {
								 // delete cart
									String username = session.getAttribute("name").toString();		
									PreparedStatement pt =  con.prepareStatement("delete FROM `e-commerce`.cart where c_c_name ='" + username + "'");
							
											int j = pt.executeUpdate();
												if(j > 0) {
													jspPageToForward = "checkout.jsp";
													flag = true;
													con.close();
												} 	 
									
								}
							
							
				
			}
			catch(Exception e){
			e.printStackTrace();
			}
		}

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
	}

}
