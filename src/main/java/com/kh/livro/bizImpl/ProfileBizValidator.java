package com.kh.livro.bizImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.livro.dao.ProfileDao;
import com.kh.livro.dto.ProfileDto;

@Service
public class ProfileBizValidator implements Validator {
	
	@Autowired
	private ProfileDao profileDao;

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ProfileDto file = (ProfileDto) target;

		if (file.getProfile().getSize() == 0) { // ProfileDto이라는 객체안의 Mpfile 게터의 사이즈가 0이면 즉, 파일이 없으면

			errors.rejectValue("profile", "fileNPE", "please select a file");
			// 전 객체에 대한 글로벌 에러코드를 추가,
			// 메세지 인자로 errorArgs를 전달,
			// 에러코드에 대한 메세지가 존재하지 않을 경우 defaultMessage를 사용
		}

	}
	
	public int profileInsert(String member_id) {
		return profileDao.profileInsert(member_id);
	}

}
