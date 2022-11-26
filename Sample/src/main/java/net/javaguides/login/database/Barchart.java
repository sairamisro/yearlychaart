package net.javaguides.login.database;

import java.util.List;

public class Barchart {

	private String id;
	private String name;
	private String parent;
	private String y1;
	private String y2;
	private List<String> y;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getY1() {
		return y1;
	}

	public void setY1(String y1) {
		this.y1 = y1;
	}

	public String getY2() {
		return y2;
	}

	public void setY2(String y2) {
		this.y2 = y2;
	}

	public List<String> getY() {
		return y;
	}

	public void setY(List<String> y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Barchart [id=" + id + ", name=" + name + ", parent=" + parent + ", y1=" + y1 + ", y2=" + y2 + ", y=" + y
				+ "]";
	}

	

	
}