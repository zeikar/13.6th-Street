package database;

import user.User;

import java.sql.*;

/**
 * Created by Zeikar on 2017-11-24.
 */
public class DatabaseWrapper
{
	private static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Connection conn = null;
		
		//"jdbc:mysql://localhost:8080/SE?autoReconnect=true"
		String jdbcurl = "jdbc:mysql://localhost:3306/SE?serverTimezone=UTC";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcurl, "root", "capscaps12345");
		
		return conn;
	}
	
	private static ResultSet executeQuery(String query)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if (rs.next())
			{
				return rs;
			}
			else
			{
				return null;
			}
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
				stmt.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	private static boolean executeUpdateQuery(String query)
	{
		Connection conn = null;
		Statement stmt = null;
		boolean res = false;
		
		try
		{
			conn = getConnection();
			stmt = conn.createStatement();
			res = (stmt.executeUpdate(query) != 0);
			
			return res;
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				conn.close();
				stmt.close();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	public static boolean isIdAndPasswordValid(String id, String password)
	{
		String query = "SELECT * FROM User WHERE id = '" + id + "' AND password = '"
				+ password + "'";
		
		ResultSet rs = executeQuery(query);
		
		return rs != null;
	}
	
	public static User getUser(String id)
	{
		String query = "SELECT * FROM User WHERE id = '" + id + "'";
		
		ResultSet rs = executeQuery(query);
		
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
		
		return null;
	}
	
	public static boolean insertUserInfo(User user)
	{
		String query = "INSERT INTO User(id, password, name, email, address, phoneNumber)" +
				"VALUES('" + user.getId() + "','" + user.getPassword() + "','" +
				user.getName() + "','" + user.getEmail() + "','" + user.getAddress() + "','" +
				user.getPhoneNumber() + "')";
		
		return executeUpdateQuery(query);
	}
	
	public static boolean updateUserInfo(User user)
	{
		String query = "UPDATE User set " +
				"password = '" + user.getPassword() + "'," +
				"address = '" + user.getAddress() + "'," +
				"phoneNumber = '" + user.getPhoneNumber() + "'," +
				"point = '" + user.getPoint() + "'," +
				"creditCardNumber = '" + user.getCreditCardNumber() + "'," +
				"bankAccountNumber = '" + user.getBackAccountNumber() + "'," +
				"userType = '" + user.getUserType() + "'," +
				"isUserBlocked = '" + (user.isUserBlocked()?"1":"0") + "' " +
				"WHERE id = '" + user.getId() + "'";
		
		return executeUpdateQuery(query);
	}
}