<#
╔══════════════════════════════════════════════════════════════════╗
║                    MOTTUFLOW - INICIALIZAÇÃO                     ║
╚══════════════════════════════════════════════════════════════════╝

Script de inicialização completa do sistema MottuFlow.
Ordem de execução:
  1. Serviço Python da câmera (porta 5001)
  2. Backend Spring Boot com H2 (porta 8080)
  3. Navegador (Login + Swagger)

Uso: .\start.ps1
#>

$ErrorActionPreference = "Stop"

# ═══════════════════════════════════════════════════════════════════
# CONFIGURAÇÃO
# ═══════════════════════════════════════════════════════════════════

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendPath = Join-Path $repoRoot "Java Advanced\MottuFlowJava\MottuFlow"
$pythonPath = Join-Path $repoRoot "Disruptive Architectures IOT & IA"
$pythonScript = Join-Path $pythonPath "camera_web_service.py"

# ═══════════════════════════════════════════════════════════════════
# FUNÇÕES (nomes sem hífen para máxima compatibilidade com PS 5.1)
# ═══════════════════════════════════════════════════════════════════

function ShowStep {
    param(
        [string]$Message,
        [string]$Color = "Cyan"
    )
    Write-Host ""
    Write-Host "================================================" -ForegroundColor $Color
    Write-Host ("  {0}" -f $Message) -ForegroundColor $Color
    Write-Host "================================================" -ForegroundColor $Color
}

function ShowSuccess {
    param([string]$Message)
    Write-Host ("  [OK] {0}" -f $Message) -ForegroundColor Green
}

function ShowInfo {
    param([string]$Message)
    Write-Host ("  [INFO] {0}" -f $Message) -ForegroundColor Gray
}

function ShowError {
    param([string]$Message)
    Write-Host ("  [ERRO] {0}" -f $Message) -ForegroundColor Red
}

function TestPort {
    param(
        [int]$Port,
        [int]$TimeoutSeconds = 60
    )
    $elapsed = 0
    while ($elapsed -lt $TimeoutSeconds) {
        try {
            $connection = Test-NetConnection -ComputerName localhost -Port $Port -InformationLevel Quiet -WarningAction SilentlyContinue
            if ($connection) { return $true }
        }
        catch {
            # Ignora erros de conexão
        }
        Start-Sleep -Seconds 2
        $elapsed += 2
        ShowInfo "Aguardando porta $Port... ($elapsed/$TimeoutSeconds segundos)"
    }
    return $false
}

# ═══════════════════════════════════════════════════════════════════
# INÍCIO
# ═══════════════════════════════════════════════════════════════════

Clear-Host
Write-Host ""
Write-Host "================================================" -ForegroundColor Yellow
Write-Host "  MOTTUFLOW - SISTEMA DE GESTAO" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Yellow
Write-Host ""

# Validações
if (-not (Test-Path $backendPath)) {
    ShowError "Backend não encontrado em: $backendPath"
    exit 1
}

if (-not (Test-Path $pythonScript)) {
    ShowError "Script Python não encontrado: $pythonScript"
    ShowInfo "Camera IoT não estará disponível"
    $pythonScript = $null
}

# ═══════════════════════════════════════════════════════════════════
# ETAPA 1: SERVIÇO PYTHON DA CÂMERA
# ═══════════════════════════════════════════════════════════════════

ShowStep "ETAPA 1/3: Iniciando Serviço Python (Câmera IoT)" "Cyan"

if ($pythonScript) {
    # Usar Set-Location para evitar problemas com cd em caminhos com espaços
    $pythonCmd = "Set-Location -Path '$pythonPath'; python camera_web_service.py"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", $pythonCmd -WindowStyle Normal
    
    ShowInfo "Aguardando serviço Python na porta 5001 (até 30 segundos)..."
    if (TestPort -Port 5001 -TimeoutSeconds 30) {
        try {
            $resp = Invoke-WebRequest -Uri "http://localhost:5001/status" -TimeoutSec 5 -UseBasicParsing -ErrorAction Stop
            if ($resp.StatusCode -ge 200 -and $resp.StatusCode -lt 300) { ShowSuccess "Serviço Python disponível em http://localhost:5001" }
            else { ShowInfo "Serviço Python respondeu com status $($resp.StatusCode)" }
        }
        catch {
            ShowInfo "Porta 5001 abriu, mas /status não respondeu. A interface pode demorar alguns segundos."
        }
    }
    else {
        ShowError "Serviço Python não respondeu na porta 5001"
        ShowInfo "A página IoT poderá ficar 'carregando' até o serviço iniciar."
    }
}
else {
    ShowInfo "Serviço Python não disponível (arquivo não encontrado)"
}

# ═══════════════════════════════════════════════════════════════════
# ETAPA 2: BACKEND SPRING BOOT
# ═══════════════════════════════════════════════════════════════════

ShowStep "ETAPA 2/3: Iniciando Backend Spring Boot (H2)" "Cyan"

$startCmd = "cd '$backendPath'; `$env:SPRING_PROFILES_ACTIVE='h2'; .\mvnw -q -DskipTests spring-boot:run"
Start-Process powershell -ArgumentList "-NoExit", "-Command", $startCmd -WindowStyle Normal

ShowInfo "Aguardando backend na porta 8080 (até 90 segundos)..."
if (TestPort -Port 8080 -TimeoutSeconds 90) {
    ShowSuccess "Backend online em http://localhost:8080"
}
else {
    ShowError "Backend não respondeu na porta 8080"
    ShowInfo "Verifique a janela do Maven para erros"
    exit 1
}

# ═══════════════════════════════════════════════════════════════════
# ETAPA 3: NAVEGADOR
# ═══════════════════════════════════════════════════════════════════

ShowStep "ETAPA 3/3: Abrindo Navegador" "Cyan"

Start-Sleep -Seconds 2
Start-Process "http://localhost:8080/login"
ShowSuccess "Página de login aberta"

Start-Sleep -Seconds 1
Start-Process "http://localhost:8080/swagger-ui/index.html"
ShowSuccess "Swagger UI aberto"

# ═══════════════════════════════════════════════════════════════════
# INFORMAÇÕES FINAIS
# ═══════════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "=========== SISTEMA INICIADO COM SUCESSO! ===========" -ForegroundColor Green
Write-Host ""
Write-Host "CREDENCIAIS DE ACESSO:" -ForegroundColor Cyan
Write-Host "  ADMIN:    admin@email.com / adminmottu" -ForegroundColor White
Write-Host "  MECANICO: joao@email.com / joao123" -ForegroundColor Gray
Write-Host "  GERENTE:  maria@email.com / maria123" -ForegroundColor Gray
Write-Host ""
Write-Host "ENDPOINTS:" -ForegroundColor Cyan
Write-Host "  Login:           http://localhost:8080/login" -ForegroundColor White
Write-Host "  Camera IoT:      http://localhost:8080/cameras/iot" -ForegroundColor White
Write-Host "  Swagger:         http://localhost:8080/swagger-ui/index.html" -ForegroundColor White
Write-Host "  API REST:        http://localhost:8080/api" -ForegroundColor Gray
Write-Host "  Camera Service:  http://localhost:5001" -ForegroundColor Gray
Write-Host "  Camera Stream:   http://localhost:5001/stream" -ForegroundColor Gray
Write-Host ""
Write-Host "PARA PARAR O SISTEMA: Execute .\stop.ps1" -ForegroundColor Yellow
Write-Host ""
