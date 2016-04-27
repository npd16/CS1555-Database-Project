//Nick DeFranco & Peter Schaldenbrand
//CS 1555 Database Management Project

import java.io.*;
import java.util.*;
import java.text.*;

import java.sql.*;  //import the file containing definitions for the parts
import java.text.ParseException;
import oracle.jdbc.*;

public class FaceSpace 
{
	private static Connection connection; //used to hold the jdbc connection to the DB
    private Statement statement; //used to create an instance of the connection
    private PreparedStatement prepStatement; //used to create a prepared statement, that will be later reused
    private ResultSet resultSet; //used to hold the result of your query (if one exists)
    private String query;  //this will hold the query we are using
    private String username; //This is your username in oracle
    private String password; //This is your password in oracle
	
	public FaceSpace(String un, String pw){
		username = un;
		password = pw; 
	
		try{
			System.out.println("Registering DB.."); 
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());

			System.out.println("Set url..");
			//This is the location of the database.  This is the database in oracle
			//provided to the class
			String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass"; 
			
			System.out.println("Connect to DB..");
			//create a connection to DB on class3.cs.pitt.edu
			connection = DriverManager.getConnection(url, username, password); 
			
			statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		}
		catch(Exception Ex)  {
			System.out.println("Error connecting to database.  Machine Error: " +
					Ex.toString());
		}
	}
	
	public boolean createUser ( String fn, String ln, String email, String dob ){
	
		try{	
			query = "insert into Profiles (userID,fname,lname,email,dob) values (?,?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date birthday = new java.sql.Date (df.parse( dob ).getTime());
			
			//Make a unique userID
			Random rand = new Random();
			long uID;
			while( true ){
				uID = (long)rand.nextInt( 100000000 );
				String isItUnique = "SELECT * FROM Profiles WHERE userID = "+uID;
				resultSet = statement.executeQuery( isItUnique );
				if( resultSet.next() ){
					continue;
				}
				else{ break; }
			}
			prepStatement.setLong(1, uID); 
			prepStatement.setString(2, fn);
			prepStatement.setString(3, ln );
			prepStatement.setString(4, email);
			prepStatement.setDate(5, birthday);
			
			prepStatement.executeUpdate();
			
			String selectQuery = "SELECT * FROM  Profiles WHERE userID = "+uID;
	    
			resultSet = statement.executeQuery(selectQuery); //run the query on the DB table
			while (resultSet.next()) {
				//the profile was successfully created.
				System.out.println("User successfully created");
				return true;
			}
			return false;
		}
		catch(SQLException Ex) {
			System.out.println("Error creating profile.  Machine Error: " + Ex.toString());
		} 
		catch (ParseException e) {
			System.out.println("Error parsing the date. Machine Error: " +
			e.toString());
		}
		return false;
	}
	public long getUserID( String fn, String ln ){
		//return the user's id using their first and last names
		try{
			String selectQuery = "SELECT * FROM  Profiles WHERE  fname = '"+fn+"' and lname = '"+ln+"'";
			resultSet = statement.executeQuery(selectQuery); 
			while (resultSet.next()) {
				return resultSet.getLong(1);
			}
			return -1;
		}
		catch(SQLException Ex) {
			System.out.println("Error getting users ID.  Machine Error: " + Ex.toString());
		} 
		return -1;
	}
		
	public boolean initiateFriendship( long user1_id, long user2_id ){
		try{
			//Make sure that the users already have profiles
			String selectQuery = "SELECT * FROM  Profiles WHERE userID = "+user1_id;
			resultSet = statement.executeQuery(selectQuery);
			if(!resultSet.next()) {
				System.out.println("user1 does not exist");
				return false;	//the profile doesn't exits
			}
			selectQuery = "SELECT * FROM  Profiles WHERE userID = "+user2_id;
			resultSet = statement.executeQuery(selectQuery);
			if (!resultSet.next()) {
				System.out.println("user2 does not exist");
				return false;	//the profile doesn't exits
			}
			
			//insert into friendships
			query = "insert into Friendships values (?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			java.sql.Date sent = new java.sql.Date( df.parse( date ).getTime() );
			
			prepStatement.setLong(1, user1_id); 
			prepStatement.setLong(2, user2_id);
			prepStatement.setLong(3, 0);
			prepStatement.setDate(4, sent);
			
			prepStatement.executeUpdate();
			System.out.println("Friendship successfully initated");
			return true;
			
		}
		catch(SQLException Ex) {
			System.out.println("Error initiating friendship.  Machine Error: " + Ex.toString());
		} 
		catch (ParseException e) {
			System.out.println("Error parsing the date. Machine Error: " +
			e.toString());
		}
		
		return false;
	}
	public boolean establishFriendship( long user1, long user2 ){
		try{
			//Make sure that the users already have profiles
			String selectQuery = "SELECT * FROM  Profiles WHERE userID = "+user1;
			resultSet = statement.executeQuery(selectQuery);
			if(!resultSet.next()) {
				System.out.println("user1 does not exist");
				return false;	//the profile doesn't exits
			}
			selectQuery = "SELECT * FROM  Profiles WHERE userID = "+user2;
			resultSet = statement.executeQuery(selectQuery);
			if (!resultSet.next()) {
				System.out.println("user2 does not exist");
				return false;	//the profile doesn't exits
			}
			
			//make sure that the users are already friends
			selectQuery = "SELECT * FROM Friendships WHERE "+
				"(userId1="+user1+" and userId2 = "+user2 +" ) "+
				"or ( userId1 = "+user2+" and userId2 = "+user1+" )";
			resultSet = statement.executeQuery(selectQuery);
			if(!resultSet.next() ){
				System.out.println("These peeps haven't requested to be friends yet");
				return false;
			}

			String updateFriend = "update Friendships set status = 1 where (userId1 = ? and userId2 = ?)";
			
			prepStatement = connection.prepareStatement(updateFriend);
			prepStatement.setLong(1, user1);
			prepStatement.setLong(2, user2);
			
			prepStatement.executeUpdate();
			
			query = "insert into Friendships values (?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
			java.sql.Date sent = new java.sql.Date( df.parse( date ).getTime() );
			
			prepStatement.setLong(1, user2); 
			prepStatement.setLong(2, user1);
			prepStatement.setInt(3, 1);
			prepStatement.setDate(4, sent);
			
			prepStatement.executeUpdate();
			
			System.out.println("Friendship successfully established");
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error establishing friendship.  Machine Error: " + Ex.toString());
		}
		catch (ParseException e) {
			System.out.println("Error parsing the date. Machine Error: " +
			e.toString());
		}
		return false;
	}
	
	public boolean displayFriends(String fname, String lname){
		long user = getUserID(fname,lname);
		try{
			//Make sure that the users already have profiles
			String selectQuery = "SELECT * FROM  Profiles WHERE userID = "+user;
			resultSet = statement.executeQuery(selectQuery);
			if(!resultSet.next()) {
				System.out.println("user1 does not exist");
				return false;	//the profile doesn't exits
			}
			
			//grabbing the established friends
			selectQuery = "SELECT userId,fname,lname,status FROM Profiles "
			+ "RIGHT JOIN (SELECT userId2,status FROM Friendships WHERE userId1=" +user+ ") t2 "
			+ "ON Profiles.userId = t2.userId2";
			resultSet = statement.executeQuery(selectQuery);
			if(!resultSet.next() ){
				System.out.println("This user doesn't have any friends");
				return false;
			}
			resultSet.first();
			
			System.out.println("Displaying " + fname + " " + lname + "'s friends");
			String user2FName = "";
			String user2LName = "";
			long user2Id = 0;
			int user2Status = -1;
			String status, output;
			do {
				user2Id = resultSet.getLong(1);
				user2FName = resultSet.getString(2);
				user2LName = resultSet.getString(3);
				user2Status = resultSet.getInt(4);
				if(user2Status == 1){
					status = "Established";
				}
				else{
					status = "Pending";
				}
				
				output = user2FName + " " + user2LName +"\tUser ID: " + user2Id + "\tStatus: " + status;
				
				System.out.println(output);
			}
			while(resultSet.next());
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error displaying friendships.  Machine Error: " + Ex.toString());
		}
		return false;
	}
	
	public boolean createGroup (String gname, String description, int limit){
	
		try{	
			query = "insert into Groups (groupId,gname,description,members,memlimit) values (?,?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			
			//Make a unique userID
			Random rand = new Random();
			long id;
			while( true ){
				id = (long)rand.nextInt( 100000000 );
				String isItUnique = "SELECT * FROM Groups WHERE groupId = " + id;
				resultSet = statement.executeQuery( isItUnique );
				if( resultSet.next() ){
					continue;
				}
				else{ break; }
			}
			prepStatement.setLong(1, id); 
			prepStatement.setString(2, gname);
			prepStatement.setString(3, description );
			prepStatement.setInt(4, 0);
			prepStatement.setInt(5, limit);
			
			prepStatement.executeUpdate();
			
			String selectQuery = "SELECT * FROM  Groups WHERE groupId = " + id;
	    
			resultSet = statement.executeQuery(selectQuery); //run the query on the DB table
			while (resultSet.next()) {
				//the group was successfully created.
				System.out.println("Group successfully created");
				return true;
			}
			return false;
		}
		catch(SQLException Ex) {
			System.out.println("Error creating group.  Machine Error: " + Ex.toString());
		} 
		return false;
	}
	
	public long getGroupID( String gname ){
		long result = -1;
		try{
			String selectQuery = "SELECT groupId FROM  Groups WHERE  gname = '"+gname+"'";
			resultSet = statement.executeQuery(selectQuery);
						
			while(resultSet.next()) {
				result = resultSet.getLong(1);
				return result;
			}
			System.out.println("groupID not found");
			return -1;
		}
		catch(SQLException Ex) {
			System.out.println("Error getting group ID.  Machine Error: " + Ex.toString());
		} 
		return -1;
	}
	
	public boolean addToGroup ( long userID, long groupID ){
		try{
			//check to see if the group member limit is not reached
			query = "select members,memlimit from Groups where groupID = "+groupID;
			resultSet = statement.executeQuery( query );
			if( !resultSet.next() ){
				return false;
			}
			long member_count = resultSet.getLong(1);
			int member_limit = resultSet.getInt(2);
			if( member_count > member_limit ){
				System.out.println("The Group Limit has been reached.");
				return false;
			}
			
			//add new member to group table
			query = "update Groups set members = ? where groupId = ?";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setLong(1, member_count + 1);
			prepStatement.setLong(2, groupID);
			prepStatement.executeUpdate();
			//System.out.println("updataed");
			
			//add new row in groupmembers table
			query = "insert into GroupMembers values( ?, ? )";
			prepStatement = connection.prepareStatement(query);
			prepStatement.setLong(1, groupID);
			prepStatement.setLong(2, userID);
			prepStatement.executeUpdate();
			System.out.println("The user has been added to the group.");
			
			return true;
		}
		catch(SQLException Ex){
			System.out.println("Error adding to group.  Machine Error: "+Ex.toString());
		}
		return false;
	}
	
	public boolean sendMessageToUser( String sub, String body, long recipient, long sender){
		try{	
			query = "insert into Messages values (?,?,?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			
			//Make a unique message
			Random rand = new Random();
			long id;
			while( true ){
				id = (long)rand.nextInt( 100000000 );
				String isItUnique = "SELECT * FROM Messages WHERE msgId = " + id;
				resultSet = statement.executeQuery( isItUnique );
				if( resultSet.next() ){
					continue;
				}
				else{ break; }
			}
			prepStatement.setLong(1, id); 
			prepStatement.setLong(2, sender);
			prepStatement.setLong(3, recipient );
			prepStatement.setString(4, sub);
			prepStatement.setString(5, body);
			java.util.Date today = new java.util.Date();
			java.sql.Timestamp t = new java.sql.Timestamp(today.getTime());
			prepStatement.setTimestamp(6, t );
			
			prepStatement.executeUpdate();
			System.out.println("Your message has been sent");
			
			return true;
		}
		catch(SQLException Ex){
			System.out.println("Error sending a message to a user.  Machine Error: "+Ex.toString());
		}
		return false;
	}
	
	public boolean displayMessages( long userID ){
		try{
			String selectQuery = "select sender,subject,body,sent_date,fname,lname from messages left join (select userId,fname,lname from profiles)p on messages.receiver = p.userId WHere receiver=" + userID;
			resultSet = statement.executeQuery(selectQuery); 
			if(resultSet.next()){
				resultSet.previous();
				while (resultSet.next()) {
					String subject = resultSet.getString(2);
					String body = resultSet.getString(3);
					java.sql.Timestamp t = resultSet.getTimestamp(4);
					String fname = resultSet.getString(5);
					String lname = resultSet.getString(6);
					String name = fname + " " + lname;
					
					//output the message to the standard out
					System.out.println("\n"+name+" sent:");
					System.out.println("Subject: "+subject);
					System.out.println("Body: " + body);
					System.out.println("On: "+t.toString());
				}
				return true;
			}
			System.out.println("No messages sent to this user");
		}
		catch(SQLException Ex) {
			System.out.println("Error getting displaying message.  Machine Error: " + Ex.toString());
		} 
		return false;
	}
	
	public boolean searchForUser (String search){
		try{
			//Spilt the search terms
			String[] terms = search.split(" ");
			long userId = 0;
			String userFName = "";
			String userLName = "";
			String userEmail = "";
			String output;
			
			for(int i = 0; i < terms.length; i++){
				System.out.println("");
				String selectQuery = "SELECT userId,fname,lname,email FROM Profiles WHERE (fname LIKE \'%" + terms[i] + "%\' OR lname LIKE \'%" + terms[i] + "%\'OR email LIKE \'%" + terms[i] + "%\')";
				resultSet = statement.executeQuery(selectQuery);
				if(!resultSet.next() ){
					System.out.println("The term '"+terms[i]+"' is no where to be found");
					continue;
				}
				resultSet.first();
				System.out.println("Displaying results for the term " + terms[i]);
				
				do {
					userId = resultSet.getLong(1);
					userFName = resultSet.getString(2);
					userLName = resultSet.getString(3);
					userEmail = resultSet.getString(4);
				
					output = userFName + " " + userLName +"\tUser ID: " + userId + "\tEmail: " + userEmail;
				
					System.out.println(output+"\n");
					
				}
				while(resultSet.next());
			}
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error displaying search results.  Machine Error: " + Ex.toString());
		}
		return false;
	}
	
	public boolean topMessengers (int months, int num){
		try{
				int smallMonths = months % 12;
				int years = months / 12;
				String date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
				int dlYear = Integer.parseInt(date.substring(0,4)) - years; //Getting the current year and subtracting it by however many need to make dead line for top messages
				int dlMonth = Integer.parseInt(date.substring(5,7)) - smallMonths;//Same with statement above just with months
				int dlDay = Integer.parseInt(date.substring(8,10));
				if(dlMonth <= 0){
					dlMonth += 12;
					dlYear--;
				}
				
				String deadline = String.format("%04d-%02d-%02d",dlYear,dlMonth,dlDay);
				System.out.println(deadline);
				
				System.out.println("");
				String selectQuery = "select fname,lname, t.total "
								   + "from ( "
								   		+ "select sender as UserId, (c_sender+c_receiver) as Total "
								   		+ "from ( "
								   			+ "select sender,count(sender) as c_sender "
								   			+ "from messages "
								   			+ "where sent_date between to_date('"+deadline+"','YYYY-MM-DD') and to_date('"+date+"','YYYY-MM-DD') "
								   			+ "group by sender ";
				String selectQuery2  = ")t1 join ( "
								   			+ "select receiver,count(receiver) as c_receiver "
								   			+ "from messages "
								   			+ "where sent_date between to_date('"+deadline+"','YYYY-MM-DD') and to_date('"+date+"','YYYY-MM-DD') "
								   			+ "group by receiver "
								   		+ ")t2 "
								   		+ "on t1.sender = t2.receiver "
								   		+ "order by total desc "
								   	+ ")t join Profiles "
								   	+ "on t.userID = profiles.userid "
								   	+ "where rownum <= " + num;
			
				resultSet = statement.executeQuery(selectQuery + selectQuery2);
				if(!resultSet.next() ){
					System.out.println("There are no messages");
					return false;
				}
				resultSet.first();
				
				String userFName;
				String userLName;
				int messageCount;
				
				System.out.println("Displaying the top" + num + " messengers for the past " + months + " months");
				do {
					userFName = resultSet.getString(1);
					userLName = resultSet.getString(2);
					messageCount = resultSet.getInt(3);
				
					String output = userFName + " " + userLName +"\tTotal Messages Sent or Received: " + messageCount;
					System.out.println(output+"\n");
					
				}
				while(resultSet.next());
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error displaying top messengers.  Machine Error: " + Ex.toString());
		}
		return false;
	}
}