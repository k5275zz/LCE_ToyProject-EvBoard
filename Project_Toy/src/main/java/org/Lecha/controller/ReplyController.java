package org.Lecha.controller;

import java.util.ArrayList;

import org.Lecha.dto.ReplyDTO;
import org.Lecha.service.ReplyServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/replies",method = RequestMethod.GET)
public class ReplyController {
	@Autowired
	ReplyServiceImpl rservice;
	
	@RequestMapping(value = "/new",method = RequestMethod.POST)
	public ResponseEntity<String> repwrite(@RequestBody ReplyDTO rdto) {
		System.out.println("rdto= "+rdto.toString());
		int result=rservice.replyInsert(rdto);
		System.out.println(result);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 댓글리스트
	@RequestMapping(value = "/{bno}",method = RequestMethod.GET)
	public ResponseEntity<ArrayList<ReplyDTO>> getList(@PathVariable("bno")int bno){
		
		return new ResponseEntity<>(rservice.replyList(bno),HttpStatus.OK);
	}
	// 댓글 삭제
	@RequestMapping(value = "/del",method = RequestMethod.DELETE)
	public ResponseEntity<String> repDel(@RequestBody ReplyDTO rdto){
		System.out.println("rdto"+rdto.toString());
		int result=rservice.replyDelete(rdto);
		System.out.println("result=::"+result);
		return result == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 댓글 수정
	@RequestMapping(value = "/put",method = RequestMethod.PUT)
	public ResponseEntity<String> repUpdate(@RequestBody ReplyDTO rdto){
		System.out.println("rdto"+rdto.toString());
		int result=rservice.replyUpdate(rdto);
		System.out.println("result=::"+result);
		return result == 1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
