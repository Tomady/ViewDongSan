package co.MovingCenter.ViewDongSan.man.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.MovingCenter.ViewDongSan.aram.service.AramRoomsService;
import co.MovingCenter.ViewDongSan.comm.service.AdminVO;
import co.MovingCenter.ViewDongSan.comm.service.ChartVO;
import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.comm.service.HostVO;
import co.MovingCenter.ViewDongSan.comm.service.NoticeVO;
import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;
import co.MovingCenter.ViewDongSan.ej.service.EjNoticeService;
import co.MovingCenter.ViewDongSan.man.service.ManAdminService;
import co.MovingCenter.ViewDongSan.man.service.ManChartService;
import co.MovingCenter.ViewDongSan.man.service.ManGuestService;
import co.MovingCenter.ViewDongSan.man.service.ManHostService1;
import co.MovingCenter.ViewDongSan.man.service.ManNoticeService;

@Controller
public class AdminController {
	@Autowired
	String saveDirectory;
	@Autowired
	private ManHostService1 manHostDao1;
	@Autowired
	private ManGuestService manGuestDao;
	@Autowired
	private ManAdminService manAdminDao;
	@Autowired
	private ManChartService manChartDao;
	@Autowired
	private ManNoticeService manNoticeDao;
	
	 @Autowired
	   AramRoomsService aramRoomsService;
	
	@Autowired
	public EjNoticeService ejNoticeDao;

	@RequestMapping(value = "/adminMain.do")
	public String test() {
		return "ADMIN/main";
	}

	@RequestMapping(value = "/Login.do")
	public String loginpage() {
		System.out.println("login1");
		return "Login";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "Login";
	}

	@RequestMapping("/alllist.do")
	public String alllist(Model model) {
//		List<LoginVO> list = loginDao.allLoginMember();
//		model.addAttribute("main", list);

		List<HostVO> hostlist = manHostDao1.selectListHost();
		List<GuestVO> guestlist = manGuestDao.selectListGuest();
		model.addAttribute("hosts", hostlist);
		model.addAttribute("guests", guestlist);

		return "ADMIN/main";
	}

	@RequestMapping("/main.do")
	public String login(HttpServletResponse response,HttpSession session, @RequestParam("id") String id, @RequestParam("pw") String password, Model model) throws IOException {
		System.out.println("login2");
		String path = "";

		AdminVO avo = new AdminVO();
		avo.setAdminId(id);
		avo.setAdminPassword(password);
		avo = manAdminDao.selectAdmin(avo);
		
		
		
		if (avo == null) { //admin 계정이 없을때
			
			HostVO hvo = new HostVO();
			hvo.setHostId(id);
			hvo.setHpassword(password);
//			session.setAttribute(id, hvo.getHostid());
			hvo = manHostDao1.selectHost(hvo);
			
			

			if (hvo == null) {
				GuestVO gvo = new GuestVO();
				gvo.setGuestId(id);
				gvo.setGpassword(password);
//				session.setAttribute(id, gvo.getGuestid());
				gvo = manGuestDao.selectGuest(gvo);
				
				
				if (gvo != null) {
					session.setAttribute("id", gvo.getGuestId());
					session.setAttribute("author", "GUEST");
					session.setAttribute("name", gvo.getGname());
					session.setAttribute("img", gvo.getGimg());
					session.setAttribute("tel", gvo.getGtel());
		            session.setAttribute("addr", gvo.getGaddress());
		               
					path = "GUEST/main";
					// guest
				}
			} 
			
			else {
				session.setAttribute("id", hvo.getHostId());
				session.setAttribute("author", "HOST");
				session.setAttribute("name", hvo.getHname());
				session.setAttribute("img", hvo.getHimg());
				
				RoomsVO room = new RoomsVO();
			      room.setHostId(id);
			      List<RoomsVO> rooms = aramRoomsService.roomSelectList(room);
			      model.addAttribute("rooms", rooms);
				path = "HOST/main";
			}
		} else {
			List<HostVO> hostlist = manHostDao1.selectListHost();
			List<GuestVO> guestlist = manGuestDao.selectListGuest();
			model.addAttribute("hosts", hostlist);
			model.addAttribute("guests", guestlist);
			System.out.println("관리자");
			
			session.setAttribute("id", avo.getAdminId());
			session.setAttribute("author", "ADMIN");
			

			path = "ADMIN/main";
		}
		if(path == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 정보를 확인해주세요.');</script>");
			out.flush();
			

			return "Login";
		}else {
			
			return path;
		}
		
		

	}

	@RequestMapping("/guestlist.do")
	public String guestList(Model model) {

		List<GuestVO> list = manGuestDao.selectListGuest();
		model.addAttribute("guestlist", list);

		return "ADMIN/guestlist";
	}

	@RequestMapping("/hostlist.do")
	public String hostList(Model model) {

		List<HostVO> list = manHostDao1.selectListHost();
		model.addAttribute("hostlist", list);

		return "ADMIN/hostlist";
	}

	@RequestMapping("/hostapprove.do")
	public String hostapprove(Model model) {
		List<HostVO> list = manHostDao1.selectListHost();
		model.addAttribute("hostapprove", list);
		return "ADMIN/hostapprove";

	}

	@ResponseBody
	@RequestMapping("/deletehost.do")
	public String deleteHost(HttpServletRequest request, Model model) {
		String hostid = request.getParameter("checkboxarr");
		System.out.println("deletehost.do");
		System.out.println(hostid);

		int result = manHostDao1.hostDelete(hostid);
		if (result != 0) {
		} else {
			System.out.println("false");
		}
//		String[] arrayParam  = request.getParameterValues("hostid[]");
//		
//		for (int i = 0; i < arrayParam.length; i++) {
//			System.out.println(arrayParam[i]);
//		}
		return Integer.toString(result);
	}

	@ResponseBody
	@RequestMapping("/deleteguest.do")
	public String deleteGuest(HttpServletRequest request, Model model) {
		String guestid = request.getParameter("checkboxarr");
		System.out.println(guestid);

		manGuestDao.guestDelete(guestid);
		int result = manGuestDao.guestDelete(guestid);
//		

		return Integer.toString(result);
	}

	@ResponseBody
	@RequestMapping("/updatehost.do")
	public String updateHost(HttpServletRequest request, Model model) {
		System.out.println("들어오나");
		String author = request.getParameter("authorArr");
		String hostid = request.getParameter("hostid");

		HostVO vo = new HostVO();
		vo.setHostId(hostid);
		vo.setAuthor(author);

		manHostDao1.hostUpdate(vo);
		int result = manHostDao1.hostUpdate(vo);
		System.out.println("수정완료");

		return Integer.toString(result);
	}

	@RequestMapping(value = "/allchart.do")
	public String chartpage(Model model) {
		System.out.println("chart");
		List<String> names = manChartDao.selectHostID();
		for (int i = 0; i < names.size(); i++) {
			System.out.print(names.get(i));
		}
		model.addAttribute("names", names);
		// model.addAttribute("info", manChartDao.selectListChart());

		return "ADMIN/allchart";
	}

	@RequestMapping(value = "/yearchart.do")
	@ResponseBody
	public List<ChartVO> ajaxpage(Model model) {
		List<ChartVO> list = manChartDao.selectListChart();
//		for(int i = 0 ; i < list.size(); i++) {
//			System.out.println(list.get(i).toString());
//		}
		return list;
	}

	@RequestMapping("/hostChart.do")
	public String hostchart(ChartVO vo, Model model) {
		List<ChartVO> list = manChartDao.selectChart(vo);
		model.addAttribute("selectchart", list);

		return "";
	}

	@RequestMapping("/getHostChartData.do")
	@ResponseBody
	public List<ChartVO> getChartDataById(ChartVO vo) {
		return manChartDao.selectChart(vo);
	}

	@RequestMapping("/noticelist.do")
	public String noticelist() {
		System.out.println("noti");

		return "ADMIN/noticelist";
	}

	@RequestMapping("/oKnoticeinsert.do")
	public String OKnoticeInsert(@RequestParam(value = "Nimg",required=false) MultipartFile file,Model model,
			HttpServletRequest request) {
		NoticeVO vo = new NoticeVO();
		System.out.println(request.getParameter("Nsubject"));
		System.out.println("들어오지않아요..");
		String fileName = file.getOriginalFilename(); // 원본파일명가져오기
		System.out.println("파일명: " + fileName);
		String pfileName = UUID.randomUUID().toString(); // 물리파일명만들기
		pfileName = pfileName + fileName.substring(fileName.lastIndexOf(".")); // 원본확장자명을 잘라서 물리파일명뒤에 붙이기
		System.out.println(saveDirectory);
		File target = new File(saveDirectory, pfileName);
		System.out.println(pfileName);
		vo.setFileName(fileName); // 원본 파일명 -db저장위해 vo에다 담기
		// vo.setPfileName("c:/DIV/ggggg/"+pfileName); //물리 파일명 -db저장위해 vo에다 담기

		if (!new File(saveDirectory).exists()) { // 동일한 이름 가진 파일이 존재하지 않는다면
			System.out.println("디렉토리만들기");
			new File(saveDirectory).mkdir(); // 만들어줘라! 카피해라..!?
		}

		try {
			FileCopyUtils.copy(file.getBytes(), target); // 파일저장
			// 항상 파일저장을 먼저하고 데이터 저장하기!!
			// 첨부파일이 먼저 물리적위치에 도착했는지 확인 후, 데이터를 저장하기
			vo.setNimg(pfileName);
			System.out.println(request.getParameter("Nsubject"));
			vo.setNsubject(request.getParameter("Nsubject"));
			vo.setNtitle(request.getParameter("Ntitle"));
			manNoticeDao.noticeInsert(vo); // 데이터 저장
			System.out.println("저장장장장");
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("noticeList", ejNoticeDao.noticeList());

		return "GUEST/notice";
	}

}
