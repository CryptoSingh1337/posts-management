package org.lunatic_devs.dao;

import org.lunatic_devs.entity.Comment;
import org.lunatic_devs.entity.Post;

import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/8/2021
 */

public interface PostDAO {

    void addPost(Post post);

    List<Post> getPosts();

    Post getPostById(long id);

    void deletePost(long id);

    void addPostComment(long id, Comment comment);
}
