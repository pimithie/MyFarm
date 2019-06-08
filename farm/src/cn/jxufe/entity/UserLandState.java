package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="user_land_state")
@Entity
public class UserLandState extends EntityID {
	/**
	 * 用户Id
	 */
	private int userId;
	
	/**
	 * 种子Id，获取对应的土地类型等信息
	 */
	private int seedId;
	
	/**
	 * 土地Id，获取对应的土地类型等信息
	 */
	private int landId;
	
	/**
	 * 成长阶段Id
	 */
	private int growStageId;
	
	/**
	 * 当前土地是否有害虫
	 */
	private boolean hasInsect;
	
	/**
	 * 预期果实数
	 */
	private int fruitNum;

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

	public int getLandId() {
		return landId;
	}

	public void setLandId(int landId) {
		this.landId = landId;
	}

	public int getGrowStageId() {
		return growStageId;
	}

	public void setGrowStageId(int growStageId) {
		this.growStageId = growStageId;
	}

	public boolean isHasInsect() {
		return hasInsect;
	}

	public void setHasInsect(boolean hasInsect) {
		this.hasInsect = hasInsect;
	}

	public int getFruitNum() {
		return fruitNum;
	}

	public void setFruitNum(int fruitNum) {
		this.fruitNum = fruitNum;
	}
	
}
