package Beans;

import com.googlecode.objectify.ObjectifyService;
import javax.servlet.ServletContextEvent;

public class OfyHelper {
    public void contextInitialized(ServletContextEvent event) {
        ObjectifyService.register(Users.class);
        ObjectifyService.register(User.class);
  }

  public void contextDestroyed(ServletContextEvent event) {
  }
}
