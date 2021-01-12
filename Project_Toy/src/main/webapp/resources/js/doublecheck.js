/**
 * 아이디 중복확인
 */

$(document).ready(function(){
	
	$("#doublecheckbtn").click(function(){
		
		var userid = $("#userid").val();
		
		$.ajax({
						type:"post",
						url:"/email/useridCheck",
						data:JSON.stringify({id:userid}),
						contentType:"application/json;text/plain; charset=utf-8",
						success:function(result){
							
								if(result=="success"){
									alert("중복된아이디입니다.")
								}
									
						},
						error:function(){
							$("#doublecheckbtn").val("사용가능").attr("class","btn btn-outline-success btn-sm")
							$("#doublecheckbtn").attr("disabled","disabled")
						} 
					})// ajax 수정 끝
	})
	
	
})