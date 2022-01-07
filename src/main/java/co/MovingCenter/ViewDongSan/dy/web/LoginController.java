package co.MovingCenter.ViewDongSan.dy.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	// chat페이지로 이동
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.GET)
	public String loginProcess(HttpSession session) {
		logger.info("Welcome " + session.getAttribute("id"));
		
		return "chatting/chat";
	}
}
