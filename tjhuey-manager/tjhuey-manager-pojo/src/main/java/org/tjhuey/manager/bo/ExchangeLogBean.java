package org.tjhuey.manager.bo;
/**
 * @包名 com.atguigu.jf.console.trigger.bean.bo
 * @类名 ExchangeLogBean.java
 * @作者 huey
 * @创建日期 Dec 3, 2016
 * @描述 积分导入流水的业务bean
 * @版本 V 1.0
 */
public class ExchangeLogBean {
	private String id;
	private String impDate;
	private String providerName;
	private String impPoint;
	private String rate;
	private String fee;
	private String amount;
	private String profit;
	private String exchangeState;
	private String exchangeDate;
	private String exportState;
	private String exportDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImpDate() {
		return impDate;
	}

	public void setImpDate(String impDate) {
		this.impDate = impDate;
	}

	public String getProviderName() {
		return providerName;
	}

	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}

	public String getImpPoint() {
		return impPoint;
	}

	public void setImpPoint(String impPoint) {
		this.impPoint = impPoint;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getProfit() {
		return profit;
	}

	public void setProfit(String profit) {
		this.profit = profit;
	}

	public String getExchangeState() {
		return exchangeState;
	}

	public void setExchangeState(String exchangeState) {
		this.exchangeState = exchangeState;
	}

	public String getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(String exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public String getExportState() {
		return exportState;
	}

	public void setExportState(String exportState) {
		this.exportState = exportState;
	}

	public String getExportDate() {
		return exportDate;
	}

	public void setExportDate(String exportDate) {
		this.exportDate = exportDate;
	}

	@Override
	public String toString() {
		return "ExchangeLogBean [id=" + id + ", impDate=" + impDate
				+ ", providerName=" + providerName + ", impPoint=" + impPoint
				+ ", rate=" + rate + ", fee=" + fee + ", amount=" + amount
				+ ", profit=" + profit + ", exchangeState=" + exchangeState
				+ ", exchangeDate=" + exchangeDate + ", exportState="
				+ exportState + ", exportDate=" + exportDate + "]";
	}

	
}
