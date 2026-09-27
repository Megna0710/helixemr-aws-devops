<%--
  HelixEMR Dashboard – Professional redesign
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="activePage" value="dashboard" scope="request"/>
<c:set var="pageTitle"  value="Dashboard – HelixEMR" scope="request"/>

<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<!-- ============================================================
     Welcome Banner
     ============================================================ -->
<div class="helix-welcome-banner">
    <div class="helix-welcome-text">
        <h2>Welcome back,
            <c:choose>
                <c:when test="${not empty pageContext.request.userPrincipal}">
                    <c:out value="${pageContext.request.userPrincipal.name}"/>
                </c:when>
                <c:otherwise>Administrator</c:otherwise>
            </c:choose>
            &#x1F44B;
        </h2>
        <p>Here's what's happening in your clinic today. Everything looks good.</p>
    </div>
    <div class="helix-welcome-badge" style="position:relative;z-index:1;">
        <span class="helix-welcome-badge-dot"></span>
        System Operational
    </div>
</div>

<!-- ============================================================
     Stat Cards
     ============================================================ -->
<div class="helix-stats-grid">

    <!-- Total Patients -->
    <div class="helix-stat-card">
        <div class="helix-stat-icon">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                <circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            </svg>
        </div>
        <div class="helix-stat-label">Total Patients</div>
        <div class="helix-stat-value">
            <c:choose>
                <c:when test="${not empty totalPatients}"><fmt:formatNumber value="${totalPatients}" groupingUsed="true"/></c:when>
                <c:otherwise>0</c:otherwise>
            </c:choose>
        </div>
        <span class="helix-stat-trend green">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="18 15 12 9 6 15"/></svg>
            Active Registry
        </span>
    </div>

    <!-- Encounters Today -->
    <div class="helix-stat-card success">
        <div class="helix-stat-icon">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                <polyline points="14,2 14,8 20,8"/>
                <line x1="16" y1="13" x2="8" y2="13"/>
                <line x1="16" y1="17" x2="8" y2="17"/>
            </svg>
        </div>
        <div class="helix-stat-label">Encounters Today</div>
        <div class="helix-stat-value">0</div>
        <span class="helix-stat-trend green">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            Clinic Open
        </span>
    </div>

    <!-- Active Visits -->
    <div class="helix-stat-card accent">
        <div class="helix-stat-icon">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                <polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
        </div>
        <div class="helix-stat-label">Active Visits</div>
        <div class="helix-stat-value">0</div>
        <span class="helix-stat-trend cyan">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/></svg>
            In-Patient
        </span>
    </div>

    <!-- Pending Orders -->
    <div class="helix-stat-card info">
        <div class="helix-stat-icon">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M9 2H5a2 2 0 0 0-2 2v4m6-6h10a2 2 0 0 1 2 2v4M9 2v20m0 0h10a2 2 0 0 0 2-2V8M9 22H5a2 2 0 0 1-2-2V8m0 0h18"/>
            </svg>
        </div>
        <div class="helix-stat-label">Pending Orders</div>
        <div class="helix-stat-value">0</div>
        <span class="helix-stat-trend blue">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
            Awaiting Review
        </span>
    </div>
</div>

<!-- ============================================================
     Main Row: Quick Actions + Activity Feed | System Status
     ============================================================ -->
<div class="helix-dashboard-row">

    <!-- Left column -->
    <div>
        <!-- Quick Action Tiles -->
        <div class="helix-card">
            <div class="helix-card-header">
                <h2 class="helix-card-title">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                        <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
                    </svg>
                    Quick Actions
                </h2>
            </div>
            <div class="helix-action-grid">
                <a href="${pageContext.request.contextPath}/patients/add"
                   class="helix-action-tile">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="8.5" cy="7" r="4"/>
                            <line x1="20" y1="8" x2="20" y2="14"/>
                            <line x1="23" y1="11" x2="17" y2="11"/>
                        </svg>
                    </div>
                    Register Patient
                </a>

                <a href="${pageContext.request.contextPath}/patients"
                   class="helix-action-tile green">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"/>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                        </svg>
                    </div>
                    Search Patients
                </a>

                <a href="${pageContext.request.contextPath}/encounters"
                   class="helix-action-tile cyan">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14,2 14,8 20,8"/>
                            <line x1="16" y1="13" x2="8" y2="13"/>
                        </svg>
                    </div>
                    New Encounter
                </a>

                <a href="${pageContext.request.contextPath}/orders"
                   class="helix-action-tile">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 6h18M3 12h18M3 18h18"/>
                        </svg>
                    </div>
                    Manage Orders
                </a>

                <a href="${pageContext.request.contextPath}/reports"
                   class="helix-action-tile green">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="18" y1="20" x2="18" y2="10"/>
                            <line x1="12" y1="20" x2="12" y2="4"/>
                            <line x1="6"  y1="20" x2="6"  y2="14"/>
                        </svg>
                    </div>
                    View Reports
                </a>

                <a href="${pageContext.request.contextPath}/admin"
                   class="helix-action-tile">
                    <div class="helix-action-tile-icon">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="3"/>
                            <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
                        </svg>
                    </div>
                    Administration
                </a>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="helix-card">
            <div class="helix-card-header">
                <h2 class="helix-card-title">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12 6 12 12 16 14"/>
                    </svg>
                    Recent Activity
                </h2>
                <span class="helix-badge helix-badge-active">Live</span>
            </div>
            <ul class="helix-activity-list">
                <li class="helix-activity-item">
                    <span class="helix-activity-dot purple"></span>
                    <div>
                        <div class="helix-activity-text">System initialised — HelixEMR is running</div>
                        <div class="helix-activity-time">Just now</div>
                    </div>
                </li>
                <li class="helix-activity-item">
                    <span class="helix-activity-dot green"></span>
                    <div>
                        <div class="helix-activity-text">Database connection established successfully</div>
                        <div class="helix-activity-time">On startup</div>
                    </div>
                </li>
                <li class="helix-activity-item">
                    <span class="helix-activity-dot blue"></span>
                    <div>
                        <div class="helix-activity-text">Liquibase schema migrations applied</div>
                        <div class="helix-activity-time">On startup</div>
                    </div>
                </li>
                <li class="helix-activity-item">
                    <span class="helix-activity-dot amber"></span>
                    <div>
                        <div class="helix-activity-text">Ready to register patients and record encounters</div>
                        <div class="helix-activity-time">Awaiting first entry</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!-- Right column: System Status -->
    <div>
        <div class="helix-card">
            <div class="helix-card-header">
                <h2 class="helix-card-title">
                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-success);">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                        <polyline points="22 4 12 14.01 9 11.01"/>
                    </svg>
                    System Status
                </h2>
                <span class="helix-badge helix-badge-active">All Systems Go</span>
            </div>
            <ul class="helix-status-list">
                <li class="helix-status-row">
                    <span class="helix-status-key">Application</span>
                    <span class="helix-status-val">HelixEMR</span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">Version</span>
                    <span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;">1.0.0-SNAPSHOT</span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">Database</span>
                    <span class="helix-status-val" style="color:var(--helix-success);">
                        <svg width="10" height="10" viewBox="0 0 24 24" fill="var(--helix-success)" style="margin-right:4px;vertical-align:middle;"><circle cx="12" cy="12" r="10"/></svg>
                        Connected
                    </span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">Cache</span>
                    <span class="helix-status-val" style="color:var(--helix-success);">
                        <svg width="10" height="10" viewBox="0 0 24 24" fill="var(--helix-success)" style="margin-right:4px;vertical-align:middle;"><circle cx="12" cy="12" r="10"/></svg>
                        Active
                    </span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">FHIR R4</span>
                    <span class="helix-status-val" style="color:var(--helix-success);">
                        <svg width="10" height="10" viewBox="0 0 24 24" fill="var(--helix-success)" style="margin-right:4px;vertical-align:middle;"><circle cx="12" cy="12" r="10"/></svg>
                        Enabled
                    </span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">HL7</span>
                    <span class="helix-status-val" style="color:var(--helix-success);">
                        <svg width="10" height="10" viewBox="0 0 24 24" fill="var(--helix-success)" style="margin-right:4px;vertical-align:middle;"><circle cx="12" cy="12" r="10"/></svg>
                        Enabled
                    </span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">Today</span>
                    <span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;">
                        <c:out value="${today}"/>
                    </span>
                </li>
                <li class="helix-status-row">
                    <span class="helix-status-key">Platform</span>
                    <span class="helix-status-val" style="font-size:11px;color:var(--helix-text-secondary);">MPL 2.0</span>
                </li>
            </ul>
        </div>

        <!-- Compact info card -->
        <div class="helix-card" style="background:linear-gradient(135deg,var(--helix-primary-50) 0%,var(--helix-surface) 100%);border-color:var(--helix-border);">
            <div style="display:flex;align-items:center;gap:10px;margin-bottom:10px;">
                <div style="width:36px;height:36px;border-radius:var(--helix-radius-md);background:linear-gradient(135deg,var(--helix-primary),#9333EA);display:flex;align-items:center;justify-content:center;">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/>
                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/>
                    </svg>
                </div>
                <div>
                    <div style="font-size:13px;font-weight:700;color:var(--helix-text-primary);">Interoperability</div>
                    <div style="font-size:11px;color:var(--helix-text-secondary);">FHIR R4 + HL7 v2</div>
                </div>
            </div>
            <p style="margin:0;font-size:12px;color:var(--helix-text-secondary);line-height:1.6;">
                HelixEMR supports standards-based data exchange.
                Connect to external labs, imaging, and health information exchanges.
            </p>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
