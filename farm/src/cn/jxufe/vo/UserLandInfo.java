package cn.jxufe.vo;

import cn.jxufe.entity.GrowStage;
import cn.jxufe.entity.Seed;

public class UserLandInfo {
	
	private int landId;
	
	private Seed seed;
	
	private String matureTime;
	
	public String getMatureTime() {
		return matureTime;
	}

	public void setMatureTime(String matureTime) {
		this.matureTime = matureTime;
	}

	public Seed getSeed() {
		return seed;
	}

	public void setSeed(Seed seed) {
		this.seed = seed;
	}

	public int getLandId() {
		return landId;
	}

	public void setLandId(int landId) {
		this.landId = landId;
	}

}
