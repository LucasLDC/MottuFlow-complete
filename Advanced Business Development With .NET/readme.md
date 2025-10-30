<div align="center">
  <img src="https://github.com/thejaobiell/MottuFlowJava/blob/main/MottuFlow/src/main/resources/static/images/logo.png?raw=true" alt="MottuFlow" width="200"/>
  <h1>𝙈𝙤𝙩𝙩𝙪𝙁𝙡𝙤𝙬</h1>
</div>

![.NET](https://img.shields.io/badge/.NET-8-blue.svg)
![ASP.NET Core](https://img.shields.io/badge/ASP.NET%20Core-8.0-green.svg)
![Oracle](https://img.shields.io/badge/Oracle-19c-red.svg)
![xUnit](https://img.shields.io/badge/xUnit-2.5-orange.svg)

## 1. 🚀 Sobre o Projeto

**MottuFlow** é uma solução completa para gerenciamento de frotas de motocicletas, combinando **API REST** moderna com interface web intuitiva. Utiliza **visão computacional** e **ArUco Tags** para identificação automática de veículos, oferecendo controle total sobre funcionários, pátios, motos, câmeras e localização de ativos.

## 2. 👥 Integrantes

| Nome | RM | Turma |
|------|----|-------|
| João Gabriel Boaventura | 557854 | 2TDSB2025 |
| Léo Mota Lima | 557851 | 2TDSB2025 |
| Lucas Leal das Chagas | 551124 | 2TDSB2025 |

## 3. 📌 Justificativa da Arquitetura e Domínio

### Arquitetura
Arquitetura em camadas para **manutenção, escalabilidade e testes**:

| Camada | Função |
|--------|--------|
| **Controller** | Recebe requisições HTTP e retorna respostas |
| **Service** | Contém regras de negócio e processamento de dados |
| **Repository** | Gerencia o acesso ao banco de dados |
| **Data/DbContext** | Conecta e gerencia operações no banco de dados |

**DTOs** são usados para padronizar dados entre camadas.

### Domínio
| Entidade | Função |
|----------|-------|
| **Funcionário** | Organiza e monitora motos no pátio |
| **Moto** | Principal recurso para entregas e locação |
| **Pátio** | Local físico para armazenamento e organização das motos |

## 4. 🖼 Endpoints e Exemplos de Payloads

Abaixo estão listados os principais **endpoints da API**, separados por recurso, acompanhados de exemplos de payloads para facilitar os testes.

---

### 👥 Funcionários
```http
GET /api/funcionarios
POST /api/funcionarios
PUT /api/funcionarios/{id}
DELETE /api/funcionarios/{id}
```
**Exemplo POST/PUT**
```json
[
  {
    "nome": "Leonardo Mota",
    "cpf": "12345678900",
    "cargo": "Desenvolvedor",
    "telefone": "(11) 98765-4321",
    "email": "leonardo@email.com",
    "senha": "Senha123!"
  }
]
```
**Status codes esperados:** `200 OK`, `201 Created`, `400 Bad Request`, `404 Not Found`

---

### 🏪 Pátios
```http
GET /api/patios
POST /api/patios
PUT /api/patios/{id}
DELETE /api/patios/{id}
```
**Exemplo POST/PUT**
```json
[
  {
    "nome": "Patio Central",
    "endereco": "Rua das Flores, 123",
    "capacidadeMaxima": 50
  }
]
```

---

### 🏍️ Motos
```http
GET /api/motos
POST /api/motos
PUT /api/motos/{id}
DELETE /api/motos/{id}
```
**Exemplo POST/PUT**
```json
[
  {
    "placa": "ABC-1234",
    "modelo": "Honda CG 160",
    "fabricante": "Honda",
    "ano": 2023,
    "idPatio": 1,
    "localizacaoAtual": "Entrada Principal"
  }
]
```

---

### 📹 Câmeras
```http
GET /api/cameras
POST /api/cameras
PUT /api/cameras/{id}
DELETE /api/cameras/{id}
```
**Exemplo POST/PUT**
```json
[
  {
    "statusOperacional": "Ativa",
    "localizacaoFisica": "Entrada Principal",
    "idPatio": 1
  }
]
```

---

### 🏷️ ArUco Tags
```http
GET /api/arucotags
POST /api/arucotags
PUT /api/arucotags/{id}
DELETE /api/arucotags/{id}
```
**Exemplo POST/PUT**
```json
[
  {
    "codigo": "TAG-001",
    "status": "Ativo",
    "id_moto": 1
  }
]
```

---

### 🌐 Localidades
```http
GET /api/localidades
POST /api/localidades
```
**Exemplo POST**
```json
[
  {
    "dataHora": "2025-09-30T12:00:00",
    "pontoReferencia": "Entrada Principal",
    "idMoto": 1,
    "idPatio": 1,
    "idCamera": 1
  }
]
```

---

### 📍 Registro de Status
```http
GET /api/registro-status
POST /api/registro-status
```
**Exemplo POST**
```json
[
  {
  "TipoStatus": "Entrada",
  "Descricao": "Moto entrou no pátio",
  "DataStatus": "2025-09-30T12:00:00",
  "IdPatio": 1,
  "IdMoto": 1,
  "IdFuncionario": 1,
  "IdCamera": 1
  }
]
```

---

## 5. 🔗 HATEOAS
Todos os recursos retornam **links de navegação** seguindo o padrão **HATEOAS**, permitindo interação intuitiva entre endpoints:  

- `self` → Link para o próprio recurso  
- `update` → Link para atualizar o recurso  
- `delete` → Link para remover o recurso  

Esse padrão garante **descobribilidade**, facilitando o consumo da API e promovendo boas práticas REST.

---

## 6. 📌 Boas Práticas e Observações
- **Status Codes Utilizados:**
  - `200 OK` → Requisição bem-sucedida  
  - `201 Created` → Recurso criado com sucesso  
  - `204 No Content` → Recurso atualizado ou excluído, sem retorno de conteúdo  
  - `400 Bad Request` → Erro de requisição (parâmetros inválidos ou faltantes)  
  - `404 Not Found` → Recurso não encontrado  

- **Documentação no Swagger:**  
  Todos os endpoints estão descritos e exemplificados:  
  - Exemplos de requisição e resposta  
  - Descrição detalhada de parâmetros  
  - Estrutura de modelos de dados

---

## 7. ✅ Testes rápidos com cURL

### 🔹 1. Verificar se o Swagger está de pé
```bash
curl -i http://localhost:5224/swagger/index.html
```

### 🔹 2. Listar Funcionários (GET)
```bash
curl -i http://localhost:5224/api/funcionarios
```

### 🔹 3. Criar Funcionário (POST)
```bash
curl -X POST http://localhost:5224/api/funcionarios -H "Content-Type: application/json" -d '{
  "nome": "Teste API",
  "cpf": "12345678901",
  "cargo": "Dev",
  "telefone": "(11) 99999-9999",
  "email": "teste@api.com",
  "senha": "Senha123!"
}'
```

### 🔹 4. Health Check (Ping)
```bash
curl -i http://localhost:5224/api/health/ping
```
Resposta esperada:
```json
{ "status": "API rodando 🚀" }
```
