package user;

import database.DatabaseWrapper;

/**
 * Created by Zeikar on 2017-11-25.
 */
public class PointController
{
	private static User getUser(String id)
	{
		return DatabaseWrapper.getUser(id);
	}
	
	private static boolean updatePoint(User user, int amount)
	{
		if(user.getPoint() + amount < 0)
		{
			return false;
		}
		
		user.setPoint(user.getPoint() + amount);
		return DatabaseWrapper.updateUserInfo(user);
	}
	
	public static boolean usePoint(String id, int amount)
	{
		User user = getUser(id);
		
		return updatePoint(user, -amount);
	}
	
	public static boolean chargePointWithCreditCard(String id, int amount, String payNumber)
	{
		User user = getUser(id);
		
		user.setCreditCardNumber(payNumber);
		
		return updatePoint(user, amount);
	}
	
	public static boolean chargePointWithBankAccount(String id, int amount, String payNumber)
	{
		User user = getUser(id);
		
		user.setBankAccountNumber(payNumber);
		
		return updatePoint(user, amount);
	}
	
	public static boolean refundPoint(String id, int amount, String refundNumber)
	{
		User user = getUser(id);
		
		user.setBankAccountNumber(refundNumber);
		
		return updatePoint(user, -amount);
	}
}
