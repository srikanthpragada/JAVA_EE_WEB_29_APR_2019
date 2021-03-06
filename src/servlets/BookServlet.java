package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;
import com.google.gson.Gson;
import beans.Book;
import oracle.jdbc.rowset.OracleCachedRowSet;

@WebServlet("/book")
public class BookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String id = request.getParameter("bookid");
		try {
			CachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select * from books where id = ?");
			crs.setString(1, id);
			crs.execute();

			if (crs.next()) {
				Book book = new Book();
				book.setId(id);
				book.setTitle(crs.getString("title"));
				book.setAuthor(crs.getString("author"));
				book.setCategory(crs.getString("category"));
				book.setNopages(crs.getInt("nopages"));
				Gson gson = new Gson();
				pw.println(gson.toJson(book)); // Convert book to json

			} else {
				// send error message
				pw.println("{\"message\": \"Book not found\"}");
			}
		} catch (Exception ex) {
			pw.println("{\"message\": \"Book not found\"}");
		}
	}

}
