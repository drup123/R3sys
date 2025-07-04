package training_day3;


class Trial {
	int a,b,c;
	
	void set(int a, int b) {
		this.a = a;  // refer to instance variable
		this.b = b;
	}
	
	void add(){
		c = a+b;    // without this keyword it will give output as 0
		System.out.println(c);
	}
}

public class Demo_this {

	public static void main(String[] args) {
		
        Trial obj = new Trial();
        obj.set(50,79);
        obj.add();
        
	}

}
