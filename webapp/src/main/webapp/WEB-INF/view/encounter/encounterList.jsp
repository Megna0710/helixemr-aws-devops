<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="encounters" scope="request"/>
<c:set var="pageTitle"  value="Encounters – HelixEMR" scope="request"/>
<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<!-- Page Header -->
<div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;">
    <div>
        <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">Encounters</h2>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">Clinical encounter records for all patients</p>
    </div>
    <a href="${pageContext.request.contextPath}/encounters/new" class="helix-btn helix-btn-primary">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        New Encounter
    </a>
</div>

<!-- Search bar -->
<div class="helix-card" style="padding:16px 20px;margin-bottom:20px;">
    <div style="display:flex;gap:10px;align-items:center;">
        <div style="position:relative;flex:1;">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                 style="position:absolute;left:11px;top:50%;transform:translateY(-50%);color:var(--helix-text-secondary);">
                <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
            <input type="text" class="helix-input" placeholder="Search encounters by patient name, ID or date…"
                   style="padding-left:34px;"/>
        </div>
        <select class="helix-select" style="width:160px;">
            <option>All Types</option>
            <option>Outpatient</option>
            <option>Inpatient</option>
            <option>Emergency</option>
        </select>
        <button class="helix-btn helix-btn-outline">Filter</button>
    </div>
</div>

<!-- Empty state -->
<div class="helix-card">
    <div class="helix-card-header">
        <h3 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14,2 14,8 20,8"/>
            </svg>
            All Encounters
        </h3>
        <span class="helix-badge helix-badge-inactive">0 records</span>
    </div>
    <div style="text-align:center;padding:56px 24px;">
        <div style="width:64px;height:64px;border-radius:16px;background:var(--helix-primary-50);display:flex;align-items:center;justify-content:center;margin:0 auto 16px;">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="var(--helix-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14,2 14,8 20,8"/>
                <line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/>
            </svg>
        </div>
        <h3 style="margin:0 0 8px;font-size:16px;font-weight:700;color:var(--helix-text-primary);">No encounters recorded yet</h3>
        <p style="margin:0 0 20px;font-size:13px;color:var(--helix-text-secondary);max-width:360px;margin-left:auto;margin-right:auto;">
            Clinical encounters will appear here once patients have been registered and seen.
        </p>
        <a href="${pageContext.request.contextPath}/patients" class="helix-btn helix-btn-primary">
            View Patients
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
