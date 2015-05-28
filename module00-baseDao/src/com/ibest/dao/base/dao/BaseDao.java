package com.ibest.dao.base.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;

/**
 * 基于hibernate的BaseDao
 * 
 * @param <T>
 */
public interface BaseDao<T extends Serializable> {

	/**
	 * 获取主键名称
	 * 
	 * @return
	 */
	public String getPkname();

	/**
	 * 保存实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void save(T t) throws HibernateException;
	
	/**
	 * 批量保存实例
	 * 
	 * @param l
	 * @throws HibernateException
	 */
	public void saveList(List<T> l)throws HibernateException;

	/**
	 * 修改实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void update(T t) throws HibernateException;
	
	/**
	 * 批量修改实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void updateList(List<T> l) throws HibernateException;

	/**
	 * 删除实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void delete(T t) throws HibernateException;

	/**
	 * 获取实例
	 * 
	 * @param id
	 * @throws HibernateException
	 */
	public T get(Serializable id) throws Exception;

	/**
	 * 查询全部
	 * 
	 * @throws HibernateException
	 */
	public List<T> findAll() throws Exception;

	/**
	 * 查询总数
	 * 
	 * @throws HibernateException
	 */
	public Integer findAllCount() throws Exception;

	/**
	 * QBC查询
	 * 
	 * @param criteria
	 * @throws HibernateException
	 */
	public List<T> findByCriteria(Criteria criteria) throws Exception;

	/**
	 * QBE查询
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public List<T> findByExample(T t) throws Exception;
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<T> findEntityByHql(String hql, final Object... objects)
			throws Exception;
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @throws HibernateException
	 */
	public List<T> findEntityByHql(String hql)
			throws Exception;
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @throws HibernateException
	 */
	public List<?> findAllTypeByHql(String hql)
			throws Exception;
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<?> findAllTypeByHql(String hql, final Object... objects)
			throws Exception;
	
	
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<Object[]> findByHql(String hql, final Object... objects)
			throws Exception;
	
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @throws HibernateException
	 */
	public List<Object[]> findByHql(String hql)
			throws Exception;

	/**
	 * SQL查询
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<Object[]> findBySql(String sql, final Object... objects);
	
	/**
	 * SQL无参数查询
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<Object[]> findBySql(String sql);
	
	/**
	 * SQL更新
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public int updateBySql(String sql, final Object... objects);
	
	/**
	 * SQL无参数更新
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public int updateBySql(String sql);
}
