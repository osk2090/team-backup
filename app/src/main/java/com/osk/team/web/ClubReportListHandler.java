package com.osk.team.web;


import com.osk.team.domain.Club;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/reportList")
public class ClubReportListHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        try {

            List<Club> clubs = null;

            String arrive = request.getParameter("arrive");
            String reason = request.getParameter("reason");
            int result = Integer.parseInt(request.getParameter("result"));
            String date = request.getParameter("date");

            String rresult = null;
            if (result == 0) {
                rresult = "미처리";
            }else {
                rresult = "처리완료";
            }

            String writer = request.getParameter("writer");
            StringBuffer sb = new StringBuffer();
            sb.append(writer);
            sb.replace(1, 3, "*");
            System.out.println(sb);

            clubs = clubService.getReports();

            request.setAttribute("clubs", clubs);
            response.setContentType("text/html;charset=UTF-8");
            request.getRequestDispatcher("/jsp/club/reportList.jsp").include(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
