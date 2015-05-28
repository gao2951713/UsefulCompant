/**
 * 
 */
package com.ibest.service.biz.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibest.dao.biz.dao.BizCommentDao;
import com.ibest.entity.biz.pojo.BizComment;
import com.ibest.service.biz.service.BizCommentService;

/**
 * @author gaowenguo
 *
 */
@Service("bizCommentService")
public class BizCommentServiceImpl implements BizCommentService {
	@Resource
	private BizCommentDao bizCommentDao;

	@Override
	public int findCommentCount(Integer menu_id, String range_code,
			Integer api_id, String chart_type, Integer question_id) {
		Integer count=0;
		List<Object[]> obj =new ArrayList<Object[]>();
		if("".equals(chart_type) || chart_type ==null) {
			chart_type ="XXXX";
		}
		
		try {
			obj = bizCommentDao.findCommentCount(menu_id, range_code, api_id, chart_type, question_id);
			Object ob = obj.get(0);
			count = Integer.parseInt(ob.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<BizComment> getComment(Integer menu_id, String range_code,
			Integer api_id, String chart_type, Integer question_id) {
		List<BizComment> comments =null;
		try {
			comments = bizCommentDao.getComment(menu_id, range_code, api_id, chart_type, question_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comments;
	}

	@Override
	public Integer insertComment(BizComment bizComment) {
		Integer result = null;
		  try {
			  bizCommentDao.insertComment(bizComment);
			  result = 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}

}
