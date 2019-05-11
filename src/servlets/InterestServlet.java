package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/interest")
public class InterestServlet extends HttpServlet {
    
	
	@Override
	public void init() throws ServletException {
		 System.out.println("Init is called");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve data from HTML form
		double interest;
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		int period = Integer.parseInt(request.getParameter("period"));
		
		if (period < 24)
			interest = amount * 0.07;
		else
			interest = amount * 0.08;
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		
		writer.println("<h2>Interest P.A = " + Math.round(interest) + "</h2>");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
