package com.sic.pdm.model.or;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.or.OrderVo;
import com.sic.pdm.vo.or.RefoundVo;
import com.sic.pdm.vo.or.RefounddetailVo;

@Repository
public class Refound_DaoImpl implements Refound_IDao {
	
	private final String NS = "com.sic.pdm.model.or.Refound_IDao.";
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<RefoundVo> refoundList() {
		List<RefoundVo> lists = null;
		logger.info("Refound_DaoImpl refoundList");
		lists = sqlsession.selectList(NS+"refoundList");
		return lists;
	}
	
	@Override
	public RefounddetailVo refoundDetail(Map<String, Object> map) {
		logger.info("Refound_DaoImpl refoundDetail");
		return sqlsession.selectOne(NS+"refoundDetail",map);
	}
	
	@Override
	public boolean refund(Map<String, Object> map) {
		logger.info("Refound_DaoImpl refund");
		int n = sqlsession.insert(NS+"refund",map);
		return n>0?true:false;
	}

	@Override
	public boolean refoundModify(String onum) {
		logger.info("Refound_DaoImpl refoundModify {}", onum);
		int n = sqlsession.update(NS+"refoundModify", onum);
		return n>0?true:false;
	}

	@Override
	public boolean refoundApprove(String onum) {
		logger.info("Refound_DaoImpl refoundApprove {}", onum);
		int n = sqlsession.update(NS+"refoundApprove", onum);
		return n>0?true:false;
	}

	@Override
	public boolean refoundRefuse(String onum) {
		logger.info("Refound_DaoImpl refoundRefuse {}", onum);
		int n = sqlsession.update(NS+"refoundRefuse", onum);
		return n>0?true:false;
	}

	@Override
	public OrderVo gorefund(String onum) {
		return sqlsession.selectOne(NS+"gorefund",onum);
	}

	

}
