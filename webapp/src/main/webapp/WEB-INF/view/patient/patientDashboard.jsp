<%--
  HelixEMR Patient Dashboard
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="activePage" value="patients" scope="request"/>

<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<!-- Patient Header Banner -->
<div class="helix-patient-header">
    <div class="helix-patient-avatar">
        <c:out value="${patient.gender == 'M' ? 'M' : 'F'}"/>
    </div>
    <div>
        <div class="helix-patient-name">
            <c:out value="${patient.givenName}"/> <c:out value="${patient.familyName}"/>
        </div>
        <div class="helix-patient-mrn">
            MRN: <c:out value="${patient.medicalRecordNumber}"/>
        </div>
        <div style="margin-top:6px; font-size:13px; opacity:0.85;">
            Gender: <c:out value="${patient.gender}"/> &nbsp;|&nbsp;
            DOB: <c:out value="${patient.birthdate}"/>
        </div>
    </div>
    <div style="margin-left:auto; display:flex; gap:12px; align-items:flex-start;">
        <a href="${pageContext.request.contextPath}/patients/${patient.patientId}/edit"
           class="helix-btn helix-btn-outline helix-btn-sm"
           style="color:white; border-color:rgba(255,255,255,0.6);">
            Edit Patient
        </a>
        <c:if test="${not patient.voided}">
            <span class="helix-badge helix-badge-active">Active</span>
        </c:if>
        <c:if test="${patient.voided}">
            <span class="helix-badge helix-badge-inactive">Voided</span>
        </c:if>
    </div>
</div>

<!-- Patient Info Cards -->
<div style="display:grid; grid-template-columns:1fr 1fr; gap:var(--helix-space-lg);">

    <!-- Demographics -->
    <div class="helix-card">
        <div class="helix-card-header">
            <h2 class="helix-card-title">Demographics</h2>
        </div>
        <table class="helix-table">
            <tbody>
                <tr>
                    <td style="font-weight:600; width:140px;">Patient ID</td>
                    <td><c:out value="${patient.patientId}"/></td>
                </tr>
                <tr>
                    <td style="font-weight:600;">MRN</td>
                    <td style="font-family:var(--helix-font-mono); font-size:12px;">
                        <c:out value="${patient.medicalRecordNumber}"/>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight:600;">UUID</td>
                    <td style="font-family:var(--helix-font-mono); font-size:11px;">
                        <c:out value="${patient.uuid}"/>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight:600;">Gender</td>
                    <td><c:out value="${patient.gender}"/></td>
                </tr>
                <tr>
                    <td style="font-weight:600;">Date of Birth</td>
                    <td><c:out value="${patient.birthdate}"/></td>
                </tr>
                <tr>
                    <td style="font-weight:600;">Allergy Status</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty patient.allergyStatus}">
                                <c:out value="${patient.allergyStatus}"/>
                            </c:when>
                            <c:otherwise>
                                <span style="color:var(--helix-text-secondary);">Not recorded</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Audit Info -->
    <div class="helix-card">
        <div class="helix-card-header">
            <h2 class="helix-card-title">Record Audit</h2>
        </div>
        <table class="helix-table">
            <tbody>
                <tr>
                    <td style="font-weight:600; width:140px;">Created</td>
                    <td><c:out value="${patient.dateCreated}"/></td>
                </tr>
                <tr>
                    <td style="font-weight:600;">Last Modified</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty patient.dateChanged}">
                                <c:out value="${patient.dateChanged}"/>
                            </c:when>
                            <c:otherwise>
                                <span style="color:var(--helix-text-secondary);">—</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight:600;">Status</td>
                    <td>
                        <c:choose>
                            <c:when test="${patient.voided}">
                                <span class="helix-badge helix-badge-inactive">Voided</span>
                                <div style="font-size:12px; color:var(--helix-text-secondary); margin-top:4px;">
                                    Reason: <c:out value="${patient.voidReason}"/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <span class="helix-badge helix-badge-active">Active</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Encounters placeholder -->
<div class="helix-card">
    <div class="helix-card-header">
        <h2 class="helix-card-title">Encounters</h2>
        <a href="${pageContext.request.contextPath}/encounters/add?patientId=${patient.patientId}"
           class="helix-btn helix-btn-primary helix-btn-sm">+ New Encounter</a>
    </div>
    <p style="color:var(--helix-text-secondary); text-align:center; padding:var(--helix-space-xl);">
        No encounters recorded for this patient.
    </p>
</div>

<!-- Back link -->
<a href="${pageContext.request.contextPath}/patients"
   class="helix-btn helix-btn-outline" style="margin-bottom:var(--helix-space-lg);">
    &larr; Back to Patient List
</a>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
