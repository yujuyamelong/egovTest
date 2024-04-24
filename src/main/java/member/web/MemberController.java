package member.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.service.MemberService;
import member.service.MemberVO;

@Controller
public class MemberController {
	/* memberService 사용하겟다~ */
	@Resource(name = "memberService")
	public MemberService memberService;

	/* 회원등록 페이지 호출 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}

	@RequestMapping("/memberWriteSave.do")
	@ResponseBody // 메시지 전송할수 있다
	public String insertMember(MemberVO vo) throws Exception {
		String message = "";

		String result = memberService.insertMember(vo);
		
		
		if (result == null) {
			message = "ok";
		}
		
		return message;
	}

	@RequestMapping("/idChk.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid) throws Exception {

		String message = ""; // ajax에 message값이 세팅되어서 전달함
		
		//회원이 존재한다면  1, 없으면 0
		int count = memberService.selectMemberIdCheck(userid);
		if (count == 0) {
			message = "ok";
		}

		return message;
	}
	
	/*로그인 호출 화면*/
	@RequestMapping("/loginWrite.do")
	public String login() {
		return "member/loginWrite";
	}
	
	/*로그인 PROC 실행화면 */
	@RequestMapping("/loginProc.do")
	@ResponseBody //세션을 만들어주는 클래스
	public String loginProc(MemberVO vo, HttpSession session) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberIdCheck(vo.getUserid());
		System.out.println("cnt : " +cnt);
		if(cnt == 0 ) {//아이디가 없습니다.
			message = "x";
		}else {//성공 
			int cnt2 = memberService.loginProc(vo);
			System.out.println("cnt2 : "+  cnt2);
			
			if(cnt2 == 0) { //패스워드가 틀려요
				message = "wrong password";
			}else {
				//session 생성
				session.setAttribute("sessionId", vo.getUserid());
				message = "ok";
			}
		}
		return message;
	}
	
	/*회원목록 화면*/
	@RequestMapping("/memberList.do")
	public String selectMemberList(MemberVO vo, Model model) throws Exception {
		List<?> list = memberService.selectMemberList(vo);
		model.addAttribute("resultList", list);
		return "member/memberList";
	}

}