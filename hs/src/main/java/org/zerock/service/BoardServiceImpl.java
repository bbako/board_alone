package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.ReplyDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public List<BoardVO> listAll(Criteria cri) {
		return dao.listAll(cri);
	}

	@Transactional
	@Override
	public void regist(BoardVO vo) {
		dao.creat(vo);
		
		String[] files = vo.getFiles();
		
		if(files == null){
			return;
			
		}
		for(String fileName : files){
			
			dao.addAttach(fileName);
		}
	}

	@Override
	public int totalCount(Criteria cri) {
		return dao.totalCount(cri);
	}

	@Override
	public BoardVO read(int bno) {
		return dao.read(bno);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}

	@Override
	public void modify(BoardVO vo) {
		dao.modify(vo);
	}

}
