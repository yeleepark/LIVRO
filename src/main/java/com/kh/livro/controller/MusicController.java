package com.kh.livro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.kh.livro.biz.MusicBiz;
import com.kh.livro.dto.MusicDto;

@Controller
public class MusicController {

	@Autowired
	private MusicBiz musicBiz;
	
	private Logger logger = LoggerFactory.getLogger(MusicController.class);
	
	@Resource(name="uploadpath")
	private String path;
	
	
	@RequestMapping(value="upload.do", method = RequestMethod.POST)//upload리턴 받아오면 upload.jsp
	public String fileUpload(HttpServletRequest request, Model model, MusicDto musicDto, String member_id, String music_content) {
			
		logger.info("뮤직컨트롤러 " + member_id);
		System.out.println("뮤직디티오 겟맴버 아이디"+musicDto.getMember_id());
		MultipartFile music = musicDto.getMusic_file();	//업로드된 멀티파트객체(파일)을 변수에 저장
		
		
		UUID uuid = UUID.randomUUID();
		int audioformat = music.getOriginalFilename().lastIndexOf(".");
		String music_title = music.getOriginalFilename().toString().substring(0, audioformat);
		
		System.out.println(music_title);
		String music_savename = uuid.toString()+".mp3";	//파일의 이름 변수에 저장
		String music_realname = music.getOriginalFilename();	//파일의 이름 변수에 저장
		
		InputStream inputStream = null;		//입력스트림의 슈퍼클래스
		OutputStream outputStream = null;	//출력스트림의 슈퍼클래스
		/*	
		MusicDto fileObj = new MusicDto();	//UploadFile()로 객체 생성
		fileObj.setMember_id(music_savename);					//객체의 이름에 name값 설정
		fileObj.setMember_id(name);					//객체의 이름에 name값 설정
		fileObj.setMusic_content(musicDto.getMusic_content());	//			설명문 설정
		*/
		
		try {
			inputStream = music.getInputStream(); //업로드된 파일의 입력스트림을 변수에 저장
			
			//프로젝트 내부에 파일 업로드하는 경로  
			String servpath = WebUtils.getRealPath(request.getSession().getServletContext(), "/");
			//String path = WebUtils.getRealPath(request.getSession().getServletContext() , "/resources/music");
			
			//model.addAttribute("filepath", path+music_savename);
			//model.addAttribute("artistdto", member_id);
			
			//현재 사용중인 프로젝트 경로가 어디인가
			System.out.println("서블렛 컨텍스트 경로 : "+ servpath);
			System.out.println("업로드될 실제 경로 : "+ path);
			
			File storage = new File(path);	//문자열로 만들어진 경로를 파일객체로 저장
			if (!storage.exists()) {	//해당경로가 없을 시 
				storage.mkdir();	//경로명에 해당하는 디렉토리 생성
			}
			
			File newFile = new File(path+"/"+music_savename);	//경로가 존재할 경우 경로명에 /파일명 을 붙여 객체 생성
			if (!newFile.exists()) {	//경로에 해당하는 파일이 존재하지 않는 경우
				newFile.createNewFile();	//파일 생성(프로젝트안에 업로드) 용량은 0바이트
			}
			System.out.println(path+music_savename);
			System.out.println(newFile);
			outputStream = new FileOutputStream(newFile); //출력스트램 객체에 경로명+파일명을 가진 출력스트림을 만듬
			
			int read = 0;  
			byte[] b = new byte[(int) music.getSize()];	//업로드할 파일의 크기를 바이트로 저장 
			
			while((read=inputStream.read(b)) != -1) {	
				outputStream.write(b,0,read); 	//서버에 업로드된 용량이 0인 파일에 클라이언트 파일의 데이터를 작성함. 파일의 처음부터 끝까지
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();		//입출력 스트림 닫음
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		musicDto.setMember_id(member_id);
		musicDto.setMusic_title(music_title);
		musicDto.setMusic_content(music_content);
		musicDto.setMusic_savename(music_savename);
		musicDto.setMusic_realname(music_realname);
		musicBiz.insert(musicDto);
		
		return "redirect:artist.do?member_id="+member_id;
	}
	
	@RequestMapping(value="deletemusic.do")
	public String delete(Model model, int music_no, String member_id) {
		System.out.println(music_no);
		String music_savename = musicBiz.musicSavename(music_no);
		System.out.println(music_savename);
		System.out.println(path+"/"+music_savename+"dddddddddddddddddddd");
		
		File file = new File(path+"/"+music_savename); 
		if( file.exists() ){ 
			if(file.delete()) { 
				System.out.println("파일삭제 성공"); 
				model.addAttribute("res", musicBiz.deletemusic(music_no));
			} else { 
				System.out.println("파일삭제 실패"); 
			} 
			
		} else { 
			System.out.println("파일이 존재하지 않습니다."); 
		} 
		
		return "redirect:artist.do?member_id="+member_id;
	}
	

}
