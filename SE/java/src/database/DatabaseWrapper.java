package database;

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
	
	// 추후에 업데이트 예정!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// 신고 유저, 신고 클래스 필요
	public static List<User> getReportedUserList()
	{
		String query = "SELECT * FROM User";
		
		Connection conn = getConnection();
		ResultSet rs = executeQuery(conn, query);
		
		List<User> userList = new ArrayList<>();
		
		try
		{
			if (rs != null)
			{
				do
				{
					User user = new User(rs.getString("id"), rs.getString("password"),
						rs.getString("name"), rs.getString("email"), rs.getString("address"),
						rs.getString("phoneNumber"),
						rs.getInt("point"), rs.getString("creditCardNumber"),
						rs.getString("bankAccountNumber"),
						rs.getInt("userType"), rs.getInt("isUserBlocked") == 1);
					
					userList.add(user);
				}
				while(rs.next());
				
				return userList;
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
}