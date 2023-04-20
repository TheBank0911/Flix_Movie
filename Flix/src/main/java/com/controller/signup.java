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
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private User user;

	public signup() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.user = new User();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("signup")) {
			this.SignUp(request, response);
		}
		request.setAttribute("action", "dangky");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	private void SignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usernamesu = req.getParameter("username");
		String passwordsu = req.getParameter("password");
		String fullnamesu = req.getParameter("fullname");
		String emailsu = req.getParameter("email");
		String method = req.getMethod();
		if ("".equals(usernamesu) || "".equals(passwordsu) || "".equals(fullnamesu) || "".equals(emailsu)) {
			req.setAttribute("messagesu", "Vui lòng nhập đầy đủ thông tin!");
		} else {
			if (method.equalsIgnoreCase("POST")) {
				try {
					User entity = new User();
					BeanUtils.populate(entity, req.getParameterMap());
					UserDAO dao = new UserDAO();
					dao.create(entity);
					req.setAttribute("messagesu", "Đăng ký thành công!");
				} catch (Exception e) {
					System.out.println(e);
					req.setAttribute("messagesu", "Lỗi đăng ký!");
				}
			}
		}
	}
}
