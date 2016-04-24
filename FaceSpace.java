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
			
			statement = connection.createStatement();
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
			
			System.out.println("Displaying " + fname + " " + lname + "'s friends");
			String user2FName = "";
			String user2LName = "";
			long user2Id = 0;
			int user2Status = -1;
			String status, output;
			while(resultSet.next()){
				resultSet.previous();
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
				resultSet.next();
			}
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error displaying friendships.  Machine Error: " + Ex.toString());
		}
		return false;
	}
	
	public boolean createGroup (String gname, String description, int limit){
	
		try{	
			query = "insert into Groups (groupId,gname,description,members) values (?,?,?,?)";
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
			prepStatement.setInt(4, limit);
			
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
}