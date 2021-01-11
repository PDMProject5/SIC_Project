package com.sic.pdm.vo.user;

public class SellerVo {
	private String sellerid;
	private String sellerpw;
	private String store;
	private String storephone;
	private String beaconmajor;
	
	public SellerVo() {
	}

	@Override
	public String toString() {
		return "SellerVo [sellerid=" + sellerid + ", sellerpw=" + sellerpw + ", store=" + store + ", storephone="
				+ storephone + ", beaconmajor=" + beaconmajor + "]";
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public String getSellerpw() {
		return sellerpw;
	}

	public void setSellerpw(String sellerpw) {
		this.sellerpw = sellerpw;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getStorephone() {
		return storephone;
	}

	public void setStorephone(String storephone) {
		this.storephone = storephone;
	}

	public String getBeaconmajor() {
		return beaconmajor;
	}

	public void setBeaconmajor(String beaconmajor) {
		this.beaconmajor = beaconmajor;
	}
	
}
