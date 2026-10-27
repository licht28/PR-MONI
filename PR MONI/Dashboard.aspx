<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Purchase Request Monitoring System</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cousine:wght@400;700&family=Inter:wght@400;500;600;700&family=Outfit:wght@600;700;800&display=swap" rel="stylesheet">
  <style>
    :root {
      /* Colors */
      --color-navy: #0f1d42;
      --color-red: #c0261b;
      --color-red-tint: rgba(192, 38, 27, 0.18);
      --color-red-icon: #ef5a4f;
      --color-page: #eef2f8;
      --color-white: #ffffff;
      --color-border: #e2e8f0;
      --color-slate-50: #f8fafc;
      --color-slate-100: #f1f5f9;
      --color-slate-300: #cbd5e1;
      --color-slate-400: #94a3b8;
      --color-slate-350: #90a1b9;
      --color-slate-500: #62748e;
      --color-slate-600: #475569;
      --color-slate-700: #314158;
      --color-on-dark-border: rgba(255, 255, 255, 0.07);
      --color-on-dark-divider: rgba(255, 255, 255, 0.08);
      --color-on-dark-text: rgba(255, 255, 255, 0.55);
      --color-on-dark-muted: rgba(255, 255, 255, 0.45);
      --color-on-dark-label: rgba(255, 255, 255, 0.3);
      --color-on-dark-badge: rgba(255, 255, 255, 0.4);
      --color-on-dark-footer-1: rgba(255, 255, 255, 0.25);
      --color-on-dark-footer-2: rgba(255, 255, 255, 0.15);

      --color-amber-bg: #fef3c7;
      --color-amber-text: #92400e;
      --color-amber-dot: #f59e0b;
      --color-rose-bg: #fee2e2;
      --color-rose-text: #991b1b;
      --color-rose-dot: #ef4444;
      --color-blue-bg: #dbeafe;
      --color-blue-text: #1e40af;
      --color-blue-dot: #3b82f6;
      --color-violet-bg: #ede9fe;
      --color-violet-text: #5b21b6;
      --color-violet-dot: #8b5cf6;
      --color-green-bg: #d1fae5;
      --color-green-text: #065f46;
      --color-green-dot: #10b981;

      --color-bar-books: #1e3a8a;
      --color-bar-journals: #7c3aed;
      --color-bar-databases: #0e7490;
      --color-bar-supplies: #b45309;

      /* Typography */
      --font-display: "Outfit", "Inter", system-ui, sans-serif;
      --font-body: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
      --font-mono: "Cousine", ui-monospace, "Courier New", monospace;
      --fs-xs: 12px;
      --fs-sm: 14px;
      --fs-lg: 18px;
      --fs-xl: 30px;
      --lh-xs: 16px;
      --lh-sm: 20px;

      /* Spacing */
      --sp-1: 2px;
      --sp-2: 4px;
      --sp-3: 8px;
      --sp-4: 12px;
      --sp-5: 16px;
      --sp-6: 20px;
      --sp-7: 24px;

      /* Shape */
      --radius-sm: 6px;
      --radius-md: 8px;
      --radius-lg: 12px;
      --radius-pill: 9999px;
      --border-w: 1.241px;
      --sidebar-w: 230px;
      --shadow-header: 0 1px 1.5px rgba(0, 0, 0, 0.04);
    }

    *, *::before, *::after { box-sizing: border-box; }

    html { -webkit-text-size-adjust: 100%; }

    body {
      margin: 0;
      background: var(--color-page);
      font-family: var(--font-body);
      color: var(--color-navy);
    }

    h1, h2, p, ul, ol { margin: 0; padding: 0; }
    ul, ol { list-style: none; }
    a { color: inherit; text-decoration: none; }
    button { font: inherit; cursor: pointer; }
    svg { display: block; flex-shrink: 0; }

    .icon { width: 1em; height: 1em; }

    /* ---------- App shell ---------- */
    .app {
      display: flex;
      align-items: flex-start;
      min-height: 100vh;
      background: var(--color-page);
    }

    /* ---------- Sidebar ---------- */
    .sidebar {
      position: sticky;
      top: 0;
      display: flex;
      flex-direction: column;
      flex: 0 0 var(--sidebar-w);
      width: var(--sidebar-w);
      height: 100vh;
      background: var(--color-navy);
      border-right: var(--border-w) solid var(--color-on-dark-border);
    }

    .sidebar__brand {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: var(--sp-7) var(--sp-6) var(--sp-6);
      border-bottom: var(--border-w) solid var(--color-on-dark-divider);
    }

    .sidebar__toggle {
      display: none;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      padding: 0;
      color: var(--color-white);
      background: transparent;
      border: var(--border-w) solid rgba(255, 255, 255, 0.15);
      border-radius: var(--radius-md);
    }

    .sidebar__toggle:focus-visible {
      outline: 2px solid var(--color-red-icon);
      outline-offset: 2px;
    }

    .sidebar__toggle-line {
      transform-origin: center;
      transition: transform 0.3s ease, opacity 0.3s ease;
    }

    .sidebar--open .sidebar__toggle-line--top { transform: translateY(6px) rotate(45deg); }
    .sidebar--open .sidebar__toggle-line--mid { opacity: 0; }
    .sidebar--open .sidebar__toggle-line--bot { transform: translateY(-6px) rotate(-45deg); }

    .sidebar__menu {
      display: flex;
      flex-direction: column;
      flex: 1;
      min-height: 0;
    }

    .sidebar__menu-inner {
      display: flex;
      flex-direction: column;
      flex: 1;
      min-height: 0;
    }

    .sidebar__footer {
      padding: var(--sp-5) var(--sp-6);
      border-top: var(--border-w) solid var(--color-on-dark-border);
    }

    .sidebar__footer-line {
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-on-dark-footer-1);
    }

    .sidebar__footer-line--secondary {
      margin-top: var(--sp-1);
      color: var(--color-on-dark-footer-2);
    }

    /* Brand */
    .brand {
      display: flex;
      align-items: center;
      gap: var(--sp-3);
      height: 38px;
      padding-bottom: var(--sp-2);
    }

    .brand__mark {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 32px;
      height: 32px;
      font-family: var(--font-display);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 800;
      color: var(--color-white);
      background: var(--color-red);
      border-radius: var(--radius-sm);
    }

    .brand__name {
      font-family: var(--font-display);
      font-size: var(--fs-sm);
      line-height: 17.5px;
      font-weight: 600;
      color: var(--color-white);
    }

    .brand__tagline {
      font-size: var(--fs-xs);
      line-height: 15.6px;
      font-weight: 400;
      color: var(--color-on-dark-muted);
    }

    /* Navigation */
    .nav {
      flex: 1;
      min-height: 0;
      padding: var(--sp-5) var(--sp-4);
      overflow: hidden;
    }

    .nav__label {
      padding: 0 var(--sp-3);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 600;
      letter-spacing: 0.96px;
      color: var(--color-on-dark-label);
    }

    .nav__item { padding-top: var(--sp-1); }
    .nav__item:first-child { padding-top: var(--sp-3); }
    .nav__item:last-child { padding-bottom: var(--sp-1); }

    .nav__link {
      display: flex;
      align-items: center;
      gap: var(--sp-4);
      padding: 10px var(--sp-4);
      font-size: var(--fs-sm);
      line-height: var(--lh-sm);
      font-weight: 500;
      color: var(--color-on-dark-text);
      border-left: 2.482px solid transparent;
      border-radius: var(--radius-md);
    }

    .nav__link:focus-visible {
      outline: 2px solid var(--color-red-icon);
      outline-offset: 2px;
    }

    .nav__link--active {
      color: var(--color-white);
      background: var(--color-red-tint);
      border-left-color: var(--color-red);
    }

    .nav__icon {
      width: 18px;
      height: 18px;
      color: rgba(255, 255, 255, 0.4);
    }

    .nav__link--active .nav__icon { color: var(--color-red-icon); }

    .nav__text { flex: 1; min-width: 0; }

    .nav__badge {
      padding: var(--sp-1) var(--sp-3);
      font-family: var(--font-mono);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      color: var(--color-on-dark-badge);
      background: var(--color-on-dark-divider);
      border-radius: var(--radius-pill);
    }

    /* ---------- Main ---------- */
    .main {
      display: flex;
      flex-direction: column;
      flex: 1;
      min-width: 0;
      min-height: 100vh;
    }

    .main__accent {
      height: 2.987px;
      background: linear-gradient(to right, var(--color-navy), var(--color-red) 50%, var(--color-navy));
    }

    .topbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--sp-4);
      padding: var(--sp-5) var(--sp-7);
      background: var(--color-white);
      border-bottom: var(--border-w) solid var(--color-border);
      box-shadow: var(--shadow-header);
    }

    .topbar__title {
      font-family: var(--font-display);
      font-size: var(--fs-lg);
      line-height: 22.5px;
      font-weight: 600;
      color: var(--color-navy);
    }

    .topbar__subtitle {
      padding-top: var(--sp-1);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-slate-500);
    }

    .topbar__actions {
      display: flex;
      align-items: center;
      gap: var(--sp-3);
    }

    .btn {
      display: inline-flex;
      align-items: center;
      gap: var(--sp-3);
      padding: var(--sp-3) var(--sp-4);
      font-family: var(--font-body);
      font-size: var(--fs-sm);
      line-height: var(--lh-sm);
      font-weight: 500;
      text-align: center;
      border: 0;
      border-radius: var(--radius-md);
    }

    .btn:focus-visible {
      outline: 2px solid var(--color-navy);
      outline-offset: 2px;
    }

    .btn--outline {
      color: var(--color-slate-600);
      background: var(--color-slate-50);
      border: var(--border-w) solid var(--color-border);
    }

    .btn--primary {
      color: var(--color-white);
      background: var(--color-red);
    }

    .btn__icon {
      width: 14px;
      height: 14px;
    }

    .btn--outline .btn__icon { color: var(--color-slate-600); }
    .btn--primary .btn__icon { color: var(--color-white); }

    .content {
      flex: 1;
      min-width: 0;
      padding: var(--sp-7);
    }

    .dashboard { width: 100%; }

    /* ---------- Stat cards ---------- */
    .stats {
      display: grid;
      grid-template-columns: repeat(7, minmax(0, 1fr));
      gap: var(--sp-5);
    }

    .stat-card {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: var(--sp-3);
      padding: var(--sp-5);
      border-radius: var(--radius-lg);
      background: var(--stat-bg);
      color: var(--stat-fg);
    }

    .stat-card--total   { --stat-bg: var(--color-navy);        --stat-fg: var(--color-white); }
    .stat-card--po      { --stat-bg: var(--color-amber-bg);    --stat-fg: var(--color-amber-text); }
    .stat-card--no-po   { --stat-bg: var(--color-rose-bg);     --stat-fg: var(--color-rose-text); }
    .stat-card--si      { --stat-bg: var(--color-blue-bg);     --stat-fg: var(--color-blue-text); }
    .stat-card--partial { --stat-bg: var(--color-violet-bg);   --stat-fg: var(--color-violet-text); }
    .stat-card--done    { --stat-bg: var(--color-green-bg);    --stat-fg: var(--color-green-text); }

    .stat-card__body { min-width: 0; }

    .stat-card__label {
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 600;
      opacity: 0.7;
    }

    .stat-card__value {
      padding-top: var(--sp-2);
      font-family: var(--font-display);
      font-size: var(--fs-xl);
      line-height: 30px;
      font-weight: 700;
    }

    .stat-card__hint {
      margin-top: var(--sp-2);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      opacity: 0.55;
    }

    .stat-card__icon {
      width: 20px;
      height: 20px;
      opacity: 0.4;
    }

    /* ---------- Panels ---------- */
    .panel {
      min-width: 0;
      padding: var(--sp-6);
      background: var(--color-white);
      border: var(--border-w) solid var(--color-border);
      border-radius: var(--radius-lg);
    }

    .panel__title {
      font-family: var(--font-display);
      font-size: var(--fs-sm);
      line-height: var(--lh-sm);
      font-weight: 600;
      color: var(--color-navy);
    }

    .panels {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: var(--sp-5);
      margin-top: var(--sp-7);
    }

    .panel--workflow {
      display: flex;
      flex-direction: column;
    }

    .panel--summary { margin-top: var(--sp-7); }

    /* Category value bars */
    .category-list { padding-top: var(--sp-5); }

    .category { padding-top: var(--sp-4); }
    .category:first-child { padding-top: 0; }

    .category__head {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: var(--sp-3);
      height: var(--lh-xs);
    }

    .category__name {
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 500;
      color: var(--color-slate-700);
    }

    .category__amount {
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-slate-500);
    }

    .category__track {
      height: 6.982px;
      margin-top: var(--sp-2);
      overflow: hidden;
      background: var(--color-slate-100);
      border-radius: var(--radius-pill);
    }

    .category__fill {
      width: 0;
      height: 100%;
      background: var(--bar-color);
      border-radius: var(--radius-pill);
      transition: width 0.4s ease;
    }

    .category--books     { --bar-color: var(--color-bar-books); }
    .category--journals  { --bar-color: var(--color-bar-journals); }
    .category--databases { --bar-color: var(--color-bar-databases); }
    .category--supplies  { --bar-color: var(--color-bar-supplies); }

    .category__count {
      padding-top: var(--sp-1);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-slate-350);
    }

    /* Workflow */
    .workflow { padding-top: var(--sp-5); }

    .workflow__step {
      display: flex;
      align-items: center;
      gap: var(--sp-4);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-slate-400);
    }

    .workflow__step + .workflow__step { padding-top: var(--sp-3); }

    .workflow__badge {
      display: flex;
      align-items: center;
      justify-content: center;
      flex: 0 0 23.99px;
      width: 23.99px;
      height: 23.99px;
      background: var(--color-slate-100);
      border: var(--border-w) solid var(--color-border);
      border-radius: var(--radius-pill);
    }

    .workflow__num {
      font-family: var(--font-mono);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 700;
      color: var(--color-slate-400);
    }

    .workflow__check {
      display: none;
      width: 12px;
      height: 12px;
      color: var(--color-green-dot);
    }

    .workflow__chevron {
      width: 10px;
      height: 10px;
      margin-left: auto;
      color: var(--color-slate-300);
    }

    .workflow__step--done {
      font-weight: 600;
      color: var(--color-green-text);
    }

    .workflow__step--done .workflow__badge {
      background: var(--color-green-bg);
      border-color: var(--color-green-dot);
    }

    .workflow__step--done .workflow__num { display: none; }
    .workflow__step--done .workflow__check { display: block; }

    .workflow__summary {
      margin-top: var(--sp-5);
      padding: var(--sp-3) var(--sp-4);
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 400;
      color: var(--color-amber-text);
      background: var(--color-amber-bg);
      border-radius: var(--radius-md);
    }

    .workflow__summary strong { font-weight: 700; }

    /* Status summary */
    .summary {
      display: grid;
      grid-template-columns: repeat(7, minmax(0, 1fr));
      gap: var(--sp-3);
      padding-top: var(--sp-5);
    }

    .summary__item {
      display: flex;
      align-items: center;
      gap: var(--sp-4);
      padding: 10px var(--sp-4);
      background: var(--stat-bg);
      color: var(--stat-fg);
      border-radius: var(--radius-md);
    }

    .summary__item--po      { --stat-bg: var(--color-amber-bg);  --stat-fg: var(--color-amber-text);  --dot: var(--color-amber-dot); }
    .summary__item--no-po   { --stat-bg: var(--color-rose-bg);   --stat-fg: var(--color-rose-text);   --dot: var(--color-rose-dot); }
    .summary__item--si      { --stat-bg: var(--color-blue-bg);   --stat-fg: var(--color-blue-text);   --dot: var(--color-blue-dot); }
    .summary__item--partial { --stat-bg: var(--color-violet-bg); --stat-fg: var(--color-violet-text); --dot: var(--color-violet-dot); }
    .summary__item--done    { --stat-bg: var(--color-green-bg);  --stat-fg: var(--color-green-text);  --dot: var(--color-green-dot); }

    .summary__dot {
      width: 7.99px;
      height: 7.99px;
      background: var(--dot);
      border-radius: var(--radius-pill);
    }

    .summary__label {
      flex: 1;
      min-width: 0;
      font-size: var(--fs-xs);
      line-height: var(--lh-xs);
      font-weight: 500;
    }

    .summary__value {
      font-family: var(--font-display);
      font-size: var(--fs-sm);
      line-height: var(--lh-sm);
      font-weight: 700;
    }

    /* ---------- Desktop-narrow: 7 columns no longer fit ---------- */
    @media (max-width: 1280px) {
      .stats,
      .summary { grid-template-columns: repeat(3, minmax(0, 1fr)); }
    }

    /* ---------- Tablet ---------- */
    @media (max-width: 1024px) {
      .app { flex-direction: column; align-items: stretch; }

      .sidebar {
        position: relative;
        flex: none;
        width: 100%;
        height: auto;
        border-right: 0;
      }

      .sidebar__toggle { display: inline-flex; }

      .sidebar__menu {
        display: grid;
        grid-template-rows: 0fr;
        flex: none;
        visibility: hidden;
        transition: grid-template-rows 0.3s ease, visibility 0.3s;
      }

      .sidebar--open .sidebar__menu {
        grid-template-rows: 1fr;
        visibility: visible;
      }

      .sidebar__menu-inner {
        flex: none;
        min-height: 0;
        overflow: hidden;
      }

      .nav { flex: none; overflow: visible; }

      .main { min-height: 0; }

      .panels { grid-template-columns: minmax(0, 1fr); }
    }

    /* ---------- Mobile ---------- */
    @media (max-width: 768px) {
      .topbar {
        flex-wrap: wrap;
        padding: var(--sp-5);
      }

      .content { padding: var(--sp-5); }

      .stats,
      .summary { grid-template-columns: repeat(2, minmax(0, 1fr)); }

      .panels,
      .panel--summary { margin-top: var(--sp-5); }

      .panel { padding: var(--sp-5); }

      .category__head { height: auto; flex-wrap: wrap; }
    }

    @media (max-width: 480px) {
      .stats,
      .summary { grid-template-columns: minmax(0, 1fr); }
    }

    @media (prefers-reduced-motion: reduce) {
      .sidebar__menu,
      .sidebar__toggle-line,
      .category__fill { transition: none; }
    }
  </style>
</head>
<body>

  <!-- Icon sprite -->
  <svg width="0" height="0" style="position:absolute" aria-hidden="true" focusable="false">
    <defs>
      <symbol id="i-dashboard" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M6.74916 2.24969H2.99966C2.5855 2.24969 2.24976 2.58544 2.24976 2.99959V8.24889C2.24976 8.66305 2.5855 8.99879 2.99966 8.99879H6.74916C7.16331 8.99879 7.49906 8.66305 7.49906 8.24889V2.99959C7.49906 2.58544 7.16331 2.24969 6.74916 2.24969Z"/>
          <path d="M14.9981 2.24969H11.2486C10.8344 2.24969 10.4987 2.58544 10.4987 2.99959V5.24929C10.4987 5.66345 10.8344 5.99919 11.2486 5.99919H14.9981C15.4122 5.99919 15.748 5.66345 15.748 5.24929V2.99959C15.748 2.58544 15.4122 2.24969 14.9981 2.24969Z"/>
          <path d="M14.9981 8.99881H11.2486C10.8344 8.99881 10.4987 9.33455 10.4987 9.74871V14.998C10.4987 15.4122 10.8344 15.7479 11.2486 15.7479H14.9981C15.4122 15.7479 15.748 15.4122 15.748 14.998V9.74871C15.748 9.33455 15.4122 8.99881 14.9981 8.99881Z"/>
          <path d="M6.74916 11.9984H2.99966C2.5855 11.9984 2.24976 12.3342 2.24976 12.7483V14.998C2.24976 15.4122 2.5855 15.7479 2.99966 15.7479H6.74916C7.16331 15.7479 7.49906 15.4122 7.49906 14.998V12.7483C7.49906 12.3342 7.16331 11.9984 6.74916 11.9984Z"/>
        </g>
      </symbol>
      <symbol id="i-book" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M8.99878 3.7495V15.7479"/>
          <path d="M14.9987 14.2481C15.3963 14.2479 15.7776 14.0898 16.0587 13.8085C16.3398 13.5273 16.4978 13.1459 16.4978 12.7483V3.74949C16.4978 3.35185 16.3398 2.97049 16.0587 2.68924C15.7776 2.408 15.3963 2.24989 14.9987 2.24969L11.9984 2.25119C11.4164 2.25102 10.8424 2.38631 10.3217 2.64637C9.80112 2.90642 9.34817 3.2841 8.99876 3.74949C8.6495 3.28382 8.19662 2.90586 7.67598 2.64554C7.15534 2.38522 6.58125 2.24969 5.99916 2.24969H2.99956C2.60178 2.24969 2.2203 2.40771 1.93904 2.68898C1.65777 2.97024 1.49976 3.35172 1.49976 3.74949V12.7483C1.49976 13.1459 1.65767 13.5273 1.93877 13.8085C2.21988 14.0898 2.60116 14.2479 2.99881 14.2481H5.99916C6.58125 14.2481 7.15534 14.3836 7.67598 14.6439C8.19662 14.9043 8.6495 15.2822 8.99876 15.7479C9.34801 15.2822 9.80089 14.9043 10.3215 14.6439C10.8422 14.3836 11.4163 14.2481 11.9984 14.2481H14.9987Z"/>
        </g>
      </symbol>
      <symbol id="i-newspaper" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M11.2485 13.4982H7.49902"/>
          <path d="M13.4982 10.4986H7.49902"/>
          <path d="M2.99956 16.4978H14.998C15.3957 16.4978 15.7772 16.3398 16.0585 16.0585C16.3397 15.7773 16.4978 15.3958 16.4978 14.998V2.9996C16.4978 2.60183 16.3397 2.22035 16.0585 1.93908C15.7772 1.65782 15.3957 1.4998 14.998 1.4998H5.99916C5.60138 1.4998 5.2199 1.65782 4.93864 1.93908C4.65737 2.22035 4.49936 2.60183 4.49936 2.9996V14.998C4.49936 15.3958 4.34134 15.7773 4.06007 16.0585C3.77881 16.3398 3.39733 16.4978 2.99956 16.4978ZM2.99956 16.4978C2.60178 16.4978 2.2203 16.3398 1.93904 16.0585C1.65777 15.7773 1.49976 15.3958 1.49976 14.998V8.2489C1.49976 7.85113 1.65777 7.46965 1.93904 7.18838C2.2203 6.90712 2.60178 6.7491 2.99956 6.7491H4.49936"/>
          <path d="M12.7483 4.4994H8.24892C7.83477 4.4994 7.49902 4.83515 7.49902 5.2493V6.7491C7.49902 7.16326 7.83477 7.499 8.24892 7.499H12.7483C13.1625 7.499 13.4982 7.16326 13.4982 6.7491V5.2493C13.4982 4.83515 13.1625 4.4994 12.7483 4.4994Z"/>
        </g>
      </symbol>
      <symbol id="i-database" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M8.99886 5.9992C12.7263 5.9992 15.748 4.99198 15.748 3.7495C15.748 2.50703 12.7263 1.4998 8.99886 1.4998C5.27143 1.4998 2.24976 2.50703 2.24976 3.7495C2.24976 4.99198 5.27143 5.9992 8.99886 5.9992Z"/>
          <path d="M2.24976 3.7495V14.2481C2.24976 14.8448 2.96082 15.417 4.22652 15.8389C5.49222 16.2608 7.20888 16.4978 8.99886 16.4978C10.7888 16.4978 12.5055 16.2608 13.7712 15.8389C15.0369 15.417 15.748 14.8448 15.748 14.2481V3.7495"/>
          <path d="M2.24976 8.99879C2.24976 9.59545 2.96082 10.1677 4.22652 10.5896C5.49222 11.0115 7.20888 11.2485 8.99886 11.2485C10.7888 11.2485 12.5055 11.0115 13.7712 10.5896C15.0369 10.1677 15.748 9.59545 15.748 8.99879"/>
        </g>
      </symbol>
      <symbol id="i-cart" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M1.53735 1.53729L2.36149 1.51629C2.53954 1.5118 2.71338 1.57083 2.85188 1.68281C2.99038 1.79479 3.0845 1.95242 3.11739 2.12746L5.13462 12.8863C5.16682 13.0582 5.25812 13.2135 5.39274 13.3253C5.52736 13.437 5.69682 13.4982 5.87178 13.4982H13.4983"/>
          <path d="M3.42175 3.7495H15.7464C15.8579 3.74927 15.9682 3.77395 16.069 3.82174C16.1699 3.86952 16.2588 3.93921 16.3292 4.02572C16.3997 4.11222 16.45 4.21337 16.4764 4.32178C16.5029 4.43019 16.5048 4.54314 16.482 4.65238L15.7126 9.32125C15.6381 9.65981 15.4487 9.96212 15.1765 10.1768C14.9043 10.3914 14.5662 10.5051 14.2196 10.4986H4.68683"/>
          <path d="M13.4982 16.4978C14.3265 16.4978 14.998 15.8263 14.998 14.998C14.998 14.1697 14.3265 13.4982 13.4982 13.4982C12.6699 13.4982 11.9984 14.1697 11.9984 14.998C11.9984 15.8263 12.6699 16.4978 13.4982 16.4978Z"/>
          <path d="M5.99919 16.4978C6.82751 16.4978 7.49899 15.8263 7.49899 14.998C7.49899 14.1697 6.82751 13.4982 5.99919 13.4982C5.17087 13.4982 4.49939 14.1697 4.49939 14.998C4.49939 15.8263 5.17087 16.4978 5.99919 16.4978Z"/>
        </g>
      </symbol>
      <symbol id="i-clipboard" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M11.2484 1.4998H6.74905C6.33489 1.4998 5.99915 1.83554 5.99915 2.2497V3.7495C5.99915 4.16366 6.33489 4.4994 6.74905 4.4994H11.2484C11.6626 4.4994 11.9983 4.16366 11.9983 3.7495V2.2497C11.9983 1.83554 11.6626 1.4998 11.2484 1.4998Z"/>
          <path d="M11.9984 2.9996H13.4982C13.896 2.9996 14.2775 3.15762 14.5588 3.43888C14.84 3.72015 14.998 4.10163 14.998 4.4994V14.998C14.998 15.3958 14.84 15.7773 14.5588 16.0585C14.2775 16.3398 13.896 16.4978 13.4982 16.4978H4.49943C4.10166 16.4978 3.72018 16.3398 3.43891 16.0585C3.15765 15.7773 2.99963 15.3958 2.99963 14.998V4.4994C2.99963 4.10163 3.15765 3.72015 3.43891 3.43888C3.72018 3.15762 4.10166 2.9996 4.49943 2.9996H5.99923"/>
          <path d="M8.99878 8.2489H11.9984"/>
          <path d="M8.99878 11.9984H11.9984"/>
          <path d="M5.99915 8.2489H6.00664"/>
          <path d="M5.99915 11.9984H6.00664"/>
        </g>
      </symbol>
      <symbol id="i-warehouse" viewBox="0 0 18 18">
        <g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round">
          <path d="M7.49902 8.9988H10.4986"/>
          <path d="M7.49902 5.9992H10.4986"/>
          <path d="M10.4986 15.7479V13.4982C10.4986 13.1004 10.3406 12.7189 10.0593 12.4377C9.77807 12.1564 9.3966 11.9984 8.99882 11.9984C8.60105 11.9984 8.21957 12.1564 7.9383 12.4377C7.65704 12.7189 7.49902 13.1004 7.49902 13.4982V15.7479"/>
          <path d="M4.49936 7.499H2.99956C2.60178 7.499 2.2203 7.65701 1.93904 7.93828C1.65777 8.21955 1.49976 8.60103 1.49976 8.9988V14.2481C1.49976 14.6459 1.65777 15.0273 1.93904 15.3086C2.2203 15.5899 2.60178 15.7479 2.99956 15.7479H14.998C15.3957 15.7479 15.7772 15.5899 16.0585 15.3086C16.3397 15.0273 16.4978 14.6459 16.4978 14.2481V6.7491C16.4978 6.35133 16.3397 5.96985 16.0585 5.68858C15.7772 5.40731 15.3957 5.2493 14.998 5.2493H13.4982"/>
          <path d="M4.49939 15.7479V3.7495C4.49939 3.35173 4.6574 2.97025 4.93867 2.68898C5.21994 2.40771 5.60142 2.2497 5.99919 2.2497H11.9984C12.3962 2.2497 12.7776 2.40771 13.0589 2.68898C13.3402 2.97025 13.4982 3.35173 13.4982 3.7495V15.7479"/>
        </g>
      </symbol>
      <symbol id="i-filter" viewBox="0 0 14 14">
        <path fill="none" stroke="currentColor" stroke-width="1.16525" stroke-linecap="round" stroke-linejoin="round" d="M5.82626 11.6525C5.82621 11.7608 5.85633 11.8669 5.91324 11.959C5.97015 12.0511 6.0516 12.1255 6.14845 12.1739L7.3137 12.7566C7.40255 12.801 7.50127 12.8219 7.60049 12.8174C7.69971 12.8129 7.79614 12.7831 7.88061 12.7309C7.96508 12.6786 8.03479 12.6057 8.08312 12.5189C8.13146 12.4321 8.1568 12.3344 8.15676 12.2351V8.15674C8.15689 7.86798 8.26423 7.58955 8.45797 7.37544L12.6663 2.72085C12.7417 2.63728 12.7913 2.53364 12.8091 2.42248C12.8268 2.31131 12.812 2.19738 12.7664 2.09445C12.7208 1.99153 12.6464 1.90402 12.5521 1.84251C12.4578 1.781 12.3477 1.74813 12.2351 1.74786H1.74788C1.63521 1.7479 1.52496 1.78062 1.4305 1.84204C1.33603 1.90346 1.26141 1.99095 1.21566 2.09392C1.16991 2.19689 1.15499 2.31092 1.17273 2.42219C1.19046 2.53346 1.24008 2.6372 1.31557 2.72085L5.52504 7.37544C5.71878 7.58955 5.82613 7.86798 5.82626 8.15674V11.6525Z"/>
      </symbol>
      <symbol id="i-download" viewBox="0 0 14 14">
        <g fill="none" stroke="currentColor" stroke-width="1.16525" stroke-linecap="round" stroke-linejoin="round">
          <path d="M6.99152 8.73936V1.74786"/>
          <path d="M12.2351 8.73938V11.0699C12.2351 11.3789 12.1123 11.6753 11.8938 11.8938C11.6753 12.1124 11.3789 12.2351 11.0699 12.2351H2.91311C2.60407 12.2351 2.30768 12.1124 2.08916 11.8938C1.87063 11.6753 1.74786 11.3789 1.74786 11.0699V8.73938"/>
          <path d="M4.07837 5.82626L6.99149 8.73939L9.90462 5.82626"/>
        </g>
      </symbol>
      <symbol id="i-file-text" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M4.99879 18.3289C4.55686 18.3289 4.13304 18.1534 3.82056 17.8409C3.50807 17.5284 3.33252 17.1046 3.33252 16.6627V3.33253C3.33252 2.89061 3.50807 2.46679 3.82056 2.1543C4.13304 1.84181 4.55686 1.66626 4.99879 1.66626H11.6639C11.9276 1.66583 12.1888 1.71759 12.4324 1.81853C12.6761 1.91948 12.8974 2.06763 13.0835 2.25445L16.0728 5.24374C16.2601 5.42995 16.4087 5.65143 16.5099 5.89538C16.6112 6.13934 16.6631 6.40093 16.6627 6.66506V16.6627C16.6627 17.1046 16.4871 17.5284 16.1746 17.8409C15.8621 18.1534 15.4383 18.3289 14.9964 18.3289H4.99879Z"/>
          <path d="M11.6639 1.66626V5.83193C11.6639 6.05289 11.7517 6.2648 11.9079 6.42104C12.0641 6.57728 12.2761 6.66506 12.497 6.66506H16.6627"/>
          <path d="M8.33131 7.4982H6.66504"/>
          <path d="M13.3301 10.8307H6.66504"/>
          <path d="M13.3301 14.1633H6.66504"/>
        </g>
      </symbol>
      <symbol id="i-clock" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M9.99759 18.3289C14.5989 18.3289 18.3289 14.5989 18.3289 9.99759C18.3289 5.39632 14.5989 1.66626 9.99759 1.66626C5.39632 1.66626 1.66626 5.39632 1.66626 9.99759C1.66626 14.5989 5.39632 18.3289 9.99759 18.3289Z"/>
          <path d="M9.99759 4.99881V9.99761L13.3301 11.6639"/>
        </g>
      </symbol>
      <symbol id="i-alert-circle" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M9.99759 18.3289C14.5989 18.3289 18.3289 14.5989 18.3289 9.99759C18.3289 5.39632 14.5989 1.66626 9.99759 1.66626C5.39632 1.66626 1.66626 5.39632 1.66626 9.99759C1.66626 14.5989 5.39632 18.3289 9.99759 18.3289Z"/>
          <path d="M9.99759 6.66507V9.9976"/>
          <path d="M9.99759 13.3301H10.0059"/>
        </g>
      </symbol>
      <symbol id="i-trending-up" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M13.3301 5.83194H18.3289V10.8307"/>
          <path d="M18.3289 5.83194L11.2473 12.9136L7.08163 8.74791L1.66627 14.1633"/>
        </g>
      </symbol>
      <symbol id="i-truck" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M11.6639 14.9964V4.99879C11.6639 4.55686 11.4883 4.13304 11.1758 3.82056C10.8633 3.50807 10.4395 3.33252 9.99759 3.33252H3.33253C2.89061 3.33252 2.46678 3.50807 2.1543 3.82056C1.84181 4.13304 1.66626 4.55686 1.66626 4.99879V14.1633C1.66626 14.3842 1.75404 14.5961 1.91028 14.7524C2.06652 14.9086 2.27843 14.9964 2.49939 14.9964H4.16566"/>
          <path d="M12.497 14.9964H7.4982"/>
          <path d="M15.8295 14.9964H17.4958C17.7168 14.9964 17.9287 14.9086 18.0849 14.7524C18.2412 14.5961 18.3289 14.3842 18.3289 14.1633V11.1223C18.3286 10.9333 18.264 10.7499 18.1456 10.6025L15.2463 6.97833C15.1684 6.88075 15.0696 6.80194 14.9571 6.74772C14.8446 6.69349 14.7214 6.66525 14.5965 6.66507H11.6639"/>
          <path d="M14.1633 16.6627C15.0835 16.6627 15.8295 15.9167 15.8295 14.9964C15.8295 14.0762 15.0835 13.3301 14.1633 13.3301C13.243 13.3301 12.497 14.0762 12.497 14.9964C12.497 15.9167 13.243 16.6627 14.1633 16.6627Z"/>
          <path d="M5.83193 16.6627C6.75219 16.6627 7.4982 15.9167 7.4982 14.9964C7.4982 14.0762 6.75219 13.3301 5.83193 13.3301C4.91168 13.3301 4.16566 14.0762 4.16566 14.9964C4.16566 15.9167 4.91168 16.6627 5.83193 16.6627Z"/>
        </g>
      </symbol>
      <symbol id="i-circle-check" viewBox="0 0 20 20">
        <g fill="none" stroke="currentColor" stroke-width="1.66627" stroke-linecap="round" stroke-linejoin="round">
          <path d="M9.99759 18.3289C14.5989 18.3289 18.3289 14.5989 18.3289 9.99759C18.3289 5.39632 14.5989 1.66626 9.99759 1.66626C5.39632 1.66626 1.66626 5.39632 1.66626 9.99759C1.66626 14.5989 5.39632 18.3289 9.99759 18.3289Z"/>
          <path d="M13.3301 7.4982L8.7479 12.0804L6.66507 9.9976"/>
        </g>
      </symbol>
      <symbol id="i-step-check" viewBox="0 0 12 12">
        <g fill="none" stroke="currentColor" stroke-width="0.998792" stroke-linecap="round" stroke-linejoin="round">
          <path d="M5.99275 10.9867C8.75084 10.9867 10.9867 8.75084 10.9867 5.99275C10.9867 3.23467 8.75084 0.998795 5.99275 0.998795C3.23467 0.998795 0.998795 3.23467 0.998795 5.99275C0.998795 8.75084 3.23467 10.9867 5.99275 10.9867Z"/>
          <path d="M7.99033 4.49457L5.24365 7.24125L3.99516 5.99276"/>
        </g>
      </symbol>
      <symbol id="i-chevron" viewBox="0 0 10 10">
        <path fill="none" stroke="currentColor" stroke-width="0.832323" stroke-linecap="round" stroke-linejoin="round" d="M3.74548 7.4909L6.24245 4.99393L3.74548 2.49696"/>
      </symbol>
    </defs>
  </svg>

  <div class="app">

    <!-- Sidebar -->
    <aside class="sidebar" id="sidebar">
      <div class="sidebar__brand">
        <div class="brand">
          <div class="brand__mark" aria-hidden="true">PR</div>
          <div class="brand__text">
            <p class="brand__name">PR Monitor</p>
            <p class="brand__tagline">Library Acquisitions</p>
          </div>
        </div>

        <button class="sidebar__toggle" type="button" aria-expanded="false" aria-controls="sidebar-menu" aria-label="Toggle navigation menu">
          <svg width="22" height="22" viewBox="0 0 22 22" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
            <line class="sidebar__toggle-line sidebar__toggle-line--top" x1="3" y1="5" x2="19" y2="5"/>
            <line class="sidebar__toggle-line sidebar__toggle-line--mid" x1="3" y1="11" x2="19" y2="11"/>
            <line class="sidebar__toggle-line sidebar__toggle-line--bot" x1="3" y1="17" x2="19" y2="17"/>
          </svg>
        </button>
      </div>

      <div class="sidebar__menu" id="sidebar-menu">
        <div class="sidebar__menu-inner">
          <nav class="nav" aria-label="Modules">
            <p class="nav__label">MODULES</p>
            <ul class="nav__list">
              <li class="nav__item">
                <a class="nav__link nav__link--active" href="#dashboard" aria-current="page">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-dashboard"/></svg>
                  <span class="nav__text">Dashboard</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#books-pr">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-book"/></svg>
                  <span class="nav__text">Books PR</span>
                  <span class="nav__badge" data-bind="count.books">0</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#journals-pr">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-newspaper"/></svg>
                  <span class="nav__text">Journals PR</span>
                  <span class="nav__badge" data-bind="count.journals">0</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#databases-pr">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-database"/></svg>
                  <span class="nav__text">Databases PR</span>
                  <span class="nav__badge" data-bind="count.databases">0</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#supplies-pr">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-cart"/></svg>
                  <span class="nav__text">Supplies PR</span>
                  <span class="nav__badge" data-bind="count.supplies">0</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#collection-types">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-clipboard"/></svg>
                  <span class="nav__text">Collection Types</span>
                </a>
              </li>
              <li class="nav__item">
                <a class="nav__link" href="#suppliers">
                  <svg class="nav__icon" aria-hidden="true"><use href="#i-warehouse"/></svg>
                  <span class="nav__text">Suppliers</span>
                  <span class="nav__badge" data-bind="count.suppliers">0</span>
                </a>
              </li>
            </ul>
          </nav>

          <footer class="sidebar__footer">
            <p class="sidebar__footer-line">Fiscal Year 2024</p>
            <p class="sidebar__footer-line sidebar__footer-line--secondary">Library Resources &amp; Acquisitions Unit</p>
          </footer>
        </div>
      </div>
    </aside>

    <!-- Main -->
    <div class="main">
      <div class="main__accent" aria-hidden="true"></div>

      <header class="topbar">
        <div class="topbar__heading">
          <h1 class="topbar__title">Dashboard</h1>
          <p class="topbar__subtitle">Real-time acquisition status overview</p>
        </div>
        <div class="topbar__actions">
          <button class="btn btn--outline" type="button">
            <svg class="btn__icon" aria-hidden="true"><use href="#i-filter"/></svg>
            <span>Filter</span>
          </button>
          <button class="btn btn--primary" type="button">
            <svg class="btn__icon" aria-hidden="true"><use href="#i-download"/></svg>
            <span>Export</span>
          </button>
        </div>
      </header>

      <main class="content" id="dashboard">
        <div class="dashboard">

          <!-- Stat cards -->
          <section class="stats" aria-label="Purchase request totals">
            <article class="stat-card stat-card--total">
              <div class="stat-card__body">
                <p class="stat-card__label">Total PRs</p>
                <p class="stat-card__value" data-bind="total">0</p>
                <p class="stat-card__hint">All categories</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-file-text"/></svg>
            </article>

            <article class="stat-card stat-card--po">
              <div class="stat-card__body">
                <p class="stat-card__label">For PO</p>
                <p class="stat-card__value" data-bind="forPO">0</p>
                <p class="stat-card__hint">Awaiting PO issuance</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-clock"/></svg>
            </article>

            <article class="stat-card stat-card--no-po">
              <div class="stat-card__body">
                <p class="stat-card__label">No PO Yet</p>
                <p class="stat-card__value" data-bind="noPO">0</p>
                <p class="stat-card__hint">Needs attention</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-alert-circle"/></svg>
            </article>

            <article class="stat-card stat-card--si">
              <div class="stat-card__body">
                <p class="stat-card__label">For SI</p>
                <p class="stat-card__value" data-bind="forSI">0</p>
                <p class="stat-card__hint">Sales invoice pending</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-trending-up"/></svg>
            </article>

            <article class="stat-card stat-card--partial">
              <div class="stat-card__body">
                <p class="stat-card__label">Partial Delivery</p>
                <p class="stat-card__value" data-bind="partialDelivery">0</p>
                <p class="stat-card__hint">Partially received</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-truck"/></svg>
            </article>

            <article class="stat-card stat-card--done">
              <div class="stat-card__body">
                <p class="stat-card__label">Completed</p>
                <p class="stat-card__value" data-bind="completed">0</p>
                <p class="stat-card__hint"><span data-bind="completedPct">0</span>% of total PRs</p>
              </div>
              <svg class="stat-card__icon" aria-hidden="true"><use href="#i-circle-check"/></svg>
            </article>
          </section>

          <!-- Category value + workflow -->
          <section class="panels" aria-label="Category value and workflow">
            <article class="panel panel--categories">
              <h2 class="panel__title">PR Value by Category</h2>
              <ul class="category-list">
                <li class="category category--books">
                  <div class="category__head">
                    <span class="category__name">Books</span>
                    <span class="category__amount" data-bind="amount.books">₱0.00</span>
                  </div>
                  <div class="category__track"><div class="category__fill" data-bar="books"></div></div>
                  <p class="category__count" data-bind="requests.books">0 requests</p>
                </li>
                <li class="category category--journals">
                  <div class="category__head">
                    <span class="category__name">Journals</span>
                    <span class="category__amount" data-bind="amount.journals">₱0.00</span>
                  </div>
                  <div class="category__track"><div class="category__fill" data-bar="journals"></div></div>
                  <p class="category__count" data-bind="requests.journals">0 requests</p>
                </li>
                <li class="category category--databases">
                  <div class="category__head">
                    <span class="category__name">Databases</span>
                    <span class="category__amount" data-bind="amount.databases">₱0.00</span>
                  </div>
                  <div class="category__track"><div class="category__fill" data-bar="databases"></div></div>
                  <p class="category__count" data-bind="requests.databases">0 requests</p>
                </li>
                <li class="category category--supplies">
                  <div class="category__head">
                    <span class="category__name">Supplies</span>
                    <span class="category__amount" data-bind="amount.supplies">₱0.00</span>
                  </div>
                  <div class="category__track"><div class="category__fill" data-bar="supplies"></div></div>
                  <p class="category__count" data-bind="requests.supplies">0 requests</p>
                </li>
              </ul>
            </article>

            <article class="panel panel--workflow">
              <h2 class="panel__title">Acquisition Workflow</h2>
              <ol class="workflow" id="workflow">
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">1</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">Faculty MIBF Request</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">2</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">MARF Submission</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">3</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">Supplier Tagging</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">4</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">PR Created</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">5</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">PO Generated</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">6</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">Sales Invoice / Delivery</span>
                  <svg class="workflow__chevron" aria-hidden="true"><use href="#i-chevron"/></svg>
                </li>
                <li class="workflow__step">
                  <span class="workflow__badge"><span class="workflow__num">7</span><svg class="workflow__check" aria-hidden="true"><use href="#i-step-check"/></svg></span>
                  <span class="workflow__label">Completed / Archived</span>
                </li>
              </ol>
              <p class="workflow__summary"><strong><span data-bind="workflow.completed">0</span> of 7 stages</strong> completed across active PRs</p>
            </article>
          </section>

          <!-- Status summary -->
          <section class="panel panel--summary" aria-labelledby="status-summary-title">
            <h2 class="panel__title" id="status-summary-title">Status Summary</h2>
            <ul class="summary">
              <li class="summary__item summary__item--po">
                <span class="summary__dot" aria-hidden="true"></span>
                <span class="summary__label">For PO</span>
                <span class="summary__value" data-bind="forPO">0</span>
              </li>
              <li class="summary__item summary__item--no-po">
                <span class="summary__dot" aria-hidden="true"></span>
                <span class="summary__label">No PO Yet</span>
                <span class="summary__value" data-bind="noPO">0</span>
              </li>
              <li class="summary__item summary__item--si">
                <span class="summary__dot" aria-hidden="true"></span>
                <span class="summary__label">For SI</span>
                <span class="summary__value" data-bind="forSI">0</span>
              </li>
              <li class="summary__item summary__item--partial">
                <span class="summary__dot" aria-hidden="true"></span>
                <span class="summary__label">Partial Delivery</span>
                <span class="summary__value" data-bind="partialDelivery">0</span>
              </li>
              <li class="summary__item summary__item--done">
                <span class="summary__dot" aria-hidden="true"></span>
                <span class="summary__label">Completed</span>
                <span class="summary__value" data-bind="completed">0</span>
              </li>
            </ul>
          </section>

        </div>
      </main>
    </div>
  </div>

  <script>
    /*
      Database connection
      -------------------
      All figures start at 0 and are filled from your backend. Point API_ENDPOINT at a
      route that returns JSON in this shape (missing values are treated as 0):

      {
        "total": 0, "forPO": 0, "noPO": 0, "forSI": 0, "partialDelivery": 0, "completed": 0,
        "counts":     { "books": 0, "journals": 0, "databases": 0, "supplies": 0, "suppliers": 0 },
        "categories": {
          "books":     { "amount": 0, "requests": 0 },
          "journals":  { "amount": 0, "requests": 0 },
          "databases": { "amount": 0, "requests": 0 },
          "supplies":  { "amount": 0, "requests": 0 }
        },
        "workflow": { "completedStages": 0 }   // 0 to 7
      }
    */
    (function () {
      "use strict";

      var API_ENDPOINT = "/api/dashboard";
      var CATEGORIES = ["books", "journals", "databases", "supplies"];
      var TOTAL_STAGES = 7;

      /* ----- Navigation toggle ----- */
      var sidebar = document.getElementById("sidebar");
      var toggle = sidebar.querySelector(".sidebar__toggle");

      toggle.addEventListener("click", function () {
        var isOpen = toggle.getAttribute("aria-expanded") === "true";
        toggle.setAttribute("aria-expanded", String(!isOpen));
        sidebar.classList.toggle("sidebar--open", !isOpen);
      });

      /* ----- Data binding ----- */
      var currency = new Intl.NumberFormat("en-PH", { style: "currency", currency: "PHP" });

      function num(value) {
        var n = Number(value);
        return isFinite(n) ? n : 0;
      }

      function setText(key, value) {
        document.querySelectorAll('[data-bind="' + key + '"]').forEach(function (el) {
          el.textContent = value;
        });
      }

      function requestsLabel(n) {
        return n + (n === 1 ? " request" : " requests");
      }

      function render(data) {
        data = data || {};
        var counts = data.counts || {};
        var categories = data.categories || {};
        var total = num(data.total);
        var completed = num(data.completed);

        setText("total", total);
        setText("forPO", num(data.forPO));
        setText("noPO", num(data.noPO));
        setText("forSI", num(data.forSI));
        setText("partialDelivery", num(data.partialDelivery));
        setText("completed", completed);
        setText("completedPct", total > 0 ? Math.round((completed / total) * 100) : 0);

        ["books", "journals", "databases", "supplies", "suppliers"].forEach(function (key) {
          setText("count." + key, num(counts[key]));
        });

        var maxAmount = 0;
        CATEGORIES.forEach(function (key) {
          maxAmount = Math.max(maxAmount, num((categories[key] || {}).amount));
        });

        CATEGORIES.forEach(function (key) {
          var item = categories[key] || {};
          var amount = num(item.amount);
          var bar = document.querySelector('[data-bar="' + key + '"]');

          setText("amount." + key, currency.format(amount));
          setText("requests." + key, requestsLabel(num(item.requests)));

          if (bar) {
            bar.style.width = (maxAmount > 0 ? (amount / maxAmount) * 100 : 0) + "%";
          }
        });

        var stages = Math.min(TOTAL_STAGES, Math.max(0, Math.round(num((data.workflow || {}).completedStages))));
        document.querySelectorAll("#workflow .workflow__step").forEach(function (step, index) {
          step.classList.toggle("workflow__step--done", index < stages);
        });
        setText("workflow.completed", stages);
      }

      function load() {
        fetch(API_ENDPOINT, { headers: { Accept: "application/json" }, credentials: "same-origin" })
          .then(function (response) {
            if (!response.ok) { throw new Error("HTTP " + response.status); }
            return response.json();
          })
          .then(render)
          .catch(function (error) {
            console.error("Dashboard data could not be loaded:", error);
            render({});
          });
      }

      render({});
      load();
    })();
  </script>
</body>
</html>
```