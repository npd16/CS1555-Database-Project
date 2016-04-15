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
	
	public FaceSpace(){
		String username, password;
		username = "pls21"; //This is your username in oracle
		password = "3771162"; //This is your password in oracle
	
		try{
			System.out.println("Registering DB..");
			// Register the oracle driver.  
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
			//statement = connection.createStatement(); //create an instance
			
			query = "insert into Profiles (userID,fname,lname,email,dob) values (?,?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date birthday = new java.sql.Date (df.parse( dob ).getTime());
			
			//Make a unique userID
			Random rand = new Random();
			long uID;
			System.out.println("1");
			while( true ){
				uID = (long)rand.nextInt( 100000000 );
				String isItUnique = "SELECT * FROM Profiles WHERE userID = "+uID;
				resultSet = statement.executeQuery( isItUnique );
				if( resultSet.next() ){
					continue;
				}
				else{ break; }
			}
			System.out.println("2");
			prepStatement.setLong(1, uID); 
			prepStatement.setString(2, fn);
			prepStatement.setString(3, ln );
			prepStatement.setString(4, email);
			prepStatement.setDate(5, birthday);
			
			prepStatement.executeUpdate();
			System.out.println("3");
			
			String selectQuery = "SELECT * FROM  Profiles WHERE userID = "+uID;
	    
			resultSet = statement.executeQuery(selectQuery); //run the query on the DB table
			System.out.println("4");
			while (resultSet.next()) {
				//the profile was successfully created.
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
		try{
			String selectQuery = "SELECT * FROM  Profiles WHERE  fname="+fn+" and lname="+ln;
			resultSet = statement.executeQuery(selectQuery); 
			while (resultSet.next()) {
				return resultSet.getLong(1);
			}
			return -1;
		}
		catch(SQLException Ex) {
			System.out.println("Error creating profile.  Machine Error: " + Ex.toString());
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
			
			query = "insert into Friendships values (?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			//Date today = new Date();
			//today.setHours(0); today.setMinutes(0); today.setSeconds(0);
			String date = new java.text.SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date());
			java.sql.Date sent = new java.sql.Date( df.parse( date ).getTime() );
			
			prepStatement.setLong(1, user1_id); 
			prepStatement.setLong(2, user2_id);
			prepStatement.setLong(3, 0);
			prepStatement.setDate(4, sent);
			
			prepStatement.executeUpdate();
			return true;
			
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
	public boolean establishFriendship( String user1, String user2 ){
		return false;
	}
}