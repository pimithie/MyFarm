package cn.jxufe.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * singleton factory
 */
public class GrowStageCategoryFactory {
	
	private final static GrowStageCategory seedStage = new GrowStageCategory("种子阶段");
	private final static GrowStageCategory growingStage = new GrowStageCategory("生长阶段");
	private final static GrowStageCategory matureStage = new GrowStageCategory("成熟阶段");
	private final static GrowStageCategory finalStage = new GrowStageCategory("枯草期");
	private final static List<GrowStageCategory> allStage;
	
	static {
		allStage = new ArrayList<>();
		allStage.add(seedStage);
		allStage.add(growingStage);
		allStage.add(matureStage);
		allStage.add(finalStage);
	}
	private GrowStageCategoryFactory() {}
	
	public static List<GrowStageCategory> getAllGrowStageCategory() {
		return allStage;
	}
	
	public static class GrowStageCategory {
		
		private String cropStage;
		
		public GrowStageCategory(String cropStage) {
			super();
			this.cropStage = cropStage;
		}

		public String getCropStage() {
			return cropStage;
		}

		public void setCropStage(String cropStage) {
			this.cropStage = cropStage;
		}
		
	}
	
}
