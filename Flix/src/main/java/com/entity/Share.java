package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

//@NamedQueries({@NamedQuery(name = "Share.findAll",query = "Select o from Users o")})
//
@NamedStoredProcedureQueries({@NamedStoredProcedureQuery(name = "shareByUser",procedureName = "Statistical_Share",parameters = {@StoredProcedureParameter(name="titleVideo",type = String.class)})})

@Entity
@Table(name = "Share", uniqueConstraints = { @UniqueConstraint(columnNames = { "VideoId", "UserId" }) })
public class Share {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	int id;
	@ManyToOne
	@JoinColumn(name = "UserId")
	User user;
	@ManyToOne
	@JoinColumn(name = "VideoId")
	Video video;
	@Column(name ="Emails")
	String Emails;
	@Column(name ="ShareDate")
	Date ShareDate=new Date();
	
	
	public Share() {
		super();
	}
	public Share(int id, User user, Video video, String emails, Date shareDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		Emails = emails;
		ShareDate = shareDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public String getEmails() {
		return Emails;
	}
	public void setEmails(String emails) {
		Emails = emails;
	}
	public Date getShareDate() {
		return ShareDate;
	}
	public void setShareDate(Date shareDate) {
		ShareDate = shareDate;
	}
	
	
	
}
