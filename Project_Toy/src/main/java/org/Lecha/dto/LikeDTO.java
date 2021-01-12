package org.Lecha.dto;

public class LikeDTO {
	private String id;
	private int bno;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "LikeDTO [id=" + id + ", bno=" + bno + "]";
	}
	
}
