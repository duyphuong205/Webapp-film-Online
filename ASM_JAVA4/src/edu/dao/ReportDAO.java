package edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.model.Report;
import edu.model.ReportFavoriteUsers;
import edu.model.ReportShareFriends;
import edu.utils.JpaUtils;

public class ReportDAO {
	EntityManager em = JpaUtils.getEntityManager();

	public List<Report> ReportFavorites() {
		String jpql = "select new edu.model.Report(f.video.title,count(f),min(f.likedate),max(f.likedate)) from Favorite f group by f.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		List<Report> list = query.getResultList();
		return list;
	}

	public List<ReportFavoriteUsers> ReportFavoriteUser(String videoID) {
		String jpql = "select new edu.model.ReportFavoriteUsers(f.user.id,f.user.fullname,f.user.email,f.likedate)from Favorite f where f.video.id =:videoID";
		TypedQuery<ReportFavoriteUsers> query = em.createQuery(jpql, ReportFavoriteUsers.class);
		query.setParameter("videoID", videoID);
		List<ReportFavoriteUsers> list = query.getResultList();
		return list;
	}

	public List<ReportShareFriends> ReportShareFriends(String videoID) {
		String jpql = "select new edu.model.ReportShareFriends(f.user.fullname,f.user.email,f.user.email,f.sharedate) from Share f where f.video.id =:videoID";
		TypedQuery<ReportShareFriends> query = em.createQuery(jpql, ReportShareFriends.class);
		query.setParameter("videoID", videoID);
		List<ReportShareFriends> list = query.getResultList();
		return list;
	}
}
