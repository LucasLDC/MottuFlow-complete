# Script para Encerrar o MottuFlow

Write-Host "================================================" -ForegroundColor Red
Write-Host "    ENCERRANDO MOTTUFLOW" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Red
Write-Host ""

# Parar Java
Write-Host "[1/2] Encerrando Backend Java..." -ForegroundColor Yellow
Stop-Process -Name "java" -Force -ErrorAction SilentlyContinue
if ($?) {
    Write-Host "✅ Backend Java encerrado" -ForegroundColor Green
}
else {
    Write-Host "ℹ️  Nenhum processo Java rodando" -ForegroundColor Gray
}

Write-Host ""

# Parar Node (Expo)
Write-Host "[2/2] Encerrando Expo..." -ForegroundColor Yellow
Stop-Process -Name "node" -Force -ErrorAction SilentlyContinue
if ($?) {
    Write-Host "✅ Expo encerrado" -ForegroundColor Green
}
else {
    Write-Host "ℹ️  Nenhum processo Node rodando" -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "   🛑 Todos os serviços encerrados!" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Green
Write-Host ""

Start-Sleep -Seconds 3
