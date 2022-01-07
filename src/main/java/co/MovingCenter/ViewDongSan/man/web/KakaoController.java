package co.MovingCenter.ViewDongSan.man.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.man.service.ManGuestService;

@Controller
public class KakaoController {
	@Autowired private ManGuestService manGuestDao;
	
	@RequestMapping("/kakaologin.do")
	public String userController(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("카카오로그인");
		System.out.println(request.getParameter("kakaoemail"));
		System.out.println(request.getParameter("kakaoname"));
		System.out.println(request.getParameter("kakaobirth"));

		// kakaoemail을 kakaoid에 저장
		String kakaoid = request.getParameter("kakaoemail");
		String kakaoname = request.getParameter("kakaoname");
		GuestVO userTo = new GuestVO();

		// kakaoid를 to의 id로 세팅
		userTo.setGuestId(kakaoid);
		userTo.setGname(kakaoname);
		userTo = manGuestDao.selectGuestId(userTo);

		// 카카오계정으로 로그인한 적이 있는지 없는지 
		String ViewPage = "";
		
		if (userTo == null) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
		    System.out.println("카카오 회원 정보 설정");
		    userTo = manGuestDao.selectGuestId(userTo);
		    model.addAttribute("kakaoid", request.getParameter("kakaoemail"));
		    model.addAttribute("kakaoname", request.getParameter("kakaoname"));
		    model.addAttribute("kakaobirth", request.getParameter("kakaobirth"));
		    model.addAttribute("kakaoemail", request.getParameter("kakaoemail"));

//		    request.setAttribute("kakaoid", request.getParameter("kakaoemail"));
//		    request.setAttribute("kakaoname",request.getParameter("kakaoname"));
//		    request.setAttribute("kakaobirth",request.getParameter("kakaobirth"));
//		    request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));
		    session.setAttribute("kakaoid", kakaoid);
		    session.setAttribute("kakaoname", kakaoname);
		    
		    // 회원가입창으로 이동
		    ViewPage = "Join/guestJoinForm";

		} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
		    // id, nick, profile을 가져와서
		    userTo = manGuestDao.selectGuestId(userTo);
		    // id를 세션에 저장
		    session.setAttribute("kakaoid", userTo.getGuestId());
		    // nick을 세션에 저장
		    session.setAttribute("nick", userTo.getGname());
		    // 프로필 사진 (profile)을 세션에 저장
		    session.setAttribute("profile", userTo.getGimg());

		    System.out.println("kakaoid : " + userTo.getGuestId());
		    System.out.println("nick : " + userTo.getGname());
		    System.out.println("profile : " + userTo.getGimg());
		    
		    ViewPage = "GUEST/main";
		}
		return ViewPage;
	}
}
