//TODO

1.클럽에 참여한 인원 방장이 모두 삭제 및 참여한 본인이 탈퇴하기 기능 구현--수정완료!    외래키 찾기 / cascade 

https://mins-father.tistory.com/46

FK_board_TO_b_photo 제약조건명

alter table b_photo drop constraint FK_board_TO_b_photo;

alter table b_photo add constraint FK_board_TO_b_photo
foreign key (bno) references board (bno)
on delete cascade
on update cascade;
/////////////////////////////////////////////////////////////////////////

하지만 지금 방장이 맴버들을 강퇴시키는 기능에서 번호가 맴버수대로 나오기때문에 버그가 발생한다 이를 수정하기 바람!-----버그 잡겠지만 확인해보겠음
클럽 참여여부 버그 잡기

3.클럽참여버튼 관련 버그 잡기
4.날짜 버그 잡음---------------------
5.클럽글 신고 창 넘어가는 기능하기--질문     디테일jsp 나누기/ 핸들러 만들기!---스프링에서 구현하기
제제를 가하면 제제+1 및 클럽글 삭제 그리고 신고된 글은 작성자가 삭제 못하게 하기-----안됨
