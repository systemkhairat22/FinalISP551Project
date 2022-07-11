package admin.dao;

import java.sql.*;
import java.util.*;
import user.model.*;
import connectionDB.*;
public class DaoAdmin {
	static Connection con = null;
	static PreparedStatement ps = null;
	static java.sql.Statement st = null;
	static ResultSet rs = null;
	private int adminid, add_age, supervisorid;
	private String admin_icnum, add_name, add_email, add_phonenum, add_password;

    //GET ADMIN BY ID
    public static Admin getAdminById(int adminid) {
    	Admin a = new Admin();
    	try{
    		//call getConnection method
    		con = ConnectionManager.getConnection();
    		
    		//create statement
    		ps=con.prepareStatement ("SELECT * FROM admin WHERE adminid =?");
    		ps.setInt(1, adminid);
    	
    		
    		//execute query
			rs = ps.executeQuery();
			if(rs.next()) {
				a.setAdminid(rs.getInt("adminid"));
				a.setAdmin_icnum(rs.getString("admin_icnum"));
				a.setAdd_name(rs.getString("add_name"));
				a.setAdd_age(rs.getInt("add_age"));
				a.setAdd_email(rs.getString("add_email"));
				a.setAdd_password(rs.getString("add_password"));
				a.setAdd_phonenum(rs.getString("add_phonenum"));
				a.setSupervisorid(rs.getInt("supervisorid"));
				
			}
			
			//close connection
			con.close();
			
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return a;
    }
    
    //CREATE NEW admin
    public void addAdmin(Admin admin) {
    	add_name = admin.getAdd_name();
    	admin_icnum = admin.getAdmin_icnum();
    	add_age = admin.getAdd_age();
    	add_email = admin.getAdd_email();
    	add_phonenum = admin.getAdd_phonenum();
    	add_password = admin.getAdd_password();
    	supervisorid = admin.getSupervisorid();
        
    	if (supervisorid == 0) {  // 0 bermaksud tiada supervisor, auto assign 0 if no supervisor id in create admin JSP
    		try
        	{
        	//call getConnection() method
        		con = ConnectionManager.getConnection();
        		
        	//create statement
        		ps = con.prepareStatement("INSERT INTO admin(add_name,admin_icnum,add_age,add_email,add_phonenum,add_password) values(?,?,?,?,?,?)");
        		ps.setString(1, add_name);
        		ps.setString(2,admin_icnum);
        		ps.setInt(3, add_age);
        		ps.setString(4, add_email);
        		ps.setString(5, add_phonenum);
        		ps.setString(6, add_password);
        		
        		
        		
        		//execute query
        		ps.executeUpdate();
    			System.out.println("Successfully inserted without supervisor");
                
    			//close connection
                con.close();
        	}
        	catch (Exception e) {
                e.printStackTrace();
            }
        	
    		
    	} // end of if ( utk supervisorid dpt baca null)
    	
    	else {
    		
    	try
    	{
    	//call getConnection() method
    		con = ConnectionManager.getConnection();
    		
    	//create statement
    		ps = con.prepareStatement("INSERT INTO admin(add_name,admin_icnum,add_age,add_email,add_phonenum,add_password,supervisorid) values(?,?,?,?,?,?,?)");
    		ps.setString(1, add_name);
    		ps.setString(2,admin_icnum);
    		ps.setInt(3, add_age);
    		ps.setString(4, add_email);
    		ps.setString(5, add_phonenum);
    		ps.setString(6, add_password);
    		ps.setInt(7, supervisorid);
    		
    		
    		//execute query
    		ps.executeUpdate();
			System.out.println("Successfully inserted");
            
			//close connection
            con.close();
    	}
    	catch (Exception e) {
            e.printStackTrace();
        }
    	
    	} // end of else
    }

    //GET ALL ADMIN
  	public static List<Admin> getAllAdmin() {
  		List<Admin> admin= new ArrayList<Admin>();
  		
  		try {
  			//call getConnection() method
  			con = ConnectionManager.getConnection();
  			
  			//create statement
  			st = con.createStatement();
  			String sql = "SELECT * FROM  admin ORDER BY adminid";
  			
  			//execute query
  			rs = st.executeQuery(sql);
  			
  			while(rs.next()) {		//process result
  				Admin a = new Admin();
  				a.setAdminid(rs.getInt("adminid"));
				a.setAdmin_icnum(rs.getString("admin_icnum"));
				a.setAdd_name(rs.getString("add_name"));
				a.setAdd_age(rs.getInt("add_age"));
			    a.setAdd_phonenum(rs.getString("add_phonenum"));
				a.setAdd_email(rs.getString("add_email"));
				a.setAdd_password(rs.getString("add_password"));
				a.setSupervisorid(rs.getInt("supervisorid"));
					
  				admin.add(a);
  			}
  			
  			//close connection
  			con.close();
  			
  			
  		} catch(Exception e) {
  			e.printStackTrace();
  		}
  		
  		return admin;
  	}



	//DELETE ADMIN
	public void deleteadmin (int id) {
		try {
			//call getConnection method
			con = ConnectionManager.getConnection();
			
			//create statement
			ps = con.prepareStatement("DELETE FROM admin WHERE adminid=?");
			ps.setInt(1, id);
			
			//execute query
			ps.executeUpdate();
			
			//close connection
			con.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
  	//UPDATE ADMIN
  	public void updateadmin (Admin admin) {
  		adminid = admin.getAdminid();
  		add_name = admin.getAdd_name();
    	admin_icnum = admin.getAdmin_icnum();
    	add_age = admin.getAdd_age();
    	add_email = admin.getAdd_email();
        add_phonenum = admin.getAdd_phonenum();
    	add_password = admin.getAdd_password();
    	supervisorid = admin.getSupervisorid();
    	
    	 try {
    		 //call getConnection method
    		 con = ConnectionManager.getConnection ();
    		 
    		 //create statement
    		ps = con.prepareStatement("UPDATE admin SET add_name=?, admin_icnum=?, add_age=?, add_email=?, add_phonenum=?, add_password=?,supervisorid=? WHERE adminid=?");
    		ps.setString(1, add_name);
     		ps.setString(2,admin_icnum);
     		ps.setInt(3, add_age);
     		ps.setString(4, add_email);
     		ps.setString(5, add_phonenum);
     		ps.setString(6, add_password);
     		ps.setInt(7, supervisorid );
     		ps.setInt(8, adminid);
    		 
     		//execute query
     		ps.executeUpdate();
     		
     		System.out.println("Successfully updated");
     		
     		//close connection
     		con.close();
     		
    	 }catch (Exception e) {
    		 e.printStackTrace();
    	 }
  	}
}
