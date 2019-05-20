package filters;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(dispatcherTypes = {DispatcherType.REQUEST }
					, urlPatterns = { "/*" })
public class LogFilter implements Filter {
    public LogFilter() {
        // TODO Auto-generated constructor stub
    }
	public void destroy() {
	}

	public void doFilter(ServletRequest request, 
			ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		System.out.println( "Staring " +  req.getRequestURI() + 
				 " at " + LocalDateTime.now());
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		System.out.println( "Ended " +  req.getRequestURI());
		
	}
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
