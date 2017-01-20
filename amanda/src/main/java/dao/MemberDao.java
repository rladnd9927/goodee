package dao;

import java.util.List;

import logic.Member;
import logic.User;

public interface MemberDao {
    List<Member> mypage(User myNum);
    List<Member> youpage(User myNum);
}