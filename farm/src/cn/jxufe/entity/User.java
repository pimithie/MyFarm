package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="T_User")
@Entity
public class User extends EntityID{
	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 密码
	 */
	private String password;
	
	/**
	 * 经验
	 */
	private long userExp;
	
	/**
	 * 金币
	 */
	private long money;
	
	/**
	 * 头像图片路径
	 */
	private String headPic;
	
	/**
	 * 当前用户的等级
	 */
	private int currentLevel;
	
	/**
	 * VIP等级
	 */
	private int vipLevel;
	
	/**
	 * 积分
	 */
	private int point;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getUserExp() {
		return userExp;
	}

	public void setUserExp(long userExp) {
		this.userExp = userExp;
	}

	public long getMoney() {
		return money;
	}

	public void setMoney(long money) {
		this.money = money;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getCurrentLevel() {
		return currentLevel;
	}

	public void setCurrentLevel(int currentLevel) {
		this.currentLevel = currentLevel;
	}

	public int getVipLevel() {
		return vipLevel;
	}

	public void setVipLevel(int vipLevel) {
		this.vipLevel = vipLevel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
