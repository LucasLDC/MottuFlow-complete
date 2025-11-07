# Guia - Câmera IoT para Detecção de ArUco Tags

## Como usar

### 1. Iniciar o sistema completo (RECOMENDADO)

**Usando o script automático:**

```powershell
.\start.ps1
```

Este script irá:

- ✅ Iniciar o serviço Python da câmera (porta 5001)
- ✅ Iniciar o backend Java com H2 (porta 8080)
- ✅ Abrir automaticamente:
  - `/login` - página de autenticação
  - `/swagger-ui/index.html` - documentação da API

### 2. Iniciar manualmente (alternativa)

**Terminal 1 - Serviço Python:**

```powershell
cd "Disruptive Architectures IOT & IA"
python camera_web_service.py
```

**Terminal 2 - Backend Java:**

```powershell
cd "Java Advanced\MottuFlowJava\MottuFlow"
$env:SPRING_PROFILES_ACTIVE='h2'
.\mvnw spring-boot:run
```

- Detectará câmeras disponíveis
- Processará frames para detectar ArUco tags
- Enviará detecções para a API Java (com JWT)
- Disponibilizará stream MJPEG

### 3. Acessar a página da câmera IoT

1. Após o login, navegue para: `http://localhost:8080/cameras/iot` (ou use o menu "Abrir Câmera (IoT)")
2. A página mostrará automaticamente as **câmeras disponíveis** no sistema
3. **Selecione a câmera** que deseja usar no dropdown
4. Clique em **"Iniciar câmera"**
5. O preview da câmera aparecerá e começará a detectar ArUco tags
6. Tags detectadas são automaticamente enviadas para o backend Java

### 4. Parar o sistema

**Usando o script automático:**

```powershell
.\stop-all.ps1
```

Ou feche manualmente as janelas PowerShell abertas pelo `start.ps1`.

- As ArUco tags detectadas aparecem no preview com:
  - Borda verde ao redor do marcador
  - ID da tag sobreposto
- No canto superior esquerdo: contador de tags detectadas
- As detecções são enviadas para `/api/aruco-tags/cadastrar` (JWT automático)

### 5. Visualizar detecções

- As ArUco tags detectadas aparecem no preview com:
  - Borda verde ao redor do marcador
  - ID da tag sobreposto
- No canto superior esquerdo: contador de tags detectadas
- As detecções são enviadas para `/api/aruco-tags/cadastrar` (JWT automático)

### 6. Parar a câmera

- Clique em **"Parar câmera"**
- A câmera será liberada e o preview desaparecerá

## Troubleshooting

### "Nenhuma câmera detectada"

- Verifique se há webcam/câmera conectada ao computador
- Verifique se outra aplicação não está usando a câmera
- Tente desconectar e reconectar a câmera USB
- Recarregue a página para detectar novamente

### "Erro ao carregar"

- Certifique-se de que `camera_web_service.py` está rodando
- Verifique se a porta 5001 está livre
- Verifique logs do serviço Python no terminal

### "ArUco tags não são detectadas"

- Certifique-se de usar ArUco tags do dicionário DICT_6X6_250
- Mantenha a tag bem iluminada e em foco
- Mantenha a tag plana e perpendicular à câmera
- Use o script `gerar_aruco_markers.py` para gerar tags válidas

### Stream não aparece

- Verifique se clicou em "Iniciar câmera" primeiro
- Verifique permissões de câmera do navegador
- Tente outro navegador (recomendado: Chrome/Edge)

## Credenciais de teste

**Usuário admin:**

- Email: `admin@email.com`
- Senha: `adminmottu`

## Arquitetura

```
┌─────────────┐      HTTP/REST      ┌──────────────┐
│  Frontend   │────────────────────>│ Backend Java │
│ (Thymeleaf) │                      │  (Spring)    │
└──────┬──────┘                      └──────────────┘
       │                                    ▲
       │ CORS                               │ JWT
       │ /cameras                           │
       │ /start (camera_id)                 │
       │ /stop                              │
       │ /stream                            │
       │                                    │
       ▼                                    │
┌─────────────┐      POST /api/aruco-tags/cadastrar
│   Python    │────────────────────────────┘
│   Flask     │    (Authorization: Bearer TOKEN)
│  + OpenCV   │
└─────────────┘
```

## Próximos passos opcionais

- [ ] Auto-start do serviço Python via `start.ps1`
- [ ] Backend proxy para `/stream` (evitar CORS)
- [ ] Histórico de detecções na UI
- [ ] Configuração de tamanho/dicionário de ArUco via UI
- [ ] Suporte para múltiplas câmeras simultâneas
