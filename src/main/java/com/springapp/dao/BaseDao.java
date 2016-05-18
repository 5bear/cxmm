package com.springapp.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by anc on 15/3/13.
 */
@Repository
public class BaseDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public <T> void save(T t) {
        Session session = getSession();
        session.save(t);
    }

    public <T> void save(List<T> list) {
        Session session = getSession();
        for (T t : list) {
            session.save(t);
        }
    }

    public <T> void delete(T t) {
        Session session = getSession();
        session.delete(t);
    }

    public <T> void delete(Class<T> entityClass, Serializable id) {
        Session session = getSession();
        session.delete(session.get(entityClass, id));
    }

    public <T> void update(T t) {
        Session session = getSession();
        session.update(t);
    }

    public <T> void update(List<T> list) {
        Session session = getSession();
        for (T t : list) {
            session.update(t);
        }
    }

    public <T> T get(Class<T> entityClass, int id) {
        Session session = getSession();
        T entity = null;
        entity = (T) session.get(entityClass, id);
        return entity;
    }

    public <T> T get(Class<T> entityClass, Long id) {
        Session session = getSession();
        T entity = null;
        entity = (T) session.get(entityClass, id);
        return entity;
    }

    public <T> T find(String hql, Class<T> entityClass, Object[] params) {
        Session session = getSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        T result = (T) query.uniqueResult();
        return result;
    }

    public <T> T find(String hql, Class<T> entityClass) {
        return find(hql, entityClass, null);
    }

    public <T> List<T> findAll(String hql, Class<T> entityClass, Object... params) {
        Session session = getSession();
        Query query = session.createQuery(hql);
        List<T> result = null;
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        result = (List<T>) query.setCacheable(true).list();
        return result;
    }

    public List findAll(String hql, Object[] params, int firstResult, int maxResults) {
        Session session = getSession();
        Query query = session.createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        query.setFirstResult(firstResult);
        query.setMaxResults(maxResults);
        List result = null;
        result = query.setCacheable(true).list();
        return result;
    }

    public List findAll(String hql) {
        return findAll(hql, new Object[]{});
    }

    public List findAll(String hql, Object[] params) {
        Session session = getSession();

        Query query = session.createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        List result = null;
        result = query.setCacheable(true).list();

        return result;
    }

    public <T> List<T> findByPage(final String hql, Class<T> entityClass,
                                  final int firstResult, final int maxResult) {
        return findByPage(hql, entityClass, null, firstResult, maxResult);
    }


    public <T> List<T> findByPage(final String hql, Class<T> entityClass,
                                  final Object[] params, final int firstResult, final int maxResult) {
        Session session = getSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                query.setParameter(i, params[i]);
            }
        }
        query.setFirstResult(firstResult);
        query.setMaxResults(maxResult);
        List<T> result = null;
        result = (List<T>) query.setCacheable(true).list();
        return result;
    }

    public long getCount(final String hql) {
        Session session = getSession();

        Query query = session.createQuery(hql);
        Number count = (Number) query.uniqueResult();
        return count.longValue();
    }

    public long getCount(final String hql, final Object[] params) {
        Session session = getSession();
        Query query = session.createQuery(hql);
        for (int i = 0; i < params.length; i++) {
            query.setParameter(i, params[i]);
        }
        Number count = (Number) query.uniqueResult();
        return count.longValue();
    }
}
