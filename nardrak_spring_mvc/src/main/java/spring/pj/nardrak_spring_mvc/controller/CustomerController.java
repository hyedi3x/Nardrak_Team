package spring.pj.nardrak_spring_mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.pj.nardrak_spring_mvc.service.CustomerServiceImpl;




@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired // 객채생성의 의미
	private CustomerServiceImpl service;

	// 첫페이지
	@RequestMapping("/main.do")
	public String main() {
		logger.info("<<< url => /main.do >>>");

		return "common/main";
	}

	// [회원가입]
	@RequestMapping("/join.do")
	public String join() {
		logger.info("<<< url => /join.do >>>");

		return "customer/join/join";
	}

	// id 중복확인
	@RequestMapping("/idConfirmAction.do")
	public String idConfirmAction(HttpServletRequest request,HttpServletResponse response ,Model model) 
			throws ServletException, IOException {
		logger.info("<<< url => /idConfirmAction.do >>>");

		// CustomerServiceImpl service = new CustomerServiceImpl();
		service.inConfirmAction(request,response, model);

		return "customer/join/idConfirmAction";
	}

	// 회원가입 처리
	// 서비스 호출, joinAction.jsp
	@RequestMapping("/joinAction.do")
	public String joinAction(HttpServletRequest request,HttpServletResponse response , Model model) 
			throws ServletException, IOException {
		logger.info("<<< url => /joinAction.do >>>");

		// CustomerServiceImpl service = new CustomerServiceImpl();
		service.signInAction(request, response ,model);

		return "customer/join/joinAction";
	}

//	// [로그인]
//	// 로그인 화면
//	@RequestMapping("/login.do")
//	public String login(HttpServletRequest request, Model model) 
//			throws ServletException, IOException {
//		logger.info("<<< url => /login.do >>>");
//
//		return "customer/login/login";
//	}
//
//	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
//	@RequestMapping("/loginAction.do")
//	public String loginAction(HttpServletRequest request, Model model) 
//			throws ServletException, IOException {
//		service.loginInAction(request, model);
//
//		return "customer/login/loginAction";
//	}
//
//	//[로그아웃]
//	   @RequestMapping("/logout.do")
//	   public String logout(HttpServletRequest request, Model model)
//	         throws ServletException, IOException {
//	      logger.info("<<< url => /logout.do >>>");
//	      
//	      //세션삭제
//	      request.getSession().invalidate();
//	         
//	       return "common/main";
//	    }
//
//	// [회원탈퇴] 
//	// 회원탈퇴  - 인증화면
//	   @RequestMapping("/deleteCustomer.do")
//		public String deleteCustomer(HttpServletRequest request, Model model) 
//			throws ServletException, IOException {
//			 logger.info("<<< url => /deleteCustomer.do >>>");
//
//			return "customer/mypage/customerInfo/deleteCustomer";
//		}
//  
//	   
//	// 회원탈퇴 처리
//	   @RequestMapping("/deleteCustomerAction.do")
//		public String deleteCustomerAction(HttpServletRequest request, Model model) 
//			throws ServletException, IOException {
//			service.deleteCustomer(request, model);
//			 logger.info("<<< url => /deleteCustomerAction.do >>>");
//
//			return "customer/mypage/customerInfo/deleteCustomerAction";
//		}
//	   
//	   
//	// [회원수정] - 인증화면
//	   @RequestMapping("/modifyCustomer.do")
//			public String modifyCustomer(HttpServletRequest request, Model model) 
//			throws ServletException, IOException {
//			logger.info("<<< url => /modifyCustomer.do >>>");
//
//			return "customer/mypage/customerInfo/modifyCustomer";
//			}
//	   
//	   
//	   
//	// [회원수정]  - 상세페이지(수정을 위해 기존데이터 가져오기)
//	   @RequestMapping("/modifyDetailAction.do")
//	 	public String modifyDetailAction(HttpServletRequest request, Model model) 
//	 			throws ServletException, IOException {
//		   logger.info("<<< url => /modifyDetailAction.do >>>");
//		   
//	 		service.modifyDetailAction(request, model);
//	 			
//
//	 		return "customer/mypage/customerInfo/modifyDetailAction";
//	 	}
//	   
//	 //  [회원수정] - 결과 페이지
//	   @RequestMapping("/modifyCustomerAction.do")
//	 	public String modifyCustomerAction(HttpServletRequest request, Model model) 
//	 			throws ServletException, IOException {
//		   logger.info("<<< url => /modifyCustomerAction.do >>>");
//		   
//	 		service.modifyCustomerInAction(request, model);
//	 			
//
//	 		return "customer/mypage/customerInfo/modifyCustomerAction";
//	 	}
//	   
//	   

}
