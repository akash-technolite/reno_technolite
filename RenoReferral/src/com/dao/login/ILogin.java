package com.dao.login;

import com.tlite.pojo.Contractor;
import com.tlite.pojo.Login;

public interface ILogin {

	public String ValidateUser(Login user);
	public String ValidateContractor(Contractor contractor);
	
	
}
