<#
MottuFlow - Stop Script
Para todos os serviços (Backend Java e Camera Python)

Uso: Execute .\stop.ps1 no PowerShell
#>

$ErrorActionPreference = "Continue"

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "    MOTTUFLOW - Parando Servicos" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Parar processos Java (Spring Boot)
Write-Host "[1/2] Parando processos Java (Spring Boot)..." -ForegroundColor Yellow
$javaProcesses = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object {
    $_.CommandLine -like "*spring-boot*" -or $_.CommandLine -like "*MottuFlow*"
}

if ($javaProcesses) {
    $javaProcesses | ForEach-Object {
        Write-Host "   Parando processo Java (PID: $($_.Id))..." -ForegroundColor Gray
        Stop-Process -Id $_.Id -Force
    }
    Write-Host "[OK] Processos Java parados" -ForegroundColor Green
} else {
    Write-Host "[INFO] Nenhum processo Java encontrado" -ForegroundColor Gray
}

Write-Host ""

# Parar processos Python (camera_web_service)
Write-Host "[2/2] Parando processos Python (camera service)..." -ForegroundColor Yellow
$pythonProcesses = Get-Process -Name "python*" -ErrorAction SilentlyContinue | Where-Object {
    $_.CommandLine -like "*camera_web_service*"
}

if ($pythonProcesses) {
    $pythonProcesses | ForEach-Object {
        Write-Host "   Parando processo Python (PID: $($_.Id))..." -ForegroundColor Gray
        Stop-Process -Id $_.Id -Force
    }
    Write-Host "[OK] Processos Python parados" -ForegroundColor Green
} else {
    Write-Host "[INFO] Nenhum processo Python encontrado" -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Todos os servicos foram parados" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Opcional: Fechar janelas de PowerShell abertas pelo start
Write-Host "NOTA: Feche manualmente as janelas PowerShell do backend/Python se ainda estiverem abertas" -ForegroundColor Yellow
Write-Host ""
