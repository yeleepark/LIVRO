package com.kh.livro.bizImpl;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.livro.dto.MusicDto;

//컨트롤러에서 객체를 부르기위해 비즈클래스로 만듦
@Service
public class MusicFileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MusicDto file = (MusicDto) target;	
		
		if (file.getMusic_file().getSize() == 0) {	//파일이 업로드되었는지 
			errors.rejectValue("music_file", "fileNPE", "Please select a file");
			//errors : 유효성검사의 상태 null 없음
			//rejectValue(지정할 필드, 에러코드, 반환할 문자열);
		}
	}

}