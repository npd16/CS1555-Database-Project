//Nick DeFranco & Peter Schaldenbrand
//CS 1555 Database Management Project

import java.io.*;
import java.util.*;

public class FaceSpaceDriver{
	public static void main(String[] args) throws IOException {
		Scanner in = new Scanner(System.in);
		FaceSpace fs;
		
		System.out.print("Please enter your oracle username: ");
		String username = in.nextLine();
		System.out.print("Please enter your oracle password: ");
		String password = in.nextLine();
		fs = new FaceSpace(username,password);
		
		while(true){
			System.out.println("\nWelcome to FaceSpace Database Management Program");
			System.out.println("Please enter one of the follow commands");
			System.out.println("" 
			+ "1: Create new user\n"
			+ "2: Initiate a friendship\n"
			+ "3: Establish a friendship\n"
			+ "4: Display a user's friends\n"
			+ "5: Create new group\n"
			+ "6: Add a user to a group\n"
			+ "7: Send a message to a user\n"
			+ "8: Display the messages sent to a user\n"
			+ "9: Search for a user\n"
			+ "10: Find a friend\n"
			+ "11: Top Messengers\n"
			+ "12: Drop a user\n"
			+ "0: Runs through all of the functions\n"
			+ "-1: Exits the system");
		
		
			int command = -2;
			if(in.hasNextInt()){
				command = in.nextInt();
			}
			switch(command) {
				case 1:
					function1(fs, in);
					break;
				case 2:
					function2(fs,in);
					break;
				case 3:
					function3(fs,in);
					break;
				case 4:
					function4(fs,in);
					break;
				case 5:
					function5(fs,in);
					break;
				case 6:
					function6(fs, in);
					break;
				case 7:
					function7(fs,in);
					break;
				case 8:
					function8(fs,in);
					break;
				case 9:
					function9(fs,in);
					break;
				case 10:
					function10(fs,in);
					break;
				case 11:
					function11(fs,in);
					break;
				case 12:
					function12(fs,in);
					break;					
				case 0:
					function0(fs);
					break;
				case -1:
					System.exit(0);
				default:
					System.out.println("Please enter a valid command");
				
			}
		}
	}
	
	private static void function1(FaceSpace fs, Scanner in){
		System.out.println("Creating a new user");
		System.out.println("Please enter the new user's first name");
		String fname = in.nextLine();
		fname = in.nextLine();
		System.out.println("Please enter the new user's last name");
		String lname = in.nextLine();
		System.out.println("Please enter the new user's email");
		String email = in.nextLine();
		System.out.println("Please enter the new user's birthday (YYYY-MM-DD Format)");
		String bday = in.nextLine();
		fs.createUser(fname,lname,email,bday);
		
	}
	
	private static void function2(FaceSpace fs, Scanner in){
		System.out.println("Creating a friendship between two users.");
		System.out.println("Please enter the first user's first name");
		String fname1 = in.nextLine();
		fname1 = in.nextLine();
		System.out.println("Please enter the first user's last name");
		String lname1 = in.nextLine();
		System.out.println("Please enter the second user's first name");
		String fname2 = in.nextLine();
		System.out.println("Please enter the second user's last name");
		String lname2 = in.nextLine();
		
		long u1 = fs.getUserID(fname1,lname1);
		long u2 = fs.getUserID(fname2,lname2);
		fs.initiateFriendship(u1, u2);
	}
	
	private static void function3(FaceSpace fs, Scanner in){
		System.out.println("If the two users have a pending friendship it will be established.");
		System.out.println("Please enter the first user's first name");
		String fname1 = in.nextLine();
		fname1 = in.nextLine();
		System.out.println("Please enter the first user's last name");
		String lname1 = in.nextLine();
		System.out.println("Please enter the second user's first name");
		String fname2 = in.nextLine();
		System.out.println("Please enter the second user's last name");
		String lname2 = in.nextLine();
		
		long u1 = fs.getUserID(fname1,lname1);
		long u2 = fs.getUserID(fname2,lname2);
		fs.establishFriendship(u1, u2);
	}

	private static void function4(FaceSpace fs, Scanner in){
		System.out.println("Displaying someone's friends");
		System.out.println("Please enter the user's first name");
		String fname = in.nextLine();
		fname = in.nextLine();
		System.out.println("Please enter the user's last name");
		String lname = in.nextLine();
		fs.displayFriends(fname,lname);
		
	}

	private static void function5(FaceSpace fs, Scanner in){
		System.out.println("Creating a new group");
		System.out.println("Please enter the new group's name");
		String gname = in.nextLine();
		gname = in.nextLine();
		System.out.println("Please enter the new group's description");
		String desc = in.nextLine();
		System.out.println("Please enter the new group's member limit");
		int limit = 1000;
		if(in.hasNextInt()){
			limit = in.nextInt();
		}
		fs.createGroup(gname,desc,limit);
	}
	
	private static void function6(FaceSpace fs, Scanner in){
		//TODO
	}

	private static void function7(FaceSpace fs, Scanner in){
		//TODO
	}
	
	private static void function8(FaceSpace fs, Scanner in){
		//TODO
	}
	
	private static void function9(FaceSpace fs, Scanner in){
		//TODO
	}
	
	private static void function10(FaceSpace fs, Scanner in){
		//TODO
	}

	private static void function11(FaceSpace fs, Scanner in){
		//TODO
	}
	
	private static void function12(FaceSpace fs, Scanner in){
		//TODO
	}
	
	private static void function0(FaceSpace fs){
		//Test createUser
		System.out.println("Creating Users");
		fs.createUser( "Peter","Schaldenbrand","pls21@pitt.edu","1995-07-16");
		fs.createUser( "Nick","DeFranco","npd16@pitt.edu","1994-06-14");
		
		//Test initiateFriendship
		System.out.println("Initiating Friendships");
		long u1 = fs.getUserID("Peter","Schaldenbrand");
		long u2 = fs.getUserID("Nick","DeFranco");
		fs.initiateFriendship( u1, u2 );
		
		//Test establishFriendship
		System.out.println("Establishing Friendships");
		fs.establishFriendship( u1, u2 );
		
		//Test displayFriends
		System.out.println("Displaying Friends");
		fs.displayFriends("Nick", "DeFranco");
		
		//Test createGroup
		System.out.println("Creating Group");
		fs.createGroup("Fan of Green Lantern","We think Green Lantern is the best superhero!",1000);
	}

}
