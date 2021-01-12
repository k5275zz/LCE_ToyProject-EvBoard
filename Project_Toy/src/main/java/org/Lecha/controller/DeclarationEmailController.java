package org.Lecha.controller;

import org.Lecha.dto.DeclarationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/email", method = RequestMethod.GET)
public class DeclarationEmailController {
	@Autowired
	MailSender sender;
	
	// 신고 로직
		@RequestMapping(value = "/declaration", method = RequestMethod.POST)
		public String declarationAction(DeclarationDTO ddto) {
			System.out.println("신고하기 도착");
			System.out.println(ddto.toString());
			// 메일 내용 설정
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo("dlcodms1231@naver.com"); // 수신자 설정
			message.setSubject("[강의평가 신고]"+ ddto.getReportTitle()); // 메일 제목 설정
			message.setText("신고내용 : " + ddto.getReportContent()); // 메일 내용 설정
			message.setFrom("codms2ek@gmail.com"); // 발신자 설정
			sender.send(message);
			
			return "redirect:/index";
		}
}
