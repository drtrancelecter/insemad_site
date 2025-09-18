#!/usr/bin/env bash
set -euo pipefail

# ---------- CSS principal (blindado) ----------
mkdir -p assets/css
cat > assets/css/brand.css <<'CSS'
:root{
  --teal:#0e6771; --teal-dark:#0b555e; --ink:#0f3b3f; --paper:#fff;
  --hero-height:600px; --hero-pad-top:24px; --hero-pad-bottom:120px;
  --radius:16px;
  --shadow:0 10px 30px rgba(0,0,0,.16);
}
html{ overflow-y:scroll; } /* Scroll reservado: evita micro-saltos */
*{ box-sizing:border-box; }
html,body{ margin:0; padding:0; font-family:'Inter',system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,'Helvetica Neue',Arial,sans-serif; color:#17363a; background:#fff; }
.container{ max-width:1100px; margin:0 auto; padding:0 20px; }

/* Topbar fija e idéntica */
.topbar{ position:sticky; top:0; z-index:10; background:#fff; border-bottom:1px solid #e5eef0; }
.topbar .container{ display:flex; align-items:center; justify-content:space-between; height:54px; }
.brand{ font-weight:800; letter-spacing:.02em; color:var(--ink); display:flex; align-items:center; gap:10px; user-select:none; }
.brand img{ height:24px; width:24px; border-radius:50%; display:block; }
.brand span{ font-weight:800; transform:none!important; transition:none!important; } /* anti-zoom */
.nav a{ color:var(--ink); text-decoration:none; margin-left:18px; font-weight:600; opacity:.9; }
.nav a:hover{ opacity:1; }

/* Hero inamovible */
.hero{
  background:linear-gradient(180deg,var(--teal) 0%, var(--teal-dark) 100%);
  min-height:var(--hero-height)!important;
  max-height:var(--hero-height)!important;
  padding:var(--hero-pad-top) 0 var(--hero-pad-bottom)!important;
  display:flex; align-items:center; justify-content:center;
}
.hero-inner{ display:flex; flex-direction:column; align-items:center; text-align:center; gap:16px; }
.hero-title{ color:#fff; font-weight:900; font-size:44px; line-height:1.08; letter-spacing:.2px; margin:0; }
.hero-sub{ color:#d9f1f3; font-weight:600; margin:0; }
.hero-chips{ display:flex; flex-wrap:wrap; gap:12px; justify-content:center; }
.chip{ background:#fff; color:var(--teal); padding:.6rem 1.2rem; border-radius:28px; font-weight:800; white-space:nowrap; }

.btn-wsp{ display:inline-block; background:#fff; color:var(--teal); font-weight:800; padding:.65rem 1rem; border-radius:12px; text-decoration:none; box-shadow:0 2px 0 rgba(0,0,0,.06); }
.btn-wsp:hover{ transform:translateY(-1px); }

.hero-card{ background:#fff; border-radius:var(--radius); box-shadow:var(--shadow); padding:8px; width:100%; max-width:660px; margin:8px auto 0; }
.hero-card .ph{ height:220px; border-radius:12px; background:#f5f7f8; }

.section{ padding:40px 0; }
.site-footer{ padding:18px 0; text-align:center; color:#436d73; background:#fff; }
.site-footer small{ opacity:.8; }

/* Botones flotantes (siempre visibles) */
.floating-buttons{ position:fixed; bottom:20px; right:20px; display:flex; flex-direction:column; align-items:center; z-index:999; gap:14px; }
.btn-float{ width:60px; height:60px; border-radius:18px; display:flex; align-items:center; justify-content:center; box-shadow:none; }
.btn-float.black{ background:#111; } .btn-float.green{ background:#5a7720; } .btn-float.blue{ background:#0077B5; }
.btn-float img, .btn-float svg{ width:28px; height:28px; }

/* CTA inferior */
.cta{ display:flex; gap:16px; justify-content:center; padding:24px 0 0; }
.cta .btn{ background:#0E6668; color:#fff; padding:.85rem 1.2rem; border-radius:10px; text-decoration:none; font-weight:800; }

/* Grilla de productos (rígida) */
.productos-grid{ display:grid; grid-template-columns:repeat(auto-fit,minmax(260px,1fr)); gap:24px; }
.productos-grid .card{ background:#fff; border:1px solid #e9ecef; border-radius:12px; padding:16px; text-align:center; box-shadow:0 6px 16px rgba(0,0,0,.06); }
.productos-grid .card h3{ color:#0E6668; margin:.25rem 0 .5rem; }

/* Placeholders invisibles para evitar flex re-centrado con vacío */
.placeholder-hero{ height:1px; width:1px; opacity:0; pointer-events:none; }

@media (max-width:640px){
  .hero-title{ font-size:34px; }
}
CSS

# ---------- JS mínimo ----------
mkdir -p assets/js
cat > assets/js/main.js <<'JS'
// reservado para interacciones futuras (sin dependencias)
JS

# ---------- SVGs simples ----------
mkdir -p assets/svg
cat > assets/svg/phone.svg <<'SVG'
<svg viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg"><path d="M6.6 10.8c1.7 3.3 3.9 5.5 7.2 7.2l2.4-2.4a1 1 0 0 1 1.1-.2c1.2.5 2.5.8 3.9.8a1 1 0 0 1 1 1V21a1 1 0 0 1-1 1A19 19 0 0 1 3 7a1 1 0 0 1 1-1h3.8a1 1 0 0 1 1 1c0 1.4.3 2.7.8 3.9a1 1 0 0 1-.2 1.1L6.6 10.8z"/></svg>
SVG
cat > assets/svg/arrow-right.svg <<'SVG'
<svg viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg"><path d="M13 5l7 7-7 7M5 12h14" stroke="#fff" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/></svg>
SVG
cat > assets/svg/linkedin.svg <<'SVG'
<svg viewBox="0 0 24 24" fill="#fff" xmlns="http://www.w3.org/2000/svg"><path d="M4.98 3.5C4.98 4.88 3.86 6 2.5 6S0 4.88 0 3.5 1.12 1 2.5 1 4.98 2.12 4.98 3.5zM0 8h5v15H0zM8 8h4.8v2.1h.07c.67-1.27 2.3-2.6 4.73-2.6C21.4 7.5 24 10 24 14.3V23H19v-7.6c0-1.8-.03-4.1-2.5-4.1-2.5 0-2.9 1.95-2.9 4v7.7H8V8z"/></svg>
SVG

# ---------- Bloques reutilizables ----------
header_block='
  <header class="topbar">
    <div class="container">
      <div class="brand"><img src="assets/img/logo_insemad.jpg" alt="logo"><span>INSEMAD SPA</span></div>
      <nav class="nav">
        <a href="index.html">Inicio</a>
        <a href="productos.html">Productos</a>
        <a href="certificacion.html">Certificación</a>
        <a href="nosotros.html">Nosotros</a>
        <a href="galeria.html">Galería</a>
        <a href="infraestructura.html">Infraestructura</a>
        <a href="contacto.html">Contacto</a>
      </nav>
    </div>
  </header>
'

floating='
  <div class="floating-buttons">
    <a class="btn-float black" href="#inicio" title="volver arriba"><img src="assets/svg/arrow-right.svg" alt=""></a>
    <a class="btn-float green" href="tel:+56912345678" title="Llámanos"><img src="assets/svg/phone.svg" alt=""></a>
    <a class="btn-float blue" href="https://www.linkedin.com/company/insemadspa" target="_blank" rel="noopener" title="LinkedIn"><img src="assets/svg/linkedin.svg" alt=""></a>
  </div>
'

footer_block='
  <footer class="site-footer">
    <div class="container"><small>© 2025 INSEMAD SPA. Todos los derechos reservados.</small></div>
  </footer>
'

# ---------- INDEX (Inicio) ----------
cat > index.html <<HTML
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INSEMAD SPA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/brand.css">
</head>
<body>

${header_block}

<section id="inicio" class="hero">
  <div class="hero-inner container">
    <h1 class="hero-title">Embalajes y Maderas de Exportación y<br> Nacionales</h1>
    <p class="hero-sub">Pallets · Bins · Parrillas · Estibas · Cajones a medida · NIMF-15 · HT · Antihongos</p>

    <div class="hero-chips">
      <span class="chip">FUNGICIDA A BASE DE COBRE</span>
      <span class="chip">NIMF - 15</span>
      <span class="chip">PARA USO NACIONALES E INTERNACIONAL</span>
      <span class="chip">VENTA DE MADERAS</span>
    </div>

    <a class="btn-wsp" href="https://wa.me/56912345678" target="_blank" rel="noopener">Escríbenos por WhatsApp</a>

    <div class="hero-card"><div class="ph" aria-hidden="true"></div></div>

    <div class="cta">
      <a class="btn" href="productos.html">Ver Productos</a>
      <a class="btn" href="certificacion.html">Certificación</a>
      <a class="btn" href="contacto.html">Contáctanos</a>
    </div>
  </div>
</section>

<div class="section"><div class="container"></div></div>

${footer_block}
${floating}

<script src="assets/js/main.js"></script>
</body>
</html>
HTML

# ---------- PRODUCTOS ----------
cat > productos.html <<HTML
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Productos - INSEMAD SPA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/brand.css">
</head>
<body>

${header_block}

<section id="productos" class="hero">
  <div class="hero-inner container">
    <div class="placeholder-hero" aria-hidden="true"></div>
    <h1 class="hero-title" style="opacity:.001; user-select:none;">&nbsp;</h1>
    <div class="hero-card" style="opacity:.001"><div class="ph"></div></div>
  </div>
</section>

<section class="section">
  <div class="container">
    <h2 style="margin:0 0 16px 0; color:#0E6668;">Nuestros Productos</h2>
    <div class="productos-grid">
      <div class="card"><h3>Pallets</h3><p>Estandarizados y a medida.</p></div>
      <div class="card"><h3>Parrillas y Tapas</h3><p>Terminación robusta.</p></div>
      <div class="card"><h3>Estructuras Personalizadas</h3><p>Diseño a requerimiento.</p></div>
      <div class="card"><h3>Bins</h3><p>Almacenamiento industrial.</p></div>
      <div class="card"><h3>Trabajos a pedido</h3><p>Flexibilidad total.</p></div>
      <div class="card"><h3>Jabas</h3><p>Para múltiples usos.</p></div>
    </div>

    <h2 style="margin:32px 0 16px 0; color:#0E6668;">Servicios</h2>
    <div class="productos-grid">
      <div class="card"><h3>Lavado de cobre</h3><p>Acabado protector.</p></div>
      <div class="card"><h3>Desinfección antihongos</h3><p>Tratamientos certificados.</p></div>
      <div class="card"><h3>Cámara NIMF-15</h3><p>Normativa internacional.</p></div>
    </div>
  </div>
</section>

${footer_block}
${floating}

<script src="assets/js/main.js"></script>
</body>
</html>
HTML

# ---------- Otras secciones (maqueta estable) ----------
make_page () {
  name="$1"; title="$2"
  cat > "${name}.html" <<HTML
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${title} - INSEMAD SPA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/brand.css">
</head>
<body>
${header_block}

<section class="hero">
  <div class="hero-inner container">
    <div class="placeholder-hero" aria-hidden="true"></div>
    <h1 class="hero-title">${title}</h1>
    <div class="hero-card"><div class="ph"></div></div>
  </div>
</section>

<section class="section"><div class="container"><p style="opacity:.8">Contenido editable aquí (estructura inamovible).</p></div></section>

${footer_block}
${floating}
<script src="assets/js/main.js"></script>
</body>
</html>
HTML
}

make_page "certificacion" "Certificación"
make_page "nosotros" "Nosotros"
make_page "galeria" "Galería"
make_page "infraestructura" "Infraestructura"
make_page "contacto" "Contacto"

echo "Scaffold INSEMAD creado."
