package edu.dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import edu.model.Favorite;
import edu.model.Share;
import edu.model.User;
import edu.model.Video;
import edu.utils.JpaUtils;

public class ShareDAO {
//	EntityManager em = JpaUtils.getEntityManager();
//	EntityTransaction trans = em.getTransaction();
//
//	public void insertShare(String userID, String videoID, String email) {
//		Share share = new Share();
//		User user = em.find(User.class, userID);
//		Video video = em.find(Video.class, videoID);
//		share.setUser(user);
//		share.setVideo(video);
//		share.setEmail(email);
//		share.setSharedate(new Date());
//		try {
//			trans.begin();
//			em.persist(share);
//			trans.commit();
//			System.out.println("share thành công");
//		} catch (Exception e) {
//			e.printStackTrace();
//			trans.rollback();
//		}
//	}
	
	EntityManager em = JpaUtils.getEntityManager();
	public void insert(Share share) {
		EntityTransaction tran = em.getTransaction();
		try {
			tran.begin();
			em.persist(share);
			tran.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			em.close();
		}
		
	}
}
