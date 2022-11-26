package net.javaguides.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoginDao {

	public List<Barchart> getBarcharts() throws ClassNotFoundException {
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("---connected------");
		List<Barchart> list = new ArrayList();
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:system/system@localhost:1521:orcl");
        	Statement st = conn.createStatement();) {
        	System.out.println("---Statement------");
            ResultSet rs = st.executeQuery("select * from \"SYSTEM\".\"barchart\" barchart order by TO_DATE( barchart.\"y1\", 'MM/DD/YYYY' ) asc ");
        	System.out.println("---ResultSet------");
            Barchart b= null;
            while (rs.next()) {
            	String id = rs.getString("id");
                String name = rs.getString("name");
                String parent = rs.getString("parent");
                String y1 = rs.getString("y1");
                String y2 = rs.getString("y2");
                
                b= new Barchart();
                b.setId(id);
                b.setName(name);
                b.setParent(parent);
                b.setY1(y1);
                b.setY2(y2);
                List<String> arr = new ArrayList();
                arr.add(y1);
                arr.add(y2);
                b.setY(arr);//y : [ '08/11/2015', '12/31/2021' ],
                
                //System.out.println(b.toString());
                
                list.add(b);
            }
            
            rs.close();

        } catch (SQLException e) {      	
            e.printStackTrace();
        }
		return list;
	}
    
    
}