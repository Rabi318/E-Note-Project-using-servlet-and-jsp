package com.user;

import java.sql.Date;
import java.sql.Timestamp;

public class Post {
private int id;
private String title;
private String content;
private Date date;
private UserDetails user;
public Post(int id, String title, String content, Date date, UserDetails user) {
	super();
	this.id = id;
	this.title = title;
	this.content = content;
	this.date = date;
	this.user = user;
}
public Post() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getDate() {
	return date;
}
public void setDate(Date timestamp) {
	this.date = timestamp;
}
public UserDetails getUser() {
	return user;
}
public void setUser(UserDetails user) {
	this.user = user;
}


}
