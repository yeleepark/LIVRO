package com.kh.livro.daoImpl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;

import com.kh.livro.dao.MypageDao;
import com.kh.livro.dto.MemberDto;
import com.kh.livro.dto.ProfileDto;

@Repository
public class MypageDaoImpl implements MypageDao {
	

}
