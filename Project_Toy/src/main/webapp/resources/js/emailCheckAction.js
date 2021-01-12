/**
 * ajax join.jsp 이메일 인증처리
 */

$(document).ready(function(){
	
	$("#btemail").click(function(){
		
		var useremail = $("#usermail").val()
		alert(useremail)
		var key;//인증키
		var bool = true;
		
		if(bool){
			$.ajax({
						type:"post",
						url:"/email/emailCheck",
						data:JSON.stringify({useremail:useremail}),
						contentType:"application/json;text/plain; charset=utf-8",
						success:function(result){
							
								alert("인증번호 전송!");
								//location.reload();
								key=result;
								bool=false;
								$("#btemail").val("인증번호 전송완료").attr("class","btn btn-outline-success btn-sm")		
						},
						error:function(){
							alert("발송실패")
						} 
					})// ajax 수정 끝
			alert("메일을 확인해주세요.")		
			
			
			$("#writechk1").keyup(function(){
				var userContent = $("#writechk1").val();
				//var writecheck = $("#writechk2").text();
				if(userContent.length>=6){ // 글자수가 6개일때 로직 실행
					if(userContent == key){// 유저가 입력한 수와 키값이 같으면 로직 실행
						$("#emailChk").val("Y");
						$("#writechk2").text("인증완료");	
						$("#btemail").attr("disabled",true);// 읽기 전용으로 변환
						$("#writechk1").attr("disabled",true);
						$("#usermail").attr("disabled",true);
						$("#joinbtn").attr("disabled",false)// 회원가입 버튼 활성화
					}else{
						$("#emailChk").val("N");
						$("#writechk2").text("인증실패");
						event.preventDefault();
					}
						
				}
				
				
			})		
		}
	})
	
})