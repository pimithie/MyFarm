package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="T_User")
@Entity
/**
 * 用户实体
 */
public class User extends EntityID{
	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 密码
	 */
	private String password = "123456";
	
	/**
	 * 经验
	 */
	private long userExp = 0L;
	
	/**
	 * 金币
	 */
	private long money = 100L;
	
	/**
	 * 头像图片路径
	 */
	private String headPic = "none.png";
	
	/**
	 * 当前用户的等级
	 */
	private int currentLevel = 0;
	
	/**
	 * VIP等级
	 */
	private int vipLevel = 0;
	
	/**
	 * 积分
	 */
	private int point = 0;

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

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", userExp=" + userExp + ", money=" + money
				+ ", headPic=" + headPic + ", currentLevel=" + currentLevel + ", vipLevel=" + vipLevel + ", point="
				+ point + "]";
	}
	
}
