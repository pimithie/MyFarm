package cn.jxufe.view;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Entity
@Table(name="seed_asset")
public class SeedAsset extends EntityID{

	private int countOfSeed;
	
	private long userId;
	
	private long seedId;
	
	private String seedName;
	
	private String seedImage;

	public int getCountOfSeed() {
		return countOfSeed;
	}

	public void setCountOfSeed(int countOfSeed) {
		this.countOfSeed = countOfSeed;
	}

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

	public String getSeedName() {
		return seedName;
	}

	public void setSeedName(String seedName) {
		this.seedName = seedName;
	}

	public String getSeedImage() {
		return seedImage;
	}

	public void setSeedImage(String seedImage) {
		this.seedImage = seedImage;
	}
	
	
}
