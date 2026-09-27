# Security Policy – HelixEMR

## Supported Versions

| Version | Security Support |
|---------|-----------------|
| 1.x (current) | ✅ Active |
| 0.x (pre-release) | ❌ Not supported |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Report security issues to: **security@helixhealth.io**

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Any suggested remediation

We will acknowledge receipt within **48 hours** and provide a resolution timeline
within **7 business days** for critical issues.

## Security Practices

HelixEMR follows healthcare software security best practices:

- **OWASP Top 10** mitigations enforced in code review
- **Spring Security 6** with CSRF protection and secure session management
- **Content Security Policy** headers on all responses
- **Audit logging** for all PHI access
- **BCrypt (cost 12)** password hashing
- **Dependency vulnerability scanning** via OWASP Dependency Check in CI
- **CodeQL** static analysis on every push
- Account lockout after configurable failed login attempts
- Session timeout enforcement (default 30 minutes)
- HTTPS enforced in production deployment (Tomcat/reverse proxy)
- No PHI in application logs

## Responsible Disclosure

We follow coordinated disclosure. Once a fix is available, we will:

1. Release a patched version
2. Credit the reporter (unless anonymity is requested)
3. Publish a security advisory on GitHub

Thank you for helping keep HelixEMR and its users secure.
