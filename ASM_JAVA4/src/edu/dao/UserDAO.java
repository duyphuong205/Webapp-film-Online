package edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.model.User;
import edu.utils.JpaUtils;

public class UserDAO {

	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	public void insert(User user) {
		try {
			trans.begin();
			em.persist(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public void update(User user) {
		try {
			trans.begin();
			em.merge(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public void detele(String id) {
		try {
			trans.begin();
			User user = em.find(User.class, id);
			if (user != null) {
				em.remove(user);
			} else {
				throw new Exception("Khong tim thay user");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public List<User> findAll() {
		String jpql = "select u from User u";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		List<User> list = query.getResultList();
		return list;
	}

	public User findbyId(String id) {
		User user = em.find(User.class, id);
		return user;
	}

	public User checkLogin(String username, String password) {
		String jpql = "select u from User u where u.id =:userID and u.password =:password";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("userID", username);
		query.setParameter("password", password);
		return (User) query.getSingleResult();
	}
}
