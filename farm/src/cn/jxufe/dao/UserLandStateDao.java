package cn.jxufe.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cn.jxufe.entity.UserLandState;

@Repository
public interface UserLandStateDao extends JpaRepository<UserLandState, Long>{

}
