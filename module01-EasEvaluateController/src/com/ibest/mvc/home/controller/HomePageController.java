package com.ibest.mvc.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ibest.entity.biz.pojo.BizComment;
import com.ibest.service.biz.service.BizCommentService;

@Controller
public class HomePageController {
	@Resource
	private BizCommentService bizCommentService;
	
	@RequestMapping("/homePage")
	public ModelAndView forword2Home(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		Map model = new HashMap();
		model.put("aaa", "pingce");
		//测试变量
		request.setAttribute("range_code", "XX01");
		String range_code=request.getAttribute("range_code").toString();

		//评论条数初始化显示
		List<BizComment> comments=new ArrayList<BizComment>();
		Integer menu_id =53;
		 range_code ="XX01";
		Integer api_id = 2;
		// 页面上对一级二级的综合和对比分析图的区分。定义参看data_dictionary_data表。
		String chart_type="";
		Integer question_id =1;
		Integer count =bizCommentService.findCommentCount(menu_id, range_code, api_id, chart_type, question_id);

		model.put("commentCount", count);
		
		return new ModelAndView("index",model);//"redirect:/jsp/index";
	}
}
 