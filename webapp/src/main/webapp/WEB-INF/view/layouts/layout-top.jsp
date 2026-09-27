<%--
  HelixEMR Layout – Top Half
  Include this at the top of every authenticated view JSP.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="application-name" content="HelixEMR"/>
    <meta name="description" content="Helix Health Electronic Medical Record System"/>
    <meta name="theme-color" content="#7C3AED"/>
    <title>${empty pageTitle ? 'HelixEMR' : pageTitle}</title>
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/images/helix-favicon.svg"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helix-theme.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"/>
</head>
<body>

<div class="helix-app">

    <!-- ===========================================================
         Sidebar
         =========================================================== -->
    <nav class="helix-sidebar" aria-label="Main navigation">

        <a href="${pageContext.request.contextPath}/dashboard" class="helix-sidebar-brand">
            <svg class="helix-sidebar-brand-logo" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect width="40" height="40" rx="10" fill="url(#hxgrad)"/>
                <path d="M10 20h5l3-6 4 12 3-9 3 3h2" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                <defs>
                    <linearGradient id="hxgrad" x1="0" y1="0" x2="40" y2="40" gradientUnits="userSpaceOnUse">
                        <stop offset="0%" stop-color="#7C3AED"/>
                        <stop offset="100%" stop-color="#06B6D4"/>
                    </linearGradient>
                </defs>
            </svg>
            <span class="helix-sidebar-brand-name">Helix<span>EMR</span></span>
        </a>

        <div class="helix-sidebar-user">
            <div class="helix-sidebar-user-avatar">
                <c:choose>
                    <c:when test="${not empty pageContext.request.userPrincipal}">
                        <c:out value="${pageContext.request.userPrincipal.name.substring(0,1).toUpperCase()}"/>
                    </c:when>
                    <c:otherwise>A</c:otherwise>
                </c:choose>
            </div>
            <div>
                <div class="helix-sidebar-user-name">
                    <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal}">
                            <c:out value="${pageContext.request.userPrincipal.name}"/>
                        </c:when>
                        <c:otherwise>Administrator</c:otherwise>
                    </c:choose>
                </div>
                <div class="helix-sidebar-user-role">System Administrator</div>
            </div>
        </div>

        <ul class="helix-nav" role="menubar">
            <li class="helix-nav-section-title">Clinical</li>
            <li class="helix-nav-item ${activePage == 'dashboard' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/dashboard" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/>
                        <rect x="14" y="14" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/>
                    </svg>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="helix-nav-item ${activePage == 'patients' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/patients" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                    <span>Patients</span>
                </a>
            </li>
            <li class="helix-nav-item ${activePage == 'encounters' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/encounters" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                        <polyline points="14,2 14,8 20,8"/>
                        <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/>
                    </svg>
                    <span>Encounters</span>
                </a>
            </li>
            <li class="helix-nav-item ${activePage == 'orders' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/orders" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 6h18M3 12h18M3 18h18"/>
                    </svg>
                    <span>Orders</span>
                </a>
            </li>
            <li class="helix-nav-item ${activePage == 'visits' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/visits" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                        <polyline points="22 4 12 14.01 9 11.01"/>
                    </svg>
                    <span>Active Visits</span>
                </a>
            </li>
            <li class="helix-nav-section-title">Analytics</li>
            <li class="helix-nav-item ${activePage == 'reports' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/reports" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="18" y1="20" x2="18" y2="10"/>
                        <line x1="12" y1="20" x2="12" y2="4"/>
                        <line x1="6"  y1="20" x2="6"  y2="14"/>
                    </svg>
                    <span>Reports</span>
                </a>
            </li>
            <li class="helix-nav-section-title">System</li>
            <li class="helix-nav-item ${activePage == 'admin' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/admin" role="menuitem">
                    <svg class="helix-nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="3"/>
                        <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
                    </svg>
                    <span>Administration</span>
                </a>
            </li>
        </ul>

        <div class="helix-sidebar-footer">
            <a href="${pageContext.request.contextPath}/logout">
                <svg width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                    <polyline points="16 17 21 12 16 7"/>
                    <line x1="21" y1="12" x2="9" y2="12"/>
                </svg>
                <span>Sign Out</span>
            </a>
        </div>
    </nav>

    <!-- ===========================================================
         Content column: sticky header + scrollable main + footer
         =========================================================== -->
    <div class="helix-content-col">

        <!-- Header -->
        <header class="helix-header" role="banner">
            <div class="helix-header-left">
                <div>
                    <h1 class="helix-header-title" style="margin:0;">${empty pageTitle ? 'HelixEMR' : pageTitle}</h1>
                    <div class="helix-breadcrumb">
                        <span>Home</span>
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg>
                        <span style="color:var(--helix-primary);font-weight:600;">${empty activePage ? 'Dashboard' : activePage}</span>
                    </div>
                </div>
            </div>
            <div class="helix-header-actions">
                <button class="helix-notif-btn" aria-label="Notifications">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                    </svg>
                    <span class="helix-notif-dot"></span>
                </button>
                <div class="helix-avatar">
                    <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal}">
                            <c:out value="${pageContext.request.userPrincipal.name.substring(0,1).toUpperCase()}"/>
                        </c:when>
                        <c:otherwise>A</c:otherwise>
                    </c:choose>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="helix-btn helix-btn-ghost helix-btn-sm">Sign Out</a>
            </div>
        </header>

        <!-- Main Content -->
        <main class="helix-main" role="main" id="helix-content">
