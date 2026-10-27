<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Books Purchase Requests · Purchase Request Monitoring System</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cousine:wght@400;700&family=Inter:wght@400;500;600;700&family=Outfit:wght@600;700;800&display=swap" rel="stylesheet">
  <style>
    :root {
      --color-navy: #0f1d42; --color-red: #c0261b; --color-red-tint: rgba(192, 38, 27, 0.18); --color-red-icon: #ef5a4f;
      --color-page: #eef2f8; --color-white: #ffffff; --color-border: #e2e8f0;
      --color-slate-50: #f8fafc; --color-slate-100: #f1f5f9; --color-slate-300: #cbd5e1; --color-slate-400: #94a3b8;
      --color-slate-350: #90a1b9; --color-slate-500: #62748e; --color-slate-600: #475569; --color-slate-700: #314158;
      --color-on-dark-border: rgba(255, 255, 255, 0.07); --color-on-dark-divider: rgba(255, 255, 255, 0.08);
      --color-on-dark-text: rgba(255, 255, 255, 0.55); --color-on-dark-muted: rgba(255, 255, 255, 0.45);
      --color-on-dark-label: rgba(255, 255, 255, 0.3); --color-on-dark-badge: rgba(255, 255, 255, 0.4);
      --color-on-dark-footer-1: rgba(255, 255, 255, 0.25); --color-on-dark-footer-2: rgba(255, 255, 255, 0.15);
      --color-amber-bg: #fef3c7; --color-amber-text: #92400e; --color-amber-dot: #f59e0b;
      --color-rose-bg: #fee2e2; --color-rose-text: #991b1b; --color-rose-dot: #ef4444;
      --color-blue-bg: #dbeafe; --color-blue-text: #1e40af; --color-blue-dot: #3b82f6;
      --color-violet-bg: #ede9fe; --color-violet-text: #5b21b6; --color-violet-dot: #8b5cf6;
      --color-green-bg: #d1fae5; --color-green-text: #065f46; --color-green-dot: #10b981;
      --color-orange-bg: #ffedd5; --color-orange-text: #9a3412;
      --color-tabs-bg: #e8edf5; --color-zebra: #fafbfd;
      --font-display: "Outfit", "Inter", system-ui, sans-serif;
      --font-body: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
      --font-mono: "Cousine", ui-monospace, "Courier New", monospace;
      --font-code: "Consolas", "Cousine", ui-monospace, monospace;
      --fs-xs: 12px; --fs-sm: 14px; --fs-lg: 18px; --lh-xs: 16px; --lh-sm: 20px;
      --sp-1: 2px; --sp-2: 4px; --sp-3: 8px; --sp-4: 12px; --sp-5: 16px; --sp-6: 20px; --sp-7: 24px;
      --radius-sm: 6px; --radius-md: 8px; --radius-lg: 12px; --radius-pill: 9999px;
      --border-w: 1.241px; --sidebar-w: 230px; --shadow-header: 0 1px 1.5px rgba(0, 0, 0, 0.04);
    }
    *, *::before, *::after { box-sizing: border-box; }
    html { -webkit-text-size-adjust: 100%; }
    body { margin: 0; background: var(--color-page); font-family: var(--font-body); color: var(--color-navy); }
    h1, h2, p, ul, ol { margin: 0; padding: 0; }
    ul, ol { list-style: none; }
    a { color: inherit; text-decoration: none; }
    button, input, select { font: inherit; }
    button { cursor: pointer; }
    svg { display: block; flex-shrink: 0; }

    /* App shell */
    .app { display: flex; align-items: flex-start; min-height: 100vh; background: var(--color-page); }
    .sidebar { position: sticky; top: 0; display: flex; flex-direction: column; flex: 0 0 var(--sidebar-w); width: var(--sidebar-w); height: 100vh; background: var(--color-navy); border-right: var(--border-w) solid var(--color-on-dark-border); }
    .sidebar__brand { display: flex; align-items: center; justify-content: space-between; padding: var(--sp-7) var(--sp-6) var(--sp-6); border-bottom: var(--border-w) solid var(--color-on-dark-divider); }
    .sidebar__toggle { display: none; align-items: center; justify-content: center; width: 40px; height: 40px; padding: 0; color: var(--color-white); background: transparent; border: var(--border-w) solid rgba(255, 255, 255, 0.15); border-radius: var(--radius-md); }
    .sidebar__toggle:focus-visible { outline: 2px solid var(--color-red-icon); outline-offset: 2px; }
    .sidebar__toggle-line { transform-origin: center; transition: transform 0.3s ease, opacity 0.3s ease; }
    .sidebar--open .sidebar__toggle-line--top { transform: translateY(6px) rotate(45deg); }
    .sidebar--open .sidebar__toggle-line--mid { opacity: 0; }
    .sidebar--open .sidebar__toggle-line--bot { transform: translateY(-6px) rotate(-45deg); }
    .sidebar__menu { display: flex; flex-direction: column; flex: 1; min-height: 0; }
    .sidebar__menu-inner { display: flex; flex-direction: column; flex: 1; min-height: 0; }
    .sidebar__footer { padding: var(--sp-5) var(--sp-6); border-top: var(--border-w) solid var(--color-on-dark-border); }
    .sidebar__footer-line { font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 400; color: var(--color-on-dark-footer-1); }
    .sidebar__footer-line--secondary { margin-top: var(--sp-1); color: var(--color-on-dark-footer-2); }
    .brand { display: flex; align-items: center; gap: var(--sp-3); height: 38px; padding-bottom: var(--sp-2); }
    .brand__mark { display: flex; align-items: center; justify-content: center; width: 32px; height: 32px; font-family: var(--font-display); font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 800; color: var(--color-white); background: var(--color-red); border-radius: var(--radius-sm); }
    .brand__name { font-family: var(--font-display); font-size: var(--fs-sm); line-height: 17.5px; font-weight: 600; color: var(--color-white); }
    .brand__tagline { font-size: var(--fs-xs); line-height: 15.6px; font-weight: 400; color: var(--color-on-dark-muted); }
    .nav { flex: 1; min-height: 0; padding: var(--sp-5) var(--sp-4); overflow: hidden; }
    .nav__label { padding: 0 var(--sp-3); font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 600; letter-spacing: 0.96px; color: var(--color-on-dark-label); }
    .nav__item { padding-top: var(--sp-1); }
    .nav__item:first-child { padding-top: var(--sp-3); }
    .nav__item:last-child { padding-bottom: var(--sp-1); }
    .nav__link { display: flex; align-items: center; gap: var(--sp-4); padding: 10px var(--sp-4); font-size: var(--fs-sm); line-height: var(--lh-sm); font-weight: 500; color: var(--color-on-dark-text); border-left: 2.482px solid transparent; border-radius: var(--radius-md); }
    .nav__link:focus-visible { outline: 2px solid var(--color-red-icon); outline-offset: 2px; }
    .nav__link--active { color: var(--color-white); background: var(--color-red-tint); border-left-color: var(--color-red); }
    .nav__icon { width: 18px; height: 18px; color: rgba(255, 255, 255, 0.4); }
    .nav__link--active .nav__icon { color: var(--color-red-icon); }
    .nav__text { flex: 1; min-width: 0; }
    .nav__badge { padding: var(--sp-1) var(--sp-3); font-family: var(--font-mono); font-size: var(--fs-xs); line-height: var(--lh-xs); color: var(--color-on-dark-badge); background: var(--color-on-dark-divider); border-radius: var(--radius-pill); }

    .main { display: flex; flex-direction: column; flex: 1; min-width: 0; min-height: 100vh; }
    .main__accent { height: 2.987px; background: linear-gradient(to right, var(--color-navy), var(--color-red) 50%, var(--color-navy)); }
    .topbar { display: flex; align-items: center; justify-content: space-between; gap: var(--sp-4); padding: var(--sp-5) var(--sp-7); background: var(--color-white); border-bottom: var(--border-w) solid var(--color-border); box-shadow: var(--shadow-header); }
    .topbar__title { font-family: var(--font-display); font-size: var(--fs-lg); line-height: 22.5px; font-weight: 600; color: var(--color-navy); }
    .topbar__subtitle { padding-top: var(--sp-1); font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 400; color: var(--color-slate-500); }
    .topbar__actions { display: flex; align-items: center; gap: var(--sp-3); }
    .btn { display: inline-flex; align-items: center; gap: var(--sp-3); padding: var(--sp-3) var(--sp-4); font-size: var(--fs-sm); line-height: var(--lh-sm); font-weight: 500; text-align: center; border: 0; border-radius: var(--radius-md); }
    .btn:focus-visible { outline: 2px solid var(--color-navy); outline-offset: 2px; }
    .btn--outline { color: var(--color-slate-600); background: var(--color-slate-50); border: var(--border-w) solid var(--color-border); }
    .btn--primary { color: var(--color-white); background: var(--color-red); }
    .btn__icon { width: 14px; height: 14px; }

    /* Toolbar controls */
    .toolbar { display: flex; align-items: center; gap: var(--sp-4); }
    .toolbar__summary { margin-left: auto; font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 400; color: var(--color-slate-500); white-space: nowrap; }
    .toolbar__summary strong { font-weight: 700; color: var(--color-slate-700); }
    .search { position: relative; flex: 0 0 240px; width: 240px; }
    .search__icon { position: absolute; top: 50%; left: 9.99px; width: 14px; height: 14px; color: var(--color-slate-400); transform: translateY(-50%); pointer-events: none; }
    .search__input { width: 100%; height: 38.458px; padding: var(--sp-3) var(--sp-4) var(--sp-3) 32px; font-size: var(--fs-sm); font-weight: 400; color: #1a202c; background: var(--color-white); border: var(--border-w) solid var(--color-border); border-radius: var(--radius-md); }
    .search__input::placeholder { color: rgba(26, 32, 44, 0.5); }
    .search__input:focus-visible, .select__control:focus-visible { outline: 2px solid var(--color-navy); outline-offset: 1px; }
    .select { position: relative; flex: none; }
    .select__control { height: 38.458px; padding: var(--sp-3) 34px var(--sp-3) var(--sp-4); font-size: var(--fs-sm); line-height: var(--lh-sm); font-weight: 400; color: var(--color-slate-400); background: var(--color-white); border: var(--border-w) solid var(--color-border); border-radius: var(--radius-md); appearance: none; -webkit-appearance: none; }
    .select__icon { position: absolute; top: 50%; right: 10px; width: 12px; height: 12px; color: var(--color-slate-400); transform: translateY(-50%); pointer-events: none; }

    /* Badges */
    .badge { display: inline-flex; align-items: center; padding: var(--sp-1) var(--sp-3); font-size: 11.2px; line-height: 14.933px; font-weight: 600; letter-spacing: 0.336px; white-space: nowrap; color: var(--badge-fg); background: var(--badge-bg); border-radius: var(--radius-pill); }
    .badge__dot { width: 5.993px; height: 5.993px; margin-right: 5px; background: var(--badge-dot); border-radius: 2.996px; }
    .badge--po { --badge-bg: var(--color-amber-bg); --badge-fg: var(--color-amber-text); --badge-dot: var(--color-amber-dot); }
    .badge--no-po { --badge-bg: var(--color-rose-bg); --badge-fg: var(--color-rose-text); --badge-dot: var(--color-rose-dot); }
    .badge--si { --badge-bg: var(--color-blue-bg); --badge-fg: var(--color-blue-text); --badge-dot: var(--color-blue-dot); }
    .badge--partial { --badge-bg: var(--color-violet-bg); --badge-fg: var(--color-violet-text); --badge-dot: var(--color-violet-dot); }
    .badge--done { --badge-bg: var(--color-green-bg); --badge-fg: var(--color-green-text); --badge-dot: var(--color-green-dot); }
    .badge--default { --badge-bg: var(--color-slate-100); --badge-fg: #334155; --badge-dot: var(--color-slate-400); }

    /* Books view */
    .view { display: flex; flex-direction: column; gap: var(--sp-4); padding: var(--sp-5) var(--sp-7); }
    .tabs { display: flex; align-items: center; gap: var(--sp-2); padding: var(--sp-2); background: var(--color-tabs-bg); border-radius: var(--radius-lg); }
    .tabs__tab { display: flex; align-items: center; gap: var(--sp-3); padding: var(--sp-3) var(--sp-5); font-size: var(--fs-sm); line-height: var(--lh-sm); font-weight: 500; color: #64748b; background: transparent; border: 0; border-radius: var(--radius-md); white-space: nowrap; }
    .tabs__tab:focus-visible { outline: 2px solid var(--color-navy); outline-offset: 1px; }
    .tabs__tab--active { color: var(--color-navy); background: var(--color-white); box-shadow: 0 1px 1.5px rgba(0, 0, 0, 0.08); }
    .tabs__count { padding: var(--sp-1) 6px; font-family: var(--font-mono); font-size: var(--fs-xs); line-height: var(--lh-xs); color: var(--color-slate-400); border-radius: var(--radius-pill); }
    .tabs__tab--active .tabs__count { color: var(--color-navy); background: var(--color-tabs-bg); }
    .sheet-block { display: flex; flex-direction: column; gap: var(--sp-4); min-width: 0; }
    .strip { display: grid; grid-template-columns: repeat(6, minmax(0, 1fr)); gap: var(--sp-3); }
    .strip__item { display: flex; align-items: center; justify-content: space-between; gap: var(--sp-3); padding: var(--sp-3) var(--sp-4); color: var(--s-fg); background: var(--s-bg); border-radius: var(--radius-md); }
    .strip__item--total { --s-bg: var(--color-navy); --s-fg: var(--color-white); }
    .strip__item--si-done { --s-bg: var(--color-green-bg); --s-fg: var(--color-green-text); }
    .strip__item--si-for { --s-bg: var(--color-blue-bg); --s-fg: var(--color-blue-text); }
    .strip__item--delivered { --s-bg: var(--color-violet-bg); --s-fg: var(--color-violet-text); }
    .strip__item--to-deliver { --s-bg: var(--color-orange-bg); --s-fg: var(--color-orange-text); }
    .strip__item--items { --s-bg: var(--color-slate-100); --s-fg: #334155; }
    .strip__label { font-size: var(--fs-xs); line-height: 15px; font-weight: 500; opacity: 0.72; }
    .strip__value { padding-left: var(--sp-3); font-family: var(--font-display); font-size: var(--fs-lg); line-height: 28px; font-weight: 700; }

    .sheet { max-height: 752.85px; overflow: auto; background: var(--color-white); border: var(--border-w) solid var(--color-border); border-radius: var(--radius-lg); }
    .sheet__table { width: 100%; min-width: 1619.82px; table-layout: fixed; border-collapse: separate; border-spacing: 0; }
    .sheet__th { position: sticky; top: 0; z-index: 1; padding: 10px var(--sp-3); font-size: 10.72px; line-height: 14.293px; font-weight: 600; letter-spacing: 0.3216px; text-align: left; white-space: nowrap; overflow: hidden; color: var(--color-white); background: linear-gradient(to right, var(--color-navy), var(--color-navy)); }
    .sheet__td { padding: var(--sp-3); overflow: hidden; vertical-align: middle; background: var(--color-white); border-bottom: var(--border-w) solid var(--color-slate-100); font-size: var(--fs-xs); line-height: var(--lh-xs); }
    .sheet__row:nth-child(even) .sheet__td { background: var(--color-zebra); }
    .t { display: block; white-space: nowrap; }
    .t--code-link { font-family: var(--font-code); font-weight: 500; color: #1a2f6e; }
    .t--code { font-family: var(--font-code); font-weight: 400; color: #45556c; }
    .t--code-sm { font-family: var(--font-code); font-weight: 500; color: var(--color-slate-700); }
    .t--base { color: var(--color-slate-700); }
    .t--muted { color: var(--color-slate-500); }
    .t--amount { font-weight: 600; color: #1d293d; }
    .t--medium { font-weight: 500; color: var(--color-slate-700); }
    .t--num { font-weight: 600; color: var(--color-slate-700); }
    .t--staff { color: #45556c; }
    .t--wrap { white-space: normal; }
    .t--sub { padding-top: var(--sp-1); color: var(--color-slate-350); }
    .t--badge { padding-top: var(--sp-1); }
    .deliv { display: flex; align-items: center; gap: var(--sp-2); }
    .deliv__done { font-weight: 600; color: var(--color-green-text); }
    .deliv__sep { color: #cad5e2; }
    .deliv__left { color: var(--color-slate-400); }
    .deliv__bar { height: 2.987px; margin-top: var(--sp-2); overflow: hidden; background: var(--color-slate-100); border-radius: var(--radius-pill); }
    .deliv__fill { display: block; height: 100%; background: var(--color-green-dot); border-radius: var(--radius-pill); }
    .pill-select { position: relative; display: inline-block; }
    .pill-select__control { height: 19.995px; padding: 0 24px 0 var(--sp-3); font-size: var(--fs-xs); line-height: var(--lh-xs); font-weight: 600; color: var(--pill-fg); background: var(--pill-bg); border: 0; border-radius: var(--radius-pill); appearance: none; -webkit-appearance: none; }
    .pill-select__icon { position: absolute; top: 50%; right: 6px; width: 10px; height: 10px; color: var(--pill-fg); transform: translateY(-50%); pointer-events: none; }
    .pill-select--mibf { --pill-bg: var(--color-blue-bg); --pill-fg: var(--color-blue-text); }
    .pill-select--donation { --pill-bg: var(--color-green-bg); --pill-fg: var(--color-green-text); }
    .pill-select--book-request { --pill-bg: var(--color-violet-bg); --pill-fg: var(--color-violet-text); }
    .pill-select--marf { --pill-bg: var(--color-amber-bg); --pill-fg: var(--color-amber-text); }
    .pill-select--default { --pill-bg: var(--color-slate-100); --pill-fg: #334155; }

    @media (max-width: 1280px) { .strip { grid-template-columns: repeat(3, minmax(0, 1fr)); } }
    @media (max-width: 1024px) {
      .app { flex-direction: column; align-items: stretch; }
      .sidebar { position: relative; flex: none; width: 100%; height: auto; border-right: 0; }
      .sidebar__toggle { display: inline-flex; }
      .sidebar__menu { display: grid; grid-template-rows: 0fr; flex: none; visibility: hidden; transition: grid-template-rows 0.3s ease, visibility 0.3s; }
      .sidebar--open .sidebar__menu { grid-template-rows: 1fr; visibility: visible; }
      .sidebar__menu-inner { flex: none; min-height: 0; overflow: hidden; }
      .nav { flex: none; overflow: visible; }
      .main { min-height: 0; }
      .toolbar { flex-wrap: wrap; }
    }
    @media (max-width: 768px) {
      .topbar { flex-wrap: wrap; padding: var(--sp-5); }
      .view { padding: var(--sp-5); }
      .tabs { flex-wrap: wrap; }
      .strip { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .search { flex: 1 1 100%; width: 100%; }
      .toolbar__summary { margin-left: 0; white-space: normal; }
    }
    @media (max-width: 480px) { .strip { grid-template-columns: minmax(0, 1fr); } }
    @media (prefers-reduced-motion: reduce) { .sidebar__menu, .sidebar__toggle-line { transition: none; } }
  </style>
</head>
<body>

  <svg width="0" height="0" style="position:absolute" aria-hidden="true" focusable="false">
    <defs>
      <symbol id="i-dashboard" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M6.74916 2.24969H2.99966C2.5855 2.24969 2.24976 2.58544 2.24976 2.99959V8.24889C2.24976 8.66305 2.5855 8.99879 2.99966 8.99879H6.74916C7.16331 8.99879 7.49906 8.66305 7.49906 8.24889V2.99959C7.49906 2.58544 7.16331 2.24969 6.74916 2.24969Z"/><path d="M14.9981 2.24969H11.2486C10.8344 2.24969 10.4987 2.58544 10.4987 2.99959V5.24929C10.4987 5.66345 10.8344 5.99919 11.2486 5.99919H14.9981C15.4122 5.99919 15.748 5.66345 15.748 5.24929V2.99959C15.748 2.58544 15.4122 2.24969 14.9981 2.24969Z"/><path d="M14.9981 8.99881H11.2486C10.8344 8.99881 10.4987 9.33455 10.4987 9.74871V14.998C10.4987 15.4122 10.8344 15.7479 11.2486 15.7479H14.9981C15.4122 15.7479 15.748 15.4122 15.748 14.998V9.74871C15.748 9.33455 15.4122 8.99881 14.9981 8.99881Z"/><path d="M6.74916 11.9984H2.99966C2.5855 11.9984 2.24976 12.3342 2.24976 12.7483V14.998C2.24976 15.4122 2.5855 15.7479 2.99966 15.7479H6.74916C7.16331 15.7479 7.49906 15.4122 7.49906 14.998V12.7483C7.49906 12.3342 7.16331 11.9984 6.74916 11.9984Z"/></g></symbol>
      <symbol id="i-book" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M8.99878 3.7495V15.7479"/><path d="M14.9987 14.2481C15.3963 14.2479 15.7776 14.0898 16.0587 13.8085C16.3398 13.5273 16.4978 13.1459 16.4978 12.7483V3.74949C16.4978 3.35185 16.3398 2.97049 16.0587 2.68924C15.7776 2.408 15.3963 2.24989 14.9987 2.24969L11.9984 2.25119C11.4164 2.25102 10.8424 2.38631 10.3217 2.64637C9.80112 2.90642 9.34817 3.2841 8.99876 3.74949C8.6495 3.28382 8.19662 2.90586 7.67598 2.64554C7.15534 2.38522 6.58125 2.24969 5.99916 2.24969H2.99956C2.60178 2.24969 2.2203 2.40771 1.93904 2.68898C1.65777 2.97024 1.49976 3.35172 1.49976 3.74949V12.7483C1.49976 13.1459 1.65767 13.5273 1.93877 13.8085C2.21988 14.0898 2.60116 14.2479 2.99881 14.2481H5.99916C6.58125 14.2481 7.15534 14.3836 7.67598 14.6439C8.19662 14.9043 8.6495 15.2822 8.99876 15.7479C9.34801 15.2822 9.80089 14.9043 10.3215 14.6439C10.8422 14.3836 11.4163 14.2481 11.9984 14.2481H14.9987Z"/></g></symbol>
      <symbol id="i-newspaper" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M11.2485 13.4982H7.49902"/><path d="M13.4982 10.4986H7.49902"/><path d="M2.99956 16.4978H14.998C15.3957 16.4978 15.7772 16.3398 16.0585 16.0585C16.3397 15.7773 16.4978 15.3958 16.4978 14.998V2.9996C16.4978 2.60183 16.3397 2.22035 16.0585 1.93908C15.7772 1.65782 15.3957 1.4998 14.998 1.4998H5.99916C5.60138 1.4998 5.2199 1.65782 4.93864 1.93908C4.65737 2.22035 4.49936 2.60183 4.49936 2.9996V14.998C4.49936 15.3958 4.34134 15.7773 4.06007 16.0585C3.77881 16.3398 3.39733 16.4978 2.99956 16.4978ZM2.99956 16.4978C2.60178 16.4978 2.2203 16.3398 1.93904 16.0585C1.65777 15.7773 1.49976 15.3958 1.49976 14.998V8.2489C1.49976 7.85113 1.65777 7.46965 1.93904 7.18838C2.2203 6.90712 2.60178 6.7491 2.99956 6.7491H4.49936"/><path d="M12.7483 4.4994H8.24892C7.83477 4.4994 7.49902 4.83515 7.49902 5.2493V6.7491C7.49902 7.16326 7.83477 7.499 8.24892 7.499H12.7483C13.1625 7.499 13.4982 7.16326 13.4982 6.7491V5.2493C13.4982 4.83515 13.1625 4.4994 12.7483 4.4994Z"/></g></symbol>
      <symbol id="i-database" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M8.99886 5.9992C12.7263 5.9992 15.748 4.99198 15.748 3.7495C15.748 2.50703 12.7263 1.4998 8.99886 1.4998C5.27143 1.4998 2.24976 2.50703 2.24976 3.7495C2.24976 4.99198 5.27143 5.9992 8.99886 5.9992Z"/><path d="M2.24976 3.7495V14.2481C2.24976 14.8448 2.96082 15.417 4.22652 15.8389C5.49222 16.2608 7.20888 16.4978 8.99886 16.4978C10.7888 16.4978 12.5055 16.2608 13.7712 15.8389C15.0369 15.417 15.748 14.8448 15.748 14.2481V3.7495"/><path d="M2.24976 8.99879C2.24976 9.59545 2.96082 10.1677 4.22652 10.5896C5.49222 11.0115 7.20888 11.2485 8.99886 11.2485C10.7888 11.2485 12.5055 11.0115 13.7712 10.5896C15.0369 10.1677 15.748 9.59545 15.748 8.99879"/></g></symbol>
      <symbol id="i-cart" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M1.53735 1.53729L2.36149 1.51629C2.53954 1.5118 2.71338 1.57083 2.85188 1.68281C2.99038 1.79479 3.0845 1.95242 3.11739 2.12746L5.13462 12.8863C5.16682 13.0582 5.25812 13.2135 5.39274 13.3253C5.52736 13.437 5.69682 13.4982 5.87178 13.4982H13.4983"/><path d="M3.42175 3.7495H15.7464C15.8579 3.74927 15.9682 3.77395 16.069 3.82174C16.1699 3.86952 16.2588 3.93921 16.3292 4.02572C16.3997 4.11222 16.45 4.21337 16.4764 4.32178C16.5029 4.43019 16.5048 4.54314 16.482 4.65238L15.7126 9.32125C15.6381 9.65981 15.4487 9.96212 15.1765 10.1768C14.9043 10.3914 14.5662 10.5051 14.2196 10.4986H4.68683"/><path d="M13.4982 16.4978C14.3265 16.4978 14.998 15.8263 14.998 14.998C14.998 14.1697 14.3265 13.4982 13.4982 13.4982C12.6699 13.4982 11.9984 14.1697 11.9984 14.998C11.9984 15.8263 12.6699 16.4978 13.4982 16.4978Z"/><path d="M5.99919 16.4978C6.82751 16.4978 7.49899 15.8263 7.49899 14.998C7.49899 14.1697 6.82751 13.4982 5.99919 13.4982C5.17087 13.4982 4.49939 14.1697 4.49939 14.998C4.49939 15.8263 5.17087 16.4978 5.99919 16.4978Z"/></g></symbol>
      <symbol id="i-clipboard" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M11.2484 1.4998H6.74905C6.33489 1.4998 5.99915 1.83554 5.99915 2.2497V3.7495C5.99915 4.16366 6.33489 4.4994 6.74905 4.4994H11.2484C11.6626 4.4994 11.9983 4.16366 11.9983 3.7495V2.2497C11.9983 1.83554 11.6626 1.4998 11.2484 1.4998Z"/><path d="M11.9984 2.9996H13.4982C13.896 2.9996 14.2775 3.15762 14.5588 3.43888C14.84 3.72015 14.998 4.10163 14.998 4.4994V14.998C14.998 15.3958 14.84 15.7773 14.5588 16.0585C14.2775 16.3398 13.896 16.4978 13.4982 16.4978H4.49943C4.10166 16.4978 3.72018 16.3398 3.43891 16.0585C3.15765 15.7773 2.99963 15.3958 2.99963 14.998V4.4994C2.99963 4.10163 3.15765 3.72015 3.43891 3.43888C3.72018 3.15762 4.10166 2.9996 4.49943 2.9996H5.99923"/><path d="M8.99878 8.2489H11.9984"/><path d="M8.99878 11.9984H11.9984"/><path d="M5.99915 8.2489H6.00664"/><path d="M5.99915 11.9984H6.00664"/></g></symbol>
      <symbol id="i-warehouse" viewBox="0 0 18 18"><g fill="none" stroke="currentColor" stroke-width="1.4998" stroke-linecap="round" stroke-linejoin="round"><path d="M7.49902 8.9988H10.4986"/><path d="M7.49902 5.9992H10.4986"/><path d="M10.4986 15.7479V13.4982C10.4986 13.1004 10.3406 12.7189 10.0593 12.4377C9.77807 12.1564 9.3966 11.9984 8.99882 11.9984C8.60105 11.9984 8.21957 12.1564 7.9383 12.4377C7.65704 12.7189 7.49902 13.1004 7.49902 13.4982V15.7479"/><path d="M4.49936 7.499H2.99956C2.60178 7.499 2.2203 7.65701 1.93904 7.93828C1.65777 8.21955 1.49976 8.60103 1.49976 8.9988V14.2481C1.49976 14.6459 1.65777 15.0273 1.93904 15.3086C2.2203 15.5899 2.60178 15.7479 2.99956 15.7479H14.998C15.3957 15.7479 15.7772 15.5899 16.0585 15.3086C16.3397 15.0273 16.4978 14.6459 16.4978 14.2481V6.7491C16.4978 6.35133 16.3397 5.96985 16.0585 5.68858C15.7772 5.40731 15.3957 5.2493 14.998 5.2493H13.4982"/><path d="M4.49939 15.7479V3.7495C4.49939 3.35173 4.6574 2.97025 4.93867 2.68898C5.21994 2.40771 5.60142 2.2497 5.99919 2.2497H11.9984C12.3962 2.2497 12.7776 2.40771 13.0589 2.68898C13.3402 2.97025 13.4982 3.35173 13.4982 3.7495V15.7479"/></g></symbol>
      <symbol id="i-filter" viewBox="0 0 14 14"><path fill="none" stroke="currentColor" stroke-width="1.16525" stroke-linecap="round" stroke-linejoin="round" d="M5.82626 11.6525C5.82621 11.7608 5.85633 11.8669 5.91324 11.959C5.97015 12.0511 6.0516 12.1255 6.14845 12.1739L7.3137 12.7566C7.40255 12.801 7.50127 12.8219 7.60049 12.8174C7.69971 12.8129 7.79614 12.7831 7.88061 12.7309C7.96508 12.6786 8.03479 12.6057 8.08312 12.5189C8.13146 12.4321 8.1568 12.3344 8.15676 12.2351V8.15674C8.15689 7.86798 8.26423 7.58955 8.45797 7.37544L12.6663 2.72085C12.7417 2.63728 12.7913 2.53364 12.8091 2.42248C12.8268 2.31131 12.812 2.19738 12.7664 2.09445C12.7208 1.99153 12.6464 1.90402 12.5521 1.84251C12.4578 1.781 12.3477 1.74813 12.2351 1.74786H1.74788C1.63521 1.7479 1.52496 1.78062 1.4305 1.84204C1.33603 1.90346 1.26141 1.99095 1.21566 2.09392C1.16991 2.19689 1.15499 2.31092 1.17273 2.42219C1.19046 2.53346 1.24008 2.6372 1.31557 2.72085L5.52504 7.37544C5.71878 7.58955 5.82613 7.86798 5.82626 8.15674V11.6525Z"/></symbol>
      <symbol id="i-download" viewBox="0 0 14 14"><g fill="none" stroke="currentColor" stroke-width="1.16525" stroke-linecap="round" stroke-linejoin="round"><path d="M6.99152 8.73936V1.74786"/><path d="M12.2351 8.73938V11.0699C12.2351 11.3789 12.1123 11.6753 11.8938 11.8938C11.6753 12.1124 11.3789 12.2351 11.0699 12.2351H2.91311C2.60407 12.2351 2.30768 12.1124 2.08916 11.8938C1.87063 11.6753 1.74786 11.3789 1.74786 11.0699V8.73938"/><path d="M4.07837 5.82626L6.99149 8.73939L9.90462 5.82626"/></g></symbol>
      <symbol id="i-search" viewBox="0 0 14 14"><g fill="none" stroke="currentColor" stroke-width="1.16525" stroke-linecap="round" stroke-linejoin="round"><path d="M12.2351 12.2351L9.70654 9.70653"/><path d="M6.40892 11.0699C8.98312 11.0699 11.0699 8.98308 11.0699 6.40888C11.0699 3.83468 8.98312 1.74788 6.40892 1.74788C3.83473 1.74788 1.74792 3.83468 1.74792 6.40888C1.74792 8.98308 3.83473 11.0699 6.40892 11.0699Z"/></g></symbol>
      <symbol id="i-chevron-12" viewBox="0 0 12 12"><path fill="none" stroke="currentColor" stroke-width="0.998792" stroke-linecap="round" stroke-linejoin="round" d="M2.99634 4.49457L5.99271 7.49094L8.98909 4.49457"/></symbol>
      <symbol id="i-chevron-10" viewBox="0 0 10 10"><path fill="none" stroke="currentColor" stroke-width="0.832323" stroke-linecap="round" stroke-linejoin="round" d="M2.49707 3.74545L4.99404 6.24242L7.49101 3.74545"/></symbol>
    </defs>
  </svg>

  <div class="app">

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
              <li class="nav__item"><a class="nav__link" href="dashboard.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-dashboard"/></svg><span class="nav__text">Dashboard</span></a></li>
              <li class="nav__item"><a class="nav__link nav__link--active" href="books-pr.html" aria-current="page"><svg class="nav__icon" aria-hidden="true"><use href="#i-book"/></svg><span class="nav__text">Books PR</span><span class="nav__badge" data-bind="count.books">0</span></a></li>
              <li class="nav__item"><a class="nav__link" href="journals-pr.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-newspaper"/></svg><span class="nav__text">Journals PR</span><span class="nav__badge" data-bind="count.journals">0</span></a></li>
              <li class="nav__item"><a class="nav__link" href="databases-pr.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-database"/></svg><span class="nav__text">Databases PR</span><span class="nav__badge" data-bind="count.databases">0</span></a></li>
              <li class="nav__item"><a class="nav__link" href="supplies-pr.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-cart"/></svg><span class="nav__text">Supplies PR</span><span class="nav__badge" data-bind="count.supplies">0</span></a></li>
              <li class="nav__item"><a class="nav__link" href="collection-types.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-clipboard"/></svg><span class="nav__text">Collection Types</span></a></li>
              <li class="nav__item"><a class="nav__link" href="suppliers.html"><svg class="nav__icon" aria-hidden="true"><use href="#i-warehouse"/></svg><span class="nav__text">Suppliers</span><span class="nav__badge" data-bind="count.suppliers">0</span></a></li>
            </ul>
          </nav>
          <footer class="sidebar__footer">
            <p class="sidebar__footer-line">Fiscal Year 2024</p>
            <p class="sidebar__footer-line sidebar__footer-line--secondary">Library Resources &amp; Acquisitions Unit</p>
          </footer>
        </div>
      </div>
    </aside>

    <div class="main">
      <div class="main__accent" aria-hidden="true"></div>

      <header class="topbar">
        <div class="topbar__heading">
          <h1 class="topbar__title">Books Purchase Requests</h1>
          <p class="topbar__subtitle">Track PR lifecycle for selected book titles</p>
        </div>
        <div class="topbar__actions">
          <button class="btn btn--outline" type="button"><svg class="btn__icon" aria-hidden="true"><use href="#i-filter"/></svg><span>Filter</span></button>
          <button class="btn btn--primary" type="button"><svg class="btn__icon" aria-hidden="true"><use href="#i-download"/></svg><span>Export</span></button>
        </div>
      </header>

      <main class="view">

        <div class="tabs" role="group" aria-label="Book selection lists">
          <button class="tabs__tab tabs__tab--active" type="button" data-tab="sas" aria-pressed="true">
            <span>2026 Selected Books (SAs)</span><span class="tabs__count" data-bind="tab.sas">0</span>
          </button>
          <button class="tabs__tab" type="button" data-tab="selected" aria-pressed="false">
            <span>2026 Selected Books</span><span class="tabs__count" data-bind="tab.selected">0</span>
          </button>
        </div>

        <div class="sheet-block">
          <section class="strip" aria-label="Book purchase request totals">
            <div class="strip__item strip__item--total"><span class="strip__label">Total PRs</span><span class="strip__value" data-bind="summary.total">0</span></div>
            <div class="strip__item strip__item--si-done"><span class="strip__label">With Sales Invoice</span><span class="strip__value" data-bind="summary.withSalesInvoice">0</span></div>
            <div class="strip__item strip__item--si-for"><span class="strip__label">For Sales Invoice</span><span class="strip__value" data-bind="summary.forSalesInvoice">0</span></div>
            <div class="strip__item strip__item--delivered"><span class="strip__label">Books Delivered</span><span class="strip__value" data-bind="summary.booksDelivered">0</span></div>
            <div class="strip__item strip__item--to-deliver"><span class="strip__label">To Be Delivered</span><span class="strip__value" data-bind="summary.toBeDelivered">0</span></div>
            <div class="strip__item strip__item--items"><span class="strip__label">Total Books/Items</span><span class="strip__value" data-bind="summary.totalItems">0</span></div>
          </section>

          <div class="toolbar">
            <div class="search">
              <svg class="search__icon" aria-hidden="true"><use href="#i-search"/></svg>
              <input class="search__input" id="search" type="search" placeholder="Search PR number, MARF, supplier, item..." aria-label="Search purchase requests" autocomplete="off">
            </div>
            <div class="select">
              <select class="select__control" id="filter-status" aria-label="Filter by status"><option value="">All Statuses</option></select>
              <svg class="select__icon" aria-hidden="true"><use href="#i-chevron-12"/></svg>
            </div>
            <div class="select">
              <select class="select__control" id="filter-supplier" aria-label="Filter by supplier"><option value="">All Suppliers</option></select>
              <svg class="select__icon" aria-hidden="true"><use href="#i-chevron-12"/></svg>
            </div>
            <div class="select">
              <select class="select__control" id="filter-type" aria-label="Filter by collection type"><option value="">All Collection Types</option></select>
              <svg class="select__icon" aria-hidden="true"><use href="#i-chevron-12"/></svg>
            </div>
            <p class="toolbar__summary"><span id="record-count">0</span> records · Total: <strong id="record-total">₱0.00</strong></p>
          </div>

          <section class="sheet" aria-label="Book purchase requests">
            <table class="sheet__table">
              <colgroup>
                <col style="width:113.38px"><col style="width:72.88px"><col style="width:113.38px"><col style="width:97.18px"><col style="width:89.08px"><col style="width:105.27px"><col style="width:72.88px"><col style="width:80.99px"><col style="width:121.48px"><col style="width:105.27px"><col style="width:48.58px"><col style="width:97.18px"><col style="width:97.18px"><col style="width:97.18px"><col style="width:113.38px"><col style="width:97.18px"><col style="width:97.36px">
              </colgroup>
              <thead>
                <tr>
                  <th class="sheet__th" scope="col">PR Number</th>
                  <th class="sheet__th" scope="col">MARF</th>
                  <th class="sheet__th" scope="col">Supplier</th>
                  <th class="sheet__th" scope="col">Item</th>
                  <th class="sheet__th" scope="col">Amount</th>
                  <th class="sheet__th" scope="col">Budget Source</th>
                  <th class="sheet__th" scope="col">Budget Date</th>
                  <th class="sheet__th" scope="col">Date Submitted</th>
                  <th class="sheet__th" scope="col">PR Processed By / Approved Date</th>
                  <th class="sheet__th" scope="col">PO Number / PO Date</th>
                  <th class="sheet__th" scope="col">Total No.</th>
                  <th class="sheet__th" scope="col">Sales Invoice</th>
                  <th class="sheet__th" scope="col">Delivered / To Deliver</th>
                  <th class="sheet__th" scope="col">PO Staff Assigned</th>
                  <th class="sheet__th" scope="col">Collection Type</th>
                  <th class="sheet__th" scope="col">Status</th>
                  <th class="sheet__th" scope="col">Note</th>
                </tr>
              </thead>
              <tbody id="books-body"></tbody>
            </table>
          </section>
        </div>

      </main>
    </div>
  </div>

  <script>
/*
  Database connection
  -------------------
  Point API_ENDPOINT at a route returning JSON in this shape (missing values are treated as 0 / empty):
  {
    "counts":  { "books": 0, "journals": 0, "databases": 0, "supplies": 0, "suppliers": 0 },
    "tabs":    { "sas": 0, "selected": 0 },                       // optional; falls back to counting records
    "summary": { "total": 0, "withSalesInvoice": 0, "forSalesInvoice": 0, "booksDelivered": 0, "toBeDelivered": 0, "totalItems": 0 },
    "records": [ {
      "id": "", "tab": "sas | selected", "prNumber": "", "marf": "", "supplier": "", "item": "", "amount": 0,
      "budgetSource": "", "budgetDate": "", "dateSubmitted": "", "processedBy": "", "approvedDate": "",
      "poNumber": "", "poDate": "", "totalNo": 0, "salesInvoice": "", "delivered": 0, "toDeliver": 0,
      "poStaff": "", "collectionType": "MIBF | Donation | Book Request | MARF", "status": "", "note": ""
    } ]
  }
*/
(function () {
    "use strict";

    var API_ENDPOINT = "/api/books-pr";

    /* Navigation toggle */
    var sidebar = document.getElementById("sidebar");
    var toggle = sidebar.querySelector(".sidebar__toggle");
    toggle.addEventListener("click", function () {
        var open = toggle.getAttribute("aria-expanded") === "true";
        toggle.setAttribute("aria-expanded", String(!open));
        sidebar.classList.toggle("sidebar--open", !open);
    });

    /* Helpers */
    var money = new Intl.NumberFormat("en-PH", { style: "currency", currency: "PHP" });
    var STATUS = { "completed": "done", "for po": "po", "no po yet": "no-po", "for si": "si", "for sales invoice": "si", "partial delivery": "partial" };
    var TYPE = { "mibf": "mibf", "donation": "donation", "book request": "book-request", "marf": "marf" };

    function esc(v) { return String(v == null ? "" : v).replace(/[&<>"']/g, function (c) { return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]; }); }
    function num(v) { var n = Number(v); return isFinite(n) ? n : 0; }
    function fmtDate(v) {
        if (!v) { return ""; }
        if (/^\d{4}-\d{2}-\d{2}/.test(String(v))) {
            var d = new Date(v);
            if (!isNaN(d)) { return d.toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" }); }
        }
        return String(v);
    }
    function setText(key, value) {
        document.querySelectorAll('[data-bind="' + key + '"]').forEach(function (el) { el.textContent = value; });
    }
    function unique(list, field) {
        var seen = {}, out = [];
        list.forEach(function (r) { var v = r[field]; if (v && !seen[v]) { seen[v] = true; out.push(v); } });
        return out.sort();
    }
    function fillSelect(id, values) {
        var el = document.getElementById(id), current = el.value, first = el.options[0].outerHTML;
        el.innerHTML = first + values.map(function (v) { return '<option value="' + esc(v) + '">' + esc(v) + "</option>"; }).join("");
        el.value = values.indexOf(current) > -1 ? current : "";
    }

    /* State */
    var state = { data: {}, tab: "sas", q: "", status: "", supplier: "", type: "" };

    function visibleRecords() {
        var q = state.q.trim().toLowerCase();
        return (state.data.records || []).filter(function (r) {
            if (r.tab && r.tab !== state.tab) { return false; }
            if (state.status && r.status !== state.status) { return false; }
            if (state.supplier && r.supplier !== state.supplier) { return false; }
            if (state.type && r.collectionType !== state.type) { return false; }
            if (q && [r.prNumber, r.marf, r.supplier, r.item].join(" ").toLowerCase().indexOf(q) === -1) { return false; }
            return true;
        });
    }

    function rowHtml(r) {
        var statusKey = STATUS[String(r.status || "").toLowerCase()] || "default";
        var typeKey = TYPE[String(r.collectionType || "").toLowerCase()] || "default";
        var delivered = num(r.delivered), left = num(r.toDeliver), all = delivered + left;
        var pct = all > 0 ? Math.round((delivered / all) * 100) : 0;
        var types = ["MIBF", "Donation", "Book Request", "MARF"];
        if (r.collectionType && types.indexOf(r.collectionType) === -1) { types.push(r.collectionType); }

        return '<tr class="sheet__row">' +
            '<td class="sheet__td"><span class="t t--code-link">' + esc(r.prNumber) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--code">' + esc(r.marf) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--base">' + esc(r.supplier) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--muted">' + esc(r.item) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--amount">' + money.format(num(r.amount)) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--muted">' + esc(r.budgetSource) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--muted">' + esc(r.budgetDate) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--muted">' + esc(fmtDate(r.dateSubmitted)) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--medium">' + esc(r.processedBy) + '</span><span class="t t--sub">' + esc(fmtDate(r.approvedDate)) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--code-sm">' + esc(r.poNumber) + '</span><span class="t t--sub">' + esc(fmtDate(r.poDate)) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--num">' + esc(r.totalNo) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--code-sm">' + esc(r.salesInvoice) + "</span>" +
            (r.salesInvoice ? '<span class="t t--badge"><span class="badge badge--done">With SI</span></span>' : "") + "</td>" +
            '<td class="sheet__td"><div class="deliv"><span class="deliv__done">' + delivered + '</span><span class="deliv__sep">/</span><span class="deliv__left">' + left + '</span></div>' +
            '<div class="deliv__bar"><span class="deliv__fill" style="width:' + pct + '%"></span></div></td>' +
            '<td class="sheet__td"><span class="t t--staff">' + esc(r.poStaff) + "</span></td>" +
            '<td class="sheet__td"><div class="pill-select pill-select--' + typeKey + '">' +
            '<select class="pill-select__control" aria-label="Collection type for ' + esc(r.prNumber) + '">' +
            types.map(function (t) { return '<option' + (t === r.collectionType ? " selected" : "") + ">" + esc(t) + "</option>"; }).join("") +
            '</select><svg class="pill-select__icon" aria-hidden="true"><use href="#i-chevron-10"/></svg></div></td>' +
            '<td class="sheet__td"><span class="badge badge--' + statusKey + '"><span class="badge__dot"></span>' + esc(r.status) + "</span></td>" +
            '<td class="sheet__td"><span class="t t--muted t--wrap">' + esc(r.note) + "</span></td>" +
            "</tr>";
    }

    function render() {
        var data = state.data, all = data.records || [], list = visibleRecords(), summary = data.summary || {}, counts = data.counts || {}, tabs = data.tabs || {};

        ["books", "journals", "databases", "supplies", "suppliers"].forEach(function (k) { setText("count." + k, num(counts[k])); });
        ["sas", "selected"].forEach(function (k) {
            var n = tabs[k] != null ? num(tabs[k]) : all.filter(function (r) { return r.tab === k; }).length;
            setText("tab." + k, n);
        });
        ["total", "withSalesInvoice", "forSalesInvoice", "booksDelivered", "toBeDelivered", "totalItems"].forEach(function (k) {
            setText("summary." + k, num(summary[k]));
        });

        fillSelect("filter-status", unique(all, "status"));
        fillSelect("filter-supplier", unique(all, "supplier"));
        fillSelect("filter-type", unique(all, "collectionType"));

        document.getElementById("record-count").textContent = list.length;
        document.getElementById("record-total").textContent = money.format(list.reduce(function (s, r) { return s + num(r.amount); }, 0));
        document.getElementById("books-body").innerHTML = list.map(rowHtml).join("");
    }

    /* Events */
    document.querySelectorAll(".tabs__tab").forEach(function (btn) {
        btn.addEventListener("click", function () {
            state.tab = btn.getAttribute("data-tab");
            document.querySelectorAll(".tabs__tab").forEach(function (b) {
                var on = b === btn;
                b.classList.toggle("tabs__tab--active", on);
                b.setAttribute("aria-pressed", String(on));
            });
            render();
        });
    });
    document.getElementById("search").addEventListener("input", function (e) { state.q = e.target.value; render(); });
    document.getElementById("filter-status").addEventListener("change", function (e) { state.status = e.target.value; render(); });
    document.getElementById("filter-supplier").addEventListener("change", function (e) { state.supplier = e.target.value; render(); });
    document.getElementById("filter-type").addEventListener("change", function (e) { state.type = e.target.value; render(); });
    document.getElementById("books-body").addEventListener("change", function (e) {
        var sel = e.target.closest(".pill-select__control");
        if (!sel) { return; }
        var key = TYPE[sel.value.toLowerCase()] || "default";
        sel.parentNode.className = "pill-select pill-select--" + key;
    });

    /* Load */
    render();
    fetch(API_ENDPOINT, { headers: { Accept: "application/json" }, credentials: "same-origin" })
        .then(function (res) { if (!res.ok) { throw new Error("HTTP " + res.status); } return res.json(); })
        .then(function (json) { state.data = json || {}; render(); })
        .catch(function (err) { console.error("Books PR data could not be loaded:", err); });
})();
</script>
</body>
</html>