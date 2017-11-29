package user;


import java.sql.Timestamp;

/**
 * Created by Zeikar on 2017-11-27.
 */
public class SellerRequest
{
	private String userId;
	private int state;
	private Timestamp requestTime;
	private String requestContent;
	
	public SellerRequest(String userId, int state, Timestamp requestTime, String requestContent)
	{
		this.userId = userId;
		this.state = state;
		this.requestTime = requestTime;
		this.requestContent = requestContent;
	}
	
	public SellerRequest(String userId, String requestContent)
	{
		this.userId = userId;
		this.requestContent = requestContent;
	}
	
	public String getUserId()
	{
		return userId;
	}
	
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	
	public int getState()
	{
		return state;
	}
	
	public void setState(int state)
	{
		this.state = state;
	}
	
	public Timestamp getRequestTime()
	{
		return requestTime;
	}
	
	public void setRequestTime(Timestamp requestTime)
	{
		this.requestTime = requestTime;
	}
	
	public String getRequestContent()
	{
		return requestContent;
	}
	
	public void setRequestContent(String requestContent)
	{
		this.requestContent = requestContent;
	}
}
