package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="user_seed_asset")
@Entity
public class UserSeedAsset extends EntityID{
	
	/**
	 * 用户id
	 */
	private long userId;
	
	private long seedId;
	
	private int countOfSeed;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getSeedId() {
		return seedId;
	}

	public void setSeedId(long seedId) {
		this.seedId = seedId;
	}

	public int getCountOfSeed() {
		return countOfSeed;
	}

	public void setCountOfSeed(int countOfSeed) {
		this.countOfSeed = countOfSeed;
	}
	
}
