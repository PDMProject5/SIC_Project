package com.sic.pdm.model.mileage;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sic.pdm.vo.mileage.MileageVo;

@Repository
public class Mileage_DaoImpl implements Mileage_IDao {
	
	private final String NS = "com.sic.pdm.model.mileage.Mileage_IDao.";
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public MileageVo totalMiles(String id) {
		logger.info("Mileage_DaoImpl totalMiles");
		return sqlsession.selectOne(NS+"totalMiles",id);
	}

	@Override
	public List<MileageVo> detailMiles(String id) {
		List<MileageVo> lists = null;
		logger.info("Mileage_DaoImpl detailMiles");
		lists = sqlsession.selectList(NS+"detailMiles",id);
		return lists;
	}

}
