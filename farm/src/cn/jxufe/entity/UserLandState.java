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
	 * 土地Id，获取对应的土地类型等信息
	 */
	private int landId;
	
	/**
	 * 当前土地所种作物的Id，（seed id）
	 */
	private int currentCropId;
	
	/**
	 * 当前土地是否有害虫
	 */
	private boolean hasInsect;
	
	/**
	 * 当前作物所处成长阶段的Id
	 */
	private int currentGrowStageId;
	
	/*------用于在用户离线后进行对应的时间处理--------------*/
	/**
	 * 从当前阶段到下一阶段所需的时间
	 */
	private long nextStageNeedTime;
	
	/**
	 * 用户关闭浏览器的时间
	 */
	private long closeBrowerTime;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getLandId() {
		return landId;
	}
	public void setLandId(int landId) {
		this.landId = landId;
	}
	public int getCurrentCropId() {
		return currentCropId;
	}
	public void setCurrentCropId(int currentCropId) {
		this.currentCropId = currentCropId;
	}
	public boolean isHasInsect() {
		return hasInsect;
	}
	public void setHasInsect(boolean hasInsect) {
		this.hasInsect = hasInsect;
	}
	public int getCurrentGrowStageId() {
		return currentGrowStageId;
	}
	public void setCurrentGrowStageId(int currentGrowStageId) {
		this.currentGrowStageId = currentGrowStageId;
	}
	public long getNextStageNeedTime() {
		return nextStageNeedTime;
	}
	public void setNextStageNeedTime(long nextStageNeedTime) {
		this.nextStageNeedTime = nextStageNeedTime;
	}
	public long getCloseBrowerTime() {
		return closeBrowerTime;
	}
	public void setCloseBrowerTime(long closeBrowerTime) {
		this.closeBrowerTime = closeBrowerTime;
	}
	
	

}
