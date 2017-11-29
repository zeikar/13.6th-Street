package user;

import java.sql.Timestamp;

/**
 * Created by Zeikar on 2017-11-29.
 */
public class ReportUser
{
	private String reportUserId;
	private String reportedUserId;
	private Timestamp reportDate;
	private String reportContent;
	private String reportReason;
	
	public ReportUser(String reportUserId, String reportedUserId, String reportContent, String reportReason)
	{
		this.reportUserId = reportUserId;
		this.reportedUserId = reportedUserId;
		this.reportContent = reportContent;
		this.reportReason = reportReason;
	}
	
	public ReportUser(String reportUserId, String reportedUserId, Timestamp reportDate, String reportContent, String reportReason)
	{
		this.reportUserId = reportUserId;
		this.reportedUserId = reportedUserId;
		this.reportDate = reportDate;
		this.reportContent = reportContent;
		this.reportReason = reportReason;
	}
	
	public String getReportUserId()
	{
		return reportUserId;
	}
	
	public void setReportUserId(String reportUserId)
	{
		this.reportUserId = reportUserId;
	}
	
	public String getReportedUserId()
	{
		return reportedUserId;
	}
	
	public void setReportedUserId(String reportedUserId)
	{
		this.reportedUserId = reportedUserId;
	}
	
	public Timestamp getReportDate()
	{
		return reportDate;
	}
	
	public void setReportDate(Timestamp reportDate)
	{
		this.reportDate = reportDate;
	}
	
	public String getReportContent()
	{
		return reportContent;
	}
	
	public void setReportContent(String reportContent)
	{
		this.reportContent = reportContent;
	}
	
	public String getReportReason()
	{
		return reportReason;
	}
	
	public void setReportReason(String reportReason)
	{
		this.reportReason = reportReason;
	}
}
