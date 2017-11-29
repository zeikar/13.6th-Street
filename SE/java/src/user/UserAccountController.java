package user;

import database.DatabaseWrapper;

import java.sql.Timestamp;
import java.time.LocalDateTime;
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
		if (user == null)
		{
			return "null";
		}
		return getUser(id).getName();
	}
	
	public static String getUserAddress(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return "null";
		}
		return getUser(id).getAddress();
	}
	
	public static String getUserPhoneNumber(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return "null";
		}
		return getUser(id).getPhoneNumber();
	}
	
	public static int getUserPoint(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return -1;
		}
		return getUser(id).getPoint();
	}
	
	public static boolean isUserAdmin(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return false;
		}
		return getUser(id).getUserType() == 2;
	}
	
	public static boolean isUserSeller(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return false;
		}
		return getUser(id).getUserType() == 1;
	}
	
	public static boolean isUserBlocked(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return false;
		}
		return getUser(id).isUserBlocked();
	}
	
	public static String getUserCreditCardNumber(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return "null";
		}
		return getUser(id).getCreditCardNumber();
	}
	
	public static String getUserBankAccountNumber(String id)
	{
		User user = getUser(id);
		if (user == null)
		{
			return "null";
		}
		return getUser(id).getBankAccountNumber();
	}
	
	public static String getUserSellerState(String id)
	{
		SellerRequest sellerRequest = DatabaseWrapper.getSellerRequest(id);
		if (sellerRequest == null)
		{
			return "null";
		}
		
		int sellerState = sellerRequest.getState();
		if (sellerState == 0)
		{
			return "판매자 등록 승인 대기 중";
		}
		else if (sellerState == 1)
		{
			return "판매자 등록 승인 완료";
		}
		else
		{
			return "판매자 등록 승인 거절";
		}
	}
	
	public static String getUserSellerTime(String id)
	{
		SellerRequest sellerRequest = DatabaseWrapper.getSellerRequest(id);
		if (sellerRequest == null)
		{
			return "null";
		}
		Timestamp requestTime = sellerRequest.getRequestTime();
		String timeString = requestTime.toString();
		return timeString;
	}
	
	public static String getUserSellerContent(String id)
	{
		SellerRequest sellerRequest = DatabaseWrapper.getSellerRequest(id);
		if (sellerRequest == null)
		{
			return "null";
		}
		return sellerRequest.getRequestContent();
	}
	
	public static List<String> getReportUserIdList(String id)
	{
		List<ReportUser> reportUserList = DatabaseWrapper.getReportUserList(id);
		List<String> reportUserIdList = new ArrayList<>();
		if (reportUserList == null)
		{
			return new ArrayList<String>();
		}
		for (ReportUser reportUser :
				reportUserList)
		{
			reportUserIdList.add(reportUser.getReportUserId());
		}
		return reportUserIdList;
	}
	
	public static List<String> getReportDateList(String id)
	{
		List<ReportUser> reportUserList = DatabaseWrapper.getReportUserList(id);
		List<String> reportDateList = new ArrayList<>();
		if (reportUserList == null)
		{
			return new ArrayList<String>();
		}
		for (ReportUser reportUser :
				reportUserList)
		{
			reportDateList.add(reportUser.getReportDate().toString());
		}
		return reportDateList;
	}
	
	public static List<String> getReportContentList(String id)
	{
		List<ReportUser> reportUserList = DatabaseWrapper.getReportUserList(id);
		List<String> reportContentList = new ArrayList<>();
		if (reportUserList == null)
		{
			return new ArrayList<String>();
		}
		for (ReportUser reportUser :
				reportUserList)
		{
			reportContentList.add(reportUser.getReportContent());
		}
		return reportContentList;
	}
	
	public static List<String> getReportReasonList(String id)
	{
		List<ReportUser> reportUserList = DatabaseWrapper.getReportUserList(id);
		List<String> reportReasonList = new ArrayList<>();
		if (reportUserList == null)
		{
			return new ArrayList<String>();
		}
		for (ReportUser reportUser :
				reportUserList)
		{
			reportReasonList.add(reportUser.getReportReason());
		}
		return reportReasonList;
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
		
		if (password != null && !password.equals(""))
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
	
	public static List<String> getReportedUserIdList()
	{
		List<String> reportedUserIdList = DatabaseWrapper.getReportedUserIdList();
		List<String> ret = new ArrayList<>();
		
		if (reportedUserIdList == null)
		{
			return new ArrayList<String>();
		}
		for (String id :
				reportedUserIdList)
		{
			if (!isUserBlocked(id))
			{
				ret.add(id);
			}
		}
		return ret;
	}
	
	public static List<String> getSellerRequestUserIdList()
	{
		List<String> ret = DatabaseWrapper.getSellerRequestUserIdList();
		
		if (ret == null)
		{
			return new ArrayList<String>();
		}
		return ret;
	}
	
	public static boolean addSeller(String[] idList)
	{
		for (int i = 0; i < idList.length; ++i)
		{
			SellerRequest sellerRequest = DatabaseWrapper.getSellerRequest(idList[i]);
			sellerRequest.setState(1);
			
			User user = DatabaseWrapper.getUser(idList[i]);
			user.setUserType(1);
			
			if (DatabaseWrapper.updateSellerInfo(sellerRequest) &&
					DatabaseWrapper.updateUserInfo(user) == false)
			{
				return false;
			}
		}
		
		return true;
	}
	
	public static boolean rejectSeller(String[] idList)
	{
		for (int i = 0; i < idList.length; ++i)
		{
			SellerRequest sellerRequest = DatabaseWrapper.getSellerRequest(idList[i]);
			sellerRequest.setState(2);
			
			if (DatabaseWrapper.updateSellerInfo(sellerRequest) == false)
			{
				return false;
			}
		}
		
		return true;
	}
	
	public static boolean userSellerRequest(String id, String content)
	{
		SellerRequest request = new SellerRequest(id, content);
		
		return DatabaseWrapper.insertSellerInfo(request);
	}
	
	public static boolean blockUser(String[] idList)
	{
		for (int i = 0; i < idList.length; ++i)
		{
			User user = DatabaseWrapper.getUser(idList[i]);
			user.setUserBlocked(true);
			
			if (DatabaseWrapper.updateUserInfo(user) == false)
			{
				return false;
			}
		}
		
		return true;
	}
	
	public static List<String> getBlockedUserIdList()
	{
		List<String> ret = DatabaseWrapper.getBlockedUserIdList();
		
		if (ret == null)
		{
			return new ArrayList<String>();
		}
		return ret;
	}
	
	public static boolean unBlockUser(String[] idList)
	{
		for (int i = 0; i < idList.length; ++i)
		{
			User user = DatabaseWrapper.getUser(idList[i]);
			user.setUserBlocked(false);
			
			if (DatabaseWrapper.updateUserInfo(user) == false)
			{
				return false;
			}
		}
		
		return true;
	}
	
	
	public static boolean reportUser(String reportId, String reportedId, String content, String reason)
	{
		ReportUser reportUser = new ReportUser(reportId, reportedId, content, reason);
		
		return DatabaseWrapper.insertReportInfo(reportUser);
	}
}
