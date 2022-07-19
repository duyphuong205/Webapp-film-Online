package edu.model;

import java.util.Date;

public class Report {
  private String videoTitle;
  private Long countLike;
  private Date newest;
  private Date oldest;
public Report(String videoTitle, Long countLike, Date newest, Date oldest) {
	
	this.videoTitle = videoTitle;
	this.countLike = countLike;
	this.newest = newest;
	this.oldest = oldest;
}
public Report() {

}
public String getVideoTitle() {
	return videoTitle;
}
public void setVideoTitle(String videoTitle) {
	this.videoTitle = videoTitle;
}
public Long getCountLike() {
	return countLike;
}
public void setCountLike(Long countLike) {
	this.countLike = countLike;
}
public Date getNewest() {
	return newest;
}
public void setNewest(Date newest) {
	this.newest = newest;
}
public Date getOldest() {
	return oldest;
}
public void setOldest(Date oldest) {
	this.oldest = oldest;
}

}
