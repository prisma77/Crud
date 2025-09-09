<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="학생 상세정보" scope="request"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<div class="container">
  <div class="row">
    <div class="col-md-8">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>👨‍🎓 학생 상세정보</h2>
        <div>
          <a href="${pageContext.request.contextPath}/students/${student.id}/edit"
             class="btn btn-primary">수정</a>
          <a href="${pageContext.request.contextPath}/students"
             class="btn btn-secondary">목록</a>
        </div>
      </div>

      <div class="card">
        <div class="card-body">
          <table class="table table-borderless">
            <tr>
              <th width="120">ID:</th>
              <td>${student.id}</td>
            </tr>
            <tr>
              <th>학번:</th>
              <td>${student.studentNo}</td>
            </tr>
            <tr>
              <th>이름:</th>
              <td>${student.name}</td>
            </tr>
            <tr>
              <th>이메일:</th>
              <td>${student.email}</td>
            </tr>
            <tr>
              <th>학과:</th>
              <td>${student.dept}</td>
            </tr>
            <tr>
              <th>등록일:</th>
              <td>${student.createdAt}</td>
            </tr>
          </table>
        </div>
      </div>

      <!-- 삭제 버튼 -->
      <div class="mt-3">
        <form method="post" action="${pageContext.request.contextPath}/students/${student.id}/delete"
              onsubmit="return confirm('정말 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.' );">
          <button class="btn btn-danger" type="submit">🗑️ 학생 삭제</button>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
