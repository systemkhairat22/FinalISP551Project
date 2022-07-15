package khairat.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import khairat.dao.*;
import khairat.model.Payment;
import member.dao.DaoMember;


@WebServlet("/OnlinePaymentController")
public class OnlinePaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DaoKhairat dao;   
    public OnlinePaymentController() {
        super();
        dao = new DaoKhairat();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = (int) request.getSession().getAttribute("currentSessionUser");
		request.setAttribute("m", DaoMember.getMemberById(id));
	    RequestDispatcher view = request.getRequestDispatcher("onlinepayment.jsp");
	    view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Payment p = new Payment();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		
		try {
			Date parsedDate = format.parse(request.getParameter("payment_date"));
			p.setPayment_date(parsedDate);
		}catch (ParseException e) {
			e.printStackTrace();
		}
		
		p.setPayment_amount(Double.parseDouble(request.getParameter("payment_amount")));
		p.setPayment_receipt(request.getParameter("payment_receipt"));
		p.setMemberid((int)session.getAttribute("currentSessionUser"));
		p.setTransactionid(Integer.parseInt(request.getParameter("transactionid")));
		p.setBankname(request.getParameter("bankname"));
		
		dao.onlinePayment(p);
		JOptionPane.showMessageDialog(null,"Payment successfull");
		request.setAttribute("m", DaoMember.getMemberById((int)session.getAttribute("currentSessionUser")));
		RequestDispatcher view = request.getRequestDispatcher("homemember.jsp");
		view.forward(request, response);
	}

}
