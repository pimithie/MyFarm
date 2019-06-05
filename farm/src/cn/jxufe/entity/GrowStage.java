package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Table(name="growStage")
@Entity
public class GrowStage extends EntityID{

	private int seedId;

	private int growStageId;

	private String growStageName;

	private int stageNeedTime;

	private float insectProbability;

	private int picWidth;
	
	private int picHeight;
	
	private int offsetX;
	
	private int offsetY;
	
	private String cropStage;

	public int getSeedId() {
		return seedId;
	}

	public void setSeedId(int seedId) {
		this.seedId = seedId;
	}

	public int getGrowStageId() {
		return growStageId;
	}

	public void setGrowStageId(int growStageId) {
		this.growStageId = growStageId;
	}

	public String getGrowStageName() {
		return growStageName;
	}

	public void setGrowStageName(String growStageName) {
		this.growStageName = growStageName;
	}

	public int getStageNeedTime() {
		return stageNeedTime;
	}

	public void setStageNeedTime(int stageNeedTime) {
		this.stageNeedTime = stageNeedTime;
	}

	public float getInsectProbability() {
		return insectProbability;
	}

	public void setInsectProbability(float insectProbability) {
		this.insectProbability = insectProbability;
	}

	public int getPicWidth() {
		return picWidth;
	}

	public void setPicWidth(int picWidth) {
		this.picWidth = picWidth;
	}

	public int getPicHeight() {
		return picHeight;
	}

	public void setPicHeight(int picHeight) {
		this.picHeight = picHeight;
	}

	public int getOffsetX() {
		return offsetX;
	}

	public void setOffsetX(int offsetX) {
		this.offsetX = offsetX;
	}

	public int getOffsetY() {
		return offsetY;
	}

	public void setOffsetY(int offsetY) {
		this.offsetY = offsetY;
	}

	public String getCropStage() {
		return cropStage;
	}

	public void setCropStage(String cropStage) {
		this.cropStage = cropStage;
	}

	
}
