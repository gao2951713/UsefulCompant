package com.ibest.dao.biz.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ibest.dao.base.dao.impl.BaseDaoImpl;
import com.ibest.dao.biz.dao.BizCommentDao;
import com.ibest.entity.biz.pojo.BizComment;
@Repository("bizCommentDao")
public class BizCommentDaoImpl extends BaseDaoImpl<BizComment> implements BizCommentDao {

	private final String commentId="commentId";
	private final String menuId="menuId";
	private final String chartType="chartType";
	private final String rangeCode="rangeCode";
	private final String comment="comment";
	private final String apiId="apiId";
	private final String questionId="questionId";
	private final String userId="userId";
	private final String userName="userName";
	private final String level="level";
	private final String sort="sort";
	private final String createDate="createDate";

	@Override
	public List<Object[]> findCommentCount(Integer menu_id, String range_code,
			Integer api_id, String chart_type,Integer question_id) {
		
		List<Object[]> obj =new ArrayList<Object[]>();
		StringBuilder sb = new StringBuilder();
		sb.append("select count(menu_id) as count from biz_comment");
		sb.append(" where ");
		sb.append("menu_id="+menu_id);
		sb.append(" and ");
		sb.append("range_code='"+range_code);
		sb.append("' and ");
		sb.append("api_id="+api_id);
		sb.append(" and ");
		sb.append("chart_type='"+chart_type);
		sb.append("'  and ");
		sb.append("question_id="+question_id);
		
		try {
			//do query
			obj = this.findBySql(sb.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public List<BizComment> getComment(Integer menu_id, String range_code,
			Integer api_id, String chart_type,Integer question_id) {
		List<BizComment> comments= new ArrayList<BizComment>();
		StringBuilder sb = new StringBuilder();
		sb.append(" from biz_comment");
		sb.append(" where ");
		sb.append("menu_id="+menu_id);
		sb.append(" and ");
		sb.append("range_code='"+range_code);
		sb.append("' and ");
		sb.append("api_id="+api_id);
		sb.append(" and ");
		sb.append("chart_type='"+chart_type);
		sb.append("'  and ");
		sb.append("question_id="+question_id);
		
		try {
			//do search
			comments = this.findEntityByHql(sb.toString());
		} catch (Exception e) {
		// TODO Auto-generated method stub
		}
		
		return comments;
	}

	@Override
	public Integer insertComment(BizComment bizComment) {
		Integer result=null;
		try {
			this.save(bizComment);
			result = 0;
		} catch (Exception e) {
			result = 1;
		}
		return result;
	}
	


}
