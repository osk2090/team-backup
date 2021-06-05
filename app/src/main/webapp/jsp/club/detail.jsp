<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 상세</title>
</head>
<body style="text-align: center;">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<div>
    <c:if test="${not empty club}">

    <!--클럽참여 관련-->
    <c:set var="exist" value="${false}"/>
    <c:if test="${club.total != club.nowTotal}">
        <c:forEach items="${clubMembers}" var="cm">
            <c:if test="${loginUser.no == cm.no}">
                <button type="button" class="btn btn-secondary btn-lg" disabled>클럽 참여중</button>
                <c:set var="exist" value="${true}"/>
            </c:if>
        </c:forEach>
    </c:if>

    <c:if test="${club.total == club.nowTotal and loginUser.no == club.writer.no}">
        <button type="button" class="btn btn-secondary btn-lg" disabled>클럽 참여불가</button>
    </c:if>

    <c:if test="${!exist and not empty loginUser and loginUser.no != club.writer.no and club.total > club.nowTotal}">
        <form action="join" method="post">
            <input type="text" name="no" value="${club.no}" hidden>
            <input type="text" name="loginUser" value="${loginUser.no}" hidden>
            <input class="btn btn-primary" type="submit" value="클럽 참여" onclick="result1()">
        </form>
    </c:if>

    <!--클럽신고 관련-->
    <c:set var="existreports" value="${false}"/>
    <c:forEach items="${reports}" var="rs">
        <c:if test="${rs.no == club.no}">
            <span class="badge bg-danger">신고된 글</span>
            <c:set var="existreports" value="${true}"/>
        </c:if>
    </c:forEach>

    <c:forEach items="${clubMembers}" var="cm">
        <c:if test="${not empty loginUser and !existreports and loginUser.no != club.writer.no and loginUser.no == cm.no}">
            <form action="report1" method="post">
                <input type="text" name="no" value="${club.no}" hidden>
                <input type="text" name="clubWriterNo" value="${club.writer.no}" hidden>
                <button type="submit" class="btn btn-danger">클럽 신고</button>
            </form>
        </c:if>
    </c:forEach>

    팀원:<br>
    <jsp:include page="/jsp/club/member_list.jsp"/>
</div>
<form action='update' method='post'>
    <table border='1'>
        번호: <input type='text' name='no' value='${club.no}' readonly><br>
        방장: <input type='text' name='writer' value='${club.writer.name}' readonly><br>
        도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
        가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
        오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
        테마: <input name='theme' id="themeid" value='${club.theme}' readonly><br>

        <!--로그인된 사람만 수정할수 있고 아닌사람은 readonly되게-->
        <c:if test="${loginUser.no == club.writer.no}">
            제목: <input type='text' name='title' value='${club.title}'><br>
            내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
        </c:if>

        <c:if test="${loginUser.no != club.writer.no}">
            제목: <input type='text' name='title' value='${club.title}' readonly><br>
            내용: <textarea name='content' rows='10' cols='60' readonly>${club.content}</textarea><br>
        </c:if>

        인원수 / 현재인원수: ${club.total} / ${club.nowTotal} <br>
        <th>사진</th>
        <c:if test="${not empty club.photos}">
        <%System.out.println("11");%>
        <c:forEach items="${club.photos}" var="p">
        <%System.out.println("22");%>
        <c:set var="photo254x178Url">../../upload/${p.name}_254x178.jpg</c:set>
        <%System.out.println("33");%>
        <td><img src='${photo254x178Url}'><br>
                    <%System.out.println("44");%>
            </c:forEach>
            </c:if>

            <c:if test="${not empty loginUser and loginUser.no == club.writer.no or loginUser.power == 1 }">

            <tfoot>
            <tr>
                <td colspan='2'>
                    <input type='submit' value='변경'>
                    <input onclick="del()" class="btn btn-primary" value="삭제" style="margin-left: 84%; margin-top: 7%">
                </td>
            </tr>
            </tfoot>
            </c:if>
    </table>
</form>
</c:if>

<script>

    function del() {
        if (confirm("정말 삭제하시겠습니까?") == true) {    //확인
            onclick(window.location.href = 'delete?no=${club.no}')
        } else {   //취소
            return false;
        }
    }

    function result1() {
        alert("클럽참여 완료");
    }

    function result2() {
        alert("클럽탈퇴 완료");
    }

    function result3() {
        alert("클럽강퇴 완료");
    }
</script>

</body>
</html>