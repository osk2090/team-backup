package com.osk.team.web;

import com.osk.team.domain.Member;
import com.osk.team.service.ClubService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/club/deleteMembers")
public class ClubDeleteMembersHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClubService clubService = (ClubService) request.getServletContext().getAttribute("clubService");

        Member loginUser = (Member) request.getSession().getAttribute("loginUser");

        try {
            int no = Integer.parseInt(request.getParameter("no"));
            List<Member> clubM = clubService.getMembers(no);

            clubService.deleteMember(no);
            request.setAttribute("clubMembers", clubM);
            response.sendRedirect("list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}