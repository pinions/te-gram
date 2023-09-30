package com.techelevator.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RestController;
import com.techelevator.dao.PostDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Post;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;



@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class AccountController {

    private final UserDao userDao;
    private final PostDao postDao;

    public AccountController(UserDao userDao, PostDao postDao) {
        this.userDao = userDao;
        this.postDao = postDao;
    }

    // upload a picture
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/post", method = RequestMethod.POST)
    public boolean addPost(@Valid @RequestBody Post post, Principal principal) {
        postDao.addPost(principal.getName(), post.getCaption(), post.getImgURL());
        System.out.println(post);
        return true;
    }

    // show public photo feed
    @RequestMapping(path = "/", method = RequestMethod.GET)
    public List<Post> getFeed(Principal principal) {
        String username = principal.getName();
        return postDao.getFeed(username);
    }

    // view photos by user
    @RequestMapping(path = "/{username}", method = RequestMethod.GET)
    public List<Post> getPosts(@PathVariable("username") String username) {
        return postDao.findPhotosByUsername(username);
    }

    // display favorite photos
    @RequestMapping(path = "/{username}/favorite", method = RequestMethod.GET)
    public List<Post> getFavorite(Principal principal) {
        int userId = userDao.findIdByUsername(principal.getName());
        return postDao.findFavoriteById(userId);
    }

    // view photo post in full detail
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @RequestMapping(path = "/{username}/{id}", method = RequestMethod.GET)
    public Post getPost(@PathVariable("id") int postId) {
        return postDao.findPostById(postId); // we'll need this to get a single post and see it's full details
    }
}
