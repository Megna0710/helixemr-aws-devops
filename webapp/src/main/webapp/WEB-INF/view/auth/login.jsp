<%--
  HelixEMR Login Page
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="robots" content="noindex, nofollow"/>
    <title>Sign In – HelixEMR</title>
    <link rel="icon" type="image/svg+xml"
          href="${pageContext.request.contextPath}/images/helix-favicon.svg"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/helix-theme.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"/>
</head>
<body class="helix-login-page">

<div class="helix-login-card">

    <!-- Brand -->
    <div class="helix-login-logo">
        <img src="${pageContext.request.contextPath}/images/helix-logo.svg"
             alt="HelixEMR Logo"/>
        <div class="helix-login-app-name">HelixEMR</div>
        <div class="helix-login-tagline">Helix Health &mdash; Empowering Healthcare</div>
    </div>

    <h2 class="helix-login-title">Sign In</h2>

    <!-- Error messages -->
    <c:if test="${param.error != null}">
        <div class="helix-alert helix-alert-danger" role="alert">
            Invalid username or password. Please try again.
        </div>
    </c:if>
    <c:if test="${param.logout != null}">
        <div class="helix-alert helix-alert-success" role="alert">
            You have been signed out successfully.
        </div>
    </c:if>
    <c:if test="${param.sessionExpired != null}">
        <div class="helix-alert helix-alert-warning" role="alert">
            Your session has expired. Please sign in again.
        </div>
    </c:if>

    <!-- Login form -->
    <form action="${pageContext.request.contextPath}/loginServlet"
          method="POST"
          autocomplete="on"
          novalidate>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="helix-form-group">
            <label class="helix-label" for="username">Username</label>
            <input type="text"
                   id="username"
                   name="username"
                   class="helix-input"
                   placeholder="Enter your username"
                   autocomplete="username"
                   required
                   autofocus/>
        </div>

        <div class="helix-form-group">
            <label class="helix-label" for="password">Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   class="helix-input"
                   placeholder="Enter your password"
                   autocomplete="current-password"
                   required/>
        </div>

        <div class="helix-form-group" style="margin-bottom: var(--helix-space-lg);">
            <label style="display:flex; align-items:center; gap:8px; cursor:pointer; font-size:13px;">
                <input type="checkbox" name="remember-me" style="accent-color:var(--helix-primary);"/>
                Keep me signed in
            </label>
        </div>

        <button type="submit" class="helix-btn helix-btn-primary"
                style="width:100%; justify-content:center; padding: 12px;">
            Sign In to HelixEMR
        </button>

    </form>

    <div style="text-align:center; margin-top:var(--helix-space-md);">
        <a href="${pageContext.request.contextPath}/forgotPassword"
           style="font-size:13px; color:var(--helix-text-secondary);">
            Forgot password?
        </a>
    </div>
</div>

<div style="position:fixed; bottom:16px; left:0; right:0; text-align:center;
            font-size:11px; color:rgba(255,255,255,0.4);">
    &copy; 2026 Skillfyme &nbsp;|&nbsp; HelixEMR v1.0.0 &nbsp;|&nbsp;
    <a href="https://helixhealth.io" style="color:rgba(255,255,255,0.4);">helixhealth.io</a>
</div>

</body>
</html>
