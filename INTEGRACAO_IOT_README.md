# 🔗 Integração IoT - Python + Java + React Native

## 📋 Visão Geral

Este projeto integra três componentes para detecção e gerenciamento de QR Codes ArUco:

1. **Python (IoT)** - Detector de ArUco Tags via câmera
2. **Java (Backend)** - API REST para gerenciamento de tags
3. **React Native (Mobile)** - App para escanear QR Codes com smartphone

---

## 🏗️ Arquitetura

```
┌─────────────────┐
│  Câmera Python  │
│   (IoT Device)  │
└────────┬────────┘
         │ HTTP POST
         ▼
┌─────────────────┐      ┌──────────────┐
│   Backend Java  │◄────►│  PostgreSQL  │
│   (Spring Boot) │      │   Database   │
└────────┬────────┘      └──────────────┘
         │ HTTP GET/POST
         ▼
┌─────────────────┐
│  Mobile React   │
│     Native      │
└─────────────────┘
```

---

## 🚀 Como Usar

### 1️⃣ Backend Java

**Iniciar o servidor:**

```bash
cd "Java Advanced/MottuFlowJava/MottuFlow"
./mvnw spring-boot:run
```

O servidor estará disponível em: `http://localhost:8080`

**Endpoints disponíveis:**

- `GET /api/aruco-tags/listar` - Lista todas as tags
- `POST /api/aruco-tags/cadastrar` - Cadastra nova tag
- `GET /api/aruco-tags/buscar-por-id/{id}` - Busca tag por ID
- `GET /api/aruco-tags/buscar-por-codigo/{codigo}` - Busca tag por código
- `DELETE /api/aruco-tags/deletar/{id}` - Remove tag

---

### 2️⃣ Detector Python (IoT)

**Instalar dependências:**

```bash
cd "Disruptive Architectures IOT & IA"
pip install opencv-contrib-python numpy requests ultralytics
```

**Executar o detector:**

```bash
python aruco_detector_api.py
```

**Controles do Detector:**

- `Q` - Sair
- `S` - Ativar/Desativar envio para API
- `L` - Listar tags cadastradas

**Configurações (aruco_detector_api.py):**

```python
API_BASE_URL = "http://localhost:8080/api/aruco-tags/cadastrar"
CAMERA_ID = 0  # 0 para webcam padrão
ENVIO_INTERVALO = 2  # segundos entre envios
```

---

### 3️⃣ Mobile React Native

**Instalar dependências:**

```bash
cd "Mobile Application/challenge-mottuflow/MottuFlow"
npm install expo-camera
# ou
yarn add expo-camera
```

**Atualizar o arquivo de estilos:**

Renomeie ou substitua o conteúdo de:

- `Source/Styles/vercamerasStyle.ts`

Pelo conteúdo de:

- `Source/Styles/vercamerasStyleNew.ts`

**Configurar URL da API:**

No arquivo `verCameras.tsx`, linha 18-19:

```typescript
// Para Android Emulator
const API_BASE_URL = "http://10.0.2.2:8080/api/aruco-tags";

// Para iOS Simulator
// const API_BASE_URL = 'http://localhost:8080/api/aruco-tags';

// Para dispositivo físico (substitua pelo seu IP)
// const API_BASE_URL = 'http://192.168.1.XXX:8080/api/aruco-tags';
```

**Executar o app:**

```bash
npx expo start
```

---

## 📱 Funcionalidades do Mobile

### Scanner de QR Code

- Abra o app e navegue até "Ver Câmeras"
- Toque em "📷 Escanear QR Code"
- Permita o acesso à câmera
- Aponte para um QR Code ArUco
- O código será detectado e enviado automaticamente para o backend

### Visualizar Tags

- A lista de tags é atualizada automaticamente
- Toque em "🔄 Atualizar Lista" para recarregar
- Cada tag mostra:
  - Código ArUco
  - Status (DETECTADO, etc.)
  - ID da Tag
  - ID da Moto associada

---

## 🎯 Formato do QR Code ArUco

Os QR Codes devem seguir o formato:

```
ARUCO-123
```

Onde `123` é o ID numérico do marcador ArUco.

### Gerar QR Codes ArUco

Você pode usar qualquer gerador de QR Code online com o texto no formato acima, ou usar o código Python:

```python
import cv2
import numpy as np

# Gerar marcador ArUco
aruco_dict = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_6X6_250)
marker_id = 123  # ID do marcador
marker_size = 200  # Tamanho em pixels

marker_image = cv2.aruco.generateImageMarker(aruco_dict, marker_id, marker_size)
cv2.imwrite(f'aruco_marker_{marker_id}.png', marker_image)
```

---

## 🔧 Troubleshooting

### Python não envia para Java

1. Verifique se o backend Java está rodando
2. Teste a conexão: `curl http://localhost:8080/api/aruco-tags/listar`
3. Verifique o firewall

### Mobile não conecta

1. **Android Emulator:** Use `http://10.0.2.2:8080`
2. **iOS Simulator:** Use `http://localhost:8080`
3. **Dispositivo Físico:** Use o IP da sua máquina (ex: `http://192.168.1.100:8080`)
4. Verifique se o backend permite CORS

### Câmera não abre no mobile

1. Verifique as permissões do app
2. No iOS: Adicione em `Info.plist`:
   ```xml
   <key>NSCameraUsageDescription</key>
   <string>Necessário para escanear QR Codes ArUco</string>
   ```

---

## 📊 Estrutura de Dados

### ArucoTag (Java/Database)

```json
{
  "idTag": 1,
  "codigo": "ARUCO-123",
  "status": "DETECTADO",
  "idMoto": 1
}
```

### Request POST (Python → Java)

```json
{
  "codigo": "ARUCO-123",
  "status": "DETECTADO",
  "idMoto": 1
}
```

---

## 🔐 Segurança

Para produção, considere:

- Autenticação JWT
- HTTPS
- Validação de dados
- Rate limiting
- CORS configurado corretamente

---

## 📝 Próximos Passos

- [ ] Adicionar autenticação
- [ ] Implementar WebSocket para atualizações em tempo real
- [ ] Adicionar histórico de detecções
- [ ] Dashboard web para monitoramento
- [ ] Notificações push no mobile
- [ ] Integração com múltiplas câmeras

---

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

---

## 📄 Licença

Este projeto é parte do MottuFlow Sprint 3.

---

## 👥 Equipe

Desenvolvido para o desafio MottuFlow 2025.
