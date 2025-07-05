package traning_day4;

import java.util.Scanner;

class University {
	String Uni_name = "Dr.Babasaheb Ambedkar University";
	void displayUniversityInfo() {
		System.out.println("University name is : "+Uni_name);
	}
}

class College extends University {
	String College_name = "R.C.Patel Institute of Technology";
	void displayCollege() {
		System.out.println("College name is : "+College_name);
	}
}

class Student extends College {
	String name;
	String RollNo;
	int Mark1,Mark2,Mark3;
	
	void getStudentInfo(String name, String RollNo, int Mark1, int Mark2, int Mark3) {
		this.name = name;
		this.RollNo = RollNo;
		this.Mark1 = Mark1;
		this.Mark2 = Mark2;
		this.Mark3 = Mark3;
	}
	
	double calculatePercentage() {
		int total = Mark1+Mark2+Mark3;
		return total/3.0;
	}
	
	void displayStudentInfo() {
		displayUniversityInfo();
		displayCollege();
		System.out.println("Student name is : "+name);
		System.out.println("Student Roll Number is : "+RollNo);
		System.out.println("Student Percentage : "+calculatePercentage());
		
		
	}
}

public class Problem01 {
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.println("Enter Student Name : ");
		String name = s.nextLine();
		
		System.out.println("Enter Your Roll Number : ");
		String rollno = s.nextLine();
		
		System.out.println("Enter Marks (only 3) : ");
		int Mark1 = s.nextInt();
		int Mark2 = s.nextInt();
		int Mark3 = s.nextInt();

		Student obj = new Student();
		
		obj.getStudentInfo(name,rollno,Mark1,Mark2,Mark3);
		obj.displayStudentInfo();

	

	}

}
