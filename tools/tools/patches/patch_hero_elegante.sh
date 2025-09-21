#!/bin/bash
# 🧬 patch_hero_elegante.sh – Fusión estética punto óptimo sin romper botones ni logo
# Ruta de ejecución: ~/Desktop/insemad_site

set -e

echo "🧠 Iniciando parche hero elegante…"

# 1. Backup
echo "📦 Backup de archivos originales..."
cp index.html index.html.bak.$(date +%s)
cp assets/css/brand.css assets/css/brand.css.bak.$(date +%s)

# 2. Reemplazo de bloque <main id="inicio"> completo
echo "✍️ Inyectando bloque hero óptimo..."
awk '/<main id="inicio"/ {f=1} f && /<\/main>/ {f=0; next} !f' index.html > temp_index.html
awk 'f;/<main id="inicio"/{f=1}' INJECT/index_hero_fragment.html >> temp_index.html
awk '/<main id="inicio"/,/<\/main>/' index.html | sed '1d;$d' >> temp_index.html
awk 'f;/<\/main>/{f=0} !f' index.html >> temp_index.html
mv temp_index.html index.html

# 3. Fusión parcial de CSS para .hero
echo "🎨 Añadiendo estilos .hero..."
cat INJECT/brand_hero_fragment.css >> assets/css/brand.css

# 4. Verificación mínima
echo "✅ Parche aplicado. Revisa el sitio localmente y haz git add + commit manual."

exit 0
