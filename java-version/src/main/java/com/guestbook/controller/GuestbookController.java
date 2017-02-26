package com.guestbook.controller;


import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class GuestbookController {
    
    private static final String users_name = "users_name";
    
    @RequestMapping("/")
    public String home(HttpServletRequest request){
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        HttpSession session = request.getSession();
        if(user == null){
            session.setAttribute("loginstatus", false);
            session.setAttribute("link", userService.createLoginURL("/"));
        }
        else{
            session.setAttribute("loginstatus", true);
            session.setAttribute("user", user);
            session.setAttribute("link", userService.createLogoutURL("/logout"));
        }
        return "Schedule";
    }

    @RequestMapping("/logout")
    public String signout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    @RequestMapping(value = "/search", produces = "application/json")
    @ResponseBody
    public String getSchedule(
            @RequestParam("email") String email
            ){
        System.out.println("Email: " + email);
        return "";
    }
    
    @RequestMapping(value = "/schedule", produces = "application/json")
    @ResponseBody
    public String schedule(
        @RequestParam("starttime") String starttime,
        @RequestParam("endtime") String endtime,
        @RequestParam("desciption") String description){
        
        return "";
    }
    @RequestMapping(value = "/testrun")
    public void testrun(){
        
    }
    
    
}
