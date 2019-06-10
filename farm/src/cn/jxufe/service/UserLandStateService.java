package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.UserLandState;

public interface UserLandStateService extends BasicCRUD<UserLandState>{
	
	public UserLandState findByUserIdAndLandId (int userId,int landId);
	
	public Message findByUserId(int userId);
	
}
