package co.MovingCenter.ViewDongSan.ej.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.MovingCenter.ViewDongSan.comm.service.ChartVO;
import co.MovingCenter.ViewDongSan.comm.service.GuestVO;
import co.MovingCenter.ViewDongSan.comm.service.GuestprofileVO;
import co.MovingCenter.ViewDongSan.comm.service.HostVO;
import co.MovingCenter.ViewDongSan.comm.service.HostprofileVO;
import co.MovingCenter.ViewDongSan.comm.service.ImgsVO;
import co.MovingCenter.ViewDongSan.comm.service.NoticeVO;
import co.MovingCenter.ViewDongSan.comm.service.ReservationVO;
import co.MovingCenter.ViewDongSan.comm.service.ReservationpasVO;
import co.MovingCenter.ViewDongSan.comm.service.ReviewVO;
import co.MovingCenter.ViewDongSan.comm.service.RoomsVO;
import co.MovingCenter.ViewDongSan.comm.service.WishVO;
import co.MovingCenter.ViewDongSan.dy.service.DyReservationMapper;
import co.MovingCenter.ViewDongSan.ej.service.EjChartService;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestProfileService;
import co.MovingCenter.ViewDongSan.ej.service.EjGuestService;
import co.MovingCenter.ViewDongSan.ej.service.EjHostProfileService;
import co.MovingCenter.ViewDongSan.ej.service.EjHostService;
import co.MovingCenter.ViewDongSan.ej.service.EjImgsService;
import co.MovingCenter.ViewDongSan.ej.service.EjNoticeService;
import co.MovingCenter.ViewDongSan.ej.service.EjReservationService;
import co.MovingCenter.ViewDongSan.ej.service.EjReviewService;
import co.MovingCenter.ViewDongSan.ej.service.EjRoomsService;
import co.MovingCenter.ViewDongSan.ej.service.EjViewReservationpasService;
import co.MovingCenter.ViewDongSan.ej.service.EjWishService;

@Controller
public class GuestController {
   @Autowired String saveDirectory;
   @Autowired
   ServletContext ejServletcontext;

   // DAO
   @Autowired
   public EjRoomsService ejRoomsDao;
   @Autowired
   public EjViewReservationpasService ejReservationpasDao;
   @Autowired
   public EjImgsService ejImgsDao;
   @Autowired
   public EjReviewService ejReviewDao;
   @Autowired
   public EjGuestService ejGuestDao;
   @Autowired
   public EjWishService ejWishDao;
   @Autowired
   public EjHostService ejHostDao;
   @Autowired
   public EjReservationService ejReservationDao;
   @Autowired
   public EjChartService ejChartDao;
   @Autowired
   public EjNoticeService ejNoticeDao;
   @Autowired
   public EjGuestProfileService ejGuestProfileDao;
   @Autowired
   public EjHostProfileService ejHostProfileDao;
   
   @Autowired DyReservationMapper dyReservationDao;

   // VO
   ReservationpasVO vo = new ReservationpasVO();
   RoomsVO roomsvo = new RoomsVO();
   ImgsVO imgsvo = new ImgsVO();
   ReviewVO reviewvo = new ReviewVO();
   GuestVO guestvo = new GuestVO();
   WishVO wishvo = new WishVO();
   HostVO hostvo = new HostVO();
   ReservationVO reservationvo = new ReservationVO();
   ChartVO chartvo = new ChartVO();
   NoticeVO noticevo = new NoticeVO();
   GuestprofileVO guestprofilevo = new GuestprofileVO();
   HostprofileVO hostprofilevo = new HostprofileVO();

   // 메인페이지
   @RequestMapping(value = "/guestMain.do")
   public String test(Model model) {
      model.addAttribute("ReservationList_email", dyReservationDao.selectList());
      
      return "GUEST/main";
   }

   // main_여행지 입력시
   @PostMapping(value = "/AjaxSelectAreaRoomList.do")
   @ResponseBody
   public List<ReservationpasVO> AjaxSelectAreaRoomList(@RequestParam("area") String area,
         @RequestParam("checkindate") String checkin, @RequestParam("checkoutdate") String checkout) {
      String in = checkin.substring(2).replace('-', '/');
      String out = checkout.substring(2).replace('-', '/');

      vo.setCheckIn(in);
      vo.setCheckOut(out);
      List<ReservationpasVO> value = new ArrayList<ReservationpasVO>(); // 사용자검색한지역숙소만담을리스트
      List<ReservationpasVO> list = ejReservationpasDao.selectRoomList(vo); // 사용자일정에맞는숙소리스트
      for (ReservationpasVO val : list) {
         if (val.getRoomAddress().contains(area)) {
            value.add(val);
         }
      }
      System.out.println(value);

      return value;
   }

   // main_여행지 미입력시
   @PostMapping(value = "/AjaxSelectRoomList.do")
   @ResponseBody
   public List<ReservationpasVO> AjaxSelectRoomList(@RequestParam("checkindate") String checkin,
         @RequestParam("checkoutdate") String checkout) {
      String in = checkin.substring(2).replace('-', '/');
      String out = checkout.substring(2).replace('-', '/');

      vo.setCheckIn(in);
      vo.setCheckOut(out);
      List<ReservationpasVO> list = ejReservationpasDao.selectRoomList(vo);

      return list;
   }

   // main_위시리스트에 추가된 룸 input:checked처리
   @PostMapping("/AjaxAlreadyWishAddRoom.do")
   @ResponseBody
   public List<WishVO> alreadyWishAddRoom(HttpSession session) {
      String guestId = (String)session.getAttribute("id");
      wishvo.setGuestId(guestId);
      List<WishVO> list = ejWishDao.alreadyWishInputCheck(wishvo); // 위시리스트에 있는 룸아이디 리스트

      return list;
   }

   // main->roomDetails + 숙소 평점구해서 때려넣자
   @GetMapping(value = "/roomDetails.do")
   public String roomDetails(@RequestParam("roomid") int roomid, @RequestParam("checkin") String checkin,
         @RequestParam("checkout") String checkout, Model model) {
      roomsvo.setRoomId(roomid);
      imgsvo.setRoomId(roomid);
      reviewvo.setRoomId(roomid);
      guestprofilevo.setRoomId(roomid);
      model.addAttribute("selectRoom", ejRoomsDao.selectRoomDetails(roomsvo));
      model.addAttribute("selectRoomImg", ejImgsDao.selectRoomImgs(imgsvo));
      model.addAttribute("roomRateAvg", ejReviewDao.selectRoomRateAVG(reviewvo));
      model.addAttribute("ReviewCount", ejReviewDao.selectRoomReviewCount(reviewvo));
      model.addAttribute("checkIn", checkin);
      model.addAttribute("checkOut", checkout);
      model.addAttribute("guestreview", ejGuestProfileDao.selectGuestProfileImg(guestprofilevo));

      return "GUEST/roomDetails";
   }
    
   // 숙소예약페이지
   @GetMapping(value = "/roomBooking.do")
   public String roomBooking(@RequestParam("roomid") int roomid, 
                       @RequestParam("in") String checkin,
                       @RequestParam("out") String checkout, 
                       @RequestParam("avg") String rateAvg,
                       Model model) {
      roomsvo.setRoomId(roomid);
      hostprofilevo.setRoomId(roomid);
      model.addAttribute("roomBooking", ejRoomsDao.selectRoomDetails(roomsvo));
      model.addAttribute("hostImg",ejHostProfileDao.selectHostImg(hostprofilevo));
      model.addAttribute("rateAvg",rateAvg);
      model.addAttribute("checkIn", checkin);
      model.addAttribute("checkOut", checkout);

      return "GUEST/roomBooking";
   }

   // 결제api클릭시->결제유무상관없이 reservation T, sales T에 insert
   @PostMapping("/AjaxReservationInsert.do")
   @ResponseBody
   public String reservationInsert(@RequestParam("guestId") String guestId, @RequestParam("roomId") int roomId,
         @RequestParam("checkIn") String checkIn, @RequestParam("checkOut") String checkOut,
         @RequestParam("hostId") String hostId, @RequestParam("price") String price) {

      String in = checkIn.substring(2).replace('-', '/');
      String out = checkOut.substring(2).replace('-', '/');

      // 예약테이블에 insert
      reservationvo.setGuestId(guestId);
      reservationvo.setRoomId(roomId);
      reservationvo.setCheckIn(in);
      reservationvo.setCheckOut(out);
      int nn = ejReservationDao.insertReservation(reservationvo);

      // 매출테이블에 insert
      chartvo.setHostId(hostId);
      chartvo.setGuestId(guestId);
      chartvo.setRoomId(roomId);
      chartvo.setMoney(price);
      int n = ejChartDao.insertSales(chartvo);

      String result = null;

      if (nn == 0 && n == 0) {
         result = "예약0:매출0";
      } else if (nn == 1 && n == 0) {
         result = "예약1:매출0";
      } else if (nn == 0 && n == 1) {
         result = "예약0:매출1";
      } else if (nn == 1 && n == 1) {
         result = "예약1:매출1";
      }

      return result;
   }

   // GUEST 마이페이지-세션에 저장된 아이디값을 DB와 비교해서 해당 guest정보 model로 보내기
   @RequestMapping(value = "/myPage.do")
   public String myPage(HttpSession session, Model model) throws IOException {
      String guestId = (String)session.getAttribute("id");
      guestvo.setGuestId(guestId);
      GuestVO guest = ejGuestDao.guestSelect(guestvo);
      model.addAttribute("guest", guest);

      return "GUEST/myPage";
   }

   // HOST 마이페이지-세션에 저장된 아이디값을 DB와 비교해서 해당 host정보 model로 보내기
   @RequestMapping("/hostMyPage.do")
   public String hostMyPage(HttpSession session, Model model) throws IOException {
      String hostid = (String)session.getAttribute("id");
      hostvo.setHostId(hostid);
      HostVO host = ejHostDao.hostSelect(hostvo);
      model.addAttribute("host", host);

      return "HOST/hostMyPage";
   }

   //GUEST_마이페이지_프로필 이미지 ajax로 업로드
   @PostMapping(value = "/AjaxProfileUpload.do", produces = "application/text; charset=utf8")
   @ResponseBody
   public String AjaxrofileUpload(HttpServletRequest req, 
                           @RequestParam("file") MultipartFile multi, 
                           @RequestParam("id") String guestid,
                           Model model) {
      String fileName = multi.getOriginalFilename(); //원본파일명.확장자명
      String pfileName = UUID.randomUUID().toString()
                     +fileName.substring(fileName.lastIndexOf("."));
      
      File target1 = new File(saveDirectory,pfileName);
      if(!new File(saveDirectory).exists()) {
         new File(saveDirectory).mkdir();
      }
      
      String imgPath = ejServletcontext.getRealPath("/img/upload");
      File target = new File(imgPath, fileName);

      try {
         FileCopyUtils.copy(multi.getBytes(), target1);
         guestvo.setGuestId(guestid);
         guestvo.setGimg(pfileName);
         ejGuestDao.guestProfileUpdate(guestvo);
         
         FileCopyUtils.copy(multi.getBytes(), target);
      } catch (Exception e) {
         e.printStackTrace();
      }

      model.addAttribute("fileName", fileName);
      return "img/upload/" + fileName;
   }
   
   //HOST_마이페이지_프로필 이미지 ajax로 업로드
   @PostMapping(value = "/AjaxHostProfileUpload.do", produces = "application/text; charset=utf8")
   @ResponseBody
   public String AjaxHostProfileUpload(HttpServletRequest req, 
                                 @RequestParam("file") MultipartFile multi,
                                 @RequestParam("id") String hostid,
                                 Model model) {
      String fileName = multi.getOriginalFilename(); //원본파일명.확장자명
      String pfileName = UUID.randomUUID().toString()
                     +fileName.substring(fileName.lastIndexOf("."));
         
      File target1 = new File(saveDirectory,pfileName);
      if(!new File(saveDirectory).exists()) {
         new File(saveDirectory).mkdir();
      }
         
      String imgPath = ejServletcontext.getRealPath("/img/upload");
      File target = new File(imgPath, fileName);
      try {
         FileCopyUtils.copy(multi.getBytes(), target1);
         hostvo.setHostId(hostid);
         hostvo.setHimg(pfileName);
         ejHostDao.hostProfileImgUpdate(hostvo);
            
         FileCopyUtils.copy(multi.getBytes(), target);
      } catch (Exception e) {
         e.printStackTrace();
      }

      model.addAttribute("fileName", fileName);
      return "img/upload/" + fileName;
      
   }

   // GUEST_마이페이지_정보수정 ajax
   @PostMapping("/AjaxMyinfoUpdate.do")
   @ResponseBody
   public GuestVO AjaxMyinfoUpdate(@RequestParam("id") String id, 
         @RequestParam("pw") String pw, @RequestParam("name") String name,
         @RequestParam("tel") String tel, @RequestParam("addr") String addr) {
      guestvo.setGuestId(id);
      guestvo.setGpassword(pw);
      guestvo.setGname(name);
      guestvo.setGtel(tel);
      guestvo.setGaddress(addr);
      ejGuestDao.guestUpdate(guestvo);

      return guestvo;
   }

   // HOST_마이페이지_정보수정 ajax
   @PostMapping("/AjaxHostInfoUpdate.do")
   @ResponseBody
   public HostVO AjaxHostInfoUpdate(@RequestParam("id") String id, 
         @RequestParam("pw") String pw, @RequestParam("name") String name,
         @RequestParam("tel") String tel, @RequestParam("addr") String addr) {
      hostvo.setHostId(id);
      hostvo.setHpassword(pw);
      hostvo.setHname(name);
      hostvo.setHtel(tel);
      hostvo.setHaddress(addr);
      ejHostDao.hostUpdate(hostvo);

      return hostvo;
   }

   // GUEST_마이페이지_회원탈퇴
   @PostMapping("/AjaxDropGuest.do")
   @ResponseBody
   public String dropGuest(@RequestParam("id") String id, HttpSession session) {
      guestvo.setGuestId(id);
      int result = ejGuestDao.guestDropUpdate(guestvo);
     session.invalidate();

      return result == 0 ? "NO" : "DeleteOK";
   }

   // HOST_마이페이지_회원탈퇴
   @PostMapping("/AjaxDropHost.do")
   @ResponseBody
   public String dropHost(@RequestParam("id") String id, HttpSession session) {
      hostvo.setHostId(id);
      int result = ejHostDao.hostDropUpdate(hostvo);

      return result == 0 ? "NO" : "DeleteOK";

   }

   // ajax_위시리스트 추가
   @PostMapping("/AjaxWishAdd.do")
   @ResponseBody
   public String AjaxWishAdd(@RequestParam("roomid") int roomid, HttpSession session) {
      String result = null;
      String guestId = (String)session.getAttribute("id");

      roomsvo.setRoomId(roomid); // 룸테이블에서 해당 룸 선택해오기
      RoomsVO wishRoom = ejRoomsDao.selectRoomDetails(roomsvo); // 위시리스트에 추가할 룸

      // 이미 담아놓은 숙소인지 확인
      wishvo.setGuestId(guestId);
      wishvo.setRoomId(roomid);
      if (ejWishDao.wishCheck(wishvo) > 0) { // 이미 담아두었다면
         result = "ALREADY";
      } else {
         // 위시리스트 테이블에 값 넣기
         wishvo.setRoomImg(wishRoom.getRoomImg());
         wishvo.setRoomRate(wishRoom.getRoomRate());
         wishvo.setRoomdAddress(wishRoom.getRoomAddress());
         wishvo.setRoomPrice(wishRoom.getRoomPrice());
         wishvo.setRoomName(wishRoom.getRoomName());
         int n = ejWishDao.wishInsert(wishvo);
         if (n == 0) {
            result = "NO";
         } else {
            result = "OK";
         }
      }
      return result;
   }

   // ajax_위시리스트 삭제
   @PostMapping("/AjaxWishDrop.do")
   @ResponseBody
   public String AjaxWishDrop(@RequestParam("roomid") int roomid, HttpSession session) {
      String guestId = (String)session.getAttribute("id");

      wishvo.setRoomId(roomid);
      wishvo.setGuestId(guestId);
      int result = ejWishDao.wishDelete(wishvo);
      return result == 0 ? "NO" : "OK";
   }

   // 위시리스트로 보내기-> session 게스트id, wishList 테이블값 같이 보내기
   @RequestMapping("/toWishList.do")
   public String toWishList(Model model, HttpSession session) {
      String guestId = (String)session.getAttribute("id");

      wishvo.setGuestId(guestId);
      model.addAttribute("wishRooms", ejWishDao.wishSelectList(wishvo));
      model.addAttribute("guestId", guestId);

      return "GUEST/wishList";
   }

   // 공지사항 페이지로 보내기
   @GetMapping("/toNotice.do")
   public String toNotice(Model model) {
      model.addAttribute("noticeList", ejNoticeDao.noticeList());

      return "GUEST/notice";
   }

   // 공지사항 상세페이지로 보내기_한건조회
   @GetMapping("/toNoticeDetails.do")
   public String toNoticeDetails(@RequestParam("no") int no, Model model) {
      noticevo.setNo(no);
      model.addAttribute("notice", ejNoticeDao.noticeSelect(noticevo));

      return "GUEST/noticeDetails";
   }

   // 공지사항 수정페이지로 보내기
   @GetMapping("toNoticeUpdatePage.do")
   public String toNoticeUpdate(@RequestParam("no") int no, Model model) {
      noticevo.setNo(no);
      model.addAttribute("notice", ejNoticeDao.noticeSelect(noticevo));

      return "GUEST/noticeUpdatePage";
   }

   // 공지사항 삭제
   @PostMapping("/noticeDelete.do")
   @ResponseBody
   public String noticeDelete(@RequestParam("no") int no) {
      noticevo.setNo(no);
      int result = ejNoticeDao.noticeDelete(noticevo);

      return result == 0 ? "NO" : "YES";
   }

   // 공지사항 수정
   @PostMapping("/noticeUpdate.do")
   public String noticeUpdate(HttpServletRequest request, 
                        @RequestParam(value = "newImg") MultipartFile file) {
      String fileName = file.getOriginalFilename(); //원본파일명.확장자명
      int result = -1;
      
      if (fileName == "") { //파일추가안했을때
         System.out.println("파일명 :" + fileName);
         System.out.println("파일추가안함");
         
         noticevo.setNo(Integer.parseInt(request.getParameter("no")));
         String oldImg = ejNoticeDao.noticeImgSelect(noticevo);
         
         noticevo.setNo(Integer.parseInt(request.getParameter("no")));
         noticevo.setNsubject(request.getParameter("subject"));
         noticevo.setNimg(oldImg);
         
         result = ejNoticeDao.noticeUpdate(noticevo);
      
      } else { //파일추가했을때
         System.out.println("파일명 :" + fileName);
         System.out.println("파일추가함");
         
         String pfileName = UUID.randomUUID().toString(); // 물리파일명만들기
         pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
         
         File target = new File(saveDirectory, pfileName);
         
         if(!new File(saveDirectory).exists()) {
            new File(saveDirectory).mkdir();
         }
         
         try {
            // 파일복사
            FileCopyUtils.copy(file.getBytes(), target);
            
            // db처리
            noticevo.setNo(Integer.parseInt(request.getParameter("no")));
            noticevo.setNsubject(request.getParameter("subject"));
            noticevo.setNimg(pfileName);
            result = ejNoticeDao.noticeUpdate(noticevo);
         }catch (Exception e) {
            e.printStackTrace();
         }
      }
      
      if(result > 0) {
         System.out.println("수정완료");
      }

      return "redirect:toNotice.do";
   }
}