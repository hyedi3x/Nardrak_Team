package com.spring.nardrak_mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;   // dataSource-config.xml - ���ؼ�Ǯ + ���̹�Ƽ�� ����(pom.xml)

}
