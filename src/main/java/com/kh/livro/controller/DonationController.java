package com.kh.livro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.livro.biz.DonationBiz;
import com.kh.livro.dto.DonationDto;

@Controller
public class DonationController {

	@Autowired
	private DonationBiz donationBiz;
	
	private Logger logger = LoggerFactory.getLogger(DonationController.class);
	
	
	@RequestMapping(value = "/donation.do",method = RequestMethod.POST)
	@ResponseBody
	public String donation(@RequestBody DonationDto dto) {
		logger.info("[Donation Insert]");
		
		int res = 0;
		
		res = donationBiz.insert(dto);
		
		if(res > 0) {
			logger.info("[후원성공!!]");
			return "success";
		}
			return "fail";
	}
	
	@RequestMapping(value = "/selectMap.do", method = RequestMethod.GET)
	@ResponseBody
	public String selectMap(String member_id) {
		logger.info("member_id >>>> : " + member_id);
		List<HashMap<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<>();

		list = donationBiz.selectAmountById(member_id);
		String gson = new Gson().toJson(list);
		logger.info(gson);
		return gson;
	}
}
