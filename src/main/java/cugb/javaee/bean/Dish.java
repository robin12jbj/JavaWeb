package cugb.javaee.bean;

import java.math.BigDecimal;

public class Dish {
	@Override
	public String toString() {
		return "Dish [dishid=" + dishid + ", dishname=" + dishname + ", price=" + price + ", desc=" + descrp + ", imag="
				+ imag + "]";
	}
	private int dishid;	
	private String dishname;
	private BigDecimal price;
	private String descrp;
	private String imag;
	public int getDishid() {
		return dishid;
	}
	public void setDishid(int dishid) {
		this.dishid = dishid;
	}
	public String getDishname() {
		return dishname;
	}
	public void setDishname(String dishname) {
		this.dishname = dishname;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getDescrp() {
		return descrp;
	}
	public void setDescrp(String desc) {
		this.descrp = desc;
	}
	public String getImag() {
		return imag;
	}
	public void setImag(String imag) {
		this.imag = imag;
	}
}
