<#Write-Host "================================================" -ForegroundColor Cyan

╔══════════════════════════════════════════════════════════════════╗Write-Host "  Script descontinuado" -ForegroundColor Yellow

║                    MOTTUFLOW - ENCERRAMENTO                      ║Write-Host "================================================" -ForegroundColor Cyan

╚══════════════════════════════════════════════════════════════════╝Write-Host "Use o starter único: .\\start.ps1 (encerre o backend pela janela aberta do Maven)" -ForegroundColor Green

exit 0

Script para parar todos os serviços do MottuFlow:
  - Serviço Python da câmera (porta 5001)
  - Backend Spring Boot (porta 8080)

Uso: .\stop.ps1
#>

$ErrorActionPreference = "Stop"

# ═══════════════════════════════════════════════════════════════════
# FUNÇÕES
# ═══════════════════════════════════════════════════════════════════

function Write-Step {
    param([string]$Message, [string]$Color = "Yellow")
    Write-Host ""
    Write-Host "================================================" -ForegroundColor $Color
    Write-Host ("  {0}" -f $Message) -ForegroundColor $Color
    Write-Host "================================================" -ForegroundColor $Color
}

function Write-Success {
    param([string]$Message)
    Write-Host ("  [OK] {0}" -f $Message) -ForegroundColor Green
}

function Write-Info {
    param([string]$Message)
    Write-Host ("  [INFO] {0}" -f $Message) -ForegroundColor Gray
}

function Write-Warning-Custom {
    param([string]$Message)
    Write-Host ("  [AVISO] {0}" -f $Message) -ForegroundColor Yellow
}

function Stop-ProcessByPort {
    param(
        [int]$Port,
        [string]$Description
    )
    
    Write-Info "Buscando processo na porta $Port..."
    
    try {
        $connections = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
        
        if (-not $connections) {
            Write-Warning-Custom "Nenhum processo encontrado na porta $Port"
            return $false
        }
        
        $processIds = $connections | Select-Object -ExpandProperty OwningProcess -Unique
        
        foreach ($pid in $processIds) {
            try {
                $process = Get-Process -Id $pid -ErrorAction Stop
                Write-Info "Finalizando $Description (PID: $pid, Nome: $($process.ProcessName))..."
                Stop-Process -Id $pid -Force -ErrorAction Stop
                Write-Success "$Description finalizado com sucesso"
            }
            catch {
                Write-Warning-Custom "Erro ao finalizar processo $pid`: $_"
            }
        }
        
        return $true
    }
    catch {
        Write-Warning-Custom "Erro ao buscar processo na porta $Port`: $_"
        return $false
    }
}

function Stop-ProcessByName {
    param(
        [string]$ProcessName,
        [string]$Description
    )
    
    Write-Info "Buscando processos '$ProcessName'..."
    
    try {
        $processes = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue
        
        if (-not $processes) {
            Write-Warning-Custom "Nenhum processo '$ProcessName' encontrado"
            return $false
        }
        
        foreach ($proc in $processes) {
            try {
                Write-Info "Finalizando $Description (PID: $($proc.Id))..."
                Stop-Process -Id $proc.Id -Force -ErrorAction Stop
                Write-Success "$Description finalizado com sucesso"
            }
            catch {
                Write-Warning-Custom "Erro ao finalizar PID $($proc.Id): $_"
            }
        }
        
        return $true
    }
    catch {
        Write-Warning-Custom "Erro ao buscar processo '$ProcessName': $_"
        return $false
    }
}

# ═══════════════════════════════════════════════════════════════════
# INÍCIO
# ═══════════════════════════════════════════════════════════════════

Clear-Host
Write-Host ""
Write-Host "================================================" -ForegroundColor Yellow
Write-Host "  MOTTUFLOW - ENCERRANDO SERVICOS" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Yellow
Write-Host ""

# ═══════════════════════════════════════════════════════════════════
# PARAR SERVIÇO PYTHON
# ═══════════════════════════════════════════════════════════════════

Write-Step "Parando Serviço Python (Câmera IoT)" "Yellow"

$pythonStopped = Stop-ProcessByPort -Port 5001 -Description "Serviço Python"

# Fallback: tentar matar Python diretamente
if (-not $pythonStopped) {
    Write-Info "Tentando finalizar processos Python como fallback..."
    $pythonProcs = Get-Process -Name python -ErrorAction SilentlyContinue | Where-Object {
        $_.CommandLine -like "*camera_web_service*"
    }
    
    if ($pythonProcs) {
        foreach ($proc in $pythonProcs) {
            Write-Info "Finalizando Python (PID: $($proc.Id))..."
            Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
        }
        Write-Success "Processos Python finalizados"
    }
    else {
        Write-Info "Nenhum processo Python relacionado à câmera encontrado"
    }
}

# ═══════════════════════════════════════════════════════════════════
# PARAR BACKEND SPRING BOOT
# ═══════════════════════════════════════════════════════════════════

Write-Step "Parando Backend Spring Boot" "Yellow"

$backendStopped = Stop-ProcessByPort -Port 8080 -Description "Backend Spring Boot"

# Fallback: tentar matar Java diretamente
if (-not $backendStopped) {
    Write-Info "Tentando finalizar processos Java como fallback..."
    Stop-ProcessByName -ProcessName "java" -Description "Java (Spring Boot)"
}

# ═══════════════════════════════════════════════════════════════════
# LIMPEZA ADICIONAL
# ═══════════════════════════════════════════════════════════════════

Write-Step "Limpeza Adicional" "Yellow"

# Matar processos Maven que possam estar rodando
$mvnStopped = Stop-ProcessByName -ProcessName "mvn*" -Description "Maven"

if (-not $mvnStopped) {
    Write-Info "Nenhum processo Maven encontrado"
}

# ═══════════════════════════════════════════════════════════════════
# RESULTADO FINAL
# ═══════════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "=========== TODOS OS SERVICOS FORAM ENCERRADOS! ===========" -ForegroundColor Green
Write-Host ""

Write-Host "PARA REINICIAR O SISTEMA: Execute .\start.ps1" -ForegroundColor Cyan
Write-Host ""
