package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;
	
	@Inject
	BoardDAO bodao;

	@Override
	public List<ReplyVO> read(int bno,Criteria cri) {
		return dao.read(bno,cri);
	}

	@Transactional
	@Override
	public void recreate(ReplyVO vo) {
		dao.recreate(vo);
		bodao.updateReCnt(vo.getBno(), 1);

	}

	@Override
	public void reupdate(ReplyVO vo) {
		dao.update(vo);

	}

	
	@Transactional
	@Override
	public void redelete(ReplyVO vo) {
		int bno = dao.getBno(vo);
		dao.delete(vo);
		bodao.updateReCnt(bno, -1);
	}

	@Override
	public int retotal(BoardVO vo) {
		return dao.retotal(vo);
	}

}
