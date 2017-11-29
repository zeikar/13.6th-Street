package database;

import user.ReportUser;
import user.SellerRequest;
import user.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zeikar on 2017-11-24.
 */
public class DatabaseWrapper
{
	private static Connection getConnection()
	{
		Connection conn = null;
		
		//"jdbc:mysql://localhost:8080/SE?autoReconnect=true"
		String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return conn;
	}
	
	private static void releaseConnection(Connection conn)
	{
		try
		{
			conn.close();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	private static ResultSet executeQuery(Connection conn, String query)
	{
		try
		{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			if (rs.next())
			{
				return rs;
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return null;
	}
	
	private static boolean executeUpdateQuery(Connection conn, String query)
	{
		try
		{
			Statement stmt = conn.createStatement();
			boolean res = (stmt.executeUpdate(query) != 0);
			
			return res;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static boolean isIdAndPasswordValid(String id, String password)
	{
		String query = "SELECT * FROM User WHERE id = '" + id + "' AND password = '"
				+ password + "'";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		releaseConnection(conn);
		
		return rs != null;
	}
	
	public static User getUser(String id)
	{
		String query = "SELECT * FROM User WHERE id = '" + id + "'";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		try
		{
			if (rs != null)
			{
				return new User(rs.getString("id"), rs.getString("password"),
						rs.getString("name"), rs.getString("email"), rs.getString("address"),
						rs.getString("phoneNumber"),
						rs.getInt("point"), rs.getString("creditCardNumber"),
						rs.getString("bankAccountNumber"),
						rs.getInt("userType"), rs.getInt("isUserBlocked") == 1);
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static SellerRequest getSellerRequest(String id)
	{
		String query = "SELECT * FROM Seller_request WHERE userId = '" + id + "'";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		try
		{
			if (rs != null)
			{
				return new SellerRequest(rs.getString("userId"), rs.getInt("state"),
						rs.getTimestamp("requestTime"), rs.getString("requestContent"));
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static List<ReportUser> getReportUserList(String reportedUserId)
	{
		String query = "SELECT * FROM Report_user " +
				"WHERE reported_user_id='" + reportedUserId + "'";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		List<ReportUser> reportUserList = new ArrayList<>();
		
		try
		{
			if (rs != null)
			{
				do
				{
					ReportUser reportUser = new ReportUser(rs.getString("report_user_id"),
							rs.getString("reported_user_id"), rs.getTimestamp("report_date"),
							rs.getString("report_content"), rs.getString("report_reason"));
					
					reportUserList.add(reportUser);
				}
				while(rs.next());
				
				return reportUserList;
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static boolean insertUserInfo(User user)
	{
		String query = "INSERT INTO User(id, password, name, email, address, phoneNumber)" +
				"VALUES('" + user.getId() + "','" + user.getPassword() + "','" +
				user.getName() + "','" + user.getEmail() + "','" + user.getAddress() + "','" +
				user.getPhoneNumber() + "')";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
	
	public static boolean updateUserInfo(User user)
	{
		String query = "UPDATE User set " +
				"password = '" + user.getPassword() + "'," +
				"address = '" + user.getAddress() + "'," +
				"phoneNumber = '" + user.getPhoneNumber() + "'," +
				"point = '" + user.getPoint() + "'," +
				"creditCardNumber = '" + user.getCreditCardNumber() + "'," +
				"bankAccountNumber = '" + user.getBankAccountNumber() + "'," +
				"userType = '" + user.getUserType() + "'," +
				"isUserBlocked = '" + (user.isUserBlocked()?"1":"0") + "' " +
				"WHERE id = '" + user.getId() + "'";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
	
	public static boolean deleteUser(String id)
	{
		String query = "DELETE FROM User WHERE id = '" + id + "'";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
	
	public static List<String> getReportedUserIdList()
	{
		String query = "SELECT DISTINCT reported_user_id FROM Report_user";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		List<String> userIdList = new ArrayList<>();
		
		try
		{
			if (rs != null)
			{
				do
				{
					String userId = rs.getString("reported_user_id");
					
					userIdList.add(userId);
				}
				while(rs.next());
				
				return userIdList;
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static List<String> getSellerRequestUserIdList()
	{
		String query = "SELECT userId FROM Seller_request where state = 0";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		List<String> userIdList = new ArrayList<>();
		
		try
		{
			if (rs != null)
			{
				do
				{
					String userId = rs.getString("userId");
					
					userIdList.add(userId);
				}
				while(rs.next());
				
				return userIdList;
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static List<String> getBlockedUserIdList()
	{
		String query = "SELECT id FROM User where isUserBlocked = 1";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		List<String> userIdList = new ArrayList<>();
		
		try
		{
			if (rs != null)
			{
				do
				{
					String userId = rs.getString("id");
					
					userIdList.add(userId);
				}
				while(rs.next());
				
				return userIdList;
			}
			else
			{
				return null;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			releaseConnection(conn);
		}
		
		return null;
	}
	
	public static boolean updateSellerInfo(SellerRequest sellerRequest)
	{
		String query = "UPDATE Seller_request set " +
				"state = '" + sellerRequest.getState() + "'," +
				"requestTime = '" + sellerRequest.getRequestTime() + "'," +
				"requestContent = '" + sellerRequest.getRequestContent() + "' " +
				"WHERE userId = '" + sellerRequest.getUserId() + "'";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
	
	public static boolean insertSellerInfo(SellerRequest sellerRequest)
	{
		String query = "INSERT INTO Seller_request(userId, requestContent)" +
				"VALUES('" + sellerRequest.getUserId() + "','" +
				sellerRequest.getRequestContent() + "')";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
	
	public static boolean insertReportInfo(ReportUser reportUser)
	{
		String query = "INSERT INTO Report_user (report_user_id, reported_user_id, report_content, report_reason)" +
				"VALUES('" + reportUser.getReportUserId() + "','" +
				reportUser.getReportedUserId() + "','" +
				reportUser.getReportContent() + "','" +
				reportUser.getReportReason() + "')";
		
		Connection conn = getConnection();
		Boolean ret = executeUpdateQuery(conn, query);
		releaseConnection(conn);
		
		return ret;
	}
}