# HelixEMR Architecture

**Helix Health – Enterprise Electronic Medical Record System**

---

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        HelixEMR Platform                        │
│                                                                 │
│  ┌──────────────────┐    ┌──────────────────────────────────┐  │
│  │   Browser / App   │    │        External Systems          │  │
│  │   (JSP + CSS)     │    │  FHIR R4 / HL7 / REST clients   │  │
│  └────────┬─────────┘    └───────────────┬──────────────────┘  │
│           │                              │                      │
│  ┌────────▼──────────────────────────────▼──────────────────┐  │
│  │                  Webapp Layer (WAR)                       │  │
│  │  DispatcherServlet │ Spring Security │ HelixRequestFilter  │  │
│  └────────────────────────────┬─────────────────────────────┘  │
│                               │                                 │
│  ┌────────────────────────────▼─────────────────────────────┐  │
│  │                    Web Layer (JAR)                        │  │
│  │  PatientController │ DashboardController │ REST endpoints │  │
│  └────────────────────────────┬─────────────────────────────┘  │
│                               │                                 │
│  ┌────────────────────────────▼─────────────────────────────┐  │
│  │                    API Layer (JAR)                        │  │
│  │  PatientService │ EncounterService │ OrderService │ ...   │  │
│  │  Context (static facade) → ServiceContext (singleton)    │  │
│  └──────────────┬─────────────────────────┬─────────────────┘  │
│                 │                         │                     │
│  ┌──────────────▼──────────┐  ┌──────────▼───────────────────┐ │
│  │   Persistence Layer      │  │   Infrastructure Services    │ │
│  │   Hibernate 6 ORM        │  │   Ehcache │ Quartz Scheduler  │ │
│  │   PatientDAO, etc.       │  │   Notification │ Reporting    │ │
│  └──────────────┬──────────┘  └──────────────────────────────┘ │
│                 │                                               │
│  ┌──────────────▼──────────────────────────────────────────┐   │
│  │                  Database Layer                          │   │
│  │              MariaDB 10.11 (Liquibase migrations)        │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Module Structure

### `helixemr-api`
Core service and domain layer. Contains:
- **Domain model** (`io.helixhealth.emr.patient`, `.encounter`, `.obs`, etc.)
- **Service interfaces** (`PatientService`, `EncounterService`, etc.)
- **Service implementations** (`PatientServiceImpl`, etc.)
- **DAO interfaces** (`PatientDAO`, etc.)
- **ServiceContext** – singleton registry for all services
- **Context** – static facade for `ServiceContext`
- Spring application context: `applicationContext-service.xml`

### `helixemr-web`
Spring MVC web layer. Contains:
- **MVC Controllers** (`PatientController`, `DashboardController`, etc.)
- **REST API endpoints** (JSON, `/helixemr/*/api/**`)
- **Spring Security config** (`HelixSecurityConfig`)
- **Spring MVC config** (`HelixWebConfig`)
- **Servlet filter** (`HelixRequestFilter`)

### `helixemr-webapp`
Deployable WAR. Contains:
- **JSP views** (`/WEB-INF/view/`)
- **HelixEMR brand CSS** (`helix-theme.css`)
- **Image assets** (SVG logo, favicon)
- **web.xml** (Jakarta EE 6 web descriptor)
- Packaging: all dependencies bundled into `helixemr.war`

### `helixemr-liquibase`
Database schema management:
- Baseline changelog: `db.changelog-1.0.xml`
- Versioned migration changesets

### `helixemr-bom`
Bill of Materials for downstream modules.

### `helixemr-test`
Shared test framework: `HelixBaseTest` base class.

---

## Service Registry Pattern

```
Context (static)
    └─► ServiceContext.getInstance()
            ├─► PatientService  (PatientServiceImpl)
            ├─► EncounterService
            ├─► ObsService
            ├─► OrderService
            ├─► UserService
            ├─► LocationService
            ├─► VisitService
            ├─► ProviderService
            ├─► ConditionService
            ├─► DiagnosisService
            ├─► MedicationDispenseService
            ├─► CohortService
            ├─► FormService
            ├─► ProgramWorkflowService
            ├─► AdministrationService
            ├─► SchedulerService
            ├─► NotificationService
            └─► ReportingService
```

---

## Security Architecture

```
Request → HelixRequestFilter (encoding, MDC, security headers)
        → Spring Security FilterChain
              → CSRF protection
              → Session management (30 min timeout)
              → Authentication (form login → BCrypt)
              → Authorization (URL-based rules)
        → DispatcherServlet
        → Controller
```

**Password security:** BCrypt cost factor 12  
**Session:** Cookie-based, `HttpOnly`, configurable secure flag  
**CSRF:** Spring Security CSRF token (excluded for REST API paths)  
**CSP:** `default-src 'self'` policy enforced via Spring Security headers  
**Audit:** All service calls logged to dedicated audit appender

---

## Database Schema (key tables)

```sql
helix_patient         -- Patient registry (extends person)
helix_encounter       -- Clinical encounters
helix_obs             -- Observations / vitals / lab results
helix_orders          -- Clinical orders
helix_visit           -- Patient visits
helix_person_name     -- Person names (multi-name support)
helix_person_address  -- Addresses
helix_concept         -- Concept dictionary (CIEL-compatible)
helix_location        -- Facilities / locations
helix_provider        -- Healthcare providers
helix_users           -- System users
helix_global_property -- System configuration key-value store
```

All tables use `uuid` columns (UUID v4) as globally unique identifiers alongside integer PKs.

---

## FHIR Integration

HelixEMR exposes a FHIR R4-compatible REST API at `/helixemr/fhir/`:

| Resource | Endpoint |
|----------|---------|
| Patient | `/helixemr/fhir/Patient` |
| Encounter | `/helixemr/fhir/Encounter` |
| Observation | `/helixemr/fhir/Observation` |
| MedicationRequest | `/helixemr/fhir/MedicationRequest` |
| Condition | `/helixemr/fhir/Condition` |

---

*© 2024 Helix Health | engineering@helixhealth.io*
