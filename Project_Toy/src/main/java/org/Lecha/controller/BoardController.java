package org.Lecha.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Lecha.dto.EvBoardDTO;
import org.Lecha.dto.PageConditionDTO;
import org.Lecha.dto.PageDTO;
import org.Lecha.service.EvBoardServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private EvBoardServiceImpl eservice;

	@GetMapping("/write")
	public void getWrite() {

	}

	@GetMapping(value = "/evaluationlist")
	// 페이징 후 리스트
	public void getListPaging(PageConditionDTO pcdto, Model model) {
		logger.info("type=" + pcdto.getType());
		int total = eservice.getTotal();
		int reply = eservice.getReplyCount();
		logger.info("pcdto=" + pcdto);
		logger.info("전체 건수=" + total);
		logger.info("replycount=" + reply);
		model.addAttribute("list", eservice.evBoardList(pcdto));
		model.addAttribute("pageMaker", new PageDTO(pcdto, total));
	}

	// 강의평가 글쓰기
	@PostMapping("/evaluationwrite")
	public String postEvlWrite(EvBoardDTO edto, HttpServletRequest request, HttpServletResponse response,MultipartFile[] uploadFile)
			throws IOException {
		System.out.println(edto.toString());
		
		
		if (edto.getId() == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요합니다.'); history.go(-1);</script>");
			out.flush();
		}
		String uploadFolder = "C:\\Project\\ToyProject\\Project_Toy\\src\\main\\webapp\\resources\\uploadFolder";
		// UUID클래스를 이용하여 중복되지 않는 랜덤값을 생성
					
		for (MultipartFile files : uploadFile) {
			logger.info("사용자가 선택한 파일명 : " + files.getOriginalFilename());
			logger.info("사용자가 선택한 파일크기 : " + files.getSize());
			
			String uploadFileName = "";
			UUID uuid = UUID.randomUUID();
			logger.info("uuid=" + uuid);
			uploadFileName = uuid.toString() + "_" + files.getOriginalFilename();
			edto.setUploadPath(uploadFileName);
			// File saveFile = new File(파일 업로드 경로, 파일명);
			File savaFile = new File(uploadFolder, uploadFileName);
			
			try {
				files.transferTo(savaFile);
			} catch (Exception e) {
				e.getMessage();
			}
			
		}
		
		eservice.evBoardinsert(edto);
		return "redirect:/board/evaluationlist";
	}

	// 글상세보기
	@GetMapping("/evaluationdetail")
	public void getEvldetail(@RequestParam("bno") int bno, Model model, @RequestParam("id") String id) {
		EvBoardDTO detail = eservice.evBoardDetail(bno);
		detail.setLecturecontent(detail.getLecturecontent().replace("\r\n", "<br>"));
		String nowid = id;
		System.out.println("로그인아이디는:" + nowid);
		System.out.println("게시판작성자는:" + detail.getId());
		// 같아도 올라간다.
		if (!nowid.equals(detail.getId())) {
			eservice.getViews(bno);
			/* int views = model.addAttribute("views", views); */
		}

		model.addAttribute("detail", detail);
	}
	// 글 수정하기
	@PostMapping("/evaluationupdate")
	public String postUpdate(EvBoardDTO edto) {
		eservice.postUpdate(edto);
		return "redirect:/board/evaluationlist";
	}
	// 글 삭제
	@PostMapping("/evaluationdelete")
	public String postDelete(@RequestParam("bno") int bno) {
		eservice.postDelete(bno);
		return "redirect:/board/evaluationlist";
	}
}
