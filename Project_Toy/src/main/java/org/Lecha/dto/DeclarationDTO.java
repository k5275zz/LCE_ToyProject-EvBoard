package org.Lecha.dto;

public class DeclarationDTO {

	private String userid;
	private String reportTitle;
	private String reportContent;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	@Override
	public String toString() {
		return "DeclarationDTO [userid=" + userid + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ "]";
	}
	
}
