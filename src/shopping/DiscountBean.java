package shopping;

public class DiscountBean {
	private double amount, rate;

	// property amount 
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		System.out.println("setAmount()");
		this.amount = amount;
	}

	// property rate 
	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}
	
	// read-only property discount 
	public double getDiscount() {
		return  this.amount * this.rate / 100; 
	}

	 

}
