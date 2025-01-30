package com.spring.nardrak_mvc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	// -------------------------[메인 화면]-------------------------
	@RequestMapping("main.do")
    public String main() {
        logger.info("<<< url ==>  /main.do >>>");
        
        return "common/main";
     }
	
}
