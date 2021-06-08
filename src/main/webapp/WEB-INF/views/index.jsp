<%--
  Created by CryptoSingh1337 on 6/7/2021
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="#" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/post.png" rel="icon">
</head>
<body>
    <h1 class="display-1 fw-bold text-center border-bottom pb-4">Posts</h1>
    <div class="container pt-3 pb-3">
        <div class="d-flex">
            <a href="/post/add" class="btn btn-primary me-4">Create</a>
            <span class="fs-5 fw-normal pt-1">Create a new post</span>
        </div>
    </div>
    <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
        <div class="container">
            <div class="list-group list-group-flush border-bottom scrollarea">
                <c:forEach var="post" items="${posts}">
                <a class="list-group-item list-group-item-action py-3 lh-tight" href="/post/${post.id}">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">${post.heading}</strong>
                        <small>${post.date}</small>
                    </div>
                    <div class="col-10 mb-1 small">
                        ${post.content}
                    </div>
                </a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
