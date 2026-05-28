# Testing Checklist — QR Code Generator v1.0.0

## Automated (CI/CD Pipeline)
- [ ] Tailwind CSS compiles without errors
- [ ] HTML minification succeeds
- [ ] Lighthouse Performance >= 90
- [ ] Lighthouse Accessibility >= 95
- [ ] Lighthouse Best Practices >= 90
- [ ] Lighthouse SEO >= 90

## Functional Testing
- [ ] URL type: enters URL → QR renders correctly → scans to correct URL
- [ ] Text type: enters text → QR renders → scans to correct text
- [ ] Wi-Fi type: enters SSID/password/encryption → QR renders → phone connects
- [ ] Email type: enters recipient/subject/body → QR renders → opens email client
- [ ] Data type switch: switching types clears previous input
- [ ] Error handling: exceed capacity → red error message appears
- [ ] Download PNG: file downloads with correct filename
- [ ] Download SVG: file downloads with correct filename
- [ ] Filename sanitization: special characters stripped
- [ ] Logo upload: valid image accepted, preview shown
- [ ] Logo upload: oversized file (>2MB) rejected with error
- [ ] Logo upload: non-image file rejected
- [ ] Logo upload: malicious SVG with script tag rejected
- [ ] Logo removal: logo cleared, QR re-renders without logo
- [ ] All sliders: size, margin, logo-size update QR in real time
- [ ] All color pickers: fg, bg, corner-square, corner-dot update QR
- [ ] Error correction: L/M/Q/H toggle works, affects capacity
- [ ] Export format: PNG/SVG toggle works

## Accessibility Testing
- [ ] Skip-to-content link: visible on Tab, skips to main
- [ ] Tab order: logical flow left→center→right
- [ ] EC/Format radio groups: arrow keys navigate between options
- [ ] Logo drop zone: activatable via Enter/Space key
- [ ] All inputs have associated labels (for/id)
- [ ] All decorative SVGs have aria-hidden="true"
- [ ] Error messages announced by screen reader (aria-live="assertive")
- [ ] QR preview updates announced (aria-live="polite")
- [ ] Color contrast: all text meets WCAG AA (4.5:1)
- [ ] Reduced motion: animations disabled when prefers-reduced-motion

## Cross-Browser Testing
- [ ] Chrome (latest) — Desktop & Mobile
- [ ] Firefox (latest) — Desktop & Mobile
- [ ] Safari (latest) — Desktop (macOS) & Mobile (iOS)
- [ ] Edge (latest) — Desktop

## Responsive Testing
- [ ] Desktop (1440px+): 3-column layout
- [ ] Tablet (768px-1024px): graceful collapse
- [ ] Mobile (375px): single-column, all panels usable
- [ ] Mobile: download button easily tappable

## PWA Testing
- [ ] Service worker registers successfully
- [ ] Offline: page loads from cache after first visit
- [ ] Install prompt: appears on eligible browsers
- [ ] Installed app: opens in standalone mode
- [ ] Cache update: new version invalidates old cache

## Security Testing
- [ ] CSP: no external requests in Network tab
- [ ] CSP: inline script executes (unsafe-inline allowed)
- [ ] XSS: user input never injected via innerHTML
- [ ] File upload: magic bytes validated
- [ ] SVG upload: script tags in SVG rejected
- [ ] Filename: path traversal characters stripped
