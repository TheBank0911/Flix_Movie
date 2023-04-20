package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.dao.FavoriteDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.User;

/**
 * Servlet implementation class edit_profile
 */
@WebServlet("/edit_profile")
public class edit_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private User user;

    public edit_profile() {
        super();
    	this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.user = new User();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("edit_profile")) {
			this.doEdit(request, response);
		}
		request.setAttribute("action", "thongtin");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}
	private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usernameuser = req.getParameter("username");
		String passworduser = req.getParameter("password");
		String fullnameuser = req.getParameter("fullname");
		String emailuser = req.getParameter("email");
		String method = req.getMethod();
		if ("".equals(usernameuser) || "".equals(passworduser) || "".equals(fullnameuser) || "".equals(emailuser)) {
			req.setAttribute("messagecn", "Vui lòng nhập đầy đủ thông tin!");
		} else {
			User user = (User) req.getSession().getAttribute("user");
			if(method.equalsIgnoreCase("POST")) {
				try {
					
					BeanUtils.populate(user, req.getParameterMap());
					UserDAO dao = new UserDAO();
					dao.update(user);
					req.setAttribute("messagecn", "Cập nhật tài khoản thành công!");
				} catch (Exception e) {
					System.out.println(e);
					req.setAttribute("messagecn", "Lỗi cập nhật tài khoản!");
				}
			}
			
		}

	}
}
