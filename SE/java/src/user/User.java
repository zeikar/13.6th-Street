package user;

/**
 * Created by Zeikar on 2017-11-24.
 */
public class User
{
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phoneNumber;
	private int point;
	private String creditCardNumber;
	private String bankAccountNumber;
	private int userType;
	private boolean userBlocked;
	
	public User(String id, String password, String name, String email, String address, String phoneNumber, int point, String creditCardNumber, String bankAccountNumber, int userType, boolean userBlocked)
	{
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.point = point;
		this.creditCardNumber = creditCardNumber;
		this.bankAccountNumber = bankAccountNumber;
		this.userType = userType;
		this.userBlocked = userBlocked;
	}
	
	public User(String id, String password, String name, String email, String address, String phoneNumber)
	{
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		
		this.point = 0;
		this.creditCardNumber = "";
		this.bankAccountNumber = "";
		this.userType = 0;
		this.userBlocked = false;
	}
	
	public String getId()
	{
		return id;
	}
	
	public void setId(String id)
	{
		this.id = id;
	}
	
	public String getPassword()
	{
		return password;
	}
	
	public void setPassword(String password)
	{
		this.password = password;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getAddress()
	{
		return address;
	}
	
	public void setAddress(String address)
	{
		this.address = address;
	}
	
	public String getPhoneNumber()
	{
		return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}
	
	public int getPoint()
	{
		return point;
	}
	
	public void setPoint(int point)
	{
		this.point = point;
	}
	
	public String getCreditCardNumber()
	{
		return creditCardNumber;
	}
	
	public void setCreditCardNumber(String creditCardNumber)
	{
		this.creditCardNumber = creditCardNumber;
	}
	
	public String getBankAccountNumber()
	{
		return bankAccountNumber;
	}
	
	public void setBankAccountNumber(String bankAccountNumber)
	{
		this.bankAccountNumber = bankAccountNumber;
	}
	
	public int getUserType()
	{
		return userType;
	}
	
	public void setUserType(int userType)
	{
		this.userType = userType;
	}
	
	public boolean isUserBlocked()
	{
		return userBlocked;
	}
	
	public void setUserBlocked(boolean userBlocked)
	{
		this.userBlocked = userBlocked;
	}
}
