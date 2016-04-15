//Nick DeFranco & Peter Schaldenbrand
//CS 1555 Database Management Project

import java.io.*;
import java.util.*;

public class FaceSpaceDriver{
	public static void main(String[] args) throws IOException {
		FaceSpace fs = new FaceSpace();
		fs.createUser( "peter","schaldenbrand","pls21@pitt.edu","1995-07-16");
		fs.createUser( "nick","defranco","asaf@pitt.edu","1996-07-16");
		long u1 = fs.getUserID("peter","schaldenbrand");
		long u2 = fs.getUserID("nick","defranco");
		fs.initiateFriendship( u1, u2 );
		fs.establishFriendship( u1, u2 );
		
	}
}