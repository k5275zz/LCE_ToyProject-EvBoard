package org.Lecha.controller;

import org.Lecha.dto.LikeDTO;
import org.Lecha.service.LikeServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/like")
public class LikeActionController {
	private static final Logger logger = LoggerFactory.getLogger(LikeActionController.class);
	@Autowired
	LikeServiceImpl lservice;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ResponseEntity<String> likeInsert(@RequestBody LikeDTO ldto) {
		System.out.println("ldto="+ldto.toString());
		int result=lservice.likeInsert(ldto);
		System.out.println(result);
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 좋아요 여부확인
	@RequestMapping(value = "/likecheck",method = RequestMethod.POST)
	public ResponseEntity<String> likeCheck(@RequestBody LikeDTO ldto) {
		System.out.println("ldto="+ldto.toString());
		LikeDTO result = lservice.likeCheck(ldto);
		System.out.println(result);
		return result != null ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 좋아요 취소
	@RequestMapping(value = "/del",method = RequestMethod.DELETE)
	public ResponseEntity<String> likeDel(@RequestBody LikeDTO ldto){
		int result=lservice.likeDelete(ldto);
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
