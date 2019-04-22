package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="user_seed_asset")
@Entity
public class UserSeedAsset extends EntityID{

	private int userId;
	
	private int seedId;
	
	private int countOfSeed;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSeedId() {
		return seedId;
	}

	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}

	public int getCountOfSeed() {
		return countOfSeed;
	}

	public void setCountOfSeed(int countOfSeed) {
		this.countOfSeed = countOfSeed;
	}
	
}
