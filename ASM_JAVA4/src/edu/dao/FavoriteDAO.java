package edu.dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.model.Favorite;
import edu.model.User;
import edu.model.Video;
import edu.utils.JpaUtils;

public class FavoriteDAO {
	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	public void insertLike(String userID, String videoID) {
		Favorite fa = new Favorite();
		User user = em.find(User.class, userID);
		Video video = em.find(Video.class, videoID);
		fa.setUser(user);
		fa.setVideo(video);
		fa.setLikedate(new Date());
		try {
			trans.begin();
			em.persist(fa);
			trans.commit();
			System.out.println("Like thành công");
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}
	}

	public void unLike(String userID, String videoID) {
		String jpql = "Select f from Favorite f where f.user.id =:uid and f.video.id =:vid";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("uid", userID);
		query.setParameter("vid", videoID);
		// neu thich
		if (query.getResultList().size() > 0) {
			try {
				trans.begin();
				// xoa luot yeu thich o vi tri dau tien
				em.remove(em.merge(query.getResultList().get(0)));
				trans.commit();
				System.out.println("Unlike thanh cong");
			} catch (Exception e) {
				e.printStackTrace();
				trans.rollback();
			}
		}
	}

	public boolean isLike(String userID, String videoID) {
		String jpql = "Select f from Favorite f where f.user.id =:uid and f.video.id =:vid";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("uid", userID);
		query.setParameter("vid", videoID);
		return query.getResultList().size() > 0;
	}
}
