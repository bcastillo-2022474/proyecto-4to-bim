package middleware;

import state.State;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class SetState implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        System.out.println("SetState middleware");
        req.setAttribute("currentUser", State.currentUser);
        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
