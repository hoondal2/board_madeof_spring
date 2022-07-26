<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <script src="//jquery.com/jquery-wp-content/themes/jquery/js/modernizr.custom.2.8.3.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">fastcampus</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>

<div style="text-align:center">
  <h2 class="writing-header">게시물 읽기</h2>
  <form id="form" action="" >
    <input type="text" name="bno" value="${boardDto.bno}">
    <input name="title" type="text" value="${boardDto.title}" readonly = "readonly">
    <br>
    <textarea name="content" rows="20" readonly = "readonly">${boardDto.content}</textarea>
    <br>
      <button type="button" id="writeBtn" class="btn btn-write">등록</button>
      <button type="button" id="modifyBtn" class="btn btn-modify">수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove">삭제</button>
      <button type="button" id="listBtn" class="btn btn-list">목록</button>
  </form>
</div>
<script>
  $(document).ready(function(){ // main()
    $('#listBtn').on("click", function(){
      location.href="<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
    })
  })

  $(document).ready(function(){ // main()
    $('#removeBtn').on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;
      let form = $('#form');
      form.attr("action", "<c:url value='/board/remove'/>?page=${page}&pageSize=${pageSize}");
      form.attr("method", "post");
      form.submit();
    })
  })
</script>
</body>
</html>
