package DB;

import java.sql.*;

public class DB {

	public static Connection getConnection() {
		Connection con = null;
		try {
				con = DriverManager.getConnection("jdbc:mysql://DESKTOP-4BNE4GB/e-commerce","Danny", "851021");
				/*在這邊可使用當地主機名稱 DESKTOP-4BNE4GB or ip 140.112.249.147
				 若使用後者，可遠端做使用
				 */
		}	catch(Exception e){
			System.out.print(e);
			e.printStackTrace();
		}
		return con;
	}
}	
	
