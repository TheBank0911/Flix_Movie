package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Video")
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	int id;
	@Column(name = "Title")
	String Title;
	@Column(name = "Poster")
	String Poster;
	@Column(name ="Views")
	int Views;
	@Column(name ="Descriptions")
	String Descriptions;
	@Column(name = "Active")
	Boolean Active = false;
	@Column(name="Href")
	String Href;
	public Video(int id, String title, String poster, int views, String descriptions, Boolean active, String href) {
		super();
		this.id = id;
		Title = title;
		Poster = poster;
		Views = views;
		Descriptions = descriptions;
		Active = active;
		Href = href;
	}
	public Video() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getPoster() {
		return Poster;
	}
	public void setPoster(String poster) {
		Poster = poster;
	}
	public int getViews() {
		return Views;
	}
	public void setViews(int views) {
		Views = views;
	}
	
	
	public String getDescriptions() {
		return Descriptions;
	}
	public void setDescriptions(String descriptions) {
		Descriptions = descriptions;
	}
	
	public Boolean getActive() {
		return Active;
	}
	public void setActive(Boolean active) {
		Active = active;
	}
	public String getHref() {
		return Href;
	}
	public void setHref(String href) {
		Href = href;
	}
	
	
	
}
