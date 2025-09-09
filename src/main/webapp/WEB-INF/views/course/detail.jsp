<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="강좌 상세정보" scope="request"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>

<div class="container">
  <div class="row">
    <div class="col-md-8">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>📚 강좌 상세정보</h2>
        <div>
          <a href="${pageContext.request.contextPath}/courses/${course.id}/edit"
             class="btn btn-success">수정</a>
          <a href="${pageContext.request.contextPath}/courses"
             class="btn btn-secondary">목록</a>
        </div>
      </div>

      <div class="card">
        <div class="card-body">
          <table class="table table-borderless">
            <tr>
              <th width="120">ID:</th>
              <td>${course.id}</td>
            </tr>
            <tr>
              <th>강의코드:</th>
              <td><span class="badge bg-primary fs-6">${course.code}</span></td>
            </tr>
            <tr>
              <th>과목명:</th>
              <td><strong>${course.title}</strong></td>
            </tr>
            <tr>
              <th>담당교수:</th>
              <td>${course.professor}</td>
            </tr>
            <tr>
              <th>학점:</th>
              <td><span class="badge bg-success">${course.credit}학점</span></td>
            </tr>
            <tr>
              <th>등록일:</th>
              <td>${course.createdAt}</td>
            </tr>
          </table>
        </div>
      </div>

      <!-- 삭제 버튼 -->
      <div class="mt-3">
        <form method="post" action="${pageContext.request.contextPath}/courses/${course.id}/delete"
              onsubmit="return confirm('정말 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.' );">
          <button class="btn btn-danger" type="submit">🗑️ 강좌 삭제</button>
        </form>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
