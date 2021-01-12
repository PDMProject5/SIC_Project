package com.sic.pdm.vo.product;

public class ProductVo {

	private String lcode;
	private String lname;
	private String mcode;
	private String mname;
	private String icode;
	private String iname;
	private String pcode;
	private String sellerid;
	private String rotnum;
	private String pdate;
	private String lifetime;
	private String stock;
	private String pstate;
	private String iprice;
	private String oprice;
	
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ProductVo [lcode=" + lcode + ", lname=" + lname + ", mcode=" + mcode + ", mname=" + mname + ", icode="
				+ icode + ", iname=" + iname + ", pcode=" + pcode + ", sellerid=" + sellerid + ", rotnum=" + rotnum
				+ ", pdate=" + pdate + ", lifetime=" + lifetime + ", stock=" + stock + ", pstate=" + pstate
				+ ", iprice=" + iprice + ", oprice=" + oprice + "]";
	}

	public String getLcode() {
		return lcode;
	}

	public void setLcode(String lcode) {
		this.lcode = lcode;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getIcode() {
		return icode;
	}

	public void setIcode(String icode) {
		this.icode = icode;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public String getRotnum() {
		return rotnum;
	}

	public void setRotnum(String rotnum) {
		this.rotnum = rotnum;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getLifetime() {
		return lifetime;
	}

	public void setLifetime(String lifetime) {
		this.lifetime = lifetime;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getPstate() {
		return pstate;
	}

	public void setPstate(String pstate) {
		this.pstate = pstate;
	}

	public String getIprice() {
		return iprice;
	}

	public void setIprice(String iprice) {
		this.iprice = iprice;
	}

	public String getOprice() {
		return oprice;
	}

	public void setOprice(String oprice) {
		this.oprice = oprice;
	}
	
}
