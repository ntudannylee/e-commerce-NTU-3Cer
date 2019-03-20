package Controller;

/*
 這個後臺主要負責接收從商品頁面進來的參數後做出相對應的回應；
 參數為 'add'者，則會將新的購物車流水號、商品id、購買者姓名 輸入至資料庫中(存儲在cart table內)。
 參數為 'remove'者，會依據商品id來刪除購物車上面的資料(從cart table 中刪除特定 row)。
  參數為 'order'者，會創造出一個購買流水編號、購買時間點、運送狀態"delivery、購買者id存入資料庫中"(存儲在customer_order)。
 */
 
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import DB.DB;
import Model.Account;
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected static void carto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String jspPageToForward = null;
		
		String action = request.getParameter("action");	  
		int p_id = Integer.parseInt(request.getParameter("id"));
		Account account = new Account();
		int cartid = Integer.parseInt(account.randomNum());
		HttpSession session = request.getSession();
		String cname = (String)session.getAttribute("name");
		int result = 0;
		
		String f_sum = request.getParameter("f_sum");
		
		if(p_id != 0 && action.equals("add")) {

			boolean flag = false; 
			/* 先判斷這個商品id是否已存在於cart table內。若存在，flag 為 true。 若不存在，則新增一個PreparedStatement 來 insert 資料。*/
			try {
				Connection con = DB.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st
						.executeQuery("SELECT c_p_id FROM `e-commerce`.cart");
				
				while(rs.next()){
					
					if(rs.getInt(1) == (p_id)) {
						flag = true;
					}
				}
				if(flag == false) {
				PreparedStatement ps =  con.prepareStatement("insert into cart values(?,?,?)");
					ps.setInt(1, cartid);
					ps.setInt(2, p_id);
					ps.setString(3, cname);
					result = ps.executeUpdate();
					if(result > 0) {
						jspPageToForward = "single.jsp";
						con.close();
					} 
				}
				else {
					jspPageToForward = "single.jsp";
				}
				
			} 
			catch(Exception e){
				e.printStackTrace();
			}
		}
//--------------------------------------	
		if(p_id != 0 && action.equals("remove")) {
			try{
			Connection con = DB.getConnection();
			PreparedStatement ps =  con.prepareStatement("delete FROM `e-commerce`.cart where c_p_id=" + p_id);
			result = ps.executeUpdate();
				if(result > 0) {
					jspPageToForward = "checkout.jsp";
					con.close();
				} 
			} 
			catch(Exception e){
			e.printStackTrace();
			}
		}
//--------------------------------------
		if(p_id == 0 || action.equals("order")) {
			
			int c_id = 0;
			try{
				Connection con = DB.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st
						.executeQuery("SELECT customer_id FROM `e-commerce`.customer where name ='"+cname+"'");
				
				while(rs.next()){
					c_id = rs.getInt(1);  
					rs.close();
					if(c_id!=0) {
						
						PreparedStatement pt = con.prepareStatement("insert into `e-commerce`.customer_order values(?,NOW(),?,?)");
						pt.setInt(1, cartid);
						pt.setString(2, "delivery");
						pt.setInt(3, c_id);
						int i = pt.executeUpdate();
							if(i > 0) {
								jspPageToForward = "payment.jsp";
								session.setAttribute("f_sum",f_sum);
								session.setAttribute("c_id", c_id);
								session.setAttribute("order_id", cartid);
								con.close();
							} 
					} 
				}
				
				
			}
			catch(Exception e){
			e.printStackTrace();
			}
		}
//------------------------------------------		
				
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
		dispatcher.forward(request, response);	
	}
	

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		carto(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		carto(request, response);
	}

}
