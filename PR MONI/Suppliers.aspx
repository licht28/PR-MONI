<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Supplier &amp; Publisher Directory | PR Monitor</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cousine&family=Inter:wght@400;500;600&family=Outfit:wght@600;700;800&display=swap" rel="stylesheet">
  <style>
    /* ==========================================================
       Design tokens (from Figma variables)
       ========================================================== */
    :root {
      /* colors */
      --color-white: #ffffff;
      --color-navy: #0f1d42;
      --color-red: #c0261b;
      --color-red-soft: rgba(192, 38, 27, 0.18);
      --color-red-strong: rgba(192, 38, 27, 0.4);
      --color-red-text: #fecaca;
      --color-page: #eef2f8;
      --color-surface-muted: #f8fafc;
      --color-border: #e2e8f0;
      --color-border-soft: #f1f5f9;
      --color-slate-500: #62748e;
      --color-slate-600: #45556c;
      --color-slate-700: #314158;
      --color-slate-800: #475569;
      --color-slate-900: #0f172b;
      --color-tag-bg: #f0f4fb;
      --color-tag-text: #1a2f6e;
      --color-placeholder: rgba(26, 32, 44, 0.5);
      --color-white-7: rgba(255, 255, 255, 0.07);
      --color-white-8: rgba(255, 255, 255, 0.08);
      --color-white-15: rgba(255, 255, 255, 0.15);
      --color-white-25: rgba(255, 255, 255, 0.25);
      --color-white-30: rgba(255, 255, 255, 0.3);
      --color-white-40: rgba(255, 255, 255, 0.4);
      --color-white-45: rgba(255, 255, 255, 0.45);
      --color-white-55: rgba(255, 255, 255, 0.55);

      /* typography */
      --font-heading: "Outfit", sans-serif;
      --font-body: "Inter", sans-serif;
      --font-badge: "Cousine", monospace;
      --font-mono: Consolas, "Courier New", monospace;
      --fs-12: 12px;
      --fs-14: 14px;
      --fs-16: 16px;
      --fs-18: 18px;
      --lh-15-6: 15.6px;
      --lh-16: 16px;
      --lh-17-5: 17.5px;
      --lh-20: 20px;
      --lh-22-5: 22.5px;
      --lh-24: 24px;

      /* spacing */
      --space-2: 2px;
      --space-4: 4px;
      --space-8: 8px;
      --space-12: 12px;
      --space-16: 16px;
      --space-20: 20px;
      --space-24: 24px;

      /* radius */
      --radius-6: 6px;
      --radius-8: 8px;
      --radius-12: 12px;
      --radius-pill: 9999px;

      /* layout */
      --sidebar-width: 230px;
      --transition-menu: 0.3s ease;
    }

    /* ==========================================================
       Base
       ========================================================== */
    *, *::before, *::after { box-sizing: border-box; }

    body {
      margin: 0;
      background: var(--color-page);
      font-family: var(--font-body);
      font-size: var(--fs-14);
      color: var(--color-slate-900);
    }

    h1, h2, p, ul { margin: 0; padding: 0; }
    ul { list-style: none; }
    a { text-decoration: none; color: inherit; }
    img { display: block; flex-shrink: 0; }
    button, input { font: inherit; }

    /* ==========================================================
       App shell
       ========================================================== */
    .app {
      display: flex;
      min-height: 100vh;
      align-items: stretch;
    }

    /* ==========================================================
       Sidebar
       ========================================================== */
    .sidebar {
      position: sticky;
      top: 0;
      display: flex;
      flex-direction: column;
      flex: 0 0 var(--sidebar-width);
      width: var(--sidebar-width);
      height: 100vh;
      background: var(--color-navy);
      border-right: 1px solid var(--color-white-7);
    }

    .sidebar__brand {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: var(--space-24) var(--space-20) var(--space-20);
      border-bottom: 1px solid var(--color-white-8);
    }

    .sidebar__logo {
      display: flex;
      align-items: center;
      gap: var(--space-8);
      height: 38px;
      padding-bottom: var(--space-4);
    }

    .sidebar__logo-mark {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 32px;
      height: 32px;
      background: var(--color-red);
      border-radius: var(--radius-6);
      font-family: var(--font-heading);
      font-weight: 800;
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-white);
    }

    .sidebar__title {
      font-family: var(--font-heading);
      font-weight: 600;
      font-size: var(--fs-14);
      line-height: var(--lh-17-5);
      color: var(--color-white);
    }

    .sidebar__subtitle {
      font-weight: 400;
      font-size: var(--fs-12);
      line-height: var(--lh-15-6);
      color: var(--color-white-45);
    }

    .sidebar__toggle {
      display: none;
      position: relative;
      width: 40px;
      height: 40px;
      padding: 0;
      background: transparent;
      border: 1px solid var(--color-white-8);
      border-radius: var(--radius-8);
      cursor: pointer;
    }

    .sidebar__toggle-bar {
      position: absolute;
      left: 11px;
      width: 16px;
      height: 2px;
      background: var(--color-white);
      border-radius: 2px;
      transition: transform var(--transition-menu), opacity var(--transition-menu);
    }

    .sidebar__toggle-bar:nth-child(1) { top: 12px; }
    .sidebar__toggle-bar:nth-child(2) { top: 18px; }
    .sidebar__toggle-bar:nth-child(3) { top: 24px; }

    .sidebar__toggle[aria-expanded="true"] .sidebar__toggle-bar:nth-child(1) { transform: translateY(6px) rotate(45deg); }
    .sidebar__toggle[aria-expanded="true"] .sidebar__toggle-bar:nth-child(2) { opacity: 0; }
    .sidebar__toggle[aria-expanded="true"] .sidebar__toggle-bar:nth-child(3) { transform: translateY(-6px) rotate(-45deg); }

    .sidebar__menu {
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      min-height: 0;
    }

    .sidebar__footer {
      padding: var(--space-16) var(--space-20);
      border-top: 1px solid var(--color-white-7);
    }

    .sidebar__fiscal {
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-white-25);
    }

    .sidebar__unit {
      padding-top: var(--space-2);
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-white-15);
    }

    /* ==========================================================
       Navigation
       ========================================================== */
    .nav {
      flex: 1 1 auto;
      padding: var(--space-16) var(--space-12);
      overflow: hidden;
    }

    .nav__label {
      padding: 0 var(--space-8);
      font-weight: 600;
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      letter-spacing: 0.96px;
      color: var(--color-white-30);
    }

    .nav__list { padding-top: var(--space-8); }
    .nav__item + .nav__item { padding-top: var(--space-2); }
    .nav__item:last-child { padding-bottom: var(--space-2); }

    .nav__link {
      display: flex;
      align-items: center;
      gap: var(--space-12);
      width: 100%;
      padding: 10px var(--space-12);
      border-left: 3px solid transparent;
      border-radius: var(--radius-8);
      font-weight: 500;
      font-size: var(--fs-14);
      line-height: var(--lh-20);
      color: var(--color-white-55);
    }

    .nav__icon {
      width: 18px;
      height: 18px;
      opacity: 0.55;
    }

    .nav__text { flex: 1 1 0; min-width: 0; }

    .nav__badge {
      padding: var(--space-2) var(--space-8);
      background: var(--color-white-8);
      border-radius: var(--radius-pill);
      font-family: var(--font-badge);
      font-weight: 400;
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-white-40);
    }

    .nav__link--active {
      background: var(--color-red-soft);
      border-left-color: var(--color-red);
      color: var(--color-white);
    }

    .nav__link--active .nav__icon { opacity: 1; }

    .nav__link--active .nav__badge {
      background: var(--color-red-strong);
      color: var(--color-red-text);
    }

    /* ==========================================================
       Content column
       ========================================================== */
    .content {
      display: flex;
      flex: 1 1 0;
      flex-direction: column;
      min-width: 0;
    }

    .content__accent {
      height: 3px;
      background: linear-gradient(to right, var(--color-navy), var(--color-red) 50%, var(--color-navy));
    }

    .topbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--space-16);
      min-height: 74px;
      padding: var(--space-16) var(--space-24);
      background: var(--color-white);
      border-bottom: 1px solid var(--color-border);
      box-shadow: 0 1px 1.5px rgba(0, 0, 0, 0.04);
    }

    .topbar__title {
      font-family: var(--font-heading);
      font-weight: 600;
      font-size: var(--fs-18);
      line-height: var(--lh-22-5);
      color: var(--color-navy);
    }

    .topbar__subtitle {
      padding-top: var(--space-2);
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-slate-500);
    }

    .topbar__actions {
      display: flex;
      align-items: center;
      gap: var(--space-8);
    }

    .button {
      display: inline-flex;
      align-items: center;
      gap: var(--space-8);
      padding: var(--space-8) var(--space-12);
      border: 0;
      border-radius: var(--radius-8);
      font-weight: 500;
      font-size: var(--fs-14);
      line-height: var(--lh-20);
      text-align: center;
      cursor: pointer;
    }

    .button__icon { width: 14px; height: 14px; }

    .button--secondary {
      background: var(--color-surface-muted);
      border: 1px solid var(--color-border);
      color: var(--color-slate-800);
    }

    .button--primary {
      background: var(--color-red);
      color: var(--color-white);
    }

    /* ==========================================================
       Main / suppliers
       ========================================================== */
    .main {
      flex: 1 1 auto;
      padding: var(--space-24);
    }

    .search {
      position: relative;
      width: 240px;
      height: 38px;
    }

    .search__icon {
      position: absolute;
      top: 12px;
      left: 10px;
      width: 14px;
      height: 14px;
      pointer-events: none;
    }

    .search__input {
      width: 100%;
      height: 38px;
      padding: var(--space-8) var(--space-12) var(--space-8) 32px;
      background: var(--color-white);
      border: 1px solid var(--color-border);
      border-radius: var(--radius-8);
      font-weight: 400;
      font-size: var(--fs-14);
      color: var(--color-slate-900);
      outline: none;
    }

    .search__input::placeholder { color: var(--color-placeholder); opacity: 1; }
    .search__input:focus-visible { border-color: var(--color-navy); }

    .suppliers__grid {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      grid-auto-rows: minmax(282px, auto);
      gap: var(--space-16);
      padding-top: var(--space-16);
    }

    /* ==========================================================
       Supplier card
       ========================================================== */
    .card {
      display: flex;
      flex-direction: column;
      overflow: hidden;
      background: var(--color-white);
      border: 1px solid var(--color-border);
      border-radius: var(--radius-12);
    }

    .card__header {
      padding: var(--space-20) var(--space-20) var(--space-16);
      border-bottom: 1px solid var(--color-border-soft);
    }

    .card__identity {
      display: flex;
      align-items: flex-start;
      gap: var(--space-12);
    }

    .card__avatar {
      display: flex;
      align-items: center;
      justify-content: center;
      flex: 0 0 44px;
      width: 44px;
      height: 44px;
      background: var(--color-navy);
      border-radius: var(--radius-12);
    }

    .card__avatar-icon { width: 20px; height: 20px; }

    .card__summary { flex: 1 1 0; min-width: 0; }

    .card__name {
      font-family: var(--font-heading);
      font-weight: 600;
      font-size: var(--fs-16);
      line-height: var(--lh-24);
      color: var(--color-slate-900);
      overflow-wrap: anywhere;
    }

    .card__contact {
      padding-top: var(--space-2);
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-slate-500);
    }

    .card__tags {
      display: flex;
      flex-wrap: wrap;
      gap: var(--space-4);
      padding-top: var(--space-8);
    }

    .card__tag {
      padding: var(--space-2) var(--space-8);
      background: var(--color-tag-bg);
      border-radius: var(--radius-pill);
      font-weight: 500;
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-tag-text);
    }

    .card__body { padding: var(--space-16) var(--space-20); }

    .card__row {
      display: flex;
      align-items: flex-start;
      gap: var(--space-8);
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-slate-600);
    }

    .card__row + .card__row { padding-top: var(--space-8); }
    .card__row--address { color: var(--color-slate-500); }

    .card__row-icon {
      width: 12px;
      height: 12px;
      margin-top: var(--space-2);
    }

    .card__row-text { min-width: 0; overflow-wrap: anywhere; }

    .card__footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--space-12);
      padding: var(--space-12) var(--space-20);
      background: var(--color-surface-muted);
      border-top: 1px solid var(--color-border-soft);
    }

    .card__tin {
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-slate-500);
    }

    .card__tin-value {
      font-family: var(--font-mono);
      color: var(--color-slate-700);
    }

    .card__po { text-align: right; }

    .card__po-count {
      font-size: var(--fs-12);
      line-height: var(--lh-16);
      color: var(--color-slate-500);
    }

    .card__po-total {
      font-family: var(--font-heading);
      font-weight: 700;
      font-size: var(--fs-14);
      line-height: var(--lh-20);
      color: var(--color-navy);
    }

    /* ==========================================================
       Tablet (max-width: 1024px)
       ========================================================== */
    @media (max-width: 1024px) {
      .app { display: block; }

      .sidebar {
        z-index: 20;
        width: 100%;
        height: auto;
        border-right: 0;
      }

      .sidebar__brand { padding: var(--space-16) var(--space-20); }
      .sidebar__toggle { display: block; }

      .sidebar__menu {
        max-height: 0;
        overflow: hidden;
        visibility: hidden;
        transition: max-height var(--transition-menu), visibility 0s linear 0.3s;
      }

      .sidebar--open .sidebar__menu {
        max-height: 640px;
        visibility: visible;
        transition: max-height var(--transition-menu), visibility 0s linear 0s;
      }

      .sidebar--open .sidebar__brand { border-bottom-color: var(--color-white-8); }

      .suppliers__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }

    /* ==========================================================
       Mobile (max-width: 768px)
       ========================================================== */
    @media (max-width: 768px) {
      .topbar {
        flex-wrap: wrap;
        padding: var(--space-16);
      }

      .main { padding: var(--space-16); }
      .search { width: 100%; }
      .suppliers__grid { grid-template-columns: minmax(0, 1fr); }
    }

    @media (prefers-reduced-motion: reduce) {
      .sidebar__menu,
      .sidebar__toggle-bar { transition: none; }
    }
  </style>
</head>
<body>
  <!--
    DATA SOURCE
    All supplier cards, sidebar badge counts and the fiscal year are loaded from
    the database through the two JSON endpoints configured in CONFIG (script below).
    If an endpoint returns nothing, or fails, nothing is rendered for that data.

    GET CONFIG.suppliersUrl -> [ { ... } ]  or  { "data": [ { ... } ] }
      name, contact_person, categories[], email, phone, address, tin,
      recent_po_count, recent_po_total

    GET CONFIG.sidebarUrl -> { "counts": { books, journals, databases, supplies, suppliers }, "fiscal_year": "2024" }
  -->
  <div class="app">

    <aside class="sidebar" id="sidebar">
      <div class="sidebar__brand">
        <div class="sidebar__logo">
          <div class="sidebar__logo-mark" aria-hidden="true">PR</div>
          <div class="sidebar__name">
            <p class="sidebar__title">PR Monitor</p>
            <p class="sidebar__subtitle">Library Acquisitions</p>
          </div>
        </div>
        <button class="sidebar__toggle" id="nav-toggle" type="button" aria-expanded="false" aria-controls="sidebar-menu" aria-label="Toggle navigation menu">
          <span class="sidebar__toggle-bar"></span>
          <span class="sidebar__toggle-bar"></span>
          <span class="sidebar__toggle-bar"></span>
        </button>
      </div>

      <div class="sidebar__menu" id="sidebar-menu">
        <nav class="nav" aria-label="Modules">
          <p class="nav__label">MODULES</p>
          <ul class="nav__list">
            <li class="nav__item">
              <a class="nav__link" href="#">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Crect%20x='3'%20y='3'%20width='7'%20height='7'%20rx='1'/%3E%3Crect%20x='14'%20y='3'%20width='7'%20height='7'%20rx='1'/%3E%3Crect%20x='14'%20y='14'%20width='7'%20height='7'%20rx='1'/%3E%3Crect%20x='3'%20y='14'%20width='7'%20height='7'%20rx='1'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Dashboard</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link" href="#" data-count-key="books">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M2%203h6a4%204%200%200%201%204%204v14a3%203%200%200%200-3-3H2z'/%3E%3Cpath%20d='M22%203h-6a4%204%200%200%200-4%204v14a3%203%200%200%201%203-3h7z'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Books PR</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link" href="#" data-count-key="journals">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M14.5%202H6a2%202%200%200%200-2%202v16a2%202%200%200%200%202%202h12a2%202%200%200%200%202-2V7.5L14.5%202z'/%3E%3Cpath%20d='M14%202v6h6'/%3E%3Cpath%20d='M16%2013H8'/%3E%3Cpath%20d='M16%2017H8'/%3E%3Cpath%20d='M10%209H8'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Journals PR</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link" href="#" data-count-key="databases">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cellipse%20cx='12'%20cy='5'%20rx='9'%20ry='3'/%3E%3Cpath%20d='M3%205v14a9%203%200%200%200%2018%200V5'/%3E%3Cpath%20d='M3%2012a9%203%200%200%200%2018%200'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Databases PR</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link" href="#" data-count-key="supplies">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Ccircle%20cx='8'%20cy='21'%20r='1'/%3E%3Ccircle%20cx='19'%20cy='21'%20r='1'/%3E%3Cpath%20d='M2.05%202.05h2l2.66%2012.42a2%202%200%200%200%202%201.58h9.78a2%202%200%200%200%201.95-1.57l1.65-7.43H5.12'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Supplies PR</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link" href="#">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M20%2020a2%202%200%200%200%202-2V8a2%202%200%200%200-2-2h-7.9a2%202%200%200%201-1.69-.9L9.6%203.9A2%202%200%200%200%207.93%203H4a2%202%200%200%200-2%202v13a2%202%200%200%200%202%202z'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Collection Types</span>
              </a>
            </li>
            <li class="nav__item">
              <a class="nav__link nav__link--active" href="#" aria-current="page" data-count-key="suppliers">
                <img class="nav__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='m2%207%204.41-4.41A2%202%200%200%201%207.83%202h8.34a2%202%200%200%201%201.42.59L22%207'/%3E%3Cpath%20d='M4%2012v8a2%202%200%200%200%202%202h12a2%202%200%200%200%202-2v-8'/%3E%3Cpath%20d='M15%2022v-4a2%202%200%200%200-2-2h-2a2%202%200%200%200-2%202v4'/%3E%3Cpath%20d='M2%207h20'/%3E%3Cpath%20d='M22%207v3a2%202%200%200%201-2%202a2.7%202.7%200%200%201-1.59-.63.7.7%200%200%200-.82%200A2.7%202.7%200%200%201%2016%2012a2.7%202.7%200%200%201-1.59-.63.7.7%200%200%200-.82%200A2.7%202.7%200%200%201%2012%2012a2.7%202.7%200%200%201-1.59-.63.7.7%200%200%200-.82%200A2.7%202.7%200%200%201%208%2012a2.7%202.7%200%200%201-1.59-.63.7.7%200%200%200-.82%200A2.7%202.7%200%200%201%204%2012a2%202%200%200%201-2-2V7'/%3E%3C/svg%3E" alt="" width="18" height="18">
                <span class="nav__text">Suppliers</span>
              </a>
            </li>
          </ul>
        </nav>

        <div class="sidebar__footer">
          <p class="sidebar__fiscal" id="fiscal-year" hidden></p>
          <p class="sidebar__unit">Library Resources &amp; Acquisitions Unit</p>
        </div>
      </div>
    </aside>

    <div class="content">
      <div class="content__accent" aria-hidden="true"></div>

      <header class="topbar">
        <div class="topbar__heading">
          <h1 class="topbar__title">Supplier &amp; Publisher Directory</h1>
          <p class="topbar__subtitle">Vendor profiles and contact information</p>
        </div>
        <div class="topbar__actions">
          <button class="button button--secondary" type="button">
            <img class="button__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23475569'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpolygon%20points='22%203%202%203%2010%2012.46%2010%2019%2014%2021%2014%2012.46%2022%203'/%3E%3C/svg%3E" alt="" width="14" height="14">
            Filter
          </button>
          <button class="button button--primary" type="button">
            <img class="button__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M21%2015v4a2%202%200%200%201-2%202H5a2%202%200%200%201-2-2v-4'/%3E%3Cpolyline%20points='7%2010%2012%2015%2017%2010'/%3E%3Cline%20x1='12'%20y1='15'%20x2='12'%20y2='3'/%3E%3C/svg%3E" alt="" width="14" height="14">
            Export
          </button>
        </div>
      </header>

      <main class="main">
        <section class="suppliers" aria-label="Supplier and publisher directory">
          <div class="search" role="search">
            <img class="search__icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%2394a3b8'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Ccircle%20cx='11'%20cy='11'%20r='8'/%3E%3Cpath%20d='m21%2021-4.3-4.3'/%3E%3C/svg%3E" alt="" width="14" height="14">
            <input class="search__input" id="supplier-search" type="search" placeholder="Search supplier, contact..." aria-label="Search supplier, contact">
          </div>
          <ul class="suppliers__grid" id="supplier-grid"></ul>
        </section>
      </main>
    </div>
  </div>

  <template id="supplier-card-template">
    <li class="card">
      <div class="card__header">
        <div class="card__identity">
          <div class="card__avatar">
            <img class="card__avatar-icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%23ffffff'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M6%2022V4a2%202%200%200%201%202-2h8a2%202%200%200%201%202%202v18Z'/%3E%3Cpath%20d='M6%2012H4a2%202%200%200%200-2%202v6a2%202%200%200%200%202%202h2'/%3E%3Cpath%20d='M18%209h2a2%202%200%200%201%202%202v9a2%202%200%200%201-2%202h-2'/%3E%3Cpath%20d='M10%206h4'/%3E%3Cpath%20d='M10%2010h4'/%3E%3Cpath%20d='M10%2014h4'/%3E%3Cpath%20d='M10%2018h4'/%3E%3C/svg%3E" alt="Supplier building icon" width="20" height="20">
          </div>
          <div class="card__summary">
            <h2 class="card__name" data-field="name"></h2>
            <p class="card__contact" data-field="contact_person"></p>
            <ul class="card__tags" data-field="categories"></ul>
          </div>
        </div>
      </div>
      <div class="card__body">
        <p class="card__row" data-row="email">
          <img class="card__row-icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%2394a3b8'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Crect%20x='2'%20y='4'%20width='20'%20height='16'%20rx='2'/%3E%3Cpath%20d='m22%207-8.97%205.7a1.94%201.94%200%200%201-2.06%200L2%207'/%3E%3C/svg%3E" alt="Email" width="12" height="12">
          <span class="card__row-text" data-field="email"></span>
        </p>
        <p class="card__row" data-row="phone">
          <img class="card__row-icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%2394a3b8'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M22%2016.92v3a2%202%200%200%201-2.18%202%2019.79%2019.79%200%200%201-8.63-3.07%2019.5%2019.5%200%200%201-6-6%2019.79%2019.79%200%200%201-3.07-8.67A2%202%200%200%201%204.11%202h3a2%202%200%200%201%202%201.72%2012.84%2012.84%200%200%200%20.7%202.81%202%202%200%200%201-.45%202.11L8.09%209.91a16%2016%200%200%200%206%206l1.27-1.27a2%202%200%200%201%202.11-.45%2012.84%2012.84%200%200%200%202.81.7A2%202%200%200%201%2022%2016.92z'/%3E%3C/svg%3E" alt="Phone" width="12" height="12">
          <span class="card__row-text" data-field="phone"></span>
        </p>
        <p class="card__row card__row--address" data-row="address">
          <img class="card__row-icon" src="data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%2024%2024'%20fill='none'%20stroke='%2394a3b8'%20stroke-width='2'%20stroke-linecap='round'%20stroke-linejoin='round'%3E%3Cpath%20d='M20%2010c0%206-8%2012-8%2012s-8-6-8-12a8%208%200%200%201%2016%200Z'/%3E%3Ccircle%20cx='12'%20cy='10'%20r='3'/%3E%3C/svg%3E" alt="Address" width="12" height="12">
          <span class="card__row-text" data-field="address"></span>
        </p>
      </div>
      <div class="card__footer">
        <p class="card__tin" data-row="tin">TIN: <span class="card__tin-value" data-field="tin"></span></p>
        <div class="card__po" data-row="po">
          <p class="card__po-count" data-field="recent_po_count"></p>
          <p class="card__po-total" data-field="recent_po_total"></p>
        </div>
      </div>
    </li>
  </template>

  <script>
    (function () {
      "use strict";

      /* Point these at the database-backed endpoints. */
      var CONFIG = {
        suppliersUrl: "/api/suppliers",
        sidebarUrl: "/api/sidebar"
      };

      /* ---------- Navigation toggle (tablet / mobile) ---------- */
      var sidebar = document.getElementById("sidebar");
      var toggle = document.getElementById("nav-toggle");

      toggle.addEventListener("click", function () {
        var open = toggle.getAttribute("aria-expanded") !== "true";
        toggle.setAttribute("aria-expanded", String(open));
        sidebar.classList.toggle("sidebar--open", open);
      });

      /* ---------- Helpers ---------- */
      function getJSON(url) {
        return fetch(url, { headers: { Accept: "application/json" } }).then(function (res) {
          if (!res.ok) { throw new Error("Request failed: " + res.status); }
          return res.json();
        });
      }

      function toList(payload) {
        if (Array.isArray(payload)) { return payload; }
        if (payload && Array.isArray(payload.data)) { return payload.data; }
        return [];
      }

      function hasValue(value) {
        return value !== undefined && value !== null && String(value).trim() !== "";
      }

      function formatPeso(value) {
        var number = Number(value);
        if (!isFinite(number)) { return ""; }
        return "₱" + number.toLocaleString("en-US", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
      }

      /* ---------- Sidebar data (counts, fiscal year) ---------- */
      function renderSidebar(payload) {
        if (!payload) { return; }

        var counts = payload.counts || {};
        document.querySelectorAll("[data-count-key]").forEach(function (link) {
          var count = Number(counts[link.getAttribute("data-count-key")]);
          if (!count || count < 0) { return; }
          var badge = document.createElement("span");
          badge.className = "nav__badge";
          badge.textContent = String(count);
          link.appendChild(badge);
        });

        var fiscal = document.getElementById("fiscal-year");
        if (hasValue(payload.fiscal_year)) {
          fiscal.textContent = "Fiscal Year " + payload.fiscal_year;
          fiscal.hidden = false;
        }
      }

      /* ---------- Supplier cards ---------- */
      var grid = document.getElementById("supplier-grid");
      var cardTemplate = document.getElementById("supplier-card-template");
      var search = document.getElementById("supplier-search");
      var suppliers = [];

      function setField(root, name, value) {
        var el = root.querySelector('[data-field="' + name + '"]');
        if (el) { el.textContent = value; }
      }

      function removeRow(root, name) {
        var row = root.querySelector('[data-row="' + name + '"]');
        if (row) { row.remove(); }
      }

      function buildCard(supplier) {
        var card = cardTemplate.content.firstElementChild.cloneNode(true);

        setField(card, "name", supplier.name || "");
        if (hasValue(supplier.contact_person)) {
          setField(card, "contact_person", supplier.contact_person);
        } else {
          card.querySelector('[data-field="contact_person"]').remove();
        }

        var tagList = card.querySelector('[data-field="categories"]');
        var categories = Array.isArray(supplier.categories) ? supplier.categories : [];
        categories.filter(hasValue).forEach(function (category) {
          var tag = document.createElement("li");
          tag.className = "card__tag";
          tag.textContent = category;
          tagList.appendChild(tag);
        });
        if (!tagList.children.length) { tagList.remove(); }

        ["email", "phone", "address"].forEach(function (key) {
          if (hasValue(supplier[key])) {
            setField(card, key, supplier[key]);
          } else {
            removeRow(card, key);
          }
        });

        var tin = card.querySelector('[data-row="tin"]');
        if (hasValue(supplier.tin)) {
          setField(card, "tin", supplier.tin);
        } else {
          tin.remove();
        }

        var po = card.querySelector('[data-row="po"]');
        var hasCount = hasValue(supplier.recent_po_count);
        var hasTotal = hasValue(supplier.recent_po_total);
        if (hasCount) { setField(card, "recent_po_count", supplier.recent_po_count + " recent POs"); }
        else { card.querySelector('[data-field="recent_po_count"]').remove(); }
        if (hasTotal) { setField(card, "recent_po_total", formatPeso(supplier.recent_po_total)); }
        else { card.querySelector('[data-field="recent_po_total"]').remove(); }
        if (!hasCount && !hasTotal) { po.remove(); }

        if (!card.querySelector(".card__body > *")) { card.querySelector(".card__body").remove(); }
        if (!card.querySelector(".card__footer > *")) { card.querySelector(".card__footer").remove(); }

        return card;
      }

      function matches(supplier, query) {
        var haystack = [
          supplier.name, supplier.contact_person, supplier.email,
          supplier.phone, supplier.address, supplier.tin
        ].concat(Array.isArray(supplier.categories) ? supplier.categories : []).join(" ").toLowerCase();
        return haystack.indexOf(query) !== -1;
      }

      function renderSuppliers() {
        var query = search.value.trim().toLowerCase();
        grid.textContent = "";
        suppliers.forEach(function (supplier) {
          if (!query || matches(supplier, query)) {
            grid.appendChild(buildCard(supplier));
          }
        });
      }

      search.addEventListener("input", renderSuppliers);

      /* ---------- Load from database ---------- */
      getJSON(CONFIG.sidebarUrl).then(renderSidebar).catch(function () {});

      getJSON(CONFIG.suppliersUrl).then(function (payload) {
        suppliers = toList(payload);
        renderSuppliers();
      }).catch(function () {});
    })();
  </script>
</body>
</html>