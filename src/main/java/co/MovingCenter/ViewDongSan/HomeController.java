package co.MovingCenter.ViewDongSan;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home() {
		System.out.println("home()");
		
		return "home";
	}
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chattingview");
		
		mv.addObject("userid", "dy");
		
		return mv;
	}
}
