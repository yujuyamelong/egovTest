package member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import member.service.MemberVO;

//DataBase에 접근하는 method를 가지고 있는 Class에서 쓰인다.
@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdCheck(String userid) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectMemberIdCheck",userid);
	}

	public int selectMemberCount(MemberVO vo) {
		return (int) select("memberDAO.selectMemberCount", vo);
	}

	public int loginProc(MemberVO vo) {
		return (int) select("memberDAO.loginProc", vo);
	}

	public List<?> selectMemberList(MemberVO vo) {
		return list("memberDAO.selectMemberList", vo);
	}
}
