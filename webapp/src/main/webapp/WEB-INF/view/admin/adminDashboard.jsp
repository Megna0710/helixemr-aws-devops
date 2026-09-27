<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="admin" scope="request"/>
<c:set var="pageTitle"  value="Administration – HelixEMR" scope="request"/>
<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<div style="margin-bottom:24px;">
    <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">System Administration</h2>
    <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">Manage users, settings, modules and system configuration</p>
</div>

<!-- Admin sections grid -->
<div style="display:grid;grid-template-columns:repeat(3,1fr);gap:18px;margin-bottom:24px;">

    <div class="helix-card" style="border-top:3px solid var(--helix-primary);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:var(--helix-primary-50);display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">User Management</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">Manage system users, roles and permissions</div>
        <span class="helix-badge helix-badge-inactive">1 user</span>
    </div>

    <div class="helix-card" style="border-top:3px solid var(--helix-success);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:#ECFDF5;display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-success)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="3"/>
                <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">System Settings</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">Configure locale, security and application settings</div>
        <span class="helix-badge helix-badge-active">Operational</span>
    </div>

    <div class="helix-card" style="border-top:3px solid var(--helix-accent);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:#ECFEFF;display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-accent)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/>
                <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">Integrations</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">FHIR, HL7, lab systems and external APIs</div>
        <span class="helix-badge helix-badge-active">FHIR R4 Active</span>
    </div>

    <div class="helix-card" style="border-top:3px solid var(--helix-warning);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:#FFFBEB;display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-warning)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/>
                <path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">Database</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">View schema, run migrations, backup &amp; restore</div>
        <span class="helix-badge helix-badge-active">Connected</span>
    </div>

    <div class="helix-card" style="border-top:3px solid var(--helix-info);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:#EFF6FF;display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-info)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">Audit &amp; Security</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">Access logs, audit trail and security events</div>
        <span class="helix-badge helix-badge-active">Audit On</span>
    </div>

    <div class="helix-card" style="border-top:3px solid var(--helix-danger);padding:22px 24px;">
        <div style="width:44px;height:44px;border-radius:12px;background:#FEF2F2;display:flex;align-items:center;justify-content:center;margin-bottom:14px;">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="var(--helix-danger)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
        </div>
        <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">System Info</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);margin-bottom:16px;">Version, environment and runtime diagnostics</div>
        <span class="helix-badge helix-badge-inactive">v1.0.0</span>
    </div>
</div>

<!-- System info table -->
<div class="helix-card">
    <div class="helix-card-header">
        <h3 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                <circle cx="12" cy="12" r="3"/>
                <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
            </svg>
            Runtime Information
        </h3>
    </div>
    <ul class="helix-status-list">
        <li class="helix-status-row"><span class="helix-status-key">Java Version</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;"><%= System.getProperty("java.version") %></span></li>
        <li class="helix-status-row"><span class="helix-status-key">Server</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;"><%= application.getServerInfo() %></span></li>
        <li class="helix-status-row"><span class="helix-status-key">OS</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;"><%= System.getProperty("os.name") %> <%= System.getProperty("os.version") %></span></li>
        <li class="helix-status-row"><span class="helix-status-key">Max Memory</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;"><%= (Runtime.getRuntime().maxMemory() / 1024 / 1024) %> MB</span></li>
        <li class="helix-status-row"><span class="helix-status-key">Context Path</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;">${pageContext.request.contextPath}</span></li>
        <li class="helix-status-row"><span class="helix-status-key">HelixEMR Version</span><span class="helix-status-val" style="font-family:var(--helix-font-mono);font-size:12px;">1.0.0-SNAPSHOT</span></li>
    </ul>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
