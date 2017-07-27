package com.dosurely.onecryptor.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dosurely.onecryptor.dao.UserDao;
import com.dosurely.onecryptor.dao.UserDaoImpl;
import com.dosurely.onecryptor.entity.User;

@Service
public class HelloWorldService {
	private UserDaoImpl userDao;

	public UserDaoImpl getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDaoImpl userDao) {
		this.userDao = userDao;
	}

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
			ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			UserDao userDao = (UserDao) context.getBean("userDao");
			User user = userDao.findByName(name);
			String password = user.getPassword();
			
			return "Hello " + name + ", your password is: " + password;
		}
		
	}

}