package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="seed")
@Entity
public class Seed extends EntityID {
	
	/**
	 * 种子ID
	 */
	private int seedId;
	
	/**
	 * 种子名称
	 */
	private String seedName;
	
	/**
	 * X季作物
	 */
	private int quarter;
	
	/**
	 * 种子等级
	 */
	private int seedLevel;
	
	/**
	 * 种子类型
	 */
	private String seedType;
	
	/**
	 * 收获所得经验
	 */
	private int harvestExp;
	
	/**
	 * 每一季的时间
	 */
	private int timePerQuarter;
	
	/**
	 * 每次收获的果实个数
	 */
	private int harvestNum;
	
	/**
	 * 种子价格
	 */
	private int seedPrice;
	
	/**
	 * 每个果实的利润
	 */
	private int profitPerFruit;
	
	/**
	 * 所需土地类型
	 */
	private String landType;
	
	/**
	 * 每一季可获得的积分
	 */
	private int pointPerQuarter;
	
	/**
	 * 提示
	 */
	private String tips;

	public int getSeedId() {
		return seedId;
	}

	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}

	public String getSeedName() {
		return seedName;
	}

	public void setSeedName(String seedName) {
		this.seedName = seedName;
	}

	public int getQuarter() {
		return quarter;
	}

	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}

	public int getSeedLevel() {
		return seedLevel;
	}

	public void setSeedLevel(int seedLevel) {
		this.seedLevel = seedLevel;
	}

	public String getSeedType() {
		return seedType;
	}

	public void setSeedType(String seedType) {
		this.seedType = seedType;
	}

	public int getHarvestExp() {
		return harvestExp;
	}

	public void setHarvestExp(int harvestExp) {
		this.harvestExp = harvestExp;
	}

	public int getTimePerQuarter() {
		return timePerQuarter;
	}

	public void setTimePerQuarter(int timePerQuarter) {
		this.timePerQuarter = timePerQuarter;
	}

	public int getHarvestNum() {
		return harvestNum;
	}

	public void setHarvestNum(int harvestNum) {
		this.harvestNum = harvestNum;
	}

	public int getSeedPrice() {
		return seedPrice;
	}

	public void setSeedPrice(int seedPrice) {
		this.seedPrice = seedPrice;
	}

	public int getProfitPerFruit() {
		return profitPerFruit;
	}

	public void setProfitPerFruit(int profitPerFruit) {
		this.profitPerFruit = profitPerFruit;
	}

	public String getLandType() {
		return landType;
	}

	public void setLandType(String landType) {
		this.landType = landType;
	}

	public int getPointPerQuarter() {
		return pointPerQuarter;
	}

	public void setPointPerQuarter(int pointPerQuarter) {
		this.pointPerQuarter = pointPerQuarter;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}
	
}
