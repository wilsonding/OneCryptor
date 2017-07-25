package com.dosurely.onecryptor.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dosurely.onecryptor.dao.UserDao;
import com.dosurely.onecryptor.entity.User;

@Service
public class HelloWorldService {
	@Autowired
	UserDao userDao;

	private static final Logger logger = LoggerFactory.getLogger(HelloWorldService.class);

	public String getDesc() {

		logger.debug("getDesc() is executed!");

		return "Gradle + Spring MVC Hello World Example";

	}

	public String getTitle(String name) {

		logger.debug("getTitle() is executed! $name : {}", name);

		if(StringUtils.isEmpty(name)){
			return "Hello World";
		}else{
			User user = userDao.findByName(name);
			return "Hello " + name + ", your password is: " + user.getPassword();
		}
		
	}

}