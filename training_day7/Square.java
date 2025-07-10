package training_day7;

public class Square extends Thread {
	public void run() {
		for(int i = 1; i <= 5; i++) {
			System.out.println("Square of "+i+" is : "+Math.pow(i, 2));
			
		}
	}
}
