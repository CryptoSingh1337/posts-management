<%--
  Created by CryptoSingh1337 on 6/7/2021
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/stylesheets/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/post.png" rel="icon">
</head>
<body>
    <div class="p-5 mb-4 bg-light rounded-3 pb-3" style="height: 100vh">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">${post.heading}</h1>
            <p class="fs-4">${post.content}</p>
            <div class="border-top border-bottom text-muted text-center" style="width: 10%">
                ${post.comments.size()} comments
            </div>
            <div id="post-op" class="my-3">
                <div class="badge bg-light text-dark op-con">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                    </svg><a class="op text-decoration-none ms-2" href="/post/edit?id=${post.id}">edit</a>
                </div>
                <div class="badge bg-light text-dark op-con">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                        <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                    </svg><a id="comment-btn" class="op text-decoration-none ms-2">comment</a>
                </div>
                <div class="badge bg-light text-dark op-con">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                    </svg><a class="op text-decoration-none ms-2" href="/post/delete?id=${post.id}">delete</a>
                </div>
            </div>
            <div class="card" style="width: 30%">
                <div class="card-body">
                    <form:form modelAttribute="comment" action="/post/comment/add?id=${post.id}" method="POST">
                        <div class="form-floating">
                            <form:textarea path="description" cssClass="form-control" id="floatingTextarea" style="height: 100px"/>
                            <label for="floatingTextarea">Write your comment</label>
                        </div>
                        <button type="submit" class="btn btn-primary my-2">Save comment</button>
                    </form:form>
                </div>
            </div>
            <c:choose>
                <c:when test="${post.comments.size() > 0}">
                    <div id="comments" class="mt-4">
                        <h3 class="fw-bold">Comments</h3>
                        <c:forEach var="comment" items="${post.comments}">
                            <div class="card-body">
                                <h5 class="card-title">${comment.username} on <span class="text-muted">${comment.date}</span></h5>
                                <p class="card-text">${comment.description}</p>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <h4 class="text-center my-4">No comments exists</h4>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <script>
        document.getElementById("comment-btn").onclick = function () {
            document.getElementById("floatingTextarea").focus();
        }
    </script>
</body>
</html>
