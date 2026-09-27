<%--
  HelixEMR Main Layout Template
  Helix Health – Enterprise Electronic Medical Record System
  Copyright (C) 2024 Helix Health. Mozilla Public License v. 2.0
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en" class="helix-html">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="application-name" content="HelixEMR"/>
    <meta name="description" content="Helix Health Electronic Medical Record System"/>
    <meta name="theme-color" content="#6200EA"/>

    <title>${empty pageTitle ? 'HelixEMR' : pageTitle}</title>

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/images/helix-favicon.svg"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/helix-favicon.png"/>

    <!-- HelixEMR Brand Theme -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/helix-theme.css"/>

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"/>

    <jsp:include page="/WEB-INF/view/layouts/head-extra.jsp" flush="false"/>
</head>
<body class="helix-body">

<div class="helix-app">

    <!-- ============================================================
         Sidebar Navigation
         ============================================================ -->
    <nav class="helix-sidebar" aria-label="Main navigation">
        <a href="${pageContext.request.contextPath}/helixemr/dashboard"
           class="helix-sidebar-brand">
            <img src="${pageContext.request.contextPath}/images/helix-logo.svg"
                 alt="HelixEMR"
                 class="helix-sidebar-brand-logo"/>
            <span class="helix-sidebar-brand-name">Helix<span>EMR</span></span>
        </a>

        <ul class="helix-nav" role="menubar">
            <li class="helix-nav-section-title">Clinical</li>

            <li class="helix-nav-item ${activePage == 'dashboard' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/dashboard" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/>
                        <rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/>
                    </svg>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="helix-nav-item ${activePage == 'patients' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/patients" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                    <span>Patients</span>
                </a>
            </li>

            <li class="helix-nav-item ${activePage == 'encounters' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/encounters" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                        <polyline points="14,2 14,8 20,8"/>
                        <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/>
                        <polyline points="10,9 9,9 8,9"/>
                    </svg>
                    <span>Encounters</span>
                </a>
            </li>

            <li class="helix-nav-item ${activePage == 'orders' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/orders" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M9 2H5a2 2 0 0 0-2 2v4m6-6h10a2 2 0 0 1 2 2v4M9 2v20m0 0h10a2 2 0 0 0 2-2V8M9 22H5a2 2 0 0 1-2-2V8m0 0h18"/>
                    </svg>
                    <span>Orders</span>
                </a>
            </li>

            <li class="helix-nav-item ${activePage == 'medications' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/medications" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/>
                    </svg>
                    <span>Medications</span>
                </a>
            </li>

            <li class="helix-nav-section-title">Analytics</li>

            <li class="helix-nav-item ${activePage == 'reports' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/reports" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <line x1="18" y1="20" x2="18" y2="10"/>
                        <line x1="12" y1="20" x2="12" y2="4"/>
                        <line x1="6"  y1="20" x2="6"  y2="14"/>
                    </svg>
                    <span>Reports</span>
                </a>
            </li>

            <li class="helix-nav-section-title">System</li>

            <li class="helix-nav-item ${activePage == 'admin' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/helixemr/admin" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="3"/>
                        <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
                    </svg>
                    <span>Administration</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- ============================================================
         Top Header
         ============================================================ -->
    <header class="helix-header" role="banner">
        <h1 class="helix-header-title">${empty pageTitle ? 'HelixEMR' : pageTitle}</h1>
        <div class="helix-header-actions">
            <div class="helix-user-menu">
                <div class="helix-avatar" title="${pageContext.request.userPrincipal.name}">
                    <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal.name}">
                            ${pageContext.request.userPrincipal.name.substring(0,1).toUpperCase()}
                        </c:when>
                        <c:otherwise>U</c:otherwise>
                    </c:choose>
                </div>
                <span class="helix-text-muted" style="font-size:13px;">
                    <c:out value="${pageContext.request.userPrincipal.name}"/>
                </span>
            </div>
            <a href="${pageContext.request.contextPath}/helixemr/logout"
               class="helix-btn helix-btn-outline helix-btn-sm">
                Sign Out
            </a>
        </div>
    </header>

    <!-- ============================================================
         Main Content
         ============================================================ -->
    <main class="helix-main" role="main" id="helix-content">
        <jsp:include page="${content}" flush="true"/>
    </main>

    <!-- ============================================================
         Footer
         ============================================================ -->
    <footer class="helix-footer" role="contentinfo">
        <span>&copy; 2026 <strong>Skillfyme</strong>. All rights reserved.</span>
        <span>HelixEMR v1.0.0 &nbsp;|&nbsp; MPL 2.0 &nbsp;|&nbsp;
              <a href="mailto:support@helixhealth.io">support@helixhealth.io</a></span>
    </footer>
</div>

<!-- jQuery (slim) -->
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
        integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8="
        crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/view/layouts/scripts-extra.jsp" flush="false"/>
</body>
</html>
