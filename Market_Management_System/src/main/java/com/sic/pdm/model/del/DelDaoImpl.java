package com.sic.pdm.model.del;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.del.DelVo;


@Repository
public class DelDaoImpl implements DelIDao {

	private final String NS = "com.sic.pdm.model.DelIDao.";  
	private Logger logger = LoggerFactory.getLogger(this.getClass());
			
	
	@Autowired
	private SqlSessionTemplate session;

	
	@Override
	public List<DelVo> getDelList(String id) {
		logger.info("getDelList 확인");
		List<DelVo> lists = session.selectList(NS+"getDelList",id);
		return lists;
	}

	@Override
	public boolean insertDel(DelVo vo) {
		logger.info("insertDel 확인");
		int n = session.insert(NS+"insertDel", vo);
		
		return n>0?true:false;
	}

	@Override
	public boolean updateDel(DelVo vo) {
		logger.info("updateDel 확인");
		int n = session.update(NS+"updateDel", vo);
		return n>0?true:false;
	}

	@Override
	public boolean deleteDel(Map<String, Object> map) {
		logger.info("deleteDel 확인");
		int n = session.delete(NS+"deleteDel",map);
		return n>0?true:false;
	}

	@Override
	public DelVo getDefaultAddr(String id) {
		logger.info("getDefaultAddr 확인");
		DelVo vo = session.selectOne(NS+"getDefaultAddr", id);

		return vo;
	}

	
	@Override
	public DelVo getOneDelList(String dnum) {
		logger.info("getOneDelList 확인");
		
		DelVo vo = session.selectOne(NS+"getOneDelList",dnum);
		return vo;
	}
	
	@Override
	public boolean addrflag(DelVo vo) {
		int n = session.update(NS+"addrflag", vo);
		return n>0?true:false;
	}
	
	@Override
	public boolean addrflagN(String id) {
		session.update(NS+"addrflagN", id);
		return false;
	}
}
