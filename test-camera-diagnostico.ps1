# Script de Diagnóstico da Câmera IoT
# Execute este script para verificar se tudo está funcionando

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Diagnóstico da Câmera IoT - MottuFlow" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Teste 1: Serviço Python está rodando?
Write-Host "[1/4] Verificando serviço Python..." -ForegroundColor Yellow
try {
    $status = Invoke-RestMethod -Uri "http://localhost:5001/status" -Method Get -TimeoutSec 3
    Write-Host "  ✓ Serviço Python está rodando" -ForegroundColor Green
    Write-Host "    - Running: $($status.running)" -ForegroundColor Gray
    Write-Host "    - Has Frame: $($status.has_frame)" -ForegroundColor Gray
} catch {
    Write-Host "  ✗ Serviço Python NÃO está rodando!" -ForegroundColor Red
    Write-Host "    Execute: python camera_web_service.py" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Teste 2: Câmeras disponíveis
Write-Host "[2/4] Verificando câmeras disponíveis..." -ForegroundColor Yellow
try {
    $cameras = Invoke-RestMethod -Uri "http://localhost:5001/cameras" -Method Get -TimeoutSec 5
    if ($cameras.cameras.Count -gt 0) {
        Write-Host "  ✓ Câmeras detectadas: $($cameras.cameras.Count)" -ForegroundColor Green
        foreach ($cam in $cameras.cameras) {
            Write-Host "    - ID $($cam.id): $($cam.name)" -ForegroundColor Gray
        }
        Write-Host "    - Câmera selecionada: $($cameras.selected)" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ Nenhuma câmera detectada!" -ForegroundColor Red
        Write-Host "    Conecte uma webcam e reinicie o serviço Python" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  ✗ Erro ao listar câmeras: $_" -ForegroundColor Red
}

Write-Host ""

# Teste 3: Backend Java está rodando?
Write-Host "[3/4] Verificando backend Java..." -ForegroundColor Yellow
try {
    $health = Invoke-WebRequest -Uri "http://localhost:8080/actuator/health" -Method Get -TimeoutSec 3 -UseBasicParsing
    Write-Host "  ✓ Backend Java está rodando" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Backend Java NÃO está rodando!" -ForegroundColor Red
    Write-Host "    Execute: .\start.ps1" -ForegroundColor Yellow
}

Write-Host ""

# Teste 4: Abrir página de teste
Write-Host "[4/4] Abrindo páginas de teste..." -ForegroundColor Yellow

# Abrir página de diagnóstico
$testPage = Join-Path $PSScriptRoot "test-camera-stream.html"
if (Test-Path $testPage) {
    Write-Host "  ✓ Abrindo página de diagnóstico..." -ForegroundColor Green
    Start-Process $testPage
    Start-Sleep -Seconds 1
}

# Abrir página IoT se o backend estiver rodando
try {
    $null = Invoke-WebRequest -Uri "http://localhost:8080" -Method Get -TimeoutSec 2 -UseBasicParsing
    Write-Host "  ✓ Abrindo página IoT..." -ForegroundColor Green
    Start-Process "http://localhost:8080/cameras/iot"
} catch {
    Write-Host "  ⚠ Backend não está acessível, pulando página IoT" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Instruções:" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Na página de DIAGNÓSTICO (HTML simples):" -ForegroundColor White
Write-Host "   - Clique em 'Mostrar Stream'" -ForegroundColor Gray
Write-Host "   - Se o stream aparecer, o Python está OK" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Na página IoT (Thymeleaf):" -ForegroundColor White
Write-Host "   - Pressione F12 para abrir o console" -ForegroundColor Gray
Write-Host "   - Selecione uma câmera no dropdown" -ForegroundColor Gray
Write-Host "   - Clique em 'Iniciar câmera'" -ForegroundColor Gray
Write-Host "   - Veja os logs no console (procure [CAMERA])" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Se o stream NÃO aparecer na página IoT:" -ForegroundColor White
Write-Host "   - Verifique erros no console (F12)" -ForegroundColor Gray
Write-Host "   - Tente acessar diretamente: http://localhost:5001/stream" -ForegroundColor Gray
Write-Host "   - Verifique se há erros de CORS" -ForegroundColor Gray
Write-Host ""
Write-Host "Pressione qualquer tecla para fechar..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
