<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID PW Find</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/find.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js"
   crossorigin="anonymous" defer></script>
<!-- google font -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

   var member_id = $("#member_id").val();
   
   
   window.name = 'myPage';
   
   $(function() {
      $("#idalert").hide();
   });

   $(function() {
      $("#keyalert").hide();
   })
   
   var emailcode = null;


   function idChk() {

      var member_name = $("#member_name").val().trim();
      var member_phone = $("#member_phone").val().trim();

      var idVal = {
         "member_name" : member_name,
         "member_phone" : member_phone
      }
      if (member_name == null || member_name == "" || member_phone == null
            || member_phone == "") {
         $("#idalert").show();
         $("#idalert").html("이름과 핸드폰번호를 입력해주세요.").css({
            'color' : 'red',
            'font-size' : '11px'
         });
      } else {
         $.ajax({
            type : "post",
            url : "idchk.do",
            data : JSON.stringify(idVal),
            contentType : "application/json",
            dateType : "json",
            success : function(msg) {
               console.log('통신성공');
               console.log(member_name);
               console.log(msg.check);
               if (msg.check == true) {
                  alert("ID는 : " + msg.member_id + " 입니다");
                  location.href = 'goid.do';
               } else {
                  $("#idalert").show();
                  $("#idalert").html("이름 혹은 번호가 올바르지 않습니다").css({
                     'color' : 'red',
                     'font-size' : '11px'
                  });
               }
            },
            error : function() {
               console.log('통신실패');

            }
         });

      }
   }
   

   
   
   //이메일 번호 동일 여부 및 비밀번호변경 페이지 이동 
   function CodeChk() {
      
      
      var inputEmailcode = $("#input_email_code").val().trim();
      
      
      
      if (emailcode == inputEmailcode) {
         $("#email_check").text("이메일 인증을 성공했습니다.").css({
            'color' : 'blue',
            'font-size' : '11px'
         });
         alert("새 비밀번호 변경 창으로 이동합니다.");
         
         window.open("pwupdate.do?member_id="+ $("#member_id").val(),
               "",
               "height=600, width=1000, left=50%, top=50%");


         
               
         
      } else {
         $("#email_check").text("이메일 인증을 실패했습니다. 다시 시도하여주십시오.").css({
            'color' : 'red',
            'font-size' : '11px'
         });
      }
   }
   

   // 비밀번호 이메일 인증까지 
   function pwChk() {

      var member_id = $("#member_id").val().trim();
      var member_email = $("#member_email").val().trim();

      var pwVal = {
         "member_id" : member_id,
         "member_email" : member_email

      }

      console.log(member_id);
      console.log(member_email);

      if (member_id == null || member_id == "" || member_email == null
            || member_email == "") {
         $("#pwalert").show();
         $("#pwalert").html("ID와 이메일을 입력해주세요.").css({
            'color' : 'red',
            'font-size' : '11px'
         });
      } else {
         $.ajax({
            type : "post",
            url : "pwchk.do",
            data : JSON.stringify(pwVal),
            contentType : "application/json",
            dateType : "json",
            success : function(msg) {
               console.log('통신성공!');
               console.log(msg.member_id);
               if (msg.check == true) {
                  alert("인증번호를 확인 후 입력해주세요.")
                  console.log(msg.ran);
                  $("#keyalert").show();
                  $("#input_email_code").focus();
                  emailcode = msg.ran;
                  
               
               } else {
                  console.log("<<<<<<<<")
                  $("#pwalert").show();
                  $("#pwalert").html("ID 혹은 이메일이 올바르지 않습니다").css({
                     'color' : 'red',
                     'font-size' : '11px'
                  });
               }

            },
            error : function() {
               console.log('통신오류!!');

            }
         });
      }
   }
   
      
</script>


</head>
<body>

   <section>
      <div class="id-wrapper">
         <h2>ID 찾기</h2>
         <input type="text" name="member_name" autocomplete="off"
            id="member_name" placeholder="&#xf2bd; Name" /> <input type="text"
            name="member_phone" autocomplete="off" id="member_phone"
            placeholder="&#xf2bd; Phone)01022339988" />
         <div id="idalert"></div>
         <input type="button" id="idBtn" value="Go to Find" onclick="idChk()" />
         <span> <a href="registForm.do">Don't have an Account?</a> <a
            href="login.do">LOGIN</a> <a href="main.do">홈으로</a>
         </span>

      </div>


      <div class="pw-wrapper">
         <h2>PW 찾기</h2>
         
         <input type="text" name="member_id" autocomplete="off" id="member_id" placeholder="&#xf2bd; User id" /> 
         
         <input type="text"   name="member_email" autocomplete="off" id="member_email" placeholder="&#xf2bd; Email" />
         <div id="pwalert"></div>
         <input type="button" id="pwBtn" value="Go to Find" onclick="pwChk()">
         <span> <a href="registForm.do">Don't have an Account?</a> <a
            href="login.do">LOGIN</a> <a href="main.do">홈으로</a>
         </span>
         <div id="keyalert">
            <input type="text" id="input_email_code" placeholder="&#xf2bd; 인증번호입력" /> 
            <input type="button" class="chkBtn" value="인증번호 확인" onclick="CodeChk();">
         </div>
         <div class="msg_check" id="email_check"></div>
      
      </div>
   </section>

</body>
</html>





