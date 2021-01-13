package com.sic.pdm.vo.or;

import java.util.Date;

public class RefounddetailVo {

	private String onum;
	private String id;
	private String reason;
	private Date odate;

	public RefounddetailVo() {

	}

	public RefounddetailVo(String onum, String id, String reason, Date odate) {
		super();
		this.onum = onum;
		this.id = id;
		this.reason = reason;
		this.odate = odate;
	}

	@Override
	public String toString() {
		return "RefounddetailVo [onum=" + onum + ", id=" + id + ", reason=" + reason + ", odate=" + odate + "]";
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

}
