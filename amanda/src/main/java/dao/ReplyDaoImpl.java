package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReplyMapper;
import dao.mapper.SnsMapper;
import logic.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ReplyMapper.";
	
	@Override
	public List<Reply> replyList(int sns_no, int m_number) { //SnsMApper에서 쿼리결과인 Reply객체를 리턴받을수 있는지 잘 모르겠음. 에러시 수정할것.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sns_no", sns_no);
		map.put("m_number", m_number);
		return sqlSession.selectList(NS+"replyList",map);
	}

	@Override
	public void delete(int sns_no, int m_number, int r_num) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("sns_no",sns_no);
		map.put("m_number", m_number);
		map.put("r_num", r_num);
		sqlSession.selectOne(NS+"delete",map);
	}
	@Override
	public int getMaxRnum(int sns_no) {
		return sqlSession.getMapper(ReplyMapper.class).getMaxRnum(sns_no);
	}

	@Override
	public void register(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).register(reply);
	}

}
