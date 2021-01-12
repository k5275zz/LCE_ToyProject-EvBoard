package org.Lecha.dto;

public class EvBoardDTO {
	private int bno;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	private String id;
	private String lecturename;// 강의명
	private String lectureteacher;// 강사명
	private int lectureyear;// 수강년도
	private String quarterdivide;// 수강분기
	private String lecturedivide;// 강의구분
	private String lecturetitle;// 강의평가 글제목
	private String lecturecontent;// 강의평가 글내용
	private String relevancescore;// 적절성 점수
	private String efficiencyscore;// 효율성 점수
	private String effectivenessscore;// 효과성 점수
	private String sustainabilityscore;// 지속가능성 점수
	private String writetime;
	private int reply_cnt;
	private int likes_cnt;
	private int views;
	private int lecturefee;//강의료
	private String uploadPath;//업로드파일경로
	
	
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public int getLecturefee() {
		return lecturefee;
	}
	public void setLecturefee(int lecturefee) {
		this.lecturefee = lecturefee;
	}
	
	public int getLikes_cnt() {
		return likes_cnt;
	}
	public void setLikes_cnt(int likes_cnt) {
		this.likes_cnt = likes_cnt;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public String getWritetime() {
		return writetime;
	}
	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLecturename() {
		return lecturename;
	}
	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}
	public String getLectureteacher() {
		return lectureteacher;
	}
	public void setLectureteacher(String lectureteacher) {
		this.lectureteacher = lectureteacher;
	}
	public int getLectureyear() {
		return lectureyear;
	}
	public void setLectureyear(int lectureyear) {
		this.lectureyear = lectureyear;
	}
	public String getQuarterdivide() {
		return quarterdivide;
	}
	public void setQuarterdivide(String quarterdivide) {
		this.quarterdivide = quarterdivide;
	}
	public String getLecturedivide() {
		return lecturedivide;
	}
	public void setLecturedivide(String lecturedivide) {
		this.lecturedivide = lecturedivide;
	}
	public String getLecturetitle() {
		return lecturetitle;
	}
	public void setLecturetitle(String lecturetitle) {
		this.lecturetitle = lecturetitle;
	}
	public String getLecturecontent() {
		return lecturecontent;
	}
	public void setLecturecontent(String lecturecontent) {
		this.lecturecontent = lecturecontent;
	}
	public String getRelevancescore() {
		return relevancescore;
	}
	public void setRelevancescore(String relevancescore) {
		this.relevancescore = relevancescore;
	}
	public String getEfficiencyscore() {
		return efficiencyscore;
	}
	public void setEfficiencyscore(String efficiencyscore) {
		this.efficiencyscore = efficiencyscore;
	}
	public String getEffectivenessscore() {
		return effectivenessscore;
	}
	public void setEffectivenessscore(String effectivenessscore) {
		this.effectivenessscore = effectivenessscore;
	}
	public String getSustainabilityscore() {
		return sustainabilityscore;
	}
	public void setSustainabilityscore(String sustainabilityscore) {
		this.sustainabilityscore = sustainabilityscore;
	}
	@Override
	public String toString() {
		return "EvBoardDTO [bno=" + bno + ", id=" + id + ", lecturename=" + lecturename + ", lectureteacher="
				+ lectureteacher + ", lectureyear=" + lectureyear + ", quarterdivide=" + quarterdivide
				+ ", lecturedivide=" + lecturedivide + ", lecturetitle=" + lecturetitle + ", lecturecontent="
				+ lecturecontent + ", relevancescore=" + relevancescore + ", efficiencyscore=" + efficiencyscore
				+ ", effectivenessscore=" + effectivenessscore + ", sustainabilityscore=" + sustainabilityscore
				+ ", writetime=" + writetime + "]";
	}
	
	
	
	
	
}
