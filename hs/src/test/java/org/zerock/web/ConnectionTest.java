package org.zerock.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class ConnectionTest {

	@Inject
	BoardDAO dao;
	@Inject
	SqlSessionTemplate sess;
	@Inject
	BoardService service;
	
	
	
	@Test
	public void searchTest(){
	Criteria cri= new Criteria();	
		cri.setType("하하");
		cri.setKeyword("하하");
		
		service.listAll(cri);
		
	}
	
	@Test
public void getList() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(3);
	
		dao.listAll(cri);
	
		
	}
	
	@Test
	public void getTime() throws Exception{
		
		System.out.println(sess.selectOne("org.zerock.persistence.BoardDAO.getTime"));
		
		//System.out.println(dao.getTime());
//		System.out.println("get Time");
//		System.out.println(dao.getTime());
	
		
	}
	
}
