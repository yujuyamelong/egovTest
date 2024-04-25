package member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import member.service.MemberService;
import member.service.MemberVO;

//service 어노테이션 비즈니스 로직을 수행하는 Class라는 것을 나타내는 용도
@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	public MemberDAO memberDAO;

	@Override // 다형성(오버라이딩, 오버로딩)
	public String insertMember(MemberVO vo) throws Exception {

		return memberDAO.insertMember(vo); // vo의 정보를 가지고 sql 연결
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberIdCheck(userid);
	}

	@Override
	public int loginProc(MemberVO vo) {
		return memberDAO.loginProc(vo);
	}

	@Override
	public List<?> selectMemberList(MemberVO vo) throws Exception {
		return memberDAO.selectMemberList(vo);
	}

	@Override
	public MemberVO selectMemberDetail(String name) throws Exception {
		return memberDAO.selectMemberDetail(name);
	}

	@Override
	public int deleteMember(String userid) throws Exception {
		return memberDAO.deleteMember(userid);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return memberDAO.updateMember(vo);
	}

	
}
