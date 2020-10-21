package com.kh.livro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Soundbank;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.kh.livro.biz.ProfileBiz;
import com.kh.livro.bizImpl.ProfileBizValidator;
import com.kh.livro.dao.ProfileDao;
import com.kh.livro.dto.ProfileDto;

@Controller
public class MypageController {

	@Autowired
	private ProfileBiz profileBiz;
	
	private Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping("/adminPage.do")
	public String adminPage() {
		return "mypage/adminPage";
	}
	
	@RequestMapping("/userPage.do")
	public String userPage() {
		return "mypage/userPage";
	}
	
	@RequestMapping("/profileForm.do")
	public String uploadForm() {
		return "mypage/profileForm";
	}
	
	@RequestMapping("/profileUpload.do")
	public String profileUpload(HttpServletRequest request, Model model, ProfileDto uploadFile, String member_id) {
			
			int res = profileBiz.profileInsert(member_id);
			
			//MultipartFile : 스프링에서 제공하는 인터페이스.
			//file란 변수에 업로드한 사진 데이터를 담는다
			MultipartFile profile = uploadFile.getProfile();
			//업로드한 파일의 파일명을 name이라는 변수에 담는다
			String profile_savedname = member_id + "_" + profile.getOriginalFilename(); //UUID쓰기
			String profile_realname = profile.getOriginalFilename(); 
			
			//새로운 ProfileDto  객체를 만들어서
			ProfileDto profileObj = new ProfileDto();
			profileObj.setProfile_savedname(profile_savedname);
			profileObj.setProfile_realname(profile_realname); //이름을 넣고
			
			//자바에서 데이터는 스트림을 통해 입출력된다.
			//스트림은 단일 방향으로 연속적으로 흘러가는 것을 뜻하며, 물이 높은 곳에서 낮은곳으로 흐르듯 
			//데이터는 출발지에서 나와 도착지로 흘러간다는 개념
			//InputStream은 입력(출발지), OutputStream은 출력(도착지)
			InputStream inputStream = null;
			OutputStream outputStream = null;

			try {
				inputStream = profile.getInputStream(); //파일 읽어오기
				
				//웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
				//WebUtil는 SpringMVC를 다룰 때 사용하는 클래스
				//Session에 담겨있는 객체들을 보다 짧은 코드로 넣고 빼고 할수 있으며 세션이나 쿠키 객체를 받아올수 있다
				//request.getSession().getServletContext() : 해당 프로젝트의 경로? 파일업로드의 절대경로
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/storage");

				logger.info("[ERROR] 업로드 될 경로 : " + path);
				
				//기존의 파일이나 폴더에 대한 제어를 하는 데 사용하는 File 클래스
				//변수path에 담긴 경로에 File 객체를 생성한다
				File storage = new File(path);
				
				// 스토리지가 없으면
				if (!storage.exists()) {
					//mkdir : 디렉토리 생성
					//		  만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 생성 불가
					storage.mkdir();
				}

				//지정한 경로에 업로드한 파일명으로 새로운 파일 객체 생성
				File newFile = new File(path + "/" + profile_savedname);
				if (!newFile.exists()) {
					newFile.createNewFile(); //지정 경로에 파일 생성
				}

				//업로드한 파일 정보를 담은 객체를 outputStream이라는 출력 객체에 담음
				//newFile이라는 이름의 outputStream이라는 빈칸이 생성된다고 보면 됨
				outputStream = new FileOutputStream(newFile);

				int read = 0;
				//파일의 byte크기 만큼 byte 배열 생성 
				byte[] b = new byte[(int) profile.getSize()];

				// 파일이 끝나지 않을 때 까지 (!=-1) 넘어온데이터(inputStream)을 읽어온다
				while ((read = inputStream.read(b)) != -1) {
					//outputStream에 저장
					//outputStream이라는 빈칸에 데이터가 복사된다고 보면 됨
					outputStream.write(b, 0, read);
					//b − The data. 0:The start offset in the data. read:The number of bytes to write.
					//b에 담긴 데이터를 0부터 read의 크기만큼?
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			//fileObj라는 이름으로 fileObj를 download페이지에 전달
			model.addAttribute("fileObj", profileObj);

			return "mypage/userPage";
	}
	
}
