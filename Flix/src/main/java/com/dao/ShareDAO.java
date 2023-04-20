package com.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Share;
import com.entity.Video;
import com.untils.JpaUtils;
public class ShareDAO {
	private EntityManager em;

	public ShareDAO() {
		this.em = JpaUtils.getEntityManager();
	}

	public List<Share> findAll() throws Exception {
		try {
			String jpql = "Select o from Share o ";
			TypedQuery<Share> query = this.em.createQuery(jpql, Share.class);
			return query.getResultList();
		} catch (Exception e) {
			throw e;
		}

	}
	public List<Share> findIdUser(String id) throws Exception {
		try {
			String jpql = "SELECT o FROM Share o WHERE o.user.id LIKE :id";
			TypedQuery<Share> query = this.em.createQuery(jpql, Share.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	public Share create(Share entity) {
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
}