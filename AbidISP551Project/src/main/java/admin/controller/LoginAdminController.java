package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import admin.dao.*;
import user.model.*;
@WebServlet("/LoginAdminController")
public class LoginAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DaoAdmin dao;
    public LoginAdminController() {
        super();
        dao = new DaoAdmin();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin a = new Admin();
		a.setAdminid(Integer.parseInt(request.getParameter("adminid")));
		a.setAdd_password(request.getParameter("add_password"));
		
		if(Integer.parseInt(request.getParameter("adminid")) == 201||Integer.parseInt(request.getParameter("adminid")) == 202) {
			a = DaoAdmin.loginSupervisor(a);
			if(a.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", a.getAdminid());
				request.setAttribute("a", DaoAdmin.getAdminById(a.getAdminid()));
				RequestDispatcher view = request.getRequestDispatcher("homesupervisor.jsp");
				view.forward(request, response);
			}
			else 
			{
				JOptionPane.showMessageDialog(null, "Please enter a valid Admin Id & Password", "Error Occurred", JOptionPane.WARNING_MESSAGE);
				response.sendRedirect("loginadmin.jsp");
			}
		}
		else {
			a = DaoAdmin.loginAdmin(a);
			
			if(a.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", a.getAdminid());
				request.setAttribute("a", DaoAdmin.getAdminById(a.getAdminid()));
				RequestDispatcher view = request.getRequestDispatcher("homeadmin.jsp");
				view.forward(request, response);
			}
			else 
			{
				JOptionPane.showMessageDialog(null, "Please enter a valid Admin Id & Password", "Error Occurred", JOptionPane.WARNING_MESSAGE);
				response.sendRedirect("loginadmin.jsp");
			}
		}
			
	}

}
