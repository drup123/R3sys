package training_day7;

public class Cube extends Thread {
	public void run() {
		for(int i = 1; i <= 5; i++) {
			System.out.println("cube of "+i+" is : "+Math.pow(i, 3));
			
		}
	}
}
