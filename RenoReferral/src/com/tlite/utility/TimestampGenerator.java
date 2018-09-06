package com.tlite.utility;

import java.sql.Timestamp;

public class TimestampGenerator {
	
	public static Timestamp getTimestamp(){
	  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	  
	  return timestamp;
	  
	}  

}
