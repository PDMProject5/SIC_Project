package com.sic.pdm.model.or;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

@Service
public class Refound_ServiceImpl implements Refound_IService {
	
	@Autowired
	private Refound_IDao iDao;

	@Override
	public List<RefoundVo> refoundList() {
		return iDao.refoundList();
	}
	
	@Override
	public RefounddetailVo refoundDetail() {
		return iDao.refoundDetail();
	}

	@Override
	public boolean refoundModify(String onum) {
		return iDao.refoundModify(onum);
	}

	@Override
	public boolean refoundApprove(String onum) {
		return iDao.refoundApprove(onum);
	}

	@Override
	public boolean refoundRefuse(String onum) {
		return iDao.refoundRefuse(onum);
	}

	

}
