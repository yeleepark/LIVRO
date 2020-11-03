<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SNSregist</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/snsjoin.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/d28db34e8b.js" crossorigin="anonymous" defer></script>
<!-- google font -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
   rel="stylesheet">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/snsregist.js">
</script>

</head>
<body>
   <section>
      <div class="sns-wrapper">
         <h2>SNS 회원 가입</h2>
         <form action="snsjoin.do" id="joinform" method="post">
            <input type="hidden" name="member_id" value="${snsinfo.member_id }"/>
            <input type="hidden" name="member_pw" value="${snsinfo.member_pw }"/>
            <input type="hidden" name="member_email" value="${snsinfo.member_email }"/>
            <input type="hidden" name="member_name" value="${snsinfo.member_name }"/>
            <div>
            
            <label for=member_nickname>닉네임</label> 
                  <input type="text" id="member_nickname" name="member_nickname"
                     title="닉네임은 3~10자 이내 한글,영문,숫자만 사용가능합니다.(공백사용불가)
                     " placeholder="닉네임" /> 
                     <input type="button" class="joinChkBtn" value="중복확인"
                     onclick="nick_Chk();">
                  <div class="msg_check" id="nickname_check"></div>
            </div>
            <div>
            <label for="member_addr1">주소</label>
               <input placeholder="우편번호" type="text" readonly="readonly" id="member_postcode"
                     name="member_addr1">
               <button type="button" class="joinChkBtn" onclick="execPostCode();">
                  <i class="fa fa-search"></i> 우편번호 찾기
               </button>
               </div>
            <div>
               <input placeholder="도로명 주소" id="member_addr" type="text"
                     readonly="readonly" name="member_addr2" />
            </div>
            <div>
                  <input placeholder="상세주소" type="text" id="member_addrdetail"
                     name="member_addr3" />
            </div>
               
            <div>
               <label for=member_phone>휴대폰번호</label>
               <input type="text" id="member_phone" placeholder="- 생략하고 입력해주세요."
                     name="member_phone" />
               <div class="msg_check" id="phone_check"></div>
               </div>
               
               <input type="submit" value="Sign Up" id="confirm" class="goJoinBtn">
               <input type="button" value="홈으로" class="goJoinBtn" onclick="historyback();">
         
         </form>
      </div>   
</section>

</body>
</html>



