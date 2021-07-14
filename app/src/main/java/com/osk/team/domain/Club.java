package com.osk.team.domain;

import lombok.Data;

import java.sql.Date;
import java.util.List;

@Data
public class Club {
    private int no;//클럽번호

    private Member writer;//작성자
    private List<Member> members;//현재 클럽에 소속된 멤버들

    private String arrive;//도착지
    private String theme;//테마
    private String title;//제목
    private String content;//내용
    private Date startDate;//가는날
    private Date endDate;//오는날
    private int total;//인원수
    private int nowTotal;//현재참여 인원수
    private List<Object> photos;//사진

    //신고관련
    private String rtitle;//신고제목
    private String reason;//신고사유
    private int result;//신고처리 여부
    private Date date;//신고일자
}
