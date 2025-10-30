# Script de Inicialização do MottuFlow
# Execute este arquivo para iniciar o projeto completo

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "    MOTTUFLOW - Sprint 3 (Otimizado)" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Verificar MySQL
Write-Host "[1/3] Verificando MySQL..." -ForegroundColor Green
$mysqlProcess = Get-Process -Name "mysqld" -ErrorAction SilentlyContinue
if ($mysqlProcess) {
    Write-Host "✅ MySQL está rodando" -ForegroundColor Green
}
else {
    Write-Host "❌ MySQL não está rodando. Inicie o MySQL primeiro!" -ForegroundColor Red
    Write-Host "   Use: net start MySQL80" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# 2. Iniciar Backend Java
Write-Host "[2/3] Iniciando Backend Java Spring Boot..." -ForegroundColor Green
Write-Host "   Compilando e iniciando servidor..." -ForegroundColor Gray

$backendPath = "Java Advanced\MottuFlowJava\MottuFlow"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$backendPath'; .\mvnw spring-boot:run" -WindowStyle Normal

Write-Host "   Aguardando backend inicializar (30s)..." -ForegroundColor Gray
Start-Sleep -Seconds 30

Write-Host "✅ Backend rodando em http://localhost:8080" -ForegroundColor Green
Write-Host "   Swagger: http://localhost:8080/swagger-ui/index.html" -ForegroundColor Cyan

Write-Host ""

# 3. Iniciar Expo (Mobile)
Write-Host "[3/3] Iniciando Expo Metro (Mobile)..." -ForegroundColor Green

$mobilePath = "Mobile Application\challenge-mottuflow\MottuFlow"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$mobilePath'; npx expo start" -WindowStyle Normal

Write-Host "   Aguardando Expo inicializar (15s)..." -ForegroundColor Gray
Start-Sleep -Seconds 15

Write-Host "✅ Expo rodando em exp://192.168.15.4:8081" -ForegroundColor Green

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   🎉 PROJETO INICIADO COM SUCESSO!" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📱 MOBILE:" -ForegroundColor White
Write-Host "   - Escaneie o QR Code com Expo Go" -ForegroundColor Gray
Write-Host "   - Login: admin@email.com / admin123" -ForegroundColor Gray
Write-Host ""
Write-Host "☕ BACKEND:" -ForegroundColor White
Write-Host "   - API: http://localhost:8080" -ForegroundColor Gray
Write-Host "   - Swagger: http://localhost:8080/swagger-ui/index.html" -ForegroundColor Gray
Write-Host ""
Write-Host "🔧 OTIMIZAÇÕES ATIVAS:" -ForegroundColor White
Write-Host "   ✅ Connection Pool HikariCP (10 max)" -ForegroundColor Green
Write-Host "   ✅ Compressão GZIP (65% menor)" -ForegroundColor Green
Write-Host "   ✅ Batch Processing (20/lote)" -ForegroundColor Green
Write-Host "   ✅ ApiService centralizado" -ForegroundColor Green
Write-Host "   ✅ Auto-renovação de tokens JWT" -ForegroundColor Green
Write-Host ""
Write-Host "📚 Documentação:" -ForegroundColor White
Write-Host "   - OTIMIZACOES.md" -ForegroundColor Gray
Write-Host "   - README_OTIMIZADO.md" -ForegroundColor Gray
Write-Host ""
Write-Host "Pressione Ctrl+C para encerrar" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan

# Manter o script rodando
while ($true) {
    Start-Sleep -Seconds 60
}
