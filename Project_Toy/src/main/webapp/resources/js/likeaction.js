/**
 * ajax 좋아요 처리
 */

$(document).ready(function(){
	var bno = $("#bno").val();
	var id = $("#id").val();
	
	
	likeCheck();
	
	function likeCheck(){
		var str="";
		var str1="";
		str+='<button style="border: 0;outline: 0; background:#F8F9FA;" id="fullheart"><i class="fas fa-heart" style="color: red; "></i></button>'
			
		str1+=	'<button style="border: 0;outline: 0;background:#F8F9FA;" id="emptyheart"><i class="far fa-heart"></i></button>'
		
		$.ajax({
			type : "post",
			url : "/like/likecheck",
			data:JSON.stringify({bno:bno,id:id}),
			contentType:"application/json; text/plain; charset=utf-8",
			success:function(result){
							if(result=="success"){
								
								//location.reload();
								$("#heartexist").html(str)
							}
						},
						error:function(){
							
							$("#heartexist").html(str1)
						} 
		})
	}
	// 좋아요 등록
	$("#heartexist").on("click","#emptyheart",function(e){
		e.preventDefault();
		
		if(id!=""&&bno!=""){
			$.ajax({
			type : "post",
			url : "/like/insert",
			data:JSON.stringify({bno:bno,id:id}),
			contentType:"application/json; text/plain; charset=utf-8",
			success:function(result){
							if(result=="success"){
								alert("등록성공");
								//location.reload();
								likeCheck();			
							}
						},
						error:function(){		
							alert("데이터베이스 오류")		
							location.href = "/index"		
						} 
		})
			
		}else{
			alert("로그인이 필요합니다.")
			location.href = "/member/login"
		}
		
	})
	// 좋아요 취소
	$("#heartexist").on("click","#fullheart",function(e){
		e.preventDefault();
		
		if(id!=""&&bno!=""){
			$.ajax({
			type : "delete",
			url : "/like/del",
			data:JSON.stringify({bno:bno,id:id}),
			contentType:"application/json; text/plain; charset=utf-8",
			success:function(result){
							if(result=="success"){
								alert("삭제성공");
								//location.reload();
								likeCheck();			
							}
						},
						error:function(){		
							alert("데이터베이스 오류")		
							location.href = "/index"		
						} 
		})
			
		}else{
			alert("로그인이 필요합니다.")
			location.href = "/member/login"
		}
		
	})
})