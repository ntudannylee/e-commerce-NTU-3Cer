package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import DB.DB;

/*this model feature includes :
1.get user's info from other application and set that to User.java. 
2.automatically generate random number for other application to use. 
*/

public class Account {
//---------------------------------------------------------------------------------------------------
	//for the test...
	public static void main(String args[]) {    //Load customer's info

		try{
			String cname = "apple";
			int c_id = 0;
			Connection con = DB.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("SELECT customer_id FROM `e-commerce`.customer where name ='"+cname+"'");
			
			while(rs.next()){
				c_id = rs.getInt(1);  
				//rs.close();
				if(c_id!=0) {

					PreparedStatement ps = con.prepareStatement("insert into `e-commerce`.customer_order values(?,NOW(),?,?)");
					ps.setInt(1, c_id);
					ps.setString(2, "delivery");
					ps.setInt(3, 123);
					int i = ps.executeUpdate();
						if(i > 0) {
							System.out.println("work");
						} else {System.out.println("bad");}
				} 
			}
			
			
		}
			catch(Exception e){
				e.printStackTrace();
			}
		
	}

//--------------------------------------------------------------------------------------------------------
	public String randomNum(){
		
	boolean repeated;
	int m,n;
	int[] ans = new int[8];
	ans[0] = (int)(9.0*Math.random())+1; //First number's range is from 0.0 to 8.9999,therefore we have to add "1" to translate it's range into 1 - 9.
	for(m=1;m<8;m++) {	
		do {
			repeated = false;
			ans[m] = (int)(10.0*Math.random()); 	
			for(n=0;n<m;n++) {
				if(ans[n] == ans[m]) {
					repeated = true;
					break;
				}
			}
		}while(repeated);
	}
	String randomnum = "";
	for(int i=0;i<8;i++) {
		randomnum+=ans[i];
	}
	return randomnum;
	}
	
	
	
		
}

