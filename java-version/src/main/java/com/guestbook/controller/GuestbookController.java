package com.guestbook.controller;


import Beans.Userrs;
import Beans.Userr;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.Key;
import static com.guestbook.controller.Scheduler.coalesce;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class GuestbookController {
    
    private static final String users_name = "users";
    
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
    
    @RequestMapping(value = "/search", produces = "text/plain")
    @ResponseBody
    public String getSchedule(
            @RequestParam("email") String email
            ){
        /* --Test-- */
        
        /* --Test-- */
        return "{\\\"data\\\":["
                + "[0, 0, \\\"Sample Description1\\\", \\\"green\\\", 0],"
                + "[1, 1, \\\"Sample Description2\\\", \\\"green\\\", 0]"
                + "]}";
    }
    
    @RequestMapping(value = "/schedule", produces = "text/plain")
    @ResponseBody
    public String schedule(
        @RequestParam("starttime") String starttime,
        @RequestParam("endtime") String endtime,
        @RequestParam("desciption") String description){
        
        int st, en;
        String des = description;
        st = Integer.parseInt(starttime) / 15;
        en = Integer.parseInt(endtime) / 15;
        ArrayList<Student> l = new ArrayList<Student>();
        Student stu = new Student();
        stu.times = new ArrayList<>();
        StudentTimes sstimes = new StudentTimes(1, st, en, des);
        
        stu.times.add(sstimes);
        
        Professor p = new Professor();
        p.times = new ArrayList<>();
        p.times.add(new ProfTimes(0, 9, 5+12));
        p.times.add(new ProfTimes(1, 9, 5+12));
        p.times.add(new ProfTimes(2, 8, 10));
        p.times.add(new ProfTimes(2, 12, 1+12));
        
        HashMap<String, List<StudentTimes>> res = Scheduler.Start(p, l);
        List<List<Pair<String, Integer>>> r2 = coalesce(res);
        
        StringBuilder out = new StringBuilder();
        
        out.append("\tSun\t\tMon\t\tTu\t\tWed\t\tTh\t\tFri\t\tSa");
        for (int j = 0; j < r2.get(0).size() ; j++) {
            float time = j / 4.0f;
            out.append(String.format("%.2f\t", time));
            for (int i = 0; i < r2.size(); i++) {
                // Time calc
                
                out.append(r2.get(i).get(j).val1 + "\t" + r2.get(i).get(j).val2 + "\t");
            }
            out.append("\n");
        }
        
        return out.toString();
    }
    
    @RequestMapping(value = "/testrun", produces = "text/plain")
    public String testrun(){
        System.out.println("---Welcome to testrun---");
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        /* This is the absolute */
        Entity users = new Entity("Userrs", users_name);
        Query usersquery = new Query("Userr").setAncestor(users.getKey());
        PreparedQuery pq = datastore.prepare(usersquery);
        for(Entity result : pq.asIterable()){;
            System.out.println("--User--");
            System.out.println("Gmail: " + result.getProperty("email"));
        }
        System.out.println("---Adding User---");
        Entity user = new Entity("Userr", users.getKey());
        user.setProperty("email", System.currentTimeMillis() + "@gmail.com");
        datastore.put(user);
        System.out.println("---Adding Completed---");
        pq = datastore.prepare(usersquery);
        for(Entity result : pq.asIterable()){
            System.out.println("--User--");
            System.out.println("Gmail: " + result.getProperty("email"));
        }
        System.out.println("---Deleting The First User---");
        for(Entity result : pq.asIterable()){
            datastore.delete(result.getKey());
            break;
        }
        System.out.println("---Deleting Completed---");
        pq = datastore.prepare(usersquery);
        for(Entity result : pq.asIterable()){
            System.out.println("--User--");
            System.out.println("Gmail: " + result.getProperty("email"));
        }
        return "ok";
    }
    
    
}
