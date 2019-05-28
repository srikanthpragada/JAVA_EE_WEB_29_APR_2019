package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/now" })
public class NowServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, 
			             HttpServletResponse response) throws ServletException, IOException {

		  PrintWriter writer = response.getWriter();
		  response.setContentType("text/plain");
		  LocalDateTime ldt = LocalDateTime.now();
		  writer.println(ldt.toString());
		  
	}

}
