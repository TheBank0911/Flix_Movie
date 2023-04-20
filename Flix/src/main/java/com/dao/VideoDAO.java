package com.dao;


import java.util.List;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.entity.Video;
import com.untils.JpaUtils;

public class VideoDAO {
	private EntityManager em;

	public VideoDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	public Video maxId() throws Exception {
		try {
			String jpql = "SELECT o FROM Video o WHERE o.id=(SELECT MAX(o.id) FROM Video o)";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			return query.getSingleResult();
		} catch (Exception e) {
			throw e;
		}
	}
	public Video update(Video entity) {
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
	public Video create(Video entity) {
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
	public Video remove(int id) {
		try {
			Video entity = this.FindIdVideo(id);
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		}catch (Exception e) {
			this.em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	public List<Video> findVideolist(int id) throws Exception {
		try {
			String jpql = "Select o from Video o where o.id<>:id ";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}

	}
	public List<Video> findVideoAll() throws Exception {
		try {
			String jpql = "Select o from Video o ";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}

	}
	
	

	public List<Video> findUserId(String ID) throws Exception {
		try {
			String jpql = "Select o.video from Favorite o where o.user.id =:username";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			query.setParameter("username", ID);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}

	}

	public Video FindIdVideo(int id) {
		return this.em.find(Video.class, id);
	}

	public List<Video> findKeyword(String keyword) throws Exception {
		try {
			String jpql = "SELECT DISTINCT o.video FROM Favorite o " + " WHERE o.video.title LIKE :keyword";
			TypedQuery<Video> query = this.em.createQuery(jpql, Video.class);
			query.setParameter("keyword", keyword);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}
	}

	
}
