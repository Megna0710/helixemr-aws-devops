<%--
  HelixEMR Patient List
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn"  uri="jakarta.tags.functions" %>

<c:set var="activePage" value="patients"         scope="request"/>
<c:set var="pageTitle"  value="Patients – HelixEMR" scope="request"/>

<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<!-- Page header -->
<div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;">
    <div>
        <h2 style="margin:0 0 4px;font-size:20px;font-weight:800;color:var(--helix-text-primary);">Patients</h2>
        <p style="margin:0;font-size:13px;color:var(--helix-text-secondary);">
            <fmt:formatNumber value="${total}"/> patient record<c:if test="${total != 1}">s</c:if>
        </p>
    </div>
    <a href="${pageContext.request.contextPath}/patients/add" class="helix-btn helix-btn-primary">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Register Patient
    </a>
</div>

<!-- Search bar -->
<div class="helix-card" style="padding:16px 20px;margin-bottom:20px;">
    <form method="GET" action="${pageContext.request.contextPath}/patients"
          style="display:flex;gap:10px;align-items:center;flex-wrap:wrap;">
        <div style="position:relative;flex:1;min-width:200px;">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                 style="position:absolute;left:11px;top:50%;transform:translateY(-50%);color:var(--helix-text-secondary);">
                <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
            <input type="text"
                   name="q"
                   value="${fn:escapeXml(query)}"
                   class="helix-input"
                   placeholder="Search by name, MRN, or identifier…"
                   style="padding-left:34px;"
                   aria-label="Patient search"
                   autofocus/>
        </div>
        <button type="submit" class="helix-btn helix-btn-primary">Search</button>
        <c:if test="${not empty query}">
            <a href="${pageContext.request.contextPath}/patients" class="helix-btn helix-btn-ghost">Clear</a>
        </c:if>
    </form>
</div>

<!-- Results table -->
<div class="helix-card">
    <div class="helix-card-header">
        <h2 class="helix-card-title">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="color:var(--helix-primary);">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            </svg>
            <c:choose>
                <c:when test="${not empty query}">Results for "<c:out value="${query}"/>"</c:when>
                <c:otherwise>All Patients</c:otherwise>
            </c:choose>
        </h2>
        <span class="helix-badge ${total > 0 ? 'helix-badge-active' : 'helix-badge-inactive'}">
            <fmt:formatNumber value="${total}"/> record<c:if test="${total != 1}">s</c:if>
        </span>
    </div>

    <div class="helix-table-wrapper">
        <table class="helix-table" role="grid">
            <thead>
                <tr>
                    <th>MRN</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty patients}">
                        <tr>
                            <td colspan="6">
                                <div style="text-align:center;padding:48px 24px;">
                                    <div style="width:56px;height:56px;border-radius:14px;background:var(--helix-primary-50);display:flex;align-items:center;justify-content:center;margin:0 auto 14px;">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--helix-primary)" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
                                        </svg>
                                    </div>
                                    <div style="font-size:15px;font-weight:700;color:var(--helix-text-primary);margin-bottom:6px;">No patients found</div>
                                    <div style="font-size:13px;color:var(--helix-text-secondary);margin-bottom:18px;">
                                        <c:choose>
                                            <c:when test="${not empty query}">No results for "<c:out value="${query}"/>". Try a different search.</c:when>
                                            <c:otherwise>No patient records yet. Register the first patient to get started.</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/patients/add" class="helix-btn helix-btn-primary">
                                        Register Patient
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="patient" items="${patients}">
                            <tr>
                                <td>
                                    <span style="font-family:var(--helix-font-mono);font-size:12px;background:var(--helix-surface-3);padding:2px 7px;border-radius:4px;">
                                        <c:out value="${patient.medicalRecordNumber}"/>
                                    </span>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/patients/${patient.patientId}"
                                       style="font-weight:600;color:var(--helix-primary);">
                                        <c:out value="${patient.givenName}"/> <c:out value="${patient.familyName}"/>
                                    </a>
                                </td>
                                <td><c:out value="${patient.gender}"/></td>
                                <td style="font-family:var(--helix-font-mono);font-size:12px;"><c:out value="${patient.birthdate}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${patient.voided}">
                                            <span class="helix-badge helix-badge-inactive">Voided</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="helix-badge helix-badge-active">Active</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/patients/${patient.patientId}"
                                       class="helix-btn helix-btn-outline helix-btn-sm">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
