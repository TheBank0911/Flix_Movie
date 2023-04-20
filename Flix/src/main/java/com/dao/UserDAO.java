package com.dao;


import java.util.List;

import javax.management.RuntimeErrorException;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.entity.User;
import com.untils.JpaUtils;
public class UserDAO {
	private EntityManager em;
public UserDAO() {
	this.em = JpaUtils.getEntityManager();
}
@Override
protected void finalize() throws Throwable{
	em.close();
	super.finalize();
}
public User create(User entity) {
	try {
		this.em.getTransaction().begin();
		this.em.persist(entity);
		this.em.getTransaction().commit();
		return entity;
	}catch (Exception e) {
		this.em.getTransaction().rollback();
		throw new RuntimeException(e);
	}
}
public User update(User entity) {
	try {
		this.em.getTransaction().begin();
		this.em.merge(entity);
		this.em.getTransaction().commit();
		return entity;
	}catch (Exception e) {
		this.em.getTransaction().rollback();
		throw new RuntimeException(e);
	}
}
public User remove(String id) {
	try {
		User entity = this.findById(id);
		this.em.getTransaction().begin();
		this.em.remove(entity);
		this.em.getTransaction().commit();
		return entity;
	}catch (Exception e) {
		this.em.getTransaction().rollback();
		throw new RuntimeException(e);
	}
}
public User findById(String id) {
	User entity = this.em.find(User.class, id);
	return entity;
}
public List<User> findAll(){
	String jpql ="Select o from User o";
	TypedQuery<User> query = this.em.createQuery(jpql,User.class);
	List<User> list = query.getResultList();
	return list;
}

public List<User> findVideoId(String IdVideo)throws Exception{
	try {
		String jpql ="SELECT o.user FROM Favorite o WHERE o.video.id=:vid";
	TypedQuery<User> query = this.em.createQuery(jpql,User.class);
	query.setParameter("vid", IdVideo);
	return query.getResultList();
	}catch (Exception e) {
	throw e;
	}
	
}
public User findByEmail(String email) {
	try {
		String jpql = "SELECT o FROM User o WHERE o.email = :email";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class);
		query.setParameter("email", email);
		List<User> result =  query.getResultList();
		if(result.isEmpty()) {
			return null;
		}
		return result.get(0);
	} catch (Exception e) {
		this.em.getTransaction().rollback();
		throw e;
	}
}
}
