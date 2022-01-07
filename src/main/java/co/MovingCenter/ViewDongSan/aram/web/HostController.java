package co.MovingCenter.ViewDongSan.aram.web;

import java.io.File;
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

import co.MovingCenter.ViewDongSan.aram.service.AramReservationService;
import co.MovingCenter.ViewDongSan.aram.service.AramReservationpasService;
import co.MovingCenter.ViewDongSan.aram.service.AramRoomsService;
import co.MovingCenter.ViewDongSan.aram.service.AramRvSelectService;
import co.MovingCenter.ViewDongSan.comm.service.ChartVO;
import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;
import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;
import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;
import co.MovingCenter.ViewDongSan.comm.service.UsageHistoryVO;
import co.MovingCenter.ViewDongSan.man.service.ManChartService;

@Controller
public class HostController {

	@Autowired
	AramRoomsService aramRoomsService;

	@Autowired
	AramReservationService aramRvService;

	@Autowired
	AramReservationpasService aramPasService;

	@Autowired
	AramRvSelectService aramRvSelService;

	@Autowired
	ManChartService manChartDao;

	@Autowired
	String saveDirectory;

	// =============== 호스트 메인 {숙소 리스트, 예약 달력} ===============
	@RequestMapping(value = "/hostMain.do")
	public String test(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		// 숙소 리스트
		RoomsVO room = new RoomsVO();
		room.setHostId(id);
		List<RoomsVO> rooms = aramRoomsService.roomSelectList(room);

		if (rooms == null) {
			System.out.println("null임");
		}
		model.addAttribute("rooms", rooms);

		// 달력
		ReservationpasVO pas = new ReservationpasVO();
		pas.setHostId(id);
		List<ReservationpasVO> calrv = aramPasService.calendarRvList(pas);

		model.addAttribute("calrv", calrv);

		return "HOST/main";
	}

	// =============== 숙소 등록 페이지로 이동 ===============
	@RequestMapping(value = "/addRoom.do")
	public String addRoom() {
		return "HOST/addRoom";
	}

	// =============== 숙소별 예약상태 리스트 ===============
	@RequestMapping(value = "/reservation.do")
	public String reservation(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		RoomsVO room = new RoomsVO();
		room.setHostId(id);
		List<RoomsVO> rooms = aramRoomsService.roomSelectList(room);

		if (rooms == null) {
			System.out.println("null임");
		}
		model.addAttribute("rooms", rooms);
		return "HOST/reservation";
	}

	// =============== 매출 페이지로 이동 ===============
	@RequestMapping(value = "/hostSales.do")
	public String sales(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		ChartVO names = new ChartVO();
		names.setHostId(id);

		List<ChartVO> list = manChartDao.selectListChartByID(names);
		model.addAttribute("names", list);

		return "HOST/sales";
	}

	@RequestMapping("/getHostChartData1.do")
	@ResponseBody
	public List<ChartVO> getChartDataById(ChartVO vo) {
		return manChartDao.selectChart(vo);
	}

	// =============== 호스트메인-숙소목록 안에 수정 버튼 -> 숙소정보 수정 페이지 ===============
	@RequestMapping(value = "/editRoom.do")
	public String updateRoom(RoomsVO vo, Model model, @RequestParam("roomId") int roomId) {
		vo.setRoomId(roomId);
		RoomsVO rvo = aramRoomsService.roomSelect(vo);
		model.addAttribute("room", rvo);
		return "HOST/editRoom";
	}

	// =============== 숙소 등록 페이지 - 등록 버튼 실행 ===============
	@PostMapping("/roomInsert.do")
	public String roomInsert(RoomsVO vo, MultipartFile file, HttpServletRequest request, Model model) {
		System.out.println("roomInsert()");

		String result = "false";
		String fileName = file.getOriginalFilename();
		String roomImg = UUID.randomUUID().toString();
		roomImg = roomImg + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(saveDirectory, roomImg);

		vo.setRoomName(request.getParameter("roomname"));
		vo.setRoomAddress(request.getParameter("roomaddress"));
		vo.setRoomSubject(request.getParameter("roomsubject"));
		vo.setHostId(request.getParameter("hostid"));
		vo.setRoomPrice(request.getParameter("roomprice"));
		vo.setRoomImg(roomImg);

		if (!new File(saveDirectory).exists()) {
			new File(saveDirectory).mkdir();
		}
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			int n = aramRoomsService.roomInsert(vo);

			if (n > 0) {
				result = "true";
			} else {
				result = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", result);

		return "HOST/addRoom";
	}

	// =============== 숙소정보수정 ===============
	@RequestMapping("/roomUpdate.do")
	public String roomUpdate(RoomsVO vo, Model model, HttpSession session, MultipartFile file,
			HttpServletRequest request) {
		System.out.println("update()");
		String id = (String) session.getAttribute("id");

		System.out.println(vo.getRoomId());

		// file(이미지 파일)이 있을경우
		if(file != null) {
			String fileName = file.getOriginalFilename();
			String roomImg = UUID.randomUUID().toString();
			roomImg = roomImg + fileName.substring(fileName.lastIndexOf("."));
			File target = new File(saveDirectory, roomImg);
			vo.setRoomImg(roomImg);
			
			if (!new File(saveDirectory).exists()) {
				new File(saveDirectory).mkdir();
			}
			
			try {
				FileCopyUtils.copy(file.getBytes(), target);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			vo.setRoomImg(aramRoomsService.roomSelect(vo).getRoomImg());
		}
		
		int n = aramRoomsService.roomUpdate(vo);
		
		if (n > 0) {
			System.out.println("수정 완료");
		} else {
			System.out.println("수정 실패");
		}
		
		RoomsVO room = new RoomsVO();
		room.setHostId(id);
		
		List<RoomsVO> rooms = aramRoomsService.roomSelectList(room);

		if (rooms == null) {
			System.out.println("null임");
		}
		model.addAttribute("rooms", rooms);

		return "redirect:hostMain.do";
	}

	// =============== 호스트 메인-숙소목록-삭제 버튼->ajax로 실행 ===============
	@RequestMapping("/roomDelete.do")
	@ResponseBody
	public String roomDelete(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("roomid"));
		String result = "false";

		RoomsVO vo = new RoomsVO();
		vo.setRoomId(no);

		int n = aramRoomsService.roomDelete(vo);

		if (n > 0) {
			result = "true";
		}

		return result;
	}

	// =============== 예약상태별 합계 ===============
	@RequestMapping("/selectListRv.do")
	@ResponseBody
	public String rvSelectW(Model model, @RequestParam("roomId") int roomId) {

		ReservationVO rvvo = new ReservationVO();
		rvvo.setRoomId(roomId);
		List<ReservationVO> rvlist = aramRvService.selectListRv(rvvo);

		int wsum = 0;
		int csum = 0;
		int dsum = 0;

		for (ReservationVO res : rvlist) {
			if (res.getStatus().equals("W")) {
				wsum += 1;
			} else if (res.getStatus().equals("C")) {
				csum += 1;
			} else if (res.getStatus().equals("D")) {
				dsum += 1;
			}
		}
		return "wsum:" + wsum + "," + "csum:" + csum + "," + "dsum:" + dsum;
	}

	// =============== 숙소 예약상태 상세 ===============
	@RequestMapping("/rvDetail.do")
	public String rvDetail(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("roomId") int roomId) {

		UsageHistoryVO rd = new UsageHistoryVO();

		rd.setRoomId(roomId);
		List<UsageHistoryVO> rdlist = aramRvSelService.selectRvDetailList(rd);

		model.addAttribute("rdlist", rdlist);

		return "HOST/reservationDetail";
	}

}