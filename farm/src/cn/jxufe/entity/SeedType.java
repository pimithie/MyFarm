package cn.jxufe.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.jxufe.bean.EntityID;

@Entity
@Table(name="seedType")
public class SeedType extends EntityID{
	
	private String seedTypeName;

	public String getSeedTypeName() {
		return seedTypeName;
	}

	public void setSeedTypeName(String seedTypeName) {
		this.seedTypeName = seedTypeName;
	}
	
}
