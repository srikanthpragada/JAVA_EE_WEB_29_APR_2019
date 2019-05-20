package listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

// @WebListener
public class TestListener implements ServletContextListener, HttpSessionListener {

    public TestListener() {
        // TODO Auto-generated constructor stub
    }
	
    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println("Session Created");
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
        System.out.println("Session Destroyed");
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	System.out.println("Context Destroyed");
    }
    public void contextInitialized(ServletContextEvent sce)  { 
        System.out.println("Context Initialized");
    }
	
}
