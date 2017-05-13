package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;

	@Override
	public List<ReplyVO> read(int bno,Criteria cri) {
		return dao.read(bno,cri);
	}

	@Override
	public void recreate(ReplyVO vo) {
		dao.recreate(vo);

	}

	@Override
	public void reupdate(ReplyVO vo) {
		dao.update(vo);

	}

	@Override
	public void redelete(ReplyVO vo) {
		dao.delete(vo);
	}

	@Override
	public int retotal(BoardVO vo) {
		return dao.retotal(vo);
	}

}
