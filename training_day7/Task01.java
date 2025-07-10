package training_day7;

class Th1 extends Thread {
	public void run(){
		for(int i = 10; i > 0; i--) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}

public class Task01 {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		Th1 obj = new Th1();
	    obj.setName("Count Down");
	    System.out.println(obj.getName());
		System.out.println("Tread Status : "+obj.isAlive());
		obj.start();
		System.out.println("Tread Status : "+obj.isAlive());
		
		obj.join();
		System.out.println("Thank You !");
	}

}
