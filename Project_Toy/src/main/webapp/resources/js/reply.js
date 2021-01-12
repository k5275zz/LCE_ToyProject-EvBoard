/**
 * ajax 댓글처리
 */

$(document).ready(function(){
	var bno = $("#bno").val();
	var rno="";
	var id = $("#id").val();
	
	getList();
	
	// 댓글 목록 리스트 함수(getList)
	function getList(){ // get방식만 사용가능한 형태
	
		$.getJSON("/replies/"+bno+".json",
				function(data){	// 전송이 성공적으로 끝났을때
				var str="";
					console.log(data); // 개발자 도구 콘솔에 결과를 남겨준다.
					$(data).each(function(){
						if(id==this.replyer){
							str+="<li data-rno="+this.rno+" id=replies"+this.rno+">"
						+"<input type='hidden' id=recontent"+this.rno+" value='"+this.reply+"'>"+'<div><b>'+this.replyer+'</b></div>'+this.reply+'<br><span style="font-size: x-small;">'+this.replydate+'</span>'
						+"<input type='hidden' id=rewriter"+this.rno+" value='"+this.replyer+"'>"
						+"<div id=moddiv"+this.rno+"></div><button type='button' class='btn btn-outline-success btn-sm' id='replyModBtn'>수정</Button>"
						+"<button type='button' class='btn btn-outline-danger btn-sm' id='replyDelBtn'>삭제</button><hr></li>"	
						}else{
							str+="<li data-rno="+this.rno+" id=replies"+this.rno+">"
						+"<input type='hidden' id=recontent"+this.rno+" value='"+this.reply+"'>"+'<div><b>'+this.replyer+'</b></div>'+this.reply+'<br><span style="font-size: x-small;">'+this.replydate+'<hr></span>'
						+"<input type='hidden' id=rewriter"+this.rno+" value='"+this.replyer+"'>"
						}
						
											
					})
					$("#replies").html(str);					
					/*$(data.list).each(function(){
						
					})*/
				})	
	}
					/*수정버튼 로직실행*/
					$("#replies").on("click","#replyModBtn",function(e){
					e.preventDefault();
					
					var reply=$(this).parent();
					rno = reply.attr("data-rno");
					var recontent=$("#recontent"+rno).val()
					var rewriter=$("#rewriter"+rno).val()
					
					var modstr="";
					modstr += "<div><b>댓글내용</b><br><textarea id=reply"+rno+" name='reply' rows='10' cols='50'>"+recontent+"</textarea>"
								+"<input id='replyer' type='hidden' name='replyer' value='"+rewriter+"'>"
								+"<br><button type='button' class='btn btn-success btn-sm' id='replyRnoModBtn'>댓글 수정</button><br><br></div>";
					$("#moddiv"+rno).html(modstr)
						
					})//수정 끝
					// 댓글 재수정버튼
					$("#replies").on("click","#replyRnoModBtn",function(e){// 수정등록버튼
						e.preventDefault();
						var reply = $("#reply"+rno).val();
						//var rno =$(".rno").val();	
						//alert(reply);
						//alert(rno);
						//ajax 수정시작
						// 전페이지에 가지고 있던 rno값을 가지고 이동, 입력한 reply값도 가지고 이동한다.
						$.ajax({
						type:"put",
						url:"/replies/put",
						data:JSON.stringify({rno:rno,reply:reply}),
						contentType:"application/json;text/plain; charset=utf-8",
						success:function(result){
							if(result=="success"){
								alert("수정성공");
								//location.reload();
								getList();
							}
						},
						error:function(){
							alert("수정실패")
						} 
					})// ajax 수정 끝
					})	
					
	/*삭제버튼 로직실행*/
			$("#replies").on("click","#replyDelBtn",function(e){
			 e.preventDefault();		
			var reply=$(this).parent();
			rno = reply.attr("data-rno");
					
			$.ajax({
				type:"delete",
				url:"/replies/del",
				data:JSON.stringify({rno:rno}),
				contentType:"application/json;text/plain; charset=utf-8",
				success:function(result){
					if(result=="success"){
						alert("삭제성공")
						// location.reload();
						getList();
						}
					},
						error:function(){
							alert("삭제실패")
						} 
					})// ajax 삭제 끝
					
					}) // del버튼 클릭 끝
	// 댓글추가기능				
	$("#replyAddBtn").on("click",function(){
		
		var reply = $("#reply").val();
		var replyer = $("#replyer").val();
		
		if(id!=""){
			$.ajax({
			type : "post",
			url : "/replies/new",
			data:JSON.stringify({bno:bno,reply:reply,replyer:replyer}),
			contentType:"application/json; text/plain; charset=utf-8",
			success:function(result){
							if(result=="success"){
								alert("등록성공");
								//location.reload();
								getList();
							}
						},
						error:function(){
							alert("등록실패")
						} 
		})
		}else{
			alert("로그인이 필요합니다.")
			location.href = "/member/login"
		}
		
	})
	
})