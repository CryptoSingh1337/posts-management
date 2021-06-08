package org.lunatic_devs.controller;

import org.lunatic_devs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by CryptoSingh1337 on 6/8/2021
 */
@Controller
public class HomeController {

    private PostService postService;

    @GetMapping("/")
    public String indexPage(Model model) {
        model.addAttribute("posts", postService.getPosts());
        return "index";
    }

    @Autowired
    public void setPostService(PostService postService) {
        this.postService = postService;
    }
}
