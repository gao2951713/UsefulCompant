package com.ibest.service.biz.service;

import java.util.List;

import com.ibest.entity.biz.pojo.BizComment;

public interface BizCommentService {
	/**
	 * 统计该图例的评论数
	 * @param menu_id 菜单编号
	 * @param range_code 区域编号
	 * @param api_id 评测编号
	 * @param chart_type 图例区分
	 * @param question_id 问题编号
	 * @return count 评论条数
	 */
	public int findCommentCount(Integer menu_id,String range_code,Integer api_id,String chart_type,Integer question_id);
	/**
	 * 取得该图例对应的评论详细信息
	 * @param menu_id 菜单编号
	 * @param range_code 区域编号
	 * @param api_id 评测编号
	 * @param chart_type 图例区分
	 * @param question_id 问题编号
	 * @return list 用户评论结果取得列表
	 */
	public List<BizComment> getComment(Integer menu_id,String range_code,Integer api_id,String chart_type,Integer question_id);
	/**
	 * 评论详细信息写入数据库
	 * @return 0：成功 1:失败
	 */
	public Integer insertComment(BizComment bizComment);

}
