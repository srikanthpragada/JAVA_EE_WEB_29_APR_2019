package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

import com.google.gson.Gson;

import beans.Book;
import oracle.jdbc.rowset.OracleCachedRowSet;

@WebServlet("/searchbooks")
public class SearchBooksServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String title = request.getParameter("title");
		try {
			CachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select * from books where upper(title) like ?");
			crs.setString(1, "%" + title.toUpperCase() + "%");
			crs.execute();
            ArrayList<Book> books = new ArrayList<>();
			while(crs.next()) {
				Book book = new Book();
				book.setId(crs.getString("id"));
				book.setTitle(crs.getString("title"));
				book.setAuthor(crs.getString("author"));
				book.setCategory(crs.getString("category"));
				book.setNopages(crs.getInt("nopages"));
				books.add(book);
			}
			crs.close();
			
			Gson gson = new Gson();
			pw.println(gson.toJson(books));
			
		} catch (Exception ex) {
			pw.println("{\"message\": \"Could not search due to error!\"}");
		}
	}

}
