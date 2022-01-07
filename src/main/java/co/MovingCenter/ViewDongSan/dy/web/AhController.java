package co.MovingCenter.ViewDongSan.dy.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.comm.service.HostVO;
import co.MovingCenter.ViewDongSan.comm.service.ReplyVO;
import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;
import co.MovingCenter.ViewDongSan.comm.service.ReviewVO;
import co.MovingCenter.ViewDongSan.comm.service.ServiceImgVO;
import co.MovingCenter.ViewDongSan.comm.service.UsageHistoryVO;
import co.MovingCenter.ViewDongSan.dy.service.DyGuestMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyHostMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyJoinMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyReplyMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyReservationMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyReservationpasMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyReviewMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyServiceImgMapper;
import co.MovingCenter.ViewDongSan.dy.service.DyUsageHistoryMapper;

@Controller
public class AhController {
	@Autowired DyHostMapper dyHostDao;
	@Autowired DyGuestMapper dyGuestDao;
	@Autowired DyJoinMapper dyJoinDao;
	@Autowired DyReservationMapper dyReservationDao;
	@Autowired DyReservationpasMapper dyReservationpasDao;
	@Autowired DyUsageHistoryMapper dyUsageHistoryDao;
	@Autowired DyReplyMapper dyReplyDao;
	@Autowired DyReviewMapper dyReviewDao;
	@Autowired DyServiceImgMapper dyServiceImgDao;
	@Autowired String saveDirectory;

	// 회원가입 폼으로 이동
	@RequestMapping(value = "/joinForm.do")
	public String join() {
		System.out.println("joinForm()");

		return "Join/joinForm";
	}

	// 회원가입(호스트, 게스트, DB 입력)
	@PostMapping(value = "/memberInsert.do")
	public String memberInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("memberInsert()");

		String author = request.getParameter("author");
		System.out.println(author);

		if (author.equals("host")) {
			System.out.println("if host");

			HostVO vo = new HostVO();
			vo.setAuthor(author);
			vo.setHname(request.getParameter("hname"));
			vo.setHostId(request.getParameter("hostId"));
			vo.setHpassword(request.getParameter("hpassword"));
			vo.setHtel(request.getParameter("htel"));

			System.out.println(request.getParameter("hname"));
			System.out.println(request.getParameter("hostId"));
			System.out.println(request.getParameter("hpassword"));
			System.out.println(request.getParameter("htel"));

			dyHostDao.insertHost(vo);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('회원가입 성공!🎉🎉.');</script>");
			out.flush();
			
		} else if (author.equals("guest")) {
			System.out.println("guest");

			GuestVO vo = new GuestVO();
			vo.setAuthor(author);
			vo.setGaddress(request.getParameter("gaddress"));
			vo.setGname(request.getParameter("gname"));
			vo.setGpassword(request.getParameter("gpassword"));
			vo.setGtel(request.getParameter("gtel"));
			vo.setGuestId(request.getParameter("guestId"));
			
			dyGuestDao.insertGuest(vo);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('회원가입 성공!🎉🎉.');</script>");
			out.flush();
		}

		// 로그인 page 이동
		return "Login";
	}

	// 호스트 회원가입 폼 이동
	@RequestMapping(value = "/hostJoinForm.do")
	public String hostJoinForm() {
		System.out.println("hostJoinForm()");

		return "Join/hostJoinForm";
	}

	// 게스트 회원가입 폼 이동
	@RequestMapping(value = "/guestJoinForm.do")
	public String guestJoinForm() {
		System.out.println("guestJoinForm()");

		return "Join/guestJoinForm";
	}

	// 회원가입 아이디 체크
	@ResponseBody
	@PostMapping(value = "/ajaxIdCheck")
	public String ajaxIdCheck(@RequestParam("chkId") String id, HttpServletResponse response) throws IOException {
		System.out.println("ajaxIdCheck()");

		String result;
		int chk = dyJoinDao.checkId(id);

		if (chk == 0) {
			result = "true";
		} else {
			result = "false";
		}

		return result;
	}

	// GUEST 이용내역페이지 이동
	@RequestMapping(value = "/guestUsageHistory.do")
	public String guestUsageHistory(Model model, HttpSession session) {
		System.out.println("guestUsageHistory()");

		String id = (String) session.getAttribute("id");
		UsageHistoryVO usageHistory = new UsageHistoryVO();
		usageHistory.setGuestId(id);

		model.addAttribute("usageHistory", dyUsageHistoryDao.guestSelectList(usageHistory));

		return "GUEST/usageHistory";
	}

	// HOST에서 GUEST 이용내역페이지 이동
	@RequestMapping(value = "/hostUsageHistory.do")
	public String hostUsageHistory(Model model, HttpSession session) {
		System.out.println("hostUsageHistory()");

		// 로그인 id값
		String id = (String) session.getAttribute("id");

		UsageHistoryVO usageHistory = new UsageHistoryVO();

		usageHistory.setHostId(id);
		model.addAttribute("usageHistory", dyUsageHistoryDao.hostSelectList(usageHistory));

		return "HOST/usageHistory";
	}

	// 리뷰 쓰기
	@ResponseBody
	@RequestMapping(value = "/ajaxWrite.do")
	public String ajaxWrite(HttpServletRequest request, HttpSession session) {
		System.out.println("ajaxWrite()");
		
		String result = "false";
		String id = (String) session.getAttribute("id");
		ReviewVO review = new ReviewVO();
		
		review.setGuestId(id);
		review.setSubject(request.getParameter("message").trim());
		review.setRate(Integer.parseInt(request.getParameter("rate")));
		review.setRoomId(Integer.parseInt(request.getParameter("roomId")));
		
		int n = dyReviewDao.reviewInsert(review);
		
		if(n > 0) {
			result = "true";
		}

		return result;
	}

	// 게스트 status 바꾸기
	@ResponseBody
	@RequestMapping(value = "/guestReservationUpdate.do")
	public String guestReservationUpdate(ReservationVO reservationVo) {
		System.out.println("guestReservationUpdate()");

		String result = "false";
		System.out.println(reservationVo.getGuestId());
		System.out.println(reservationVo.getRoomId());
		System.out.println(reservationVo.getCheckIn());
		System.out.println(reservationVo.getCheckOut());

		return result;
	}

	// 게스트 예약내역으로 이동
	@RequestMapping(value = "/guestReservationMove.do")
	public String guestReservationMove(HttpSession session, Model model) {
		System.out.println("guestReservationMove()");

		String id = (String) session.getAttribute("id");

		model.addAttribute("currentReservation", dyUsageHistoryDao.currentList(id));

		return "GUEST/reservation";
	}

	// 리뷰 폼 페이지로 이동
	@RequestMapping(value = "/writeReview.do")
	public String writeReview(HttpServletRequest request, Model model) {
		System.out.println("writeReview()");
		
		System.out.println(request.getParameter("roomId"));
		model.addAttribute("roomId", request.getParameter("roomId"));

		return "GUEST/reviewForm";
	}

	// 호스트 숙소 수정에서 멀티 파일업로드할 때
	@PostMapping(value = "/multi_fileUpload.do")
	public String multiFileUpload(MultipartFile[] files, Model model, ServiceImgVO vo, HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("multiFileUpload()");
		
		String id = (String) session.getAttribute("id"); 
		List<String> imgs = new ArrayList<String>();
		
		System.out.println(files.length);
		
		for (MultipartFile file : files) {
			System.out.println("roomInsert()");

			String fileName = file.getOriginalFilename();
			String roomImg = UUID.randomUUID().toString();
			roomImg = roomImg + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(saveDirectory, roomImg);

			vo.setHostId(id);
			vo.setRoomId(request.getParameter("roomId"));
			System.out.println(id);
			System.out.println(request.getParameter("roomId"));
			imgs.add(roomImg);
			
			if (!new File(saveDirectory).exists()) {
				new File(saveDirectory).mkdir();
			}
			
			try {
				FileCopyUtils.copy(file.getBytes(), target);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}	// end of for
		
		System.out.println(imgs);
		
		try {
			vo.setImage1(imgs.get(0));
			vo.setImage2(imgs.get(1));
			vo.setImage3(imgs.get(2));
			vo.setImage4(imgs.get(3));
			vo.setImage5(imgs.get(4));				
		} catch(Exception e) {
			System.out.println("파일이 없습니다");
		}
		
		ServiceImgVO serviceImg = dyServiceImgDao.serviceImgSelect(id);
		
		if (serviceImg != null) {
			dyServiceImgDao.serviceImgUpdate(vo);
		} else {
			dyServiceImgDao.serviceImgInsert(vo);
		}
		
		return "redirect:hostMain.do";
	}
}
