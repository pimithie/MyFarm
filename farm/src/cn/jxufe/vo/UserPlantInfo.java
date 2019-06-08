package cn.jxufe.vo;

public class UserPlantInfo {
	
	/**
	 * 种哪种作物
	 */
	private int seedId;
	
	/**
	 * 哪块地
	 */
	private int landId;
	
	/**
	 * 土地的类型
	 */
	private String landType;

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

	public String getLandType() {
		return landType;
	}

	public void setLandType(String landType) {
		this.landType = landType;
	}

	@Override
	public String toString() {
		return "UserPlantInfo [seedId=" + seedId + ", landId=" + landId + ", landType=" + landType + "]";
	}
	
}
