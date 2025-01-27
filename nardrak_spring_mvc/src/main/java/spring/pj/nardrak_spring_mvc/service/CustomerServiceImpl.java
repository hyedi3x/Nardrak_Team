package spring.pj.nardrak_spring_mvc.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.pj.nardrak_spring_mvc.dao.CustomerDAO;
import spring.pj.nardrak_spring_mvc.dto.CustomerDTO;


@Service
public class CustomerServiceImpl implements CustomerService {
   
   @Autowired
   private CustomerDAO dao;   //다형성 적용
   
   //ID 중복확인 처리
   @Override
   public void inConfirmAction(HttpServletRequest request,HttpServletResponse response, Model model)
         throws ServletException, IOException {
      
      System.out.println("서비스 - idConfirmAction()");
      
      // 3단계. 스트리트에서 get방식으로 넘긴 값을 가져온다.
      String strId = request.getParameter("user_id");
      
      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
      //CustomerDAO dao = CustomerDAOImpl.getInstance();
   
      // 5단계. ID 중복확인 처리
      int selectCnt = dao.useridCheck(strId);
      
      // 6단계. jsp로 처리결과 전달
      model.addAttribute("selectCnt", selectCnt);
      model.addAttribute("strId", strId);
   }
   
   //회원가입 처리
   @Override
   public void signInAction(HttpServletRequest request,HttpServletResponse response, Model model)
         throws ServletException, IOException {
      
      System.out.println("서비스 - signInAction()");
      
      
      //DTO 생성
      CustomerDTO dto = new CustomerDTO();
      dto.setUser_id(request.getParameter("user_id"));
      dto.setUser_pwd(request.getParameter("user_pwd"));
      dto.setUser_name(request.getParameter("user_name"));
      dto.setUser_gender(request.getParameter("user_gender"));
      dto.setUser_birthday(Date.valueOf(request.getParameter("user_birthday")));   //sql.Date
      
      
      // [핸드폰 번호 입력] (010-1111-2222)
      String hp = "";
      
      String hp1 = request.getParameter("user_hp1");
      String hp2 = request.getParameter("user_hp2");
      String hp3 = request.getParameter("user_hp3");

      hp = hp1 + "-" + hp2 + "-" + hp3;
     
      dto.setUser_ph(hp);
      
      // 주소
      String user_addr ="";
      
      String road_ad = request.getParameter("road");	  // 도로명주소
      String detail_ad = request.getParameter("detail");  // 상세주소
      
      
   // 상세주소가 없을 경우
      if(detail_ad.equals("")) {
    	  user_addr = road_ad;
      }
      // 상세주소가 있을 경우
      else {
    	  user_addr = road_ad + "," + detail_ad;
      }
      
      dto.setUser_addr(user_addr);
      
      //이메일
      String email1 = request.getParameter("user_email1");
      String email2 = request.getParameter("user_email2");
      String email = email1 + "@" + email2;
      
      dto.setUser_email(email);
      
      //지역 전화번호 필수가 아니므로 null 값이 들어올 수 있으므로 값이 존재할 때만 받아온다. (010-1111-2222)
      String hpp = "";
      
      String hpp1 = request.getParameter("user_hpp1");
      String hpp2 = request.getParameter("user_hpp2");
      String hpp3 = request.getParameter("user_hpp3");
      
      if(!hpp1.equals("")&& !hpp2.equals("")&& !hpp3.equals("")) {
         hpp = hpp1 + "-" + hpp2 + "-" + hpp3;
      }
      dto.setUser_ph(hpp);
      
      dto.setUser_regdate(new Timestamp(System.currentTimeMillis())); //System.currentTimeMillias()현재 시각
      
      
      // 개인정보 수집/이용동의 작성필요
      
      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
      //CustomerDAOImpl instance = new CustomerDAOImpl();
      //CustomerDAO dao = CustomerDAOImpl.getInstance();
      
      // 5단계. 회원가입 처리
      int insertCnt = dao.insertCustomer(dto);
      
      // 6단계. jsp로 처리결과 전달
      model.addAttribute("insertCnt", insertCnt);
   }
   

//   //로그인 처리 / 회원정보 인증(수정, 탈퇴)
//   @Override
//   public void loginInAction(HttpServletRequest request, Model model)
//         throws ServletException, IOException {
//      
//      System.out.println("서비스 - loginAction()");
//      
//      // 3단계. 스트리트에서 get방식으로 넘긴 값을 가져온다. (join.jsp에서...)
//      
//      String strId = request.getParameter("user_id");
//      String strPassword = request.getParameter("user_password");
//            
//      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
//      //CustomerDAO dao = CustomerDAOImpl.getInstance();
//         
//      Map<String,Object> map = new HashMap<String,Object>();
//      map.put("strId", strId);  //key , value
//      map.put("strPassword", strPassword);
//      
//      // 5단계. ID 중복확인 처리
//      int selectCnt = dao.idPasswordChk(map);
//      
//      // 로그인 성공시 세션 ID를 설정(중요)
//      if(selectCnt == 1) {
////         HttpSession session = request.getSession();
////         session.setAttribute("sessionID", strId);
//         request.getSession().setAttribute("sessionID", strId);
//      }
//      // 6단계. jsp로 처리결과 전달
//      //request.setAttribute("selectCnt", selectCnt);
//      
//      
//      
//   }
//   
//   //회원정보 인증처리 및 탈퇴처리
//   @Override
//   public void deleteCustomer(HttpServletRequest request, Model model)
//         throws ServletException, IOException {
//      System.out.println("서비스 - deleteInAction()");
//      
//      //3단계. 화면에서 입력받은 값을 가져온다.(비밀번호), 세션(id)
//      String strId = (String)request.getSession().getAttribute("sessionID");
//      String strPassword = request.getParameter("user_password");
//            
//      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
//      //CustomerDAO dao = CustomerDAOImpl.getInstance();
//            
//      Map<String,Object> map = new HashMap<String,Object>();
//      map.put("strId", strId);  //key , value
//      map.put("strPassword", strPassword);
//      
//      
//      // 5-1. 회원정보 인증처리
//      int selectCnt = dao.idPasswordChk(map);
//      
//      int deleteCnt = 0;
//      
//      // 회원정보 인증 성공시
//      if(selectCnt == 1) {
//         // 5-2단계. 탈퇴페이지
//         deleteCnt = dao.deleteCustomer(strId);
//         if(deleteCnt == 1) {
//            request.getSession().invalidate(); //주의 => 세션 삭제
//         }
//      }
//            
//      // 6단계. jsp로 처리결과 전달
//      model.addAttribute("selectCnt", selectCnt);
//      model.addAttribute("deleteCnt", deleteCnt);
//      }
//   
//   
//   
//   //회원정보 인증처리 및 상세페이지
//   @Override
//   public void modifyDetailAction(HttpServletRequest request, Model model)
//         throws ServletException, IOException {
//      System.out.println("서비스 - modifyDetailInAction()");
//      
//      //3단계. 화면에서 입력받은 값을 가져온다.(비밀번호), 세션(id)
//      String strId = (String)request.getSession().getAttribute("sessionID");
//      String strPassword = request.getParameter("user_password");
//      
//      System.out.println("strId :" + strId);
//      System.out.println("strPwd :" + strPassword);
//      
//      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
//      //CustomerDAO dao = CustomerDAOImpl.getInstance();
//      
//      // 5-1. 회원정보 인증처리
//    
//      Map<String,Object> map = new HashMap<String,Object>();
//      map.put("strId", strId);  //key , value
//      map.put("strPassword", strPassword);
//      
//      int selectCnt = dao.idPasswordChk(map);
//      
//      CustomerDTO dto = null;
//      
//      // 회원정보 인증 성공시
//      if(selectCnt == 1) {
//         // 5-2단계. 상세페이지
//         dto = dao.getCustomerDetail(strId);
//      }
//      
//      // 6단계. jsp로 처리결과 전달
//      model.addAttribute("selectCnt", selectCnt);
//      model.addAttribute("dto", dto);
//   }
//
//   //회원정보 수정처리
//   @Override
//   public void modifyCustomerInAction(HttpServletRequest request, Model model)
//         throws ServletException, IOException {
//      
//      System.out.println("서비스 - modifyCustomerInAction()");
//      
//      // 3단계. 화면에서 입력받은 값을 가져와서 dto에 담는다.(id는 세션값)
//      CustomerDTO dto = new CustomerDTO();
//      dto.setUser_id((String)request.getSession().getAttribute("sessionID"));   //input 박스에서 입력받지 않고 세션ID를 사용
//      dto.setUser_password(request.getParameter("user_password"));
//      dto.setUser_name(request.getParameter("user_name"));
//      dto.setUser_birthday(Date.valueOf(request.getParameter("user_birthday")));   //sql.Date
//      
//      
//      // 주소
//      String user_address ="";
//      
//      String road_ad = request.getParameter("road");	 // 도로명주소
//      String detail_ad = request.getParameter("detail");  // 상세주소
//      
//      
//   // 상세주소가 없을 경우
//      if(detail_ad.equals("")) {
//    	  user_address = road_ad;
//      }
//      // 상세주소가 있을 경우
//      else {
//    	  user_address = road_ad + "," + detail_ad;
//      }
//      
//      dto.setUser_address(user_address);
//      
//      
//  
//      //연락처
//      String hp = "";
//      
//      String hp1 = request.getParameter("user_hp1");
//      String hp2 = request.getParameter("user_hp2");
//      String hp3 = request.getParameter("user_hp3");
//      
//      if(!hp1.equals("")&& !hp2.equals("")&& !hp3.equals("")) {
//         hp = hp1 + "-" + hp2 + "-" + hp3;
//      }
//      dto.setUser_hp(hp);
//      
//      //이메일
//      String email1 = request.getParameter("user_email1");
//      String email2 = request.getParameter("user_email2");
//      String email = email1 + "@" + email2;
//      
//      dto.setUser_email(email);
//      
//      //등록날짜
//      dto.setUser_regdate(new Timestamp(System.currentTimeMillis()));
//      
//      // 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
//     //CustomerDAO dao = CustomerDAOImpl.getInstance();
//      
//      // 5단계. 회원정보 수정처리
//     int updateCnt = dao.updateCustomer(dto);
//      
//      // 6단계. jsp로 처리결과 전달
//      model.addAttribute("updateCnt", updateCnt);
//  }
}
