# LIVRO 라이브 스트리밍이 가능한 온라인 음원 유통 플랫폼

# 📍개발동기
'누구나 가수가 될 수 있다'

코로나19의 장기화로 인해 비대면을 뜻하는 언택트(Untact)에 온라인을 통한 외부와의 연결(On)을 더한 개념인 온택트(Ontact)라는 새로운 흐름이 생겼습니다. 저희는 글로벌 음원 유통 사이트인 '사운드 클라우드'를 벤치마킹하여 온택트 시대에 비대면 공연도 제공할 수 있는 플랫폼을 만들고자 기획하게 되었습니다.


# 📍개발기간

- 2020년 10월 19일 ~ 2020년 11월 17일


# 📍팀원소개
- 박서윤 | 팀장 [GitHub](https://github.com/pionari) 

  일반 로그인, 통합검색, 팔로우/팔로잉 구현, 음원게시판(CRUD), 응원게시판(CRUD, 댓글, 페이징, 내가 쓴 글, 신고), 
  
  일정게시판(CRUD, Toast Calendar api), 아티스트 별 방송내역(moment.js),  아티스트 채널 별 지도 (카카오 지도 API), 
  
  랭킹 (d3.js, moment.js), 아티스트 채널 개설(이미지 업로드 및 수정), Interceptor 적용, 아티스트 채널 및 랭킹페이지 반응형

- 라현준 | 팀원 [GitHub](https://github.com/la-Hyun-Jun) 

  SNS 로그인 (구글, 네이버), 아이디/비밀번호 찾기, 일반유저 및 아티스트 회원정보 수정, 비밀번호 변경, 회원탈퇴

- 박진우 | 팀원 [GitHub](https://github.com/ParkJinWoo1)

  카카오 채널 개설 팝업, 라이브 스트리밍 및 채팅 (WebRTC)

- 이현승 | 팀원 [GitHub](https://github.com/LHSEUNGG)

  footer 구현, 공지사항 (CRUD, 검색, 페이징, toast editor api),
  
  스프링 부트를 이용한 관리자페이지 (신고내역 관리 및 전체 회원 조회),
  
  팔로우한 아티스트 일정 알림 (웹노티피케이션)

- 최유정 | 팀원 [GitHub](https://github.com/LIEBEALLES)

  회원가입 (정규식, 이메일인증 및 주소 API, 비밀번호 SHA256 암호화), 방송목록 (스크롤페이징),
  
  Q&A (CRUD, 검색, 페이징, 비밀글, 댓글, 내가 쓴 글 조회, Toast editor api)

- 한지용 | 팀원 [GitHub](https://github.com/gcancer) 

  AWS 인스턴스 및 서버 관리, 실시간 스트리밍 및 채팅(WebRTC), 후원(부트페이), 후원 내역조회(Chart.js)


# 📍개발환경
- 운영체제 : Window, Mac OS
- 서버 : Apache Tomcat 9.0, AWS EC2
- 구현 언어 : JAVA, JavaScript, HTML5/CSS3
- 프레임워크 : Spring framework, Mybatis
- DBMS : Oracle 11g
- 개발 툴 : Eclipse Jee, Visual Studio Code
- 형상관리 : Github
