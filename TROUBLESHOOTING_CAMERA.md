# 🔍 Troubleshooting - Stream da Câmera Não Aparece

## Passo 1: Verificar Console do Navegador

1. Abra a página: `http://localhost:8080/cameras/iot`
2. Pressione **F12** para abrir o Developer Tools
3. Vá na aba **Console**
4. Procure por mensagens com `[CAMERA]`
5. Anote qualquer erro em vermelho

## Passo 2: Testar Stream Direto

1. Abra o arquivo que criei: `test-camera-stream.html` no navegador
2. A página fará testes automaticamente
3. Clique em "Mostrar Stream" na seção 4
4. Se o stream aparecer aqui, o problema é na integração com o Thymeleaf

## Passo 3: Testar URL do Stream Diretamente

Abra no navegador:

```
http://localhost:5001/stream
```

**Resultado esperado:** Deve mostrar o feed da câmera diretamente.

## Passo 4: Verificar CORS

No console do navegador (F12), procure por erros como:

- `CORS policy`
- `Access-Control-Allow-Origin`

Se aparecer erro de CORS:

1. Reinicie o serviço Python (acabei de atualizar o CORS)
2. Certifique-se que está acessando via `http://localhost:8080` (não `127.0.0.1`)

## Passo 5: Verificar se a Câmera Está Rodando

No terminal onde está rodando `camera_web_service.py`, procure por:

```
[PY CAM] Captura iniciada.
```

Se não aparecer, a câmera não está ativa ainda.

## Passo 6: Recarregar Página Corretamente

1. Na página `/cameras/iot`, pressione **Ctrl+Shift+R** (hard reload)
2. Veja no console se aparece `[CAMERA] Carregando lista de câmeras...`
3. Selecione uma câmera no dropdown
4. Clique em "Iniciar câmera"
5. Veja se aparece `[CAMERA] Stream carregado com sucesso!`

## Problemas Comuns

### ❌ Stream não carrega (imagem quebrada)

**Causa:** Câmera não está enviando frames ou CORS bloqueando

**Solução:**

```powershell
# No terminal do Python, pare (Ctrl+C) e reinicie:
python camera_web_service.py
```

### ❌ Dropdown de câmeras vazio

**Causa:** Serviço Python não está rodando ou não detectou câmeras

**Solução:**

1. Verifique se `camera_web_service.py` está rodando
2. Teste: `curl http://localhost:5001/cameras`

### ❌ Erro "Indisponível" no status

**Causa:** Serviço Python não está acessível

**Solução:**

```powershell
cd "Disruptive Architectures IOT & IA"
python camera_web_service.py
```

### ❌ Imagem fica "escondida" (hidden)

**Causa:** JavaScript não está removendo a classe `hidden`

**Solução:** Verifique no console se há erros JavaScript

## Comandos Úteis

### Verificar se o serviço está rodando:

```powershell
curl http://localhost:5001/status
```

### Listar câmeras:

```powershell
curl http://localhost:5001/cameras
```

### Testar stream (salva primeiro frame):

```powershell
curl http://localhost:5001/stream --output test-frame.jpg
```

## Logs para Enviar se o Problema Persistir

Por favor, envie:

1. **Console do navegador** (F12 → Console) - copie tudo
2. **Logs do Python** (terminal onde roda camera_web_service.py)
3. **Resposta de:** `curl http://localhost:5001/cameras`
4. **Resposta de:** `curl http://localhost:5001/status`

---

## Solução Rápida (Reset Completo)

Se nada funcionar, faça reset completo:

```powershell
# 1. Pare tudo (Ctrl+C em todos os terminais)

# 2. Terminal 1 - Backend
.\start.ps1

# 3. Terminal 2 - Camera Service
cd "Disruptive Architectures IOT & IA"
python camera_web_service.py

# 4. Navegador
# Acesse: http://localhost:8080/cameras/iot
# Pressione Ctrl+Shift+R para hard reload
# Selecione câmera e clique "Iniciar"
```
