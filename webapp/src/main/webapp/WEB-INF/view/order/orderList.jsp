<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="orders" scope="request"/>
<c:set var="pageTitle"  value="Orders – HelixEMR" scope="request"/>
<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;">
    <div>
        <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">Orders</h2>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">Lab, radiology, medication and procedure orders</p>
    </div>
    <a href="#" class="helix-btn helix-btn-primary">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        New Order
    </a>
</div>

<!-- Order type tabs -->
<div style="display:flex;gap:8px;margin-bottom:20px;flex-wrap:wrap;">
    <button class="helix-btn helix-btn-primary"  style="font-size:12px;padding:6px 14px;">All Orders</button>
    <button class="helix-btn helix-btn-ghost"    style="font-size:12px;padding:6px 14px;">Lab</button>
    <button class="helix-btn helix-btn-ghost"    style="font-size:12px;padding:6px 14px;">Radiology</button>
    <button class="helix-btn helix-btn-ghost"    style="font-size:12px;padding:6px 14px;">Medications</button>
    <button class="helix-btn helix-btn-ghost"    style="font-size:12px;padding:6px 14px;">Procedures</button>
</div>

<div class="helix-card">
    <div class="helix-card-header">
        <h3 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-info);">
                <path d="M3 6h18M3 12h18M3 18h18"/>
            </svg>
            Pending Orders
        </h3>
        <span class="helix-badge helix-badge-pending">0 pending</span>
    </div>
    <div style="text-align:center;padding:56px 24px;">
        <div style="width:64px;height:64px;border-radius:16px;background:#EFF6FF;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="var(--helix-info)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M9 2H5a2 2 0 0 0-2 2v4m6-6h10a2 2 0 0 1 2 2v4M9 2v20m0 0h10a2 2 0 0 0 2-2V8M9 22H5a2 2 0 0 1-2-2V8m0 0h18"/>
            </svg>
        </div>
        <h3 style="margin:0 0 8px;font-size:16px;font-weight:700;color:var(--helix-text-primary);">No orders yet</h3>
        <p style="margin:0 0 20px;font-size:13px;color:var(--helix-text-secondary);max-width:360px;margin-left:auto;margin-right:auto;">
            Orders created during encounters will appear here for tracking and fulfilment.
        </p>
        <a href="${pageContext.request.contextPath}/encounters" class="helix-btn helix-btn-outline">
            View Encounters
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
