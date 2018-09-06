package com.tlite.connection;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	 
    public static Connection getConnection(){
        Properties props = new Properties();
        InputStream in = null;
        Connection con = null;
        try {
        	in = DBConnection.class.getClassLoader().getResourceAsStream( "db.properties" );
            //fis = new FileInputStream("");
        	if(in!=null){
            props.load(in);
            // load the Driver Class
            Class.forName(props.getProperty("DB_DRIVER_CLASS"));
 
            // create the connection now
            con = DriverManager.getConnection(props.getProperty("DB_URL"),
                    props.getProperty("DB_USERNAME"),
                    props.getProperty("DB_PASSWORD"));            
        	}else{
        		System.out.println("Properties Not Found");
        	}
        	
        } catch (IOException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch(SQLException se){
        	se.printStackTrace();
        }catch(ClassNotFoundException ce){
        	ce.printStackTrace();
        }
        
        return con;
    }
}
