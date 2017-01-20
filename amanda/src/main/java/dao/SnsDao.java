package dao;

import java.util.List;

import logic.Reply;
import logic.Sns;
import logic.User;

public interface SnsDao {

	List<Sns> list(int m_number);

	Sns detail(int sns_no, int m_number);

	void insert(Sns sns);

	void update(Sns sns);

	void delete(int sns_no,int m_number);

	int getMax(int m_number);
}
