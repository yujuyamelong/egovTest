package member.service;

import java.util.List;

public interface MemberService {
	/* 회원등록처리(save) */
	public String insertMember(MemberVO vo) throws Exception;

	/* 중복아이디체크 */
	public int selectMemberIdCheck(String userid) throws Exception;

	/* 로그인 데이터 확인 */
	public int loginProc(MemberVO vo);

	/* 회원목록 출력 */
	public List<?> selectMemberList(MemberVO vo) throws Exception;

	/* 회원상세 */
	public MemberVO selectMemberDetail(String name) throws Exception;
	
	/* 회원삭제 */
	public int deleteMember(String userid) throws Exception;
	
	/* 회원 수정 */
	public int updateMember(MemberVO vo) throws Exception;

}
