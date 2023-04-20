package com.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.FavoriteDAO;
import com.dao.ShareDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.Share;
import com.entity.User;
import com.entity.Video;

/**
 * Servlet implementation class Report
 */
@WebServlet({"/procuser","/procshare"})
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private ShareDAO shareDAO;
	private User user;
	private Video video;
	private Share share;

    public Report() {
        super();
        this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.shareDAO = new ShareDAO();
		this.user = new User();
		this.video = new Video();
		this.share = new Share();
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if(uri.contains("procuser")) {
			this.Proc_User(request, response);
			try {
				request.setAttribute("videolist",this.videoDAO.findVideoAll());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("active2","active");
		}else if (uri.contains("procshare")) {
			this.Proc_Share(request, response);
			try {
				request.setAttribute("videolist",this.videoDAO.findVideoAll());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("active3","active");
		}
		else {
			this.Proc_Favorite(request, response);
			request.setAttribute("active1","active");
		}
		
		request.setAttribute("action", "thongke");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}
private void Proc_User(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Flix_Movie");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		String titleVD = request.getParameter("titleUser");
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("favoriteByUser");
		query.setParameter("titleVideo", titleVD);
		em.getTransaction().commit();
		List<Object[]> list = query.getResultList();
		request.setAttribute("listProcUser", list);
		em.close();
	}catch (Exception e) {
		System.out.println(e);
	}
}
private void Proc_Share(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Flix_Movie");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		String titleVD = request.getParameter("titlevd");
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("shareByUser");
		query.setParameter("titleVideo", titleVD);
		em.getTransaction().commit();
		List<Object[]> list = query.getResultList();
		request.setAttribute("listProcShare", list);
		em.close();
	}catch (Exception e) {
		System.out.println(e);
	}
}
String first = null; 
private void Proc_Favorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Flix_Movie");
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		StoredProcedureQuery query = em.createStoredProcedureQuery("STATISTICAL");
		em.getTransaction().commit();
		List<Object[]> list = query.getResultList();
		for(Object[] ob : list) {
		first = String.valueOf(ob[1]);
		break;
		}
		request.setAttribute("listProcFavorite", list);
		em.close();
	}catch (Exception e) {
		System.out.println(e);
	}
}
}
