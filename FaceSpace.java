//Nick DeFranco & Peter Schaldenbrand
//CS 1555 Database Management Project

import java.io.*;
import java.util.*;

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
	
	public FaceSpace(){}
	
	public boolean createUser ( String fn, String ln, String email, String dob ){
	
		try{
			statement = connection.createStatement(); //create an instance
			
			query = "insert into Profiles (userID,fname,lname,email,dob) values (?,?,?,?,?)";
			prepStatement = connection.prepareStatement(query);
			java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date birthday = new java.sql.Date (df.parse( dob ).getTime());
			
			///HEY MAKE A USERID BEFORE YOU SUBMIT THIS PROJECT
			Random rand;
			long uID = (long)rand.nextInt( 1000000000 );
			
			prepStatement.setLong(1, uID); 
			prepStatement.setString(2, fn);
			prepStatement.setString(3, ln );
			prepStatement.setString(4, email);
			prepStatement.setDate(5, birthday);
			
			prepStatement.executeUpdate();
			return true;
		}
		catch(SQLException Ex) {
			System.out.println("Error running the sample queries.  Machine Error: " + Ex.toString());
		} 
		catch (ParseException e) {
			System.out.println("Error parsing the date. Machine Error: " +
			e.toString());
		}
		return false;
	}
	public boolean initiateFriendship( String user1, String user2 ){
		return false;
	}
	public boolean establishFriendship( String user1, String user2 ){
		return false;
	}
}