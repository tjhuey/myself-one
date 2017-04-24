package org.tjhuey.manager.pojo;

import java.io.Serializable;

/**
 * @author huey 地址信息
 */
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer addressId;//序号
	private String province;//省
	private String city;//城市
	private String detail;//详情

	public Address() {
		super();
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Address(Integer addressId, String province, String city, String detail) {
		super();
		this.addressId = addressId;
		this.province = province;
		this.city = city;
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", province=" + province + ", city=" + city + ", detail=" + detail
				+ "]";
	}

}
