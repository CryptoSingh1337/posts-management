package org.lunatic_devs.controller;

import org.lunatic_devs.entity.Comment;
import org.lunatic_devs.entity.Post;
import org.lunatic_devs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Created by CryptoSingh1337 on 6/8/2021
 */
@Controller
@RequestMapping("/post")
public class PostController {

    private PostService postService;

    @GetMapping("/{id}")
    public String displayPost(@PathVariable long id, Model model) {
        model.addAttribute("post", postService.getPostById(id));
        model.addAttribute("comment", new Comment());
        return "post";
    }

    @GetMapping("/add")
    public String addPostPage(Model model) {
        model.addAttribute("post", new Post());
        return "post-add";
    }

    @PostMapping("/add")
    public String addPostProcess(@ModelAttribute("post") Post post) {
        postService.addPost(post);
        return "redirect:/";
    }

    @GetMapping("/edit")
    public String editPostPage(@RequestParam("id") long id, Model model) {
        model.addAttribute("post", postService.getPostById(id));
        return "post-add";
    }

    @GetMapping("/delete")
    public String deletePost(@RequestParam("id") long id) {
        postService.deletePost(id);
        return "redirect:/";
    }

    @PostMapping("/comment/add")
    public String addComment(@RequestParam("id") long id, @ModelAttribute("comment") Comment comment) {
        postService.addPostComment(id, comment);
        return "redirect:/post/" + id;
    }

    @Autowired
    public void setPostService(PostService postService) {
        this.postService = postService;
    }
}
