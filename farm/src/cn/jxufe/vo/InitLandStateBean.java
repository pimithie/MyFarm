package cn.jxufe.vo;

import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.Seed;

public class InitLandStateBean {
	
	private int fruitNum;
	
	private GrowStage growStage;
	
	private boolean hasInsect;
	
	private int landId;
	
	private Seed seed;
	
	private String matureTime;

	public int getFruitNum() {
		return fruitNum;
	}

	public void setFruitNum(int fruitNum) {
		this.fruitNum = fruitNum;
	}

	public GrowStage getGrowStage() {
		return growStage;
	}

	public void setGrowStage(GrowStage growStage) {
		this.growStage = growStage;
	}

	public boolean isHasInsect() {
		return hasInsect;
	}

	public void setHasInsect(boolean hasInsect) {
		this.hasInsect = hasInsect;
	}

	public int getLandId() {
		return landId;
	}

	public void setLandId(int landId) {
		this.landId = landId;
	}

	public Seed getSeed() {
		return seed;
	}

	public void setSeed(Seed seed) {
		this.seed = seed;
	}

	public String getMatureTime() {
		return matureTime;
	}

	public void setMatureTime(String matureTime) {
		this.matureTime = matureTime;
	}
	
}
