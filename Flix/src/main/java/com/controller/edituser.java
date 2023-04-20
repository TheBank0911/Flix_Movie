package com.controller;

import java.io.IOException;
import java.util.List;

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
@WebServlet({ "/edituser", "/Flix_Movie" ,"/delete"})
public class edituser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private User user;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public edituser() {
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
		if (uri.contains("edituser")) {
			this.doEdit(request, response);
		}else if(uri.contains("delete")) {
			this.deleteUser(request, response);
		}
		else if (uri.contains("Flix_Movie")) {
			String id = request.getParameter("id");
			this.user = this.userDAO.findById(id);
			request.setAttribute("User", this.userDAO.findById(id));
		}
		List<User> listusers = this.userDAO.findAll();
		request.setAttribute("listusers", listusers);
		request.setAttribute("action", "qlnguoidung");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usernameed = req.getParameter("id");
		String passworded = req.getParameter("password");
		String fullnameed = req.getParameter("fullname");
		String emailed = req.getParameter("email");

		String method = req.getMethod();
		if ("".equals(usernameed) || "".equals(passworded) || "".equals(fullnameed) || "".equals(emailed)) {
			req.setAttribute("messageed", "Vui lòng nhập đầy đủ thông tin!");
		} else {
			try {
				User entity = new User();
				BeanUtils.populate(entity, req.getParameterMap());
				this.userDAO.update(entity);
				req.setAttribute("messageed", "Cập nhật tài khoản thành công!");
			} catch (Exception e) {
				System.out.println(e);
				req.setAttribute("messageed", "Lỗi cập nhật tài khoản!");
			}
		}

	}
	private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		try {
			UserDAO dao = new UserDAO();
			dao.remove(id);
			req.setAttribute("messageed","Xóa thành công!");
		}catch(Exception e) {
			req.setAttribute("messageed","Xóa thất bại!");
		}
	}
}
