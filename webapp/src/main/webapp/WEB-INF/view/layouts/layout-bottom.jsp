<%--
  HelixEMR Layout – Bottom Half (closes main, adds footer, closes content-col and app)
  Include this at the bottom of every authenticated view JSP.
--%>
        </main><%-- closes helix-main --%>

        <!-- Footer – sits inside helix-content-col, pushed to bottom by flex -->
        <footer class="helix-footer" role="contentinfo">
            <div style="display:flex;align-items:center;gap:8px;">
                <svg width="14" height="14" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="40" height="40" rx="8" fill="url(#ftgrad)"/>
                    <path d="M10 20h5l3-6 4 12 3-9 3 3h2" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                    <defs>
                        <linearGradient id="ftgrad" x1="0" y1="0" x2="40" y2="40" gradientUnits="userSpaceOnUse">
                            <stop offset="0%" stop-color="#7C3AED"/><stop offset="100%" stop-color="#06B6D4"/>
                        </linearGradient>
                    </defs>
                </svg>
                <span>&copy; 2026 <strong style="color:var(--helix-text-primary);">Skillfyme</strong> &mdash; HelixEMR Enterprise Edition</span>
            </div>
            <div style="display:flex;align-items:center;gap:16px;flex-wrap:wrap;">
                <span style="display:flex;align-items:center;gap:4px;">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="var(--helix-success)" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>
                    v1.0.0-SNAPSHOT
                </span>
                <span style="color:var(--helix-border);">|</span>
                <span>MPL 2.0</span>
                <span style="color:var(--helix-border);">|</span>
                <a href="mailto:support@helixhealth.io"
                   style="color:var(--helix-primary);font-weight:500;display:flex;align-items:center;gap:4px;">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                        <polyline points="22,6 12,13 2,6"/>
                    </svg>
                    support@helixhealth.io
                </a>
            </div>
        </footer>

    </div><%-- closes helix-content-col --%>
</div><%-- closes helix-app --%>

<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js"
        integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8="
        crossorigin="anonymous"></script>
<script>
(function(){
    'use strict';
    document.querySelectorAll('.helix-stat-value').forEach(function(el){
        var target = parseInt(el.textContent.replace(/,/g,''), 10);
        if(isNaN(target) || target === 0) return;
        var steps = 60, count = 0;
        var timer = setInterval(function(){
            count++;
            el.textContent = Math.floor(target * count / steps).toLocaleString();
            if(count >= steps){ el.textContent = target.toLocaleString(); clearInterval(timer); }
        }, 15);
    });
})();
</script>
</body>
</html>
