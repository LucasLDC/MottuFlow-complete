# 🔍 Diagnóstico - Frame Congelado na Câmera

## Problema Identificado

A câmera mostra sempre a mesma imagem (frame congelado) ao invés de um vídeo contínuo.

## ✅ Correções Aplicadas

### 1. Serviço Python (`camera_web_service.py`)

- ✅ Adicionados logs detalhados de captura
- ✅ Contador de frames processados
- ✅ Limpeza do `latest_frame` ao parar
- ✅ Headers HTTP sem cache (no-cache, no-store)
- ✅ Delay controlado no stream (30 FPS)
- ✅ Novo endpoint `/debug` para diagnóstico

### 2. Frontend (`iot.html`)

- ✅ Cache-buster mais robusto (timestamp + random)
- ✅ Limpeza do `src` antes de recarregar
- ✅ Logs detalhados no console

## 🧪 Como Testar

### Passo 1: Parar e Reiniciar o Serviço Python

```powershell
# 1. Feche a janela do Python (ou Ctrl+C)

# 2. Reinicie o serviço
cd "Disruptive Architectures IOT & IA"
python camera_web_service.py
```

### Passo 2: Testar se o Stream Está Vivo

Execute o script de teste que criei:

```powershell
cd "Disruptive Architectures IOT & IA"
python test_stream_live.py
```

**Resultado esperado:**

```
✅ OK: Todos os 5 frames são DIFERENTES!
   O stream está transmitindo vídeo ao vivo corretamente
```

**Se aparecer:**

```
❌ PROBLEMA: Todos os frames são IDÊNTICOS!
```

→ O problema está no loop de captura do Python

### Passo 3: Verificar Logs do Python

Na janela do serviço Python, procure por:

```
[PY CAM] Captura iniciada na câmera X
[PY CAM] Processados 100 frames (câmera X)
[PY CAM] Stream MJPEG iniciado
[PY CAM] Stream: 100 frames enviados
```

**Se NÃO aparecer** "Processados X frames":
→ O loop de captura parou ou não está rodando

### Passo 4: Testar no Navegador

1. Acesse: `http://localhost:8080/cameras/iot`
2. **Pressione Ctrl+Shift+R** (hard reload - IMPORTANTE!)
3. Abra o console (F12)
4. Selecione uma câmera
5. Clique em "Iniciar câmera"
6. Verifique os logs no console

### Passo 5: Endpoint de Debug

Teste o novo endpoint de debug:

```powershell
curl http://localhost:5001/debug
```

**Verifique:**

- `running`: true
- `has_frame`: true
- `capture_thread_alive`: true ← **IMPORTANTE!**
- `frame_shape`: [altura, largura, 3]

Se `capture_thread_alive` for **false**, a thread parou!

## 🐛 Possíveis Causas

### 1. Thread de Captura Parou

**Sintoma:** `capture_thread_alive: false`

**Solução:**

```powershell
# Reinicie o serviço Python
python camera_web_service.py
```

### 2. Câmera Não Está Enviando Frames

**Sintoma:** Nenhum log "Processados X frames"

**Solução:**

- Verifique se outra aplicação está usando a câmera
- Tente outra câmera (outro ID)
- Reinicie o computador

### 3. Cache do Navegador

**Sintoma:** Mesmo após reiniciar, mostra a mesma imagem

**Solução:**

1. Feche TODAS as abas do navegador
2. Limpe o cache (Ctrl+Shift+Del)
3. Reabra o navegador
4. Pressione Ctrl+Shift+R ao carregar a página

### 4. OpenCV Travou

**Sintoma:** Python não mostra erros, mas não processa frames

**Solução:**

```powershell
# Instale/reinstale OpenCV
pip uninstall opencv-contrib-python -y
pip install opencv-contrib-python
```

## 📊 Checklist de Diagnóstico

Execute na ordem:

- [ ] Reiniciar serviço Python
- [ ] Executar `test_stream_live.py` → Deve mostrar frames diferentes
- [ ] Verificar logs: "Processados 100 frames"
- [ ] Testar `/debug` → `capture_thread_alive: true`
- [ ] Hard reload no navegador (Ctrl+Shift+R)
- [ ] Verificar console do navegador (F12) → sem erros
- [ ] Mover algo na frente da câmera → imagem deve mudar

## 🔄 Reset Completo

Se nada funcionar:

```powershell
# 1. Parar tudo
.\stop-all.ps1

# 2. Aguardar
Start-Sleep -Seconds 5

# 3. Limpar processos Python manualmente
Get-Process python* | Stop-Process -Force

# 4. Reiniciar
.\start.ps1

# 5. No navegador
# - Limpe cache (Ctrl+Shift+Del)
# - Acesse /cameras/iot
# - Ctrl+Shift+R
# - Teste novamente
```

## 📝 Informações para Reportar

Se o problema persistir, envie:

1. **Saída do `test_stream_live.py`**
2. **Saída de:** `curl http://localhost:5001/debug`
3. **Logs da janela Python** (últimas 50 linhas)
4. **Console do navegador** (F12 → Console)
5. **Qual câmera está usando** (ID e tipo: webcam, USB, etc.)
