# 🚀 MottuFlow - Guia de Inicialização Rápida

Sistema completo de gerenciamento de motos com detecção de ArUco tags via câmera IoT.

---

## ⚡ Início Rápido

### 1️⃣ Iniciar o Sistema

```powershell
.\start.ps1
```

**O que acontece:**

- ✅ Inicia o serviço Python da câmera (porta 5001)
- ✅ Inicia o backend Spring Boot com H2 (porta 8080)
- ✅ Abre automaticamente no navegador:
  - Página de login
  - Swagger UI

**Aguarde até ver:** `SISTEMA INICIADO COM SUCESSO!`

---

### 2️⃣ Fazer Login

Use uma das credenciais abaixo:

| Tipo      | E-mail            | Senha        |
| --------- | ----------------- | ------------ |
| **Admin** | `admin@email.com` | `adminmottu` |
| Mecânico  | `joao@email.com`  | `joao123`    |
| Gerente   | `maria@email.com` | `maria123`   |

---

### 3️⃣ Acessar a Câmera IoT

1. Após o login, navegue para: **Câmera IoT** (menu lateral)
2. Selecione uma câmera disponível no dropdown
3. Clique em **"Iniciar Câmera"**
4. Posicione uma ArUco tag na frente da câmera
5. A tag será detectada e enviada automaticamente para o sistema

---

### 4️⃣ Parar o Sistema

```powershell
.\stop.ps1
```

**O que acontece:**

- 🛑 Finaliza o serviço Python (porta 5001)
- 🛑 Finaliza o backend Spring Boot (porta 8080)
- 🛑 Limpa processos Java/Maven residuais

---

## 📚 Documentação Completa

- **[CAMERA_IOT_GUIA.md](CAMERA_IOT_GUIA.md)** - Guia técnico completo da câmera IoT
- **[INTEGRACAO_IOT_README.md](INTEGRACAO_IOT_README.md)** - Visão geral da integração IoT

---

## 🔗 Endpoints Principais

### Backend (Spring Boot)

| Endpoint          | URL                                           |
| ----------------- | --------------------------------------------- |
| 🔐 **Login**      | `http://localhost:8080/login`                 |
| 📸 **Câmera IoT** | `http://localhost:8080/cameras/iot`           |
| 📚 **Swagger**    | `http://localhost:8080/swagger-ui/index.html` |
| 🔌 **API REST**   | `http://localhost:8080/api`                   |

### Serviço Python (Câmera)

| Endpoint       | URL                             |
| -------------- | ------------------------------- |
| ✅ **Status**  | `http://localhost:5001/status`  |
| 📹 **Stream**  | `http://localhost:5001/stream`  |
| 📷 **Câmeras** | `http://localhost:5001/cameras` |
| 🔧 **Debug**   | `http://localhost:5001/debug`   |

---

## 🛠️ Requisitos

### Software Necessário

- ✅ **Java 21** ou superior (JDK)
- ✅ **Maven** (wrapper `mvnw` incluído)
- ✅ **Python 3.8+**

### Dependências Python

```powershell
cd "Disruptive Architectures IOT & IA"
pip install -r requirements.txt
```

**Ou instale manualmente:**

```powershell
pip install flask flask-cors opencv-python opencv-contrib-python requests numpy
```

---

## 🎥 Funcionalidades da Câmera IoT

- ✅ **Detecção automática** de câmeras disponíveis
- ✅ **Seleção de câmera** via dropdown
- ✅ **Detecção de ArUco tags** (DICT_6X6_250)
- ✅ **Stream ao vivo** com overlay de detecções
- ✅ **Envio automático** para API Java (com JWT)
- ✅ **CORS configurado** para integração web

---

## � Estrutura de Scripts

```
MottuFlow-complete/
├── start.ps1          ← ⚡ Inicia TODO o sistema (Python + Backend + Navegador)
└── stop.ps1           ← 🛑 Para TODO o sistema (mata processos Python + Java)
```

**Simples assim!** Apenas 2 scripts para gerenciar todo o ambiente.

---

## 🆘 Solução de Problemas

### ❌ Backend não respondeu na porta 8080

**Solução:**

1. Verifique a janela do Maven para erros
2. Certifique-se de que a porta 8080 não está em uso:
   ```powershell
   netstat -ano | findstr :8080
   ```
3. Execute `.\stop.ps1` e tente novamente

### ❌ Serviço Python pode não ter iniciado

**Solução:**

1. Verifique a janela do Python para erros
2. Instale as dependências:
   ```powershell
   cd "Disruptive Architectures IOT & IA"
   pip install -r requirements.txt
   ```
3. Teste manualmente:
   ```powershell
   python camera_web_service.py
   ```

### ❌ Nenhuma câmera detectada

**Solução:**

1. Conecte uma câmera USB ou use a câmera integrada do notebook
2. Verifique permissões de acesso à câmera no Windows
3. Acesse `http://localhost:8080/cameras/iot` e tente novamente
4. Verifique o endpoint de debug: `http://localhost:5001/debug`

---

## � Notas Importantes

- ⏱️ O backend pode levar **até 90 segundos** para iniciar completamente
- 🔄 Se algo falhar, execute `.\stop.ps1` antes de reiniciar
- 💾 Perfil **H2** usa banco de dados **em memória** (dados perdidos ao parar)
- 🎥 A câmera só é acessada quando você clica em **"Iniciar Câmera"**
- 🔑 ArUco Dictionary usado: **DICT_6X6_250**
- 🔐 Autenticação: JWT (gerado automaticamente pelo serviço Python)

---

## 📖 Informações Técnicas

### Banco de Dados

- **Tipo:** H2 (em memória)
- **Perfil:** `h2` (configurado automaticamente)
- **Nota:** Dados são resetados a cada reinício

### Segurança

- **Autenticação:** JWT
- **CORS:** Configurado para `localhost:8080`
- **Credenciais:** Carregadas via seed do Flyway

### Câmera IoT

- **Backend:** DirectShow (Windows)
- **Protocolo:** MJPEG Stream
- **Detecção:** ArUco DICT_6X6_250
- **Integração:** REST API com JWT

---

**Desenvolvido com ❤️ pela equipe MottuFlow**
