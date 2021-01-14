package com.sic.pdm.vo.mileage;

import java.util.Date;

public class MileageVo {

	private String mseq;
	private String id;
	private int mmoney;
	private Date mdate;
	private String mstate;

	public MileageVo() {
		
	}

	public MileageVo(String mseq, String id, int mmoney, Date mdate, String mstate) {
		super();
		this.mseq = mseq;
		this.id = id;
		this.mmoney = mmoney;
		this.mdate = mdate;
		this.mstate = mstate;
	}

	@Override
	public String toString() {
		return "MileageVo [mseq=" + mseq + ", id=" + id + ", mmoney=" + mmoney + ", mdate=" + mdate + ", mstate="
				+ mstate + "]";
	}

	public String getMseq() {
		return mseq;
	}

	public void setMseq(String mseq) {
		this.mseq = mseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMmoney() {
		return mmoney;
	}

	public void setMmoney(int mmoney) {
		this.mmoney = mmoney;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public String getMstate() {
		return mstate;
	}

	public void setMstate(String mstate) {
		this.mstate = mstate;
	}

}
