package com.Clotheng;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get current session, don't create if doesn't exist
        if (session != null) {
            session.invalidate(); // Invalidate session
        }
 	   RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
       dispatcher.forward(request, response);
    } 
}
