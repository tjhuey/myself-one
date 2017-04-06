package org.tjhuey.manager.pojo;

import java.util.Date;

public class t_supervisors {
    private Long id;

    private Date time;

    private String name;

    private String realityName;

    private String password;

    private Integer passwordContinuousErrors;

    private Boolean isPasswordErrorLocked;

    private Date passwordErrorLockedTime;

    private Boolean isAllowLogin;

    private Long loginCount;

    private Date lastLoginTime;

    private String lastLoginIp;

    private Date lastLogoutTime;

    private String lastLoginCity;

    private String email;

    private String telephone;

    private String mobile1;

    private String mobile2;

    private String officeTelephone;

    private String faxNumber;

    private Byte sex;

    private Date birthday;

    private Byte level;

    private Boolean isErased;

    private Long createrId;

    private String ukey;

    private Boolean isCustomer;

    private String customerNum;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRealityName() {
        return realityName;
    }

    public void setRealityName(String realityName) {
        this.realityName = realityName == null ? null : realityName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getPasswordContinuousErrors() {
        return passwordContinuousErrors;
    }

    public void setPasswordContinuousErrors(Integer passwordContinuousErrors) {
        this.passwordContinuousErrors = passwordContinuousErrors;
    }

    public Boolean getIsPasswordErrorLocked() {
        return isPasswordErrorLocked;
    }

    public void setIsPasswordErrorLocked(Boolean isPasswordErrorLocked) {
        this.isPasswordErrorLocked = isPasswordErrorLocked;
    }

    public Date getPasswordErrorLockedTime() {
        return passwordErrorLockedTime;
    }

    public void setPasswordErrorLockedTime(Date passwordErrorLockedTime) {
        this.passwordErrorLockedTime = passwordErrorLockedTime;
    }

    public Boolean getIsAllowLogin() {
        return isAllowLogin;
    }

    public void setIsAllowLogin(Boolean isAllowLogin) {
        this.isAllowLogin = isAllowLogin;
    }

    public Long getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Long loginCount) {
        this.loginCount = loginCount;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp == null ? null : lastLoginIp.trim();
    }

    public Date getLastLogoutTime() {
        return lastLogoutTime;
    }

    public void setLastLogoutTime(Date lastLogoutTime) {
        this.lastLogoutTime = lastLogoutTime;
    }

    public String getLastLoginCity() {
        return lastLoginCity;
    }

    public void setLastLoginCity(String lastLoginCity) {
        this.lastLoginCity = lastLoginCity == null ? null : lastLoginCity.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getMobile1() {
        return mobile1;
    }

    public void setMobile1(String mobile1) {
        this.mobile1 = mobile1 == null ? null : mobile1.trim();
    }

    public String getMobile2() {
        return mobile2;
    }

    public void setMobile2(String mobile2) {
        this.mobile2 = mobile2 == null ? null : mobile2.trim();
    }

    public String getOfficeTelephone() {
        return officeTelephone;
    }

    public void setOfficeTelephone(String officeTelephone) {
        this.officeTelephone = officeTelephone == null ? null : officeTelephone.trim();
    }

    public String getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(String faxNumber) {
        this.faxNumber = faxNumber == null ? null : faxNumber.trim();
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }

    public Boolean getIsErased() {
        return isErased;
    }

    public void setIsErased(Boolean isErased) {
        this.isErased = isErased;
    }

    public Long getCreaterId() {
        return createrId;
    }

    public void setCreaterId(Long createrId) {
        this.createrId = createrId;
    }

    public String getUkey() {
        return ukey;
    }

    public void setUkey(String ukey) {
        this.ukey = ukey == null ? null : ukey.trim();
    }

    public Boolean getIsCustomer() {
        return isCustomer;
    }

    public void setIsCustomer(Boolean isCustomer) {
        this.isCustomer = isCustomer;
    }

    public String getCustomerNum() {
        return customerNum;
    }

    public void setCustomerNum(String customerNum) {
        this.customerNum = customerNum == null ? null : customerNum.trim();
    }
}