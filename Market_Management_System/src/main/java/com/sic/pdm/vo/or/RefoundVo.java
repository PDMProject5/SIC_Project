package com.sic.pdm.vo.or;

import java.util.Date;

public class RefoundVo {
	
	private String onum  ;
	private String id    ;
	private String store ;
	private Date odate ;
	private String ostate;
	
	public RefoundVo() {
		
	}
	public RefoundVo(String onum, String id, String store, Date odate, String ostate) {
		super();
		this.onum = onum;
		this.id = id;
		this.store = store;
		this.odate = odate;
		this.ostate = ostate;
	}
	@Override
	public String toString() {
		return "RefoundDto [onum=" + onum + ", id=" + id + ", store=" + store + ", odate=" + odate + ", ostate="
				+ ostate + "]";
	}
	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getOstate() {
		return ostate;
	}
	public void setOstate(String ostate) {
		this.ostate = ostate;
	}
	
	

}
