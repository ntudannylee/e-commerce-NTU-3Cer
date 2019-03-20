package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DB;
import Model.Account;


@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static void RegisterRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String jspPageToForward = null;
		String page = request.getParameter("sub");
		String info = null;
		boolean flag = false;
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		boolean subscn = request.getParameter("subscription") != null;
		String subscription = null;
		
		Account random = new Account();
		String randomnum = random.randomNum();

			if("馬上註冊！".equals(page)) {
				jspPageToForward = "index.jsp";
			
				String ipassword = request.getParameter("password");
				String ipassword2 = request.getParameter("password2");

				//---check input passwords if identical.----
				if(!ipassword.equals(ipassword2)) {
					info = "unsame";
					request.setAttribute("info", info);
					jspPageToForward = "register.jsp";
				} 
				//---make boolean type to tinyint(1). true = 1, false = 0.
				if(subscn == true) {
					subscription = "1";
				} else {subscription = "0";}
				
				//--*check in database if input name have the same name and if not then do register function.
				if(name!=null && ipassword.equals(ipassword2)) {
					try {
						Connection con = DB.getConnection();
						Statement statement = con.createStatement();
						ResultSet resultset = statement.executeQuery("SELECT * FROM `e-commerce`.customer");
						
						while(resultset.next()) {
								String dname = resultset.getString("name");
								if(dname.equals(name)) {
									flag = true;
								}	
						}
						if(flag == true) {
							info = "samename";
							jspPageToForward="register.jsp";
							request.setAttribute("info", info);
						} else {
							statement.executeUpdate("INSERT INTO customer(customer_id, email, name, phone, password, subscription)"
										+"VALUES('"+randomnum+"','"+email+"','"+name+"','"+phone+"','"+ipassword+"','"+subscription+"')");
							info = "registered!";
							jspPageToForward="register.jsp";
							request.setAttribute("info", info);
						}	
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPageToForward);
			dispatcher.forward(request, response);	
}

	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RegisterRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RegisterRequest(request, response);
	}
}
