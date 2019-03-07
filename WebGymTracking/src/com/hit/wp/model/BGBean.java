package com.hit.wp.model;

public class BGBean {
	int r,g,p;
	
	/**
	 * get color r
	 * @return r color
	 */
	public int getR() {
		return r;
	}
	
	/**
	 * set color r
	 * @param r to set
	 */
	public void setR(int r) {
		this.r=r;
	}
	
	/**
	 * get color g
	 * @return g color
	 */
	public int getG() {
		return g;
	}
	
	/**
	 * set color g
	 * @param g to set
	 */
	public void setG(int g) {
		this.g=g;
	}
	
	/**
	 * get color p
	 * @return p color
	 */
	public int getP() {
		return r;
	}
	
	/**
	 * set color p
	 * @param p to set
	 */
	public void setP(int p) {
		this.p=p;
	}
	
	public BGBean() {
		r=255;
		g=255;
		p=255;
	}

}
