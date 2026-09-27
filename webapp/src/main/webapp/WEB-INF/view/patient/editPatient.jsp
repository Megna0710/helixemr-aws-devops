<%--
  HelixEMR Register / Edit Patient
  Helix Health – Enterprise Electronic Medical Record System
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<c:set var="activePage" value="patients" scope="request"/>

<jsp:include page="/WEB-INF/view/layouts/layout-top.jsp" flush="true"/>

<div class="helix-card" style="max-width:720px; margin:0 auto;">
    <div class="helix-card-header">
        <h2 class="helix-card-title">
            <c:choose>
                <c:when test="${not empty patient.patientId}">Edit Patient</c:when>
                <c:otherwise>Register New Patient</c:otherwise>
            </c:choose>
        </h2>
    </div>

    <form action="${pageContext.request.contextPath}/patients/save"
          method="POST" novalidate>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="patientId" value="${patient.patientId}"/>

        <!-- Personal Information -->
        <h3 style="font-size:14px; font-weight:700; text-transform:uppercase;
                   letter-spacing:0.6px; color:var(--helix-text-secondary);
                   margin:0 0 var(--helix-space-md);">Personal Information</h3>

        <div style="display:grid; grid-template-columns:1fr 1fr; gap:var(--helix-space-md);">
            <div class="helix-form-group">
                <label class="helix-label" for="givenName">First Name</label>
                <input type="text"
                       id="givenName"
                       name="givenName"
                       class="helix-input"
                       value="<c:out value="${patient.givenName}"/>"
                       placeholder="First name"
                       required maxlength="100"/>
            </div>

            <div class="helix-form-group">
                <label class="helix-label" for="familyName">Last Name</label>
                <input type="text"
                       id="familyName"
                       name="familyName"
                       class="helix-input"
                       value="<c:out value="${patient.familyName}"/>"
                       placeholder="Last name"
                       maxlength="100"/>
            </div>

            <div class="helix-form-group">
                <label class="helix-label" for="medicalRecordNumber">Medical Record Number</label>
                <input type="text"
                       id="medicalRecordNumber"
                       name="medicalRecordNumber"
                       class="helix-input"
                       value="<c:out value="${patient.medicalRecordNumber}"/>"
                       placeholder="e.g. HX-00001"
                       maxlength="50"/>
            </div>

            <div class="helix-form-group">
                <label class="helix-label" for="gender">Gender</label>
                <select id="gender" name="gender" class="helix-select">
                    <option value="">— Select —</option>
                    <option value="M" ${patient.gender == 'M' ? 'selected' : ''}>Male</option>
                    <option value="F" ${patient.gender == 'F' ? 'selected' : ''}>Female</option>
                    <option value="O" ${patient.gender == 'O' ? 'selected' : ''}>Other</option>
                    <option value="U" ${patient.gender == 'U' ? 'selected' : ''}>Unknown</option>
                </select>
            </div>

            <div class="helix-form-group">
                <label class="helix-label" for="birthdate">Date of Birth</label>
                <input type="date"
                       id="birthdate"
                       name="birthdate"
                       class="helix-input"
                       value="<c:out value="${patient.birthdate}"/>"/>
            </div>

            <div class="helix-form-group">
                <label class="helix-label" for="allergyStatus">Allergy Status</label>
                <select id="allergyStatus" name="allergyStatus" class="helix-select">
                    <option value="">— Unknown —</option>
                    <option value="No Known Allergies"
                            ${patient.allergyStatus == 'No Known Allergies' ? 'selected' : ''}>
                        No Known Allergies
                    </option>
                    <option value="Has Allergies"
                            ${patient.allergyStatus == 'Has Allergies' ? 'selected' : ''}>
                        Has Allergies
                    </option>
                </select>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="helix-d-flex helix-gap-md" style="margin-top:var(--helix-space-lg); justify-content:flex-end;">
            <a href="${pageContext.request.contextPath}/patients"
               class="helix-btn helix-btn-outline">Cancel</a>
            <button type="submit" class="helix-btn helix-btn-primary">
                <c:choose>
                    <c:when test="${not empty patient.patientId}">Save Changes</c:when>
                    <c:otherwise>Register Patient</c:otherwise>
                </c:choose>
            </button>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/view/layouts/layout-bottom.jsp" flush="true"/>
