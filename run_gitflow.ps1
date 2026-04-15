Set-Location 'C:\PAUL\UC\UC-2026-1\CONSTRUCCION DE SOFTWARE\SEMANA 5\Evaluacion-ConstruccionSW-GrupoLosLederes'
if (-not (Test-Path 'pagina-web')) {
    New-Item -ItemType Directory -Path 'pagina-web' | Out-Null
}
$lines = @(
    '<html>',
    '  <head>',
    '    <title>Pagina Web</title>',
    '  </head>',
    '  <body>',
    '    <h1>Avance de la página web</h1>',
    '    <p>Esta rama <strong>pagina-web</strong> se creó desde develop.</p>',
    '  </body>',
    '</html>'
)
$lines | Set-Content -Path 'pagina-web\index.html' -Encoding UTF8
Write-Output 'Rama actual:'
git switch -C pagina-web develop
Write-Output 'Agregando archivos...'
git add .
$status = git status --short
if ($status) {
    git commit -m 'avance pagina web'
} else {
    Write-Output 'No changes to commit'
}
Write-Output 'Empujando a remoto...'
git push -u origin pagina-web
Write-Output 'Finalizado.'
