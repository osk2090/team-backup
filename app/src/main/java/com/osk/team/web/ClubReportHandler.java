package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@SuppressWarnings("serial")
@WebServlet("/club/report")
public class ClubReportHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        try {
            int no = Integer.parseInt(request.getParameter("no"));

//            Member loginUser = (Member) request.getSession().getAttribute("loginUser");//신고자는 익명처리
            Club c = new Club();

            HashMap<String, Object> params = new HashMap<>();

            params.put("memberNo", c.getWriter().getNo());//클럽글 작성자 번호
            params.put("clubNo", no);

            c.setReason(request.getParameter("reason"));//신고사유작성
            c.setResult(0);//최초 신고시에 처리여부는 디폴트 0

            clubService.addWithReport(params);//신고하는 글과 작성자 번호 보내기

            request.setAttribute("club", c);//신고사유와 처리여부 보내기

            response.sendRedirect("report");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
