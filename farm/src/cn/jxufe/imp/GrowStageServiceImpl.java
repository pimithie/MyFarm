package cn.jxufe.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.jxufe.bean.EasyUIData;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.GrowStageDao;
import cn.jxufe.entity.GrowStage;
import cn.jxufe.service.GrowStageService;

@Service
public class GrowStageServiceImpl implements GrowStageService {

	@Autowired
	private GrowStageDao growStageDao;
	
	@Override
	public EasyUIData<GrowStage> findAll(Pageable pageable) {
		EasyUIData<GrowStage> result = new EasyUIData<>();
		Page<GrowStage> page = growStageDao.findAll(pageable);
		System.out.println("page--Number:"+page.getNumber());
		System.out.println("page--NumberOfElements:"+page.getNumberOfElements());
		System.out.println("page--Size:"+page.getSize());
		System.out.println("page--TotalElements:"+page.getTotalElements());
		System.out.println("page--TotalPages:"+page.getTotalPages());
		System.out.println("page--Sort:"+page.getSort());
		result.setRows(page.getContent());
		result.setTotal(page.getTotalElements());
		return result;
	}

	@Override
	public Message save(GrowStage growStage) {
		GrowStage newGrowStage = growStageDao.save(growStage);
		Message message = new Message();
		// 200-->ok   400-->false
		message.setCode(newGrowStage == null?400:200);
		String msg = (newGrowStage == null) ? "增加失败":"增加成功";
		message.setMsg(msg);
		return message;
	}

	@Override
	public Message delete(GrowStage growStage) {
		growStageDao.delete(growStage);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("删除成功");
		return message;
	}

	@Override
	public Message update(GrowStage growStage) {
		growStageDao.save(growStage);
		Message message = new Message();
		message.setCode(200);
		message.setMsg("更新成功");
		return message;
	}

	@Override
	public Message findAll() {
		Message msg = new Message();
		List<GrowStage> list = growStageDao.findAll();
		msg.setData(list);
		msg.setCode(200);
		msg.setMsg("查询成功");
		return msg;
	}

	@Override
	public List<GrowStage> getGrowthData(int seedId) {
		return growStageDao.findBySeedId(seedId);
	}

	@Override
	public Message getNextImage(Integer seedId) {
		List<GrowStage> list = growStageDao.findBySeedId(seedId);
		int nextImage = Integer.MIN_VALUE;
		if (null == list || 0 == list.size()) {
			nextImage = 0;
		} else {
			for (GrowStage gs : list) {
				int tmp;
				nextImage = ((tmp = gs.getGrowStageId()) > nextImage)?tmp:nextImage;
			}
		}
		nextImage++;
		Message msg = new Message();
		msg.setCode(200);
		msg.setData(nextImage);
		msg.setMsg("查询成功");
		System.out.println("nextImage----->"+nextImage);
		System.out.println("seedId----->"+seedId);
		return msg;
	}

	@Override
	public GrowStage findBySeedIdAndGrowStageId(int seedId, int growStageId) {
		return growStageDao.findBySeedIdAndGrowStageId(seedId, growStageId);
	}

}
