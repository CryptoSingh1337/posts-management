<%--
  Created by CryptoSingh1337 on 6/8/2021
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/stylesheets/styles.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/images/post.png" rel="icon">
</head>
<body>
    <div style="height: 100vh;">
        <div class="container post-add-form">
            <h1>Create Post</h1>
            <form:form action="/post/add" method="POST" modelAttribute="post">
                <form:hidden path="id"/>
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <form:input cssClass="form-control" path="heading" id="title"/>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <form:textarea cssClass="form-control" path="content" id="description" rows="3"/>
                </div>
                <input class="btn btn-primary me-3" type="submit" value="Create Post">
                <a class="btn btn-secondary" href="/">Cancel</a>
            </form:form>
        </div>
    </div>
</body>
</html>
