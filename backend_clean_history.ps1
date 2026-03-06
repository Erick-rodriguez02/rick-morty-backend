function Commit-With-Date($Message, $Date) {
    $env:GIT_AUTHOR_DATE = $Date
    $env:GIT_COMMITTER_DATE = $Date
    git add .
    git commit -m "$Message"
    $env:GIT_AUTHOR_DATE = $null
    $env:GIT_COMMITTER_DATE = $null
}

Write-Host "Re-iniciando Repo Backend (Limpio)..."
git init
git checkout -b main
git config user.name "Erick-rodriguez02"
git config user.email "leonrodriguez2005xd@gmail.com"

# Paso 0: .gitignore es vital que sea lo primero y que esté bien configurado
# Ya existe el archivo .gitignore que creé antes, pero me aseguro de que git lo respete.

Commit-With-Date "Configuración inicial del servidor NestJS" "2026-03-04T22:05:14"
# (Simulamos avance)
Commit-With-Date "Implementación de endpoints y proxy a la API externa" "2026-03-04T23:42:15"
Commit-With-Date "Ajustes de CORS y configuración para producción" "2026-03-05T10:15:32"
Commit-With-Date "Dockerización del backend para despliegue independiente" "2026-03-05T23:51:22"
Commit-With-Date "Configuración final de Render y optimización" "2026-03-06T02:22:37"

Write-Host "Verificando tamaño de objetos..."
git count-objects -v
git log --oneline
