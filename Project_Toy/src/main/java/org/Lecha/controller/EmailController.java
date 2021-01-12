package org.Lecha.controller;

import org.Lecha.dto.DeclarationDTO;
import org.Lecha.dto.MailDTO;
import org.Lecha.dto.MemberDTO;
import org.Lecha.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/email", method = RequestMethod.GET)
public class EmailController {

	@Autowired
	MailSender sender;
	@Autowired
	MemberService mservice;

	// 이메일 인증로직
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public ResponseEntity<String> emailcheckAction(@RequestBody MailDTO mailDTO) {
		System.out.println("메일체크 도착");
		System.out.println(mailDTO);
		String user_Email = mailDTO.getUseremail();
		// 6자리 난수생성
		int authCode = 0;
		String authCodes = "";
		boolean bool = false;
		String result = "";
		if (user_Email != null && !user_Email.isEmpty()) {

			for (int i = 0; i < 6; i++) {
				authCode = (int) (Math.random() * 9 + 1);
				authCodes += Integer.toString(authCode);
				System.out.println(authCodes);
			}

			// 메일 내용 설정
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(user_Email); // 수신자 설정
			message.setSubject("[인증키] 강의평가사이트 인증키입니다."); // 메일 제목 설정
			message.setText("인증키 : " + authCodes); // 메일 내용 설정
			message.setFrom("codms2ek@gmail.com"); // 발신자 설정
			result = authCodes;
			sender.send(message);
			bool = true;
		}

		return bool ? new ResponseEntity<>(result, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	// 아이디 중복확인
	@RequestMapping(value = "/useridCheck", method = RequestMethod.POST)
	public ResponseEntity<String> useridCheck(@RequestBody MemberDTO mdto) {
		System.out.println("aaa");
		boolean tf = mservice.useridcheck(mdto);
		System.out.println(tf);
		String result = "success";
		return tf ? new ResponseEntity<>(result, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
