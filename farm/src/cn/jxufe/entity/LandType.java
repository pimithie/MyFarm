package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Entity
@Table(name="landType")
public class LandType extends EntityID{
	
	private String landTypeName;

	public String getLandTypeName() {
		return landTypeName;
	}

	public void setLandTypeName(String landTypeName) {
		this.landTypeName = landTypeName;
	}
	
}
