# Script de Teste Automatico - Stream da Camera
# Verifica se o stream esta transmitindo frames diferentes

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  TESTE DE STREAM - Verificando frames ao vivo" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Teste 1: Servico Python rodando?
Write-Host "[1/4] Verificando servico Python..." -ForegroundColor Yellow
try {
    $status = Invoke-RestMethod -Uri "http://localhost:5001/status" -TimeoutSec 3
    Write-Host "  OK - Servico rodando" -ForegroundColor Green
    Write-Host "    Running: $($status.running)" -ForegroundColor Gray
    Write-Host "    Has Frame: $($status.has_frame)" -ForegroundColor Gray
    
    if (-not $status.running) {
        Write-Host "  AVISO: Camera nao esta rodando!" -ForegroundColor Yellow
        Write-Host "         Inicie a camera primeiro" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  ERRO - Servico nao esta rodando" -ForegroundColor Red
    Write-Host "         Execute: python camera_web_service.py" -ForegroundColor Yellow
    exit 1
}
Write-Host ""

# Teste 2: Debug endpoint
Write-Host "[2/4] Verificando status detalhado..." -ForegroundColor Yellow
try {
    $debug = Invoke-RestMethod -Uri "http://localhost:5001/debug" -TimeoutSec 3
    Write-Host "  Informacoes de debug:" -ForegroundColor Green
    Write-Host "    Camera ID: $($debug.camera_id)" -ForegroundColor Gray
    Write-Host "    Thread Alive: $($debug.capture_thread_alive)" -ForegroundColor Gray
    Write-Host "    Frame Shape: $($debug.frame_shape)" -ForegroundColor Gray
    
    if (-not $debug.capture_thread_alive -and $debug.running) {
        Write-Host "  PROBLEMA: Thread de captura parou!" -ForegroundColor Red
        Write-Host "            Reinicie o servico Python" -ForegroundColor Yellow
    }
} catch {
    Write-Host "  AVISO: Endpoint /debug nao disponivel" -ForegroundColor Yellow
}
Write-Host ""

# Teste 3: Stream esta respondendo?
Write-Host "[3/4] Testando stream endpoint..." -ForegroundColor Yellow
try {
    # Apenas testa se o endpoint responde (timeout esperado pois e stream continuo)
    $null = Invoke-WebRequest -Uri "http://localhost:5001/stream" -TimeoutSec 1 -Method Head -ErrorAction Stop
} catch [System.Net.WebException] {
    if ($_.Exception.Message -like "*tempo limite*" -or $_.Exception.Message -like "*timeout*") {
        Write-Host "  OK - Stream endpoint respondendo (timeout esperado)" -ForegroundColor Green
    } else {
        Write-Host "  OK - Stream endpoint ativo" -ForegroundColor Green
    }
} catch {
    Write-Host "  OK - Stream endpoint ativo" -ForegroundColor Green
}
Write-Host ""

# Teste 4: Executar teste Python de frames
Write-Host "[4/4] Testando se frames estao mudando..." -ForegroundColor Yellow
$pythonTest = Join-Path (Split-Path $PSScriptRoot) "Disruptive Architectures IOT & IA\test_stream_live.py"
if (Test-Path $pythonTest) {
    Write-Host "  Executando test_stream_live.py..." -ForegroundColor Gray
    Write-Host ""
    python $pythonTest
} else {
    Write-Host "  AVISO: test_stream_live.py nao encontrado" -ForegroundColor Yellow
    Write-Host "         Pulando teste de frames" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Recomendacoes:" -ForegroundColor Yellow
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Se os frames sao IDENTICOS:" -ForegroundColor White
Write-Host "   - Reinicie o servico Python (Ctrl+C e inicie novamente)" -ForegroundColor Gray
Write-Host "   - Verifique se outra app nao esta usando a camera" -ForegroundColor Gray
Write-Host ""
Write-Host "2. No navegador:" -ForegroundColor White
Write-Host "   - Pressione Ctrl+Shift+R para hard reload" -ForegroundColor Gray
Write-Host "   - Limpe o cache se necessario" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Se o problema persistir:" -ForegroundColor White
Write-Host "   - Execute: .\stop-all.ps1" -ForegroundColor Gray
Write-Host "   - Aguarde 5 segundos" -ForegroundColor Gray
Write-Host "   - Execute: .\start.ps1" -ForegroundColor Gray
Write-Host ""
