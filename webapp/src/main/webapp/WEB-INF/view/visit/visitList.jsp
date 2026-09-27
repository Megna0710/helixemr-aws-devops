<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="visits" scope="request"/>
<c:set var="pageTitle"  value="Active Visits – HelixEMR" scope="request"/>
<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;">
    <div>
        <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">Active Visits</h2>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">Patients currently checked in or admitted</p>
    </div>
    <a href="${pageContext.request.contextPath}/patients" class="helix-btn helix-btn-primary">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Start Visit
    </a>
</div>

<!-- Stats row -->
<div style="display:grid;grid-template-columns:repeat(3,1fr);gap:16px;margin-bottom:22px;">
    <div class="helix-card" style="padding:18px 20px;border-top:3px solid var(--helix-accent);">
        <div style="font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:0.8px;color:var(--helix-text-secondary);margin-bottom:6px;">Checked In</div>
        <div style="font-size:30px;font-weight:800;color:var(--helix-text-primary);">0</div>
    </div>
    <div class="helix-card" style="padding:18px 20px;border-top:3px solid var(--helix-success);">
        <div style="font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:0.8px;color:var(--helix-text-secondary);margin-bottom:6px;">In Consultation</div>
        <div style="font-size:30px;font-weight:800;color:var(--helix-text-primary);">0</div>
    </div>
    <div class="helix-card" style="padding:18px 20px;border-top:3px solid var(--helix-warning);">
        <div style="font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:0.8px;color:var(--helix-text-secondary);margin-bottom:6px;">Waiting</div>
        <div style="font-size:30px;font-weight:800;color:var(--helix-text-primary);">0</div>
    </div>
</div>

<div class="helix-card">
    <div class="helix-card-header">
        <h3 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-accent);">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
            Current Visit Queue
        </h3>
        <span class="helix-badge helix-badge-inactive">0 active</span>
    </div>
    <div style="text-align:center;padding:56px 24px;">
        <div style="width:64px;height:64px;border-radius:16px;background:#ECFEFF;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="var(--helix-accent)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
            </svg>
        </div>
        <h3 style="margin:0 0 8px;font-size:16px;font-weight:700;color:var(--helix-text-primary);">No active visits</h3>
        <p style="margin:0 0 20px;font-size:13px;color:var(--helix-text-secondary);max-width:360px;margin-left:auto;margin-right:auto;">
            Active visit records will appear here when patients check in for appointments.
        </p>
        <a href="${pageContext.request.contextPath}/patients" class="helix-btn helix-btn-outline">
            Search Patients
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
