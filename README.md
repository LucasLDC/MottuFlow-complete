<div align="center">
  <h1>🏍️ MottuFlow - Sistema Completo de Gerenciamento de Frotas</h1>
  <p><strong>Sistema Integrado IoT + Backend + Mobile para Controle Inteligente de Motocicletas</strong></p>
</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Integrantes](#-integrantes)
- [Arquitetura do Sistema](#-arquitetura-do-sistema)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Funcionalidades](#-funcionalidades)
- [Instalação e Configuração](#-instalação-e-configuração)
- [Componentes do Sistema](#-componentes-do-sistema)
- [API Endpoints](#-api-endpoints)
- [Banco de Dados](#-banco-de-dados)
- [Como Executar](#-como-executar)
- [Testes](#-testes)
- [Recursos Avançados](#-recursos-avançados)

---

## 🎯 Sobre o Projeto

O **MottuFlow** é uma solução completa e integrada para gerenciamento de frotas de motocicletas, desenvolvido para otimizar o controle de veículos, operações logísticas e fluxo de entrada e saída de motos em pátios da Mottu.

### Diferenciais

✅ **Visão Computacional** - Detecção automática de motos e ArUco Tags  
✅ **API REST Robusta** - Backend .NET 8 com Oracle Database  
✅ **Mobile Multiplataforma** - App React Native com Expo  
✅ **IoT Integration** - Detector Python com câmeras em tempo real  
✅ **HATEOAS** - API autodescritiva seguindo padrões REST  
✅ **Otimizações** - Connection Pool, GZIP, Batch Processing  
✅ **Segurança** - JWT com refresh tokens automáticos  

---

## 👥 Integrantes

| Nome | RM | Turma |
|------|-----|-------|
| João Gabriel Boaventura Marques e Silva | RM554874 | 2TDSB2025 |
| Léo Mota Lima | RM557851 | 2TDSB2025 |
| Lucas Leal das Chagas | RM551124 | 2TDSB2025 |

---

## 🏗️ Arquitetura do Sistema

```
┌─────────────────────────────────────────────────────────────┐
│                     MOTTUFLOW ECOSYSTEM                      │
└─────────────────────────────────────────────────────────────┘

┌──────────────────┐         ┌──────────────────┐
│  Câmera IoT      │         │  Mobile App      │
│  (Python)        │         │  (React Native)  │
│                  │         │                  │
│  - YOLOv8        │         │  - Expo          │
│  - ArUco Detect  │         │  - QR Scanner    │
│  - Real-time CV  │         │  - JWT Auth      │
└────────┬─────────┘         └────────┬─────────┘
         │                            │
         │ HTTP POST                  │ HTTP GET/POST
         │ (ArUco Tags)               │ (CRUD Operations)
         │                            │
         ▼                            ▼
┌─────────────────────────────────────────────────────┐
│              BACKEND API (.NET 8)                   │
│                                                     │
│  Controllers → Services → Repositories → DbContext  │
│                                                     │
│  - HATEOAS Links                                   │
│  - DTO Validation                                  │
│  - Swagger Documentation                           │
│  - Connection Pool (HikariCP)                      │
│  - GZIP Compression                                │
└────────────────────┬────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────┐
│            ORACLE DATABASE 19c                      │
│                                                     │
│  Tables: Funcionario, Patio, Moto, ArucoTag,      │
│          Camera, Localidade, RegistroStatus        │
│                                                     │
│  - Sequences & Triggers                            │
│  - Constraints & Foreign Keys                      │
│  - Auditoria & Fact Tables                         │
└─────────────────────────────────────────────────────┘
```

### Fluxo de Dados

1. **Detecção IoT**: Câmera Python detecta moto + ArUco Tag
2. **Envio para API**: POST para backend com dados do marcador
3. **Persistência**: Backend valida e salva no Oracle Database
4. **Mobile Sync**: App mobile consulta e exibe dados atualizados
5. **Auditoria**: Sistema registra todas operações para compliance

---

## 🛠️ Tecnologias Utilizadas

### Backend (.NET)
- **ASP.NET Core 8.0** - Framework web moderno
- **Entity Framework Core** - ORM para Oracle
- **Oracle Database 19c** - Banco de dados relacional
- **Swagger/OpenAPI** - Documentação automática
- **xUnit** - Framework de testes

### IoT/Visão Computacional (Python)
- **OpenCV** - Processamento de imagens
- **YOLOv8** - Detecção de objetos (motos)
- **ArUco** - Detecção de marcadores
- **NumPy** - Operações matemáticas
- **Requests** - Cliente HTTP

### Mobile (React Native)
- **Expo** - Framework React Native
- **TypeScript** - Tipagem estática
- **Expo Camera** - Acesso à câmera
- **AsyncStorage** - Persistência local
- **Axios** - Cliente HTTP

### DevOps & Database
- **PowerShell** - Scripts de automação
- **Git/GitHub** - Versionamento
- **Oracle SQL Developer** - Gerenciamento DB

---

## ⚡ Funcionalidades

### 🎥 Sistema de Visão Computacional
- Detecção em tempo real de motocicletas usando YOLOv8
- Identificação de marcadores ArUco (DICT_6X6_250)
- Cálculo automático de distância da câmera
- Suporte a múltiplas fontes (webcam, vídeo, imagem)
- Interface visual com caixas delimitadoras

### 🔌 API Backend
- CRUD completo para 7 entidades principais
- Paginação automática de resultados
- HATEOAS para navegação intuitiva
- Validação de dados com DTOs
- Health check endpoint
- Swagger UI interativo

### 📱 Aplicativo Mobile
- Scanner de QR Code ArUco nativo
- Visualização de tags em tempo real
- Atualização automática de listas
- Autenticação JWT com refresh tokens
- Interface responsiva e intuitiva

### 🔐 Segurança
- Autenticação JWT
- Refresh tokens automáticos
- Validação de CPF/Email únicos
- Senhas criptografadas
- Auditoria de operações

---

## 📦 Instalação e Configuração

### Pré-requisitos

```bash
# Backend
- .NET SDK 8.0+
- Oracle Database 19c
- Visual Studio 2022 / VS Code

# IoT
- Python 3.8+
- Webcam ou câmera USB

# Mobile
- Node.js 18+
- Expo CLI
- Android Studio / Xcode (opcional)
```

### 1️⃣ Configurar Banco de Dados

```sql
-- Executar o script SQL
sqlplus usuario/senha@localhost:1521/XEPDB1

@"Mastering Relational and Non-Relational Database/2TDSB_2025_CodigoSql_Integrantes.sql"
```

### 2️⃣ Instalar Dependências Backend

```bash
cd "Advanced Business Development With .NET"
dotnet restore
dotnet build
```

Configurar `appsettings.json`:
```json
{
  "ConnectionStrings": {
    "OracleDb": "User Id=seu_usuario;Password=sua_senha;Data Source=localhost:1521/XEPDB1"
  },
  "UseInMemoryDatabase": false
}
```

### 3️⃣ Instalar Dependências IoT

```bash
cd "Disruptive Architectures IOT & IA"
pip install opencv-contrib-python ultralytics numpy requests
```

### 4️⃣ Instalar Dependências Mobile

```bash
cd "Mobile Application/challenge-mottuflow/MottuFlow"
npm install
# ou
yarn install
```

---

## 🚀 Como Executar

### Opção 1: Script Automatizado (Recomendado)

```powershell
# No diretório raiz do projeto
.\start.ps1
```

Este script irá:
- ✅ Verificar MySQL/Oracle
- ✅ Iniciar backend Java (porta 8080)
- ✅ Iniciar mobile Expo (porta 8081)
- ✅ Mostrar URLs de acesso

### Opção 2: Manual

#### Backend .NET
```bash
cd "Advanced Business Development With .NET"
dotnet run
```
Acesse: `http://localhost:5224/swagger`

#### Detector IoT
```bash
cd "Disruptive Architectures IOT & IA"
python aruco_detector_api.py
```

Controles:
- `Q` - Sair
- `S` - Ativar/Desativar envio API
- `L` - Listar tags cadastradas

#### Mobile App
```bash
cd "Mobile Application/challenge-mottuflow/MottuFlow"
npx expo start
```

Escaneie o QR Code com o app **Expo Go**

---

## 📡 Componentes do Sistema

### 1. Backend API (.NET)

#### Arquitetura em Camadas

```
Controllers/          → Recebe requisições HTTP
    ├── ArucoTagController.cs
    ├── MotoController.cs
    ├── PatioController.cs
    └── ...
    
Services/            → Lógica de negócio
    ├── ArucoTagService
    ├── MotoService
    └── ...
    
Repositories/        → Acesso a dados
    ├── ArucoTagRepository
    ├── MotoRepository
    └── ...
    
Data/                → DbContext
    └── AppDbContext.cs
    
DTOs/                → Transferência de dados
    ├── ArucoTagInputDTO.cs
    ├── ArucoTagOutputDTO.cs
    └── ...
    
Models/              → Entidades
    ├── ArucoTag.cs
    ├── Moto.cs
    └── ...
```

#### Principais Entidades

**Funcionário**
- Gerencia operadores do sistema
- CPF e email únicos
- Refresh tokens para autenticação

**Moto**
- Placa, modelo, fabricante, ano
- Localização atual
- Vinculada a um pátio

**Pátio**
- Nome, endereço, capacidade máxima
- Gerencia múltiplas motos

**ArUco Tag**
- Código único (ARUCO-XXX)
- Status (DETECTADO, ATIVO, INATIVO)
- Vinculada a uma moto

**Câmera**
- Status operacional
- Localização física
- Vinculada a um pátio

**Localidade**
- Histórico de posições
- Data/hora, ponto de referência
- Relaciona moto, pátio e câmera

**Registro de Status**
- Auditoria de operações
- Entrada/saída de motos
- Histórico completo

---

### 2. Sistema IoT (Python)

#### Detector de ArUco Tags

**Funcionalidades:**
- Captura de vídeo em tempo real
- Detecção de motos com YOLOv8
- Identificação de marcadores ArUco
- Cálculo de distância (metros)
- Envio automático para API

**Configurações principais:**
```python
API_BASE_URL = "http://localhost:8080/api/aruco-tags/cadastrar"
CAMERA_ID = 0  # Webcam padrão
ENVIO_INTERVALO = 2  # segundos
ARUCO_DICT = cv2.aruco.DICT_6X6_250
```

**Formato de envio:**
```json
{
  "codigo": "ARUCO-123",
  "status": "DETECTADO",
  "idMoto": 1
}
```

---

### 3. Aplicativo Mobile (React Native)

#### Funcionalidades

**Scanner QR Code:**
- Leitura nativa de QR Codes ArUco
- Envio automático para backend
- Feedback visual de sucesso/erro

**Gerenciamento de Tags:**
- Lista todas as tags cadastradas
- Atualização em tempo real
- Exibição de status e associações

**Autenticação:**
- Login com email/senha
- JWT com refresh automático
- Logout seguro

#### Configuração de URL

```typescript
// Android Emulator
const API_BASE_URL = "http://10.0.2.2:8080/api/aruco-tags";

// iOS Simulator
const API_BASE_URL = "http://localhost:8080/api/aruco-tags";

// Dispositivo físico (substitua pelo seu IP)
const API_BASE_URL = "http://192.168.1.XXX:8080/api/aruco-tags";
```

---

## 🔗 API Endpoints

### Base URL
```
http://localhost:5224/api
```

### Funcionários
```http
GET    /api/funcionarios              # Listar todos
GET    /api/funcionarios/{id}         # Buscar por ID
POST   /api/funcionarios              # Criar novo
PUT    /api/funcionarios/{id}         # Atualizar
DELETE /api/funcionarios/{id}         # Deletar
```

**Exemplo POST:**
```json
{
  "nome": "Leonardo Mota",
  "cpf": "12345678900",
  "cargo": "Desenvolvedor",
  "telefone": "(11) 98765-4321",
  "email": "leonardo@email.com",
  "senha": "Senha123!"
}
```

### Motos
```http
GET    /api/motos                     # Listar todas
GET    /api/motos/{id}                # Buscar por ID
POST   /api/motos                     # Criar nova
PUT    /api/motos/{id}                # Atualizar
DELETE /api/motos/{id}                # Deletar
GET    /api/motos/patio/{idPatio}     # Por pátio
```

**Exemplo POST:**
```json
{
  "placa": "ABC-1234",
  "modelo": "Honda CG 160",
  "fabricante": "Honda",
  "ano": 2023,
  "idPatio": 1,
  "localizacaoAtual": "Entrada Principal"
}
```

### Pátios
```http
GET    /api/patios                    # Listar todos
GET    /api/patios/{id}               # Buscar por ID
POST   /api/patios                    # Criar novo
PUT    /api/patios/{id}               # Atualizar
DELETE /api/patios/{id}               # Deletar
```

**Exemplo POST:**
```json
{
  "nome": "Patio Central",
  "endereco": "Rua das Flores, 123",
  "capacidadeMaxima": 50
}
```

### ArUco Tags
```http
GET    /api/arucotags                 # Listar todas
GET    /api/arucotags/{id}            # Buscar por ID
POST   /api/arucotags                 # Criar nova
PUT    /api/arucotags/{id}            # Atualizar
DELETE /api/arucotags/{id}            # Deletar
GET    /api/arucotags/codigo/{codigo} # Por código
```

**Exemplo POST:**
```json
{
  "codigo": "ARUCO-123",
  "status": "ATIVO",
  "idMoto": 1
}
```

### Câmeras
```http
GET    /api/cameras                   # Listar todas
GET    /api/cameras/{id}              # Buscar por ID
POST   /api/cameras                   # Criar nova
PUT    /api/cameras/{id}              # Atualizar
DELETE /api/cameras/{id}              # Deletar
```

### Localidades
```http
GET    /api/localidades               # Listar todas
POST   /api/localidades               # Criar nova
GET    /api/localidades/moto/{idMoto} # Por moto
```

### Registro de Status
```http
GET    /api/registro-status           # Listar todos
POST   /api/registro-status           # Criar novo
GET    /api/registro-status/moto/{id} # Por moto
```

### Health Check
```http
GET    /api/health/ping               # Verificar status
```

**Resposta:**
```json
{
  "status": "API rodando 🚀",
  "timestamp": "2025-10-30T12:00:00Z"
}
```

---

## 💾 Banco de Dados

### Modelo Relacional

```sql
FUNCIONARIO (id_funcionario, nome, cpf, cargo, telefone, email, senha)
    ↓
PATIO (id_patio, nome, endereco, capacidade_maxima)
    ↓
MOTO (id_moto, placa, modelo, fabricante, ano, id_patio, localizacao_atual)
    ↓
ARUCO_TAG (id_tag, codigo, status, id_moto)
    ↓
CAMERA (id_camera, status_operacional, localizacao_fisica, id_patio)
    ↓
LOCALIDADE (id_localidade, data_hora, ponto_referencia, id_moto, id_patio, id_camera)
    ↓
REGISTRO_STATUS (id_registro, tipo_status, descricao, data_status, id_patio, id_moto, id_funcionario, id_camera)
```

### Sequences e Triggers

Todas as tabelas possuem:
- **Sequence** para auto-incremento
- **Trigger** para popular ID automaticamente

Exemplo:
```sql
CREATE SEQUENCE seq_funcionario START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_funcionario
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
  :NEW.id_funcionario := seq_funcionario.NEXTVAL;
END;
```

### Constraints

- **Primary Keys** em todas as tabelas
- **Foreign Keys** para integridade referencial
- **Unique** em CPF, Email, Placa
- **Not Null** em campos obrigatórios

---

## 🧪 Testes

### Testes Rápidos com cURL

**1. Health Check**
```bash
curl -i http://localhost:5224/api/health/ping
```

**2. Listar Funcionários**
```bash
curl -i http://localhost:5224/api/funcionarios
```

**3. Criar Funcionário**
```bash
curl -X POST http://localhost:5224/api/funcionarios \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Teste API",
    "cpf": "12345678901",
    "cargo": "Dev",
    "telefone": "(11) 99999-9999",
    "email": "teste@api.com",
    "senha": "Senha123!"
  }'
```

**4. Listar Motos**
```bash
curl -i http://localhost:5224/api/motos
```

### Status Codes

- `200 OK` - Requisição bem-sucedida
- `201 Created` - Recurso criado
- `204 No Content` - Atualização/exclusão sem retorno
- `400 Bad Request` - Dados inválidos
- `404 Not Found` - Recurso não encontrado
- `500 Internal Server Error` - Erro no servidor

---

## 🎨 Recursos Avançados

### 1. HATEOAS (Hypermedia)

Todos os recursos retornam links de navegação:

```json
{
  "idMoto": 1,
  "placa": "ABC-1234",
  "modelo": "Honda CG 160",
  "links": [
    {
      "rel": "self",
      "href": "/api/motos/1",
      "method": "GET"
    },
    {
      "rel": "update",
      "href": "/api/motos/1",
      "method": "PUT"
    },
    {
      "rel": "delete",
      "href": "/api/motos/1",
      "method": "DELETE"
    }
  ]
}
```

### 2. Paginação

```http
GET /api/motos?pageNumber=1&pageSize=10
```

**Resposta:**
```json
{
  "items": [...],
  "pageNumber": 1,
  "pageSize": 10,
  "totalPages": 5,
  "totalCount": 50,
  "hasPreviousPage": false,
  "hasNextPage": true
}
```

### 3. Otimizações de Performance

#### Connection Pool (HikariCP)
```properties
# application.properties
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=5
spring.datasource.hikari.connection-timeout=20000
```

#### Compressão GZIP
```csharp
// Program.cs
builder.Services.AddResponseCompression(options => {
    options.EnableForHttps = true;
    options.Providers.Add<GzipCompressionProvider>();
});
```

#### Batch Processing
```csharp
// Operações em lote (20 registros por vez)
await context.SaveChangesAsync();
```

### 4. Swagger UI Customizado

Acesse: `http://localhost:5224/swagger`

- Documentação interativa completa
- Exemplos de requisição/resposta
- Teste de endpoints direto no navegador
- Schemas de todos os DTOs

---

## 🔧 Troubleshooting

### Backend não inicia

```bash
# Verificar conexão com Oracle
sqlplus usuario/senha@localhost:1521/XEPDB1

# Verificar porta 5224
netstat -ano | findstr :5224

# Limpar build
dotnet clean
dotnet build
```

### Python não detecta marcadores

1. Verificar câmera está conectada
2. Testar com `cv2.VideoCapture(0)`
3. Baixar modelo YOLOv8: `yolo task=detect mode=predict model=yolov8n.pt`

### Mobile não conecta na API

**Android Emulator:**
```typescript
const API_BASE_URL = "http://10.0.2.2:8080";
```

**iOS Simulator:**
```typescript
const API_BASE_URL = "http://localhost:8080";
```

**Dispositivo físico:**
```bash
# Descobrir seu IP
ipconfig
# Use o IPv4 Address
const API_BASE_URL = "http://192.168.1.100:8080";
```

### Erro de CORS

No backend, adicione em `Program.cs`:
```csharp
builder.Services.AddCors(options => {
    options.AddPolicy("AllowAll", builder => {
        builder.AllowAnyOrigin()
               .AllowAnyMethod()
               .AllowAnyHeader();
    });
});

app.UseCors("AllowAll");
```

---

## 📚 Documentação Adicional

- `OTIMIZACOES.md` - Detalhes de performance
- `README_OTIMIZADO.md` - Changelog de melhorias
- `INTEGRACAO_IOT_README.md` - Guia de integração IoT
- `Advanced Business Development With .NET/readme.md` - Documentação API
- `Disruptive Architectures IOT & IA/REDME.md` - Visão computacional

---

## 🎯 Roadmap Futuro

- [ ] Autenticação OAuth2
- [ ] WebSocket para atualizações real-time
- [ ] Dashboard web administrativo
- [ ] Notificações push no mobile
- [ ] Múltiplas câmeras simultâneas
- [ ] Machine Learning para previsão de fluxo
- [ ] Relatórios analíticos em PDF
- [ ] Integração com AWS/Azure

---

## 📄 Licença

Este projeto foi desenvolvido como parte do desafio acadêmico MottuFlow 2025.

---

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch: `git checkout -b feature/nova-feature`
3. Commit: `git commit -m 'Adiciona nova feature'`
4. Push: `git push origin feature/nova-feature`
5. Abra um Pull Request

---

## 📞 Contato

Para dúvidas ou sugestões, entre em contato com a equipe através do GitHub.

---

<div align="center">
  <p>Desenvolvido com ❤️ pela equipe MottuFlow</p>
  <p><strong>Sprint 3 - 2025</strong></p>
</div>
