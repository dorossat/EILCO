package h.hamza.servlets;

import h.hamza.model.HelloBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// @WebServlet(name = "Hello")
public class HelloServlet extends HttpServlet {
    public HelloServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*String nom = request.getParameter("nom");
        request.setAttribute("name", "HRAMCHI");
        request.getRequestDispatcher("Hello.jsp?name="+nom).forward(request, response); // can send attributes */
        // response.sendRedirect("Hello.jsp?name="+nom); //don't send attributes

        String nom = request.getParameter("nom");
        HelloBean bean = new HelloBean();
        bean.setName(nom);
        request.setAttribute("beanHello", bean);
        request.getRequestDispatcher("Hello2.jsp").forward(request, response);
        System.out.println("je continue а travailler " + nom);

        // response.getWriter().append("Served at : ").append(request.getContextPath()).append(" (from doGet method)");
        // PrintWriter out = response.getWriter();
        // out.println("Hello from doGet method");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
