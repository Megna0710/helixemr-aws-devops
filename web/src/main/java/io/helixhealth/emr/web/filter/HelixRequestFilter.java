/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 *
 * HelixEMR – Helix Health Electronic Medical Record System
 * Copyright (C) 2024 Helix Health <https://helixhealth.io>
 */
package io.helixhealth.emr.web.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

/**
 * Core HelixEMR servlet filter.
 *
 * <p>Sets character encoding, injects MDC context for structured logging, and applies standard
 * security response headers on every request.
 */
@WebFilter(urlPatterns = "/helixemr/*")
public class HelixRequestFilter implements Filter {

    private static final Logger log = LoggerFactory.getLogger(HelixRequestFilter.class);

    private static final String ENCODING = "UTF-8";

    @Override
    public void init(FilterConfig filterConfig) {
        log.info("HelixEMR request filter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        request.setCharacterEncoding(ENCODING);
        response.setCharacterEncoding(ENCODING);

        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;

        // Structured logging context
        String requestId = java.util.UUID.randomUUID().toString();
        MDC.put("requestId", requestId);
        MDC.put("remoteAddr", httpReq.getRemoteAddr());
        MDC.put("uri", httpReq.getRequestURI());

        // Security headers
        httpResp.setHeader("X-Content-Type-Options", "nosniff");
        httpResp.setHeader("X-Frame-Options", "SAMEORIGIN");
        httpResp.setHeader("X-XSS-Protection", "1; mode=block");
        httpResp.setHeader("X-Helix-Application", "HelixEMR");
        httpResp.setHeader("X-Request-Id", requestId);

        try {
            chain.doFilter(request, response);
        } finally {
            MDC.clear();
        }
    }

    @Override
    public void destroy() {
        log.info("HelixEMR request filter destroyed");
    }
}
