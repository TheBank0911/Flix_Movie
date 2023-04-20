package com.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Favorite;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;
import com.untils.JpaUtils;
public class FavoriteDAO {
	private EntityManager em;

	public FavoriteDAO() {
		this.em = JpaUtils.getEntityManager();
	}

	public List<Video> showFavorite(boolean favorite) throws Exception {
		String jpql = "SELECT o FROM Video o WHERE o.favorites IS EMPTY";
		if (favorite) {
			jpql = "SELECT o FROM Video o WHERE o.favorites IS NOT EMPTY";
		}
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}
	public Favorite create(Favorite entity) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			// TODO: handle exception
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	public List<Favorite> findIdUser(String id) throws Exception {
		try {
			String jpql = "SELECT o FROM Favorite o WHERE o.user.id LIKE :id";
			TypedQuery<Favorite> query = this.em.createQuery(jpql, Favorite.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}
	public Favorite findById(int id) {
		Favorite entity = this.em.find(Favorite.class, id);
		return entity;
	}
	public Favorite remove(int id) {
		try {
			Favorite entity =this.findById(id);
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		}catch (Exception e) {
			this.em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
}
