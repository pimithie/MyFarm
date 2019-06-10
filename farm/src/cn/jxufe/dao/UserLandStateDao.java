package cn.jxufe.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.UserLandState;

@Repository
public interface UserLandStateDao extends JpaRepository<UserLandState, Long>{
	
	public UserLandState findByUserIdAndLandId(int userId,int landId);

	public List<UserLandState> findByUserId(int userId);
	
}
