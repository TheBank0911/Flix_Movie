package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/change")
public class change_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private User user;

	public change_pass() {
		super();
		this.userDAO = new UserDAO();
		this.user = new User();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("change")) {
			this.changepass(request, response);
		}
		request.setAttribute("action", "doimatkhau");
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	protected void changepass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = (User) request.getSession().getAttribute("user");
			String passold = request.getParameter("passold");
			String passnew = request.getParameter("passnew");
			String passconfirm = request.getParameter("passconfirm");
			if (!user.getPassword().equalsIgnoreCase(passold)) {
				request.setAttribute("change", "Mật khẩu hiện tại không đúng!");
			} else if (!passnew.equalsIgnoreCase(passconfirm)) {
				request.setAttribute("change", "Mật khẩu xác nhận không trùng khớp!");
			} else {
				user.setPassword(passnew);
				this.userDAO.update(user);
				request.getSession().setAttribute("user", user);
				request.setAttribute("change", "Đổi mật khẩu thành công!");
			}

		} catch (Exception e) {
			request.setAttribute("change", "Đổi mật khẩu không thành công!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
