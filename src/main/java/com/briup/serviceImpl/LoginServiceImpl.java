package com.briup.serviceImpl; 

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.briup.bean.Person;
import com.briup.dao.Dao;
import com.briup.service.UserLoginService;



/** 
 * @author yyj 
 * @version CreateTime：2019年3月19日 下午2:08:58 
 * 
 */
@Service("userLoginService")
public class LoginServiceImpl implements UserLoginService{
	@Resource
	private Dao dao;

	@Override
	public Person searchPerson(String userName) {
		
		return dao.searchPerson(userName);
	}

}
 