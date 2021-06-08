package org.lunatic_devs.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.lunatic_devs.entity.Comment;
import org.lunatic_devs.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/8/2021
 */
@Repository
public class PostDAOImpl implements PostDAO {

    private SessionFactory sessionFactory;

    @Override
    public void addPost(Post post) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(post);
    }

    @Override
    public List<Post> getPosts() {
        Session session = sessionFactory.getCurrentSession();
        Query<Post> query = session.createQuery("from Post", Post.class);
        return query.getResultList();
    }

    @Override
    public Post getPostById(long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Post.class, id);
    }

    @Override
    public void deletePost(long id) {
        Session session = sessionFactory.getCurrentSession();
        Post post = session.get(Post.class, id);
        session.delete(post);
    }

    @Override
    public void addPostComment(long id, Comment comment) {
        Session session = sessionFactory.getCurrentSession();
        session.save(comment);
        Post post = session.get(Post.class, id);
        post.addComment(comment);
        session.persist(post);
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
