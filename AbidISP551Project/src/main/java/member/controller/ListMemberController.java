package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.*;
@WebServlet("/ListMemberController")
public class ListMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DaoMember dao;
    public ListMemberController() {
        super();
        dao = new DaoMember();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("Member", DaoMember.getAllMember());
		RequestDispatcher view = request.getRequestDispatcher("memberlist.jsp");
		view.forward(request, response);
	}

}
