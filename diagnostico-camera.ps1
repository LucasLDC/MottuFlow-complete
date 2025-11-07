# Script de Diagnóstico da Câmera IoT

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Diagnóstico da Câmera IoT - MottuFlow" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Teste 1: Serviço Python
Write-Host "[1/3] Verificando serviço Python..." -ForegroundColor Yellow
try {
    $status = Invoke-RestMethod -Uri "http://localhost:5001/status" -Method Get -TimeoutSec 3
    Write-Host "  OK - Serviço Python rodando" -ForegroundColor Green
    Write-Host "    Running: $($status.running)" -ForegroundColor Gray
    Write-Host "    Has Frame: $($status.has_frame)" -ForegroundColor Gray
} catch {
    Write-Host "  ERRO - Serviço Python NAO esta rodando!" -ForegroundColor Red
    Write-Host "    Execute: python camera_web_service.py" -ForegroundColor Yellow
}
Write-Host ""

# Teste 2: Câmeras
Write-Host "[2/3] Verificando cameras disponiveis..." -ForegroundColor Yellow
try {
    $cameras = Invoke-RestMethod -Uri "http://localhost:5001/cameras" -Method Get -TimeoutSec 5
    if ($cameras.cameras.Count -gt 0) {
        Write-Host "  OK - $($cameras.cameras.Count) camera(s) detectada(s)" -ForegroundColor Green
        foreach ($cam in $cameras.cameras) {
            Write-Host "    - ID $($cam.id): $($cam.name)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  AVISO - Nenhuma camera detectada" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  ERRO - Nao foi possivel listar cameras" -ForegroundColor Red
}
Write-Host ""

# Teste 3: Backend Java
Write-Host "[3/3] Verificando backend Java..." -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri "http://localhost:8080" -Method Get -TimeoutSec 2 -UseBasicParsing | Out-Null
    Write-Host "  OK - Backend Java rodando" -ForegroundColor Green
} catch {
    Write-Host "  ERRO - Backend Java NAO esta rodando!" -ForegroundColor Red
    Write-Host "    Execute: .\start.ps1" -ForegroundColor Yellow
}
Write-Host ""

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Abrindo paginas de teste..." -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Abrir teste direto
$testPage = Join-Path $PSScriptRoot "test-camera-stream.html"
if (Test-Path $testPage) {
    Write-Host "Abrindo: test-camera-stream.html" -ForegroundColor Green
    Start-Process $testPage
}

Write-Host ""
Write-Host "INSTRUCOES:" -ForegroundColor Yellow
Write-Host "1. Teste o stream direto em: http://localhost:5001/stream" -ForegroundColor White
Write-Host "2. Na pagina test-camera-stream.html, clique em 'Mostrar Stream'" -ForegroundColor White
Write-Host "3. Se funcionar, o problema esta na pagina IoT" -ForegroundColor White
Write-Host "4. Abra F12 no navegador para ver erros de console" -ForegroundColor White
Write-Host ""
