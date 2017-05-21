package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> read(int bno,Criteria cri);  

	public void recreate(ReplyVO vo);
	
	public void update(ReplyVO vo);
	
	public void delete(ReplyVO vo);
	
	public int retotal(BoardVO vo);
	
	public int getBno(ReplyVO vo);
	
	public void deleteall(BoardVO vo);	
	
}
