package com.excellent.controller.common;
//Created by Xuan 2019/10/10


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
    public LoginFilter() {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String path = req.getRequestURI();
        // 如果包含login.jsp证明是登陆就放行
        if (path.contains("/student/") || path.contains("/teacher/")||path.contains("/admin/")) {
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession session = req.getSession();
            String stu = (String) session.getAttribute("username");
            // 如果session中存在user证明用户登录，可以放行。否则认为未登陆重定向到login
            if (stu == null) {
                res.setStatus(302);
                res.sendRedirect("/login");
            } else {
                chain.doFilter(req, res);
            }

        } else {
            chain.doFilter(request, response); // 放行;
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}