package edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.model.User;
import edu.model.Video;
import edu.utils.JpaUtils;

public class VideoDAO {

	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	public void insert(Video video) {
		try {
			trans.begin();
			em.persist(video);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public void update(Video video) {
		try {
			trans.begin();
			em.merge(video);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public void detele(String id) {
		try {
			trans.begin();
			Video video = em.find(Video.class, id);
			if (video != null) {
				em.remove(video);
			} else {
				throw new Exception("Khong tim thay video");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public List<Video> findAll() {
		String jpql = "select v from Video v";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}

	public Video findbyId(String id) {
		Video video = em.find(Video.class, id);
		return video;
	}

	public List searchByTitle(String title) {
		String jpql = "select DISTINCT v from Video v where v.title like :title";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("title", "%" + title + "%");
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> randomTop3() {
		Query query = em.createNamedQuery("random3");
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> favoriteVideo() {
		String jpql = "select v from Video v where v.favorites is NOT EMPTY";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> pagination(int page, int size) {
		String jpql = "select v from Video v";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setFirstResult(page);
		query.setMaxResults(size);
		List<Video> list = query.getResultList();
		return list;
	}

}
