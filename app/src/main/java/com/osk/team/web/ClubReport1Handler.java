package com.osk.team.web;

import com.osk.team.domain.Club;
import com.osk.team.domain.Member;
import com.osk.team.service.ClubService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ClubReport1Handler {

    ClubService clubService;

    public ClubReport1Handler(ClubService clubService) {
        this.clubService = clubService;
    }

    @RequestMapping("/club/report1")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int no = Integer.parseInt(request.getParameter("no"));
        Club c = clubService.get(no);
        request.setAttribute("club", c);

        return "/jsp/club/report1.jsp";
    }
}
