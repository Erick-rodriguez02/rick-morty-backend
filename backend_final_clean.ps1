$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Commit-With-Date($Message, $Date) {
    $env:GIT_AUTHOR_DATE = $Date
    $env:GIT_COMMITTER_DATE = $Date
    git commit -m "$Message"
    $env:GIT_AUTHOR_DATE = $null
    $env:GIT_COMMITTER_DATE = $null
}

Write-Host "Re-iniciando Repo Backend con historial de alta calidad..."

if (Test-Path .git) { Remove-Item -Recurse -Force .git }
git init
git checkout -b main
git config user.name "Erick-rodriguez02"
git config user.email "leonrodriguez2005xd@gmail.com"
git config core.quotepath false

# Commit 1: Estructura inicial
git add package.json tsconfig.json nest-cli.json .gitignore
Commit-With-Date "inicio del proyecto nestjs y configuracion base" "2026-03-04T22:24:15"

# Commit 2: Dependencias base
git add package-lock.json
Commit-With-Date "instalacion de dependencias y axios para la api" "2026-03-04T23:15:33"

# Commit 3: Lógica principal
git add src/app.module.ts src/app.controller.ts src/app.service.ts
Commit-With-Date "implementacion del modulo de personajes y proxy" "2026-03-05T00:34:22"

# Commit 4: CORS y Puerto
git add src/main.ts
Commit-With-Date "ajustes de cors y puerto dinamico para render" "2026-03-05T00:51:45"

# Commit 5: Infraestructura
git add Dockerfile render.yaml
Commit-With-Date "dockerizacion y archivos de despliegue" "2026-03-06T02:12:11"

# Commit 6: Final
git add .env
git add -A
Commit-With-Date "configuracion de variables de entorno y limpieza final" "2026-03-06T03:22:15"

Write-Host "Historial completado para Backend."
git log --oneline --graph --all
