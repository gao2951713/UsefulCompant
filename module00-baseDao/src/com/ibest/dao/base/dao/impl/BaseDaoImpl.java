package com.ibest.dao.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import com.ibest.dao.base.dao.BaseDao;

/**
 * 基于hibernate的BaseDao
 * 
 * @param <T>
 */
@Transactional
public abstract class BaseDaoImpl<T extends Serializable> implements BaseDao<T> {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	// 当前泛型类
	@SuppressWarnings("rawtypes")
	private Class entityClass;
	// 当前主键名称
	private String pkname;
	private String HQL_LIST_ALL;
	private String HQL_COUNT_ALL;

	@SuppressWarnings("rawtypes")
	public Class getEntityClass() {
		return entityClass;
	}

	@SuppressWarnings("rawtypes")
	public void setEntityClass(Class entityClass) {
		this.entityClass = entityClass;
	}

	@SuppressWarnings({ "unchecked" })
	public BaseDaoImpl() {
		// 获取当前泛型类
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		setEntityClass((Class<T>) type.getActualTypeArguments()[0]);
		getPkname();
		HQL_LIST_ALL = "from "
				+ ((Entity) this.entityClass.getAnnotation(Entity.class))
						.name() + " order by " + pkname + " desc";
		HQL_COUNT_ALL = "select count(*) from "
				+ ((Entity) this.entityClass.getAnnotation(Entity.class))
						.name();
	}

	/**
	 * 获取主键名称
	 * 
	 * @return
	 */
	public String getPkname() {
		Field[] fields = this.entityClass.getDeclaredFields();// 反射类字段
		for (Field field : fields) {
			if (field.isAnnotationPresent(Id.class)) {
				this.pkname = field.getName();
				break;
			}
		}
		return pkname;
	}

	/**
	 * 保存实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void save(T t) throws HibernateException {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 批量保存实例
	 * 
	 * @param l
	 * @throws HibernateException
	 */
	public void saveList(List<T> l) throws HibernateException {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			int i = 0;
			for (T t : l) {
				if (session.contains(t)) {
					continue;
				} else {
					session.save(t);
					i++;
				}

				if (i % 20 == 0) {
					session.getTransaction().commit();
					session.flush();
					session.clear();
					session.beginTransaction();
				}
			}
			session.getTransaction().commit();
			System.out.println("Total insert:" + i);
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 批量修改实例
	 * 
	 * @param l
	 * @throws HibernateException
	 */
	public void updateList(List<T> l) throws HibernateException {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			int i = 0;
			for (T t : l) {
				if (session.contains(t)) {
					continue;
				} else {
					session.update(t);
					i++;
				}

				if (i % 20 == 0) {
					session.getTransaction().commit();
					session.flush();
					session.clear();
					session.beginTransaction();
				}
			}
			session.getTransaction().commit();
			System.out.println("Total update:" + i);
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 修改实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void update(T t) throws HibernateException {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 删除实例
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	public void delete(T t) throws HibernateException {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			session.delete(t);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 获取实例
	 * 
	 * @param id
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public T get(Serializable id) throws Exception {
		Session session = null;
		T t = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			t = (T) session.get(getEntityClass(), id);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new HibernateException(e);
		} finally {
			session.close();
		}
		return t;
	}

	/**
	 * 查询全部
	 * 
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() throws Exception {
		List<T> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(HQL_LIST_ALL);
			list = query.list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * 查询总数
	 * 
	 * @throws HibernateException
	 */
	public Integer findAllCount() throws Exception {
		Session session = null;
		Integer count = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(HQL_COUNT_ALL);
			List<?> list = query.list();
			session.getTransaction().commit();
			count = new Integer(((Long) list.get(0)).intValue());
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	/**
	 * QBC查询
	 * 
	 * @param criteria
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByCriteria(Criteria criteria) throws Exception {
		List<T> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Criteria criteria1 = session.createCriteria(getEntityClass());
			criteria1 = criteria;
			list = criteria1.list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * QBE查询
	 * 
	 * @param t
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByExample(T t) throws Exception {
		List<T> list = null;
		Session session = null;
		Example example = Example.create(t);
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Criteria criteria = session.createCriteria(getEntityClass());
			criteria.add(example);
			list = criteria.list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<T> findEntityByHql(String hql, final Object... objects)
			throws Exception {
		List<T> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<T> findEntityByHql(String hql) throws Exception {
		List<T> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<?> findAllTypeByHql(String hql, final Object... objects)
			throws Exception {
		List<?> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	public List<?> findAllTypeByHql(String hql)
			throws Exception {
		List<?> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findByHql(String hql, final Object... objects)
			throws Exception {
		List<Object[]> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * HQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findByHql(String hql) throws Exception {
		List<Object[]> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session.createQuery(hql);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * SQL查询
	 * 
	 * @param hql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findBySql(String sql, final Object... objects) {
		List<Object[]> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session
					.createSQLQuery(sql);
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					query.setParameter(i, objects[i]);
				}
			}
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * SQL无参数查询
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findBySql(String sql) {
		List<Object[]> list = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session
					.createSQLQuery(sql);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * SQL更新
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public int updateBySql(String sql, Object... objects) {
		Session session = null;
		int updateCount = 0;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session
					.createSQLQuery(sql);
			if (objects != null) {
				for (int i = 0; i < objects.length; i++) {
					query.setParameter(i, objects[i]);
				}
			}
			updateCount = query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return updateCount;
	}

	/**
	 * SQL无参数更新
	 * 
	 * @param sql
	 * @param objects
	 * @throws HibernateException
	 */
	public int updateBySql(String sql) {
		Session session = null;
		int updateCount = 0;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			Query query = session
					.createSQLQuery(sql);
			updateCount = query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return updateCount;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
}
