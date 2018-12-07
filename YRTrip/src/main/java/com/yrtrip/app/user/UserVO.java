package com.yrtrip.app.user;

public class UserVO {
	private String userId;		//ID
	private String userPw;		//비밀번호
	private String userName;	//이름
	private String userGen;		//성별
	private String userPhone;	//연락처
	private String userBirth;	//생년월일
	private String userAddress;	//주소(생략가능-구매자일경우 입력)
	private String userEmail;	//이메일
	private int userStar;		//판매 평점 -> default:0
	private String userGrant;	//권한 -> default:user
	private String userAccount;	//계좌번호(생략가능-판매자일 경우 입력)
	private String userBank;	//은행정보(생략가능-판매자일 경우 입력)
	private String userDate;	//가입일 -> default:sysdate
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGen() {
		return userGen;
	}
	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserStar() {
		return userStar;
	}
	public void setUserStar(int userStar) {
		this.userStar = userStar;
	}
	public String getUserGrant() {
		return userGrant;
	}
	public void setUserGrant(String userGrant) {
		this.userGrant = userGrant;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserBank() {
		return userBank;
	}
	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userGen=" + userGen
				+ ", userPhone=" + userPhone + ", userBirth=" + userBirth + ", userAddress=" + userAddress
				+ ", userEmail=" + userEmail + ", userStar=" + userStar + ", userGrant=" + userGrant + ", userAccount="
				+ userAccount + ", userBank=" + userBank + ", userDate=" + userDate + "]";
	}
}