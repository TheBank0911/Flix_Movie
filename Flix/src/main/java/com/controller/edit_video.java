package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FilenameUtils;

import com.dao.FavoriteDAO;
import com.dao.UserDAO;
import com.dao.VideoDAO;
import com.entity.User;
import com.entity.Video;
import com.untils.RenameFileAddLibrary;

/**
 * Servlet implementation class edit_video
 */
@MultipartConfig
@WebServlet({ "/updatevd", "/edit", "/createvd", "/deletevd","/edit_video" })
public class edit_video extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private VideoDAO videoDAO;
	private FavoriteDAO favoriteDAO;
	private User user;
	private Video video;

	public edit_video() {
		super();
		this.userDAO = new UserDAO();
		this.videoDAO = new VideoDAO();
		this.favoriteDAO = new FavoriteDAO();
		this.user = new User();
		this.video = new Video();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		if (uri.contains("updatevd")) {
			this.doEditVD(request, response);
		} else if (uri.contains("edit")) {
			int id = Integer.valueOf(request.getParameter("id"));
			this.video = this.videoDAO.FindIdVideo(id);
			request.setAttribute("Video", this.video);
		} else if (uri.contains("createvd")) {
			this.createVD(request, response);
		} else if (uri.contains("deletevd")) {
			System.out.println("a");
			this.deletevd(request, response);
		}else if (uri.contains("edit_video")) {
			request.setAttribute("Video",null);
		}
		try {
			List<Video> listusers = this.videoDAO.findVideoAll();
			request.setAttribute("lists", listusers);
			request.setAttribute("action", "qlvideo");
			request.getRequestDispatcher("/views/index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void createVD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
			Video vd = new Video();
			BeanUtils.populate(vd, request.getParameterMap());
			if (!request.getPart("img_one").getSubmittedFileName().equals("")) {
				File dir = new File(request.getServletContext().getRealPath("/views/images"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				String refreshId = String.valueOf(this.videoDAO.maxId().getId() + 1);
				Part photo = request.getPart("img_one");
				File photoFile = new File(dir,
						RenameFileAddLibrary.renameFile(photo.getSubmittedFileName(), refreshId));
				photo.write(photoFile.getAbsolutePath());
				vd.setPoster(RenameFileAddLibrary.renameFile(photo.getSubmittedFileName(),refreshId));
			} else {
				vd.setPoster(video.getPoster());
			}
			vd.setActive(true);
			vd.setViews(0);
			VideoDAO dao = new VideoDAO();
			dao.create(vd);
			request.setAttribute("vd", "Thêm thành công!");
		} catch (Exception e) {
			request.setAttribute("vd", "Thêm thất bại!");
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	private void doEditVD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		try {
			Video vd = new Video();
			BeanUtils.populate(vd, request.getParameterMap());
			
			Video vid= this.videoDAO.FindIdVideo(id);
			if (!request.getPart("img_one").getSubmittedFileName().equals("")) {
				File dir = new File(request.getServletContext().getRealPath("/views/images"));
				if (!dir.exists()) {
					dir.mkdirs();
				}
				Part photo = request.getPart("img_one");
				File photoFile = new File(dir,
						RenameFileAddLibrary.renameFile(photo.getSubmittedFileName(), String.valueOf(vid.getId())));
				photo.write(photoFile.getAbsolutePath());
				vd.setPoster(RenameFileAddLibrary.renameFile(photo.getSubmittedFileName(), String.valueOf(vid.getId())));
			} else {
				vd.setPoster(vid.getPoster());
			}
			vd.setId(vid.getId());
			vd.setViews(vid.getViews());
			List<Video> listusers = this.videoDAO.findVideoAll();
			request.setAttribute("lists", listusers);
			this.videoDAO.update(vd);
			request.setAttribute("vd", "Cập nhật thành công!");
		} catch (Exception e) {
			request.setAttribute("vd", "Cập nhật thất bại!");
			e.printStackTrace();
			// TODO: handle exception
		}

	}

	protected void deletevd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.valueOf(req.getParameter("id"));
		try {
			this.videoDAO.remove(id);
			req.setAttribute("vd", "Xóa thành công!");

		} catch (Exception e) {
			req.setAttribute("vd", "Xóa không thành công!");
			// TODO: handle exception
		}
	}
}
