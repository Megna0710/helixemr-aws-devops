<%--
  HelixEMR Error Page
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${empty pageTitle ? 'Error – HelixEMR' : pageTitle}</title>
    <link rel="icon" type="image/svg+xml"
          href="${pageContext.request.contextPath}/images/helix-favicon.svg"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/helix-theme.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"/>
</head>
<body class="helix-login-page">

<div class="helix-login-card" style="text-align:center;">
    <img src="${pageContext.request.contextPath}/images/helix-logo.svg"
         alt="HelixEMR" style="width:56px; height:56px; margin-bottom:16px;"/>

    <div style="font-size:64px; font-weight:800; color:var(--helix-primary); line-height:1;">
        <c:out value="${errorCode}"/>
    </div>

    <h2 style="margin:12px 0 8px; font-size:20px; color:var(--helix-text-primary);">
        <c:out value="${errorMessage}"/>
    </h2>

    <c:if test="${not empty errorDetail}">
        <p style="font-size:12px; color:var(--helix-text-secondary); font-family:var(--helix-font-mono);">
            <c:out value="${errorDetail}"/>
        </p>
    </c:if>

    <div style="margin-top:24px; display:flex; gap:12px; justify-content:center; flex-wrap:wrap;">
        <a href="${pageContext.request.contextPath}/helixemr/dashboard"
           class="helix-btn helix-btn-primary">
            Back to Dashboard
        </a>
        <a href="javascript:history.back()" class="helix-btn helix-btn-outline">
            Go Back
        </a>
    </div>
</div>

</body>
</html>
