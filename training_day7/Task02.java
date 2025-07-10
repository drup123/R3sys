package training_day7;

public class Task02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Square sqr = new Square();
		sqr.setPriority(Thread.MIN_PRIORITY);
		sqr.start();
		sqr.setName("Square of 1 to 5");
		System.out.println(sqr.getName());
		
		
		Cube c = new Cube();
		c.setPriority(Thread.NORM_PRIORITY);
		c.start();
		c.setName("Cube of 1 to 5");
		System.out.println(c.getName());
		
		
		Table tb = new Table();
		tb.setPriority(Thread.MAX_PRIORITY);
		tb.start();
		tb.setName("Table of 5");
		System.out.println(tb.getName());
		
		
		

	}

}
