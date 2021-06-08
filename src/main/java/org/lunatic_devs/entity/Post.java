package org.lunatic_devs.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/7/2021
 */
@Entity
@Table(name = "post")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "heading")
    private String heading;
    @Column(name = "content")
    private String content;
    @Column(name = "date")
    private LocalDate date;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "post_id")
    private List<Comment> comments;

    public Post() {
    }

    public Post(String heading, String content) {
        this.heading = heading;
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getHeading() {
        return heading;
    }

    public void setHeading(String heading) {
        this.heading = heading;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void addComment(Comment comment) {
        if (comments == null)
            comments = new ArrayList<>();
        comments.add(comment);
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", heading='" + heading + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", comments=" + comments +
                '}';
    }
}
