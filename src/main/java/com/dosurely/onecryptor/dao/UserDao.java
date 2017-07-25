package com.dosurely.onecryptor.dao;

import com.dosurely.onecryptor.entity.User;

public interface UserDao {
	public User findByName(String name);

}
