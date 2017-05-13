package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	static final String namespace = "org.zerock.persistence.ReplyDAO";

	@Inject
	SqlSessionTemplate sess;

	@Override
	public List<ReplyVO> read(int bno,Criteria cri) {
		
		Map<String,Object> paramMap=new HashMap<>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return sess.selectList(namespace + ".replylist", paramMap);
	}

	@Override
	public void recreate(ReplyVO vo) {
		sess.insert(namespace + ".recreate", vo);

	}

	@Override
	public void update(ReplyVO vo) {
		sess.update(namespace + ".reupdate", vo);

	}

	@Override
	public void delete(ReplyVO vo) {
		sess.delete(namespace + ".redelete", vo);
	}

	@Override
	public int retotal(BoardVO vo) {

		return sess.selectOne(namespace + ".retotal", vo);
	}

	@Override
	public int getBno(ReplyVO vo) {
		return sess.selectOne(namespace+".getBno", vo);
	}

}
