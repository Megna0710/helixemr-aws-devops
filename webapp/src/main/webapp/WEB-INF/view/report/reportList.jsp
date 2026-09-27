<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="reports" scope="request"/>
<c:set var="pageTitle"  value="Reports – HelixEMR" scope="request"/>
<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;">
    <div>
        <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">Reports &amp; Analytics</h2>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">Clinical and operational reporting</p>
    </div>
    <button class="helix-btn helix-btn-outline">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/>
        </svg>
        Export
    </button>
</div>

<!-- Report category grid -->
<div style="display:grid;grid-template-columns:repeat(3,1fr);gap:18px;margin-bottom:24px;">

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-primary);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:var(--helix-primary-50);display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Patient Statistics</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-success);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:#ECFDF5;display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-success)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14,2 14,8 20,8"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Encounter Summary</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-accent);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:#ECFEFF;display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-accent)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Visit Analytics</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-warning);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:#FFFBEB;display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-warning)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M3 6h18M3 12h18M3 18h18"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Order Fulfilment</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-info);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:#EFF6FF;display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-info)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Lab Results</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

    <div class="helix-card" style="cursor:pointer;padding:20px 22px;border-top:3px solid var(--helix-danger);"
         onmouseover="this.style.transform='translateY(-2px)';this.style.boxShadow='var(--helix-shadow-md)';"
         onmouseout="this.style.transform='';this.style.boxShadow='';">
        <div style="width:40px;height:40px;border-radius:10px;background:#FEF2F2;display:flex;align-items:center;justify-content:center;margin-bottom:12px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--helix-danger)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
            </svg>
        </div>
        <div style="font-size:14px;font-weight:700;color:var(--helix-text-primary);margin-bottom:4px;">Audit Log</div>
        <div style="font-size:12px;color:var(--helix-text-secondary);">No data yet</div>
    </div>

</div>

<div class="helix-card">
    <div class="helix-card-header">
        <h3 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                <line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/>
            </svg>
            Available Reports
        </h3>
    </div>
    <div style="text-align:center;padding:48px 24px;">
        <div style="width:64px;height:64px;border-radius:16px;background:var(--helix-primary-50);display:flex;align-items:center;justify-content:center;margin:0 auto 16px;">
            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="var(--helix-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                <line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/>
            </svg>
        </div>
        <h3 style="margin:0 0 8px;font-size:16px;font-weight:700;color:var(--helix-text-primary);">Reports will appear here</h3>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);max-width:360px;margin-left:auto;margin-right:auto;">
            Once patient data is recorded, detailed clinical and operational reports will be generated automatically.
        </p>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
