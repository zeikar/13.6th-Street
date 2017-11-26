package user;

import database.DatabaseWrapper;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zeikar on 2017-11-24.
 * 출처: http://all-record.tistory.com/115 [세상의 모든 기록]
 */
public class UserAccountController
{
	private static User getUser(String id)
	{
		return DatabaseWrapper.getUser(id);
	}
	
	public static String getUserName(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return "null";
		}
		return getUser(id).getName();
	}
	
	public static String getUserAddress(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return "null";
		}
		return getUser(id).getAddress();
	}
	
	public static String getUserPhoneNumber(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return "null";
		}
		return getUser(id).getPhoneNumber();
	}
	
	public static int getUserPoint(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return -1;
		}
		return getUser(id).getPoint();
	}
	
	public static boolean isUserAdmin(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return false;
		}
		return getUser(id).getUserType() == 2;
	}
	
	public static boolean isUserSeller(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return false;
		}
		return getUser(id).getUserType() == 1;
	}
	
	public static String getUserCreditCardNumber(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return "null";
		}
		return getUser(id).getCreditCardNumber();
	}
	
	public static String getUserBankAccountNumber(String id)
	{
		User user = getUser(id);
		if(user == null)
		{
			return "null";
		}
		return getUser(id).getBankAccountNumber();
	}
	
	public static boolean login(String id, String password)
	{
		return DatabaseWrapper.isIdAndPasswordValid(id, password);
	}
	
	public static boolean register(String id, String password, String name, String email, String address, String phoneNumber)
	{
		User user = new User(id, password, name, email, address, phoneNumber);
		
		return DatabaseWrapper.insertUserInfo(user);
	}
	
	public static boolean isDuplicateId(String id)
	{
		User user = DatabaseWrapper.getUser(id);
		return user != null;
	}
	
	public static boolean editUser(String id, String password, String address, String phoneNumber)
	{
		User user = DatabaseWrapper.getUser(id);
		
		if(password != null && !password.equals(""))
		{
			user.setPassword(password);
		}
		
		user.setAddress(address);
		user.setPhoneNumber(phoneNumber);
		
		return DatabaseWrapper.updateUserInfo(user);
	}
	
	public static boolean deleteUser(String id)
	{
		return DatabaseWrapper.deleteUser(id);
	}
	
	// 추후에 업데이트 예정!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// 신고 유저, 신고 클래스 필요
	public static List<String> getReportedUserIdList()
	{
		List<User> userList = DatabaseWrapper.getReportedUserList();
		List<String> idList = new ArrayList<>();
		
		for (User user :
				userList)
		{
			idList.add(user.getId());
		}
		
		return idList;
	}
}
