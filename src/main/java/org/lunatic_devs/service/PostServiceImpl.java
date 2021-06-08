package org.lunatic_devs.service;

import org.lunatic_devs.dao.PostDAO;
import org.lunatic_devs.entity.Comment;
import org.lunatic_devs.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/8/2021
 */
@Service
public class PostServiceImpl implements PostService {

    private PostDAO postDAO;

    @Override
    @Transactional
    public void addPost(Post post) {
        post.setDate(LocalDate.now());
        postDAO.addPost(post);
    }

    @Override
    @Transactional
    public List<Post> getPosts() {
        return postDAO.getPosts();
    }

    @Override
    @Transactional
    public Post getPostById(long id) {
        return postDAO.getPostById(id);
    }

    @Override
    @Transactional
    public void deletePost(long id) {
        postDAO.deletePost(id);
    }

    @Override
    @Transactional
    public void addPostComment(long id, Comment comment) {
        comment.setUsername("Anonymous");
        comment.setDate(LocalDate.now());
        postDAO.addPostComment(id, comment);
    }

    @Autowired
    public void setPostDAO(PostDAO postDAO) {
        this.postDAO = postDAO;
    }
}
