package dao;

import java.util.List;

import logic.Reply;

public interface ReplyDao {

	List<Reply> replyList(int sns_no, int m_number);

	void delete(int sns_no, int m_number, int r_num);

	void register(Reply reply);

	int getMaxRnum(int sns_no);

}
