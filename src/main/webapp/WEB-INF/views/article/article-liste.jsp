<%--
  Created by IntelliJ IDEA.
  User: TOSHIBA
  Date: 26/04/2020
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <style>
        .aColor {
            color: #000000;
        }

        .space_Section {
            margin-top: 20px;
        }

        .bg-black {
            background-color: #000000!important;
        }

        .bg-cool-blue {
            background-color: #a0e5e8!important;
        }

        .icon-drop-user {
            margin-right: 10px;
        }
        .icon-menu-space{
            margin-right: 50px;
        }

        .article{
            text-align: justify;
            font-style: italic;
            font-family: cursive;
            background-color: #ececec;
        }
        .tag-item {
            position: relative;
            border-right-width: 0px;
            border-radius: 15px;
            background-color: #000000;
            color: white;
            border-color: #9327ff;
        }

    </style>
</head>
<body>
<div class="fluid">
    <c:choose>
        <c:when test="${role == 'Admin'}">
            <jsp:include page="../includes/main-navbar.jsp" />
        </c:when>
        <c:when test="${role == 'Writer'}">
            <jsp:include page="../includes/main-navbar.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="../includes/visitor-navbar.jsp" />
        </c:otherwise>
    </c:choose>

    <div class="jumbotron jumbotron-fluid bg-cool-blue">
        <div class="container">
            <h1 class="display-4 aColor">
                Articles
            </h1>
        </div>
    </div>
    <div class="container">

        <div class="row">
            <div class="col-md-12">

                <c:choose>
                    <c:when test="${role == 'Admin'}">
                        <input type="button" style="float: left; border-radius: 50px;" value="Nouveau Article"
                               onclick="window.location.href='${pageContext.request.contextPath}/article/add'; return false;"
                               class="btn btn-primary" />
                        <input type="button" style="text-align: center; border-radius: 50px;" value="Tags List"
                               onclick="window.location.href='${pageContext.request.contextPath}/tag/'; return false;"
                               class="btn btn-primary" />
                    </c:when>
                    <c:when test="${role == 'Writer'}">
                        <input type="button" style="float: left; border-radius: 50px;" value="Nouveau Article"
                               onclick="window.location.href='${pageContext.request.contextPath}/article/add'; return false;"
                               class="btn btn-primary" />
                        <input type="button" style="text-align: center; border-radius: 50px;" value="Tags List"
                               onclick="window.location.href='${pageContext.request.contextPath}/tag/'; return false;"
                               class="btn btn-primary" />
                    </c:when>
                </c:choose>

                <c:choose>
                    <c:when test="${role == 'Admin'}">
                        <input type="button" style="float: right;border-radius: 50px;" value="Consultation Users"
                               onclick="window.location.href='${pageContext.request.contextPath}/user/list'; return false;"
                               class="btn btn-primary" />
                    </c:when>
                    <c:when test="${role == 'Writer'}">
                        <input disabled="true" type="button" style="float: right;border-radius: 50px;" value="Consultation Users"
                               onclick="window.location.href='${pageContext.request.contextPath}/user/list'; return false;"
                               class="btn btn-primary" />
                    </c:when>
                </c:choose>



                <br/><br/>
            </div>
        </div>

        <div class="user-contents">
            <c:forEach items="${pageable.content}" var="item">
                <!--Ã§a sera repeter plusieur fois-->
                <div class="user-contents">
                    <div class="container">
                        <div class="row">
                            <br><br>
                            <div class="col-md-4 col-sm-4 ">
                                <h2>${item.title}</h2>
                                <div class="blok1">
                                    <img src="<c:url value="/resources/images/articles/${item.image}"/>" alt="image" class="albimage" height="200px">
                                    <div style="display: block; margin: 35px; align-items: center">
                                        <img src="<c:url value="/resources/images/users/${item.user.image}"/>" class="user" width="80px" height="80px">

                                        <a href="${pageContext.request.contextPath}/article/view/${item.id}" ><h2 style="text-align: center;"><em>${item.user.prenom}</em></h2></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <a href="${pageContext.request.contextPath}/article/view/${item.id}" ><h2 style="color: #3ed400; text-align: center; font-family: none;">Lire l'article complet ...</h2></a>
                                <div class="article">
                                        ${item.body}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="text-align: center">
                <c:forEach items="${item.tagList}" var="tags">
                    <a href="/" class="btn btn-sm tag-item" >
                            ${tags.title}
                    </a>
                </c:forEach>
                </div>
                <p style="float: right; color: #20560a; font-family: initial;">Publier le: ${item.created} </p>
                <hr style="width: 50%; color: black; background-color: black;">
            </c:forEach>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-md-offset-6">
                        <div style="text-align: center;">
                            <nav aria-label="Page navigation example " >
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${pageable.number !=0 }">
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/article/page/${pageable.number-1 }">Previous</a></li>
                                        </c:when>
                                    </c:choose>
                                    <c:forEach begin="0"   end="${pageable.totalPages -1}" var="i">
                                        <c:choose>
                                            <c:when test="${pageable.number ==i }">
                                                <li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/article/page/${i}">${i}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/article/page/${i}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${pageable.number <pageable.totalPages-1 }">
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/article/page/${pageable.number+1 }">Next</a></li>
                                        </c:when>
                                    </c:choose>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="../includes/footer.jsp" />
</div>



</body>
</html>
