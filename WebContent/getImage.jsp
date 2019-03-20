<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DB.DB"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

				<% 	
					String productid = request.getParameter("id");   //get value from <img src....>
				
					try{
						Connection con =  DB.getConnection();
						PreparedStatement ps = con.prepareStatement("select * from product where product_id=?"); 
						ps.setString(1, productid);
						ResultSet rs = ps.executeQuery();
						 if(rs.next()){
							Blob blob = rs.getBlob("image");
							byte ByteArray[] = blob.getBytes(1,(int)blob.length());
							response.setContentType("image/gif");
							OutputStream os = response.getOutputStream(); 
							os.write(ByteArray);
							os.flush();  // 強調將緩衝區中的數據發送出去，不必等到緩衝區滿。
							os.close();
						 } else {
					            System.out.println("No image found with this id.");
					     }
					}catch(Exception e){
							e.printStackTrace();
					}
					
				%>
				