<div align="center">
  <img src="https://github.com/thejaobiell/MottuFlowJava/blob/main/MottuFlow/src/main/resources/static/images/logo.png?raw=true" alt="MottuFlow" width="200"/>
  <h1>𝙈𝙤𝙩𝙩𝙪𝙁𝙡𝙤𝙬</h1>
</div>

![Java](https://img.shields.io/badge/Java-21-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)
![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.x-lightgreen.svg)

**MottuFlow** é uma solução completa para gerenciamento de frotas de motocicletas, desenvolvida com arquitetura híbrida que combina **API REST** moderna com interface web intuitiva. O sistema utiliza **visão computacional** e **ArUco Tags** para identificação automática de veículos, oferecendo controle total sobre funcionários, pátios, motos, câmeras e localização de ativos.

## 🎯 Visão Geral

O MottuFlow foi desenvolvido como parte de um projeto acadêmico integrando as disciplinas de **Internet of Things (IoT)** e **Mobile Application Development**. A solução oferece:

- **📱 Arquitetura Híbrida**: API REST para integração mobile + Interface web Thymeleaf
- **🔒 Segurança Robusta**: Autenticação JWT e Spring Security
- **📊 Gestão Completa**: Controle de funcionários, frotas, pátios e status em tempo real

### 🎥 Demonstração

[![Ver demonstração no YouTube](https://img.shields.io/badge/YouTube-Ver%20Demonstração-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=sNgxuqE-NmI)

### 🔗 Recursos Externos

- **[📂 Repositório GitHub](https://github.com/thejaobiell/MottuFlowJava)**
- **[🔌 Collection Postman](https://github.com/thejaobiell/MottuFlowJava/blob/main/MottuFlow/jsonsAPIREST/API%20-%20MottuFlow.postman_collection.json)**

## ✨ Funcionalidades

### 🏢 Módulos Principais

| Módulo | Descrição | Funcionalidades |
|--------|-----------|-----------------|
| **👥 Funcionários** | Gestão de Funcionários | CRUD completo, perfis de acesso, histórico |
| **🏪 Pátios** | Gerenciamento de locais | Cadastro, monitoramento, capacidade |
| **🏍️ Motos** | Controle de frota | Registro, status, localização, manutenção |
| **📹 Câmeras** | Sistema de monitoramento | Configuração e status |
| **🏷️ ArUco Tags** | Identificação visual | Cadastro e rastreamento |
| **📍 Status & Localização** | Tracking em tempo real | Posição, disponibilidade, alertas |

### 🚀 Recursos Avançados

- ✅ **API REST Completa** - Documentação OpenAPI/Swagger
- ✅ **Interface Web Responsiva** - Thymeleaf + Bootstrap
- ✅ **Autenticação Segura** - JWT + Spring Security
- ✅ **Migração de Dados** - Flyway para versionamento de BD
- ✅ **Validação de Dados** - Bean Validation integrado

## 🛠️ Tecnologias

### Backend Core
- **Java 21** - LTS com recursos modernos
- **Spring Boot 3.x** - Framework principal
- **Spring Data JPA** - Persistência de dados
- **Spring Security** - Autenticação e autorização
- **Spring Web** - API REST

### Database & Migration
- **MySQL 8.0** - Banco de dados principal
- **Flyway** - Controle de versão do schema
- **HikariCP** - Pool de conexões otimizado

### Frontend & Templates
- **Thymeleaf** - Engine de templates

## 🏗️ Arquitetura

```
MottuFlow/
├── 📁 src/main/java/com/sprint/MottuFlow/
│   ├── 📁 controller/         # Controladores REST e Web
│   │   ├── 📁 rest/           # Endpoints API REST
│   │   └── 📁 web/            # Controladores Thymeleaf
│   ├── 📁 domain/             # Entidades de domínio (com Model, Repository, Service e DTO)
│   │   ├── 📁 arucotag/       # ArUco Tags
│   │   ├── 📁 autenticao/     # Autenticação
│   │   ├── 📁 camera/         # Câmeras
│   │   ├── 📁 funcionario/    # Funcionários
│   │   ├── 📁 localidade/     # Localidades
│   │   ├── 📁 moto/           # Motocicletas
│   │   ├── 📁 patio/          # Pátios
│   │   └── 📁 status/         # Status das motos
│   ├── 📁 infra/              # Infraestrutura
│   │   ├── 📁 exception/      # Tratamento de exceções
│   │   └── 📁 security/       # Configurações de segurança
│   └── 📄 MottuFlowApplication.java
├── 📁 src/main/resources/
│   ├── 📁 db/migration/       # Scripts Flyway
│   ├── 📁 static/             # Recursos estáticos
│   │   ├── 📁 css/            # Arquivos CSS
│   │   └── 📁 images/         # Imagens
│   ├── 📁 templates/          # Templates Thymeleaf
│   │   ├── 📁 arucotags/      # Templates ArUco Tags
│   │   ├── 📁 cameras/        # Templates Câmeras
│   │   ├── 📁 components/     # Componentes reutilizáveis
│   │   ├── 📁 funcionarios/   # Templates Funcionários
│   │   ├── 📁 localidades/    # Templates Localidades
│   │   ├── 📁 motos/          # Templates Motocicletas
│   │   ├── 📁 patios/         # Templates Pátios
│   │   └── 📁 status/         # Templates Status
│   └── 📄 application.properties
└── 📄 pom.xml                 # Dependências Maven
```

## 💾 Instalação

### 📋 Pré-requisitos

- **Java 21+** ([OpenJDK](https://openjdk.org/install/) ou [Oracle JDK](https://www.oracle.com/java/technologies/downloads/))
- **MySQL 8.0+** ([Download](https://dev.mysql.com/downloads/mysql/))
- **Maven 3.8+** ([Download](https://maven.apache.org/download.cgi))
- **Git** ([Download](https://git-scm.com/downloads))

### 🔧 Instalação Rápida

#### Via Terminal (Linux/macOS/WSL)

```bash
# Clone o repositório
git clone https://github.com/thejaobiell/MottuFlowJava.git
cd MottuFlowJava/MottuFlow

# Execute a aplicação (baixa dependências automaticamente)
./mvnw spring-boot:run
```

#### Via Windows PowerShell

```powershell
# Clone o repositório
git clone https://github.com/thejaobiell/MottuFlowJava.git
cd MottuFlowJava\MottuFlow

# Execute a aplicação
.\mvnw.cmd spring-boot:run
```

### 🔨 IDEs Suportadas

<details>
<summary><b>🚀 IntelliJ IDEA (Recomendado)</b></summary>

1. **File** → **Open**
2. Selecione a pasta `MottuFlow` (contém `pom.xml`)
3. Aguarde o IntelliJ importar as dependências Maven
4. Execute `MottuFlowApplication.java` → **Run**

</details>

<details>
<summary><b>🌙 Eclipse IDE</b></summary>

1. **File** → **Import** → **Maven** → **Existing Maven Projects**
2. **Browse** → Selecione pasta `MottuFlow`
3. Marque o `pom.xml` → **Finish**
4. **Run As** → **Spring Boot App**

</details>

<details>
<summary><b>💻 VS Code</b></summary>

1. Instale as extensões: **Java Extension Pack**, **Spring Boot Extension Pack**
2. Abra a pasta `MottuFlow`
3. **Ctrl+Shift+P** → "Spring Boot: Run"

</details>

---

## ⚙️ Configuração

### 🗄️ Banco de Dados MySQL

#### 1. Instalação MySQL

##### 🔹 **Linux (Ubuntu/Debian)**

```bash
sudo apt update
sudo apt install mysql-server mysql-client
sudo mysql_secure_installation
```

---

##### 🔹 **Windows**

1. Baixe o **MySQL Installer**:
   👉 [Download MySQL Installer](https://dev.mysql.com/downloads/installer/)

2. Durante a instalação, escolha:

   * **Server Only** (somente servidor) ou **Full** (se quiser Workbench e utilitários).
   * Configure a senha do usuário `root`.

3. Após a instalação, inicie o MySQL.

4. Para acessar via terminal do Windows:

   * Pressione `Win + R`, digite `cmd` e execute:

   ```bash
   mysql -u root -p
   ```

   * Digite a senha configurada.

#### 2. Criação do Usuário e Banco

```sql
-- Execute no MySQL como root
CREATE USER 'mottu_user'@'%' IDENTIFIED BY 'user123';
GRANT ALL PRIVILEGES ON mottuflow.* TO 'mottu_user'@'%';
FLUSH PRIVILEGES;
```

> Se quiser restringir só para a máquina local, use `'localhost'` no lugar de `%`.

---

#### 3. Configuração da Aplicação (`src/main/resources/application.properties`)

```properties
spring.application.name=MottuFlow

spring.datasource.url=jdbc:mysql://localhost:3306/mottuflow?createDatabaseIfNotExist=true

spring.datasource.username= # COLOQUE O SEU USUÁRIO
spring.datasource.password= # COLOQUE A SUA SENHA

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.database-platform=org.hibernate.dialect.MySQL8Dialect

spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
spring.flyway.repair=true
spring.flyway.repair-on-migrate=true

logging.level.root=WARN

logging.level.org.springframework=WARN
logging.level.org.hibernate=WARN
logging.level.com.mysql.cj=WARN
logging.level.oracle.jdbc=WARN
logging.level.org.apache.tomcat=WARN
logging.level.org.apache.catalina=WARN
logging.level.org.springframework.security=WARN
logging.level.org.springframework.web=WARN
logging.level.org.springframework.boot=WARN
logging.level.org.springframework.data=WARN
logging.level.org.springframework.context=WARN
logging.level.org.springframework.validation=WARN
logging.level.org.hibernate.orm.deprecation=ERROR
spring.jpa.open-in-view=false
logging.level.org.springframework.orm.jpa.JpaBaseConfiguration=ERROR

logging.level.com.sprint.MottuFlow=WARN

spring.main.allow-bean-definition-overriding=true

server.address=0.0.0.0
server.port=8080
```

---

## 🚀 Uso

### 1. Iniciando a Aplicação

```bash
./mvnw spring-boot:run
```

**Saída esperada:**
```
 ██████╗ ███╗   ██╗██╗     ██╗███╗   ██╗███████╗██╗
██╔═══██╗████╗  ██║██║     ██║████╗  ██║██╔════╝██║
██║   ██║██╔██╗ ██║██║     ██║██╔██╗ ██║█████╗  ██║
██║   ██║██║╚██╗██║██║     ██║██║╚██╗██║██╔══╝  ╚═╝
╚██████╔╝██║ ╚████║███████╗██║██║ ╚████║███████╗██╗
 ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝

Clique aqui para acessar o Thymeleaf:   http://localhost:8080

Clique aqui para acessar o Swagger UI:   http://localhost:8080/swagger-ui/index.html
```

### 2. Acessos Principais

| Serviço | URL | Descrição |
|---------|-----|-----------|
| **🖥️ Interface Web** | http://localhost:8080 | Dashboard principal |
| **📡 API REST** | http://localhost:8080/api | Endpoints REST |
| **📚 Documentação** | http://localhost:8080/swagger-ui.html | Swagger UI (se configurado) |

### 3. Usuários Padrão

| Usuário | Senha | Cargo | Acesso |
|---------|-------|--------|--------|
| `admin@email.com` | `adminmottu` | Administrador | Completo | 
| `joao@email.com` | `joao123` | Mecânico | Limitado | 
| `maria@email.com` | `maria123` | Gerente | Completo | 

> Recomendado usar a conta de Administrador para teste

---

## 🔐 Autenticação JWT

Todas as requisições para a **API MottuFlow** exigem autenticação via **JWT (JSON Web Token)**.

---

### ✅ Usando o Postman

1. **Importe** a coleção [API - MottuFlow.postman\_collection.json](https://github.com/thejaobiell/MottuFlowJava/blob/main/MottuFlow/jsonsAPIREST/API%20-%20MottuFlow.postman_collection.json) no Postman.
2. No menu **`0 - JWT`**, execute o **POST Pegar Token JWT**, informando no **body** o `email` e `senha` do funcionário:

   ```json
   {
     "email": "admin@email.com",
     "senha": "adminmottu"
   }
   ```
3. Copie o valor de **`tokenAcesso`** retornado.
4. Vá até **API - MottuFlow → Variables**.
5. Substitua o valor da variável `jwt` pelo seu **token JWT**.
6. Agora todos os endpoints da coleção já estarão autenticados. 🚀

---

## 📡 API REST - Documentação Completa

### 🔧 Configuração Base
- **Autenticação:** Bearer Token (JWT)
- **Content-Type:** `application/json`

### Variáveis de Ambiente
- `{{baseUrl}}`: http://localhost:8080/api
- `{{jwt}}`: Token JWT obtido no login

---

## 🔐 Autenticação (JWT)

### Login
```http
POST /login
Content-Type: application/json

{
  "email": "admin@email.com",
  "senha": "adminmottu"
}
```

### Atualizar Token
```http
POST /atualizar-token
Content-Type: application/json

{
  "refreshToken": "seu_refresh_token_aqui"
}
```

### Verificar Token
```http
POST /verificar-jwt
Content-Type: application/json

{
  "tokenAcesso": "seu_token_jwt_aqui"
}
```

---

## 👥 Funcionários

### Listar Funcionários
```http
GET /funcionario/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /funcionario/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por CPF
```http
GET /funcionario/buscar-por-cpf/{cpf}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/funcionario/buscar-por-cpf/000.000.000-00`

### Criar Funcionário
```http
POST /funcionario/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "nome": "Novo Funcionário",
  "cpf": "333.333.333-33",
  "cargo": "MECANICO",
  "telefone": "(33) 33333-3333",
  "email": "novo@email.com",
  "senha": "senha123"
}
```

### Atualizar Funcionário
```http
PUT /funcionario/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "id": 2,
  "nome": "João Mecânico Atualizado",
  "cpf": "111.111.111-11",
  "cargo": "MECANICO",
  "telefone": "(11) 11111-1111",
  "email": "joao@email.com",
  "senha": "novaSenha123"
}
```

### Alterar Senha
```http
PATCH /funcionario/alterar-senha
Content-Type: application/json

{
  "email": "admin@email.com",
  "senhaAtual": "adminmottu",
  "novaSenha": "mottuadmin"
}
```

### Deletar Funcionário
```http
DELETE /funcionario/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 🏢 Pátios

### Listar Pátios
```http
GET /patios/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /patios/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Criar Pátio
```http
POST /patios/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "nome": "Patio AlfaBeta",
  "endereco": "Rua Principal, 123",
  "capacidadeMaxima": 500
}
```

### Atualizar Pátio
```http
PUT /patios/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "nome": "Patio Atualizado",
  "endereco": "Rua Nova, 456",
  "capacidadeMaxima": 100
}
```

### Deletar Pátio
```http
DELETE /patios/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 🏍️ Motos

### Listar Motos
```http
GET /motos/listar
Authorization: Bearer {jwt_token}
```

### Listar Motos com ArUco Tags
```http
GET /motos/motos-com-tags
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /motos/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por Placa
```http
GET /motos/buscar-por-placa/{placa}
Authorization: Bearer {jwt_token}
```

### Buscar por Fabricante
```http
GET /motos/buscar-por-fabricante?fabricante={fabricante}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/motos/buscar-por-fabricante?fabricante=Yamaha`

### Buscar por Pátio
```http
GET /motos/buscar-por-patio/{idPatio}
Authorization: Bearer {jwt_token}
```

### Criar Moto
```http
POST /motos/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "placa": "ABC-1234",
  "modelo": "Honda CB500",
  "fabricante": "Honda",
  "ano": 2021,
  "idPatio": 2,
  "localizacaoAtual": "Setor A"
}
```

### Atualizar Moto
```http
PUT /motos/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "placa": "XYZ-5678",
  "modelo": "Yamaha MT-07",
  "fabricante": "Yamaha",
  "ano": 2022,
  "idPatio": 2,
  "localizacaoAtual": "Setor B"
}
```

### Deletar Moto
```http
DELETE /motos/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 📹 Câmeras

### Listar Câmeras
```http
GET /cameras/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /cameras/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por Status Operacional
```http
GET /cameras/buscar-por-status/{status}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/cameras/buscar-por-status/Operacional`

### Criar Câmera
```http
POST /cameras/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "statusOperacional": "ONLINE",
  "localizacaoFisica": "Entrada do Patio",
  "idPatio": 2
}
```

### Atualizar Câmera
```http
PUT /cameras/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "statusOperacional": "INATIVA",
  "localizacaoFisica": "Saida do Patio",
  "idPatio": 3
}
```

### Deletar Câmera
```http
DELETE /cameras/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 🏷️ ArUco Tags

### Listar ArUco Tags
```http
GET /aruco-tags/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /aruco-tags/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por Status
```http
GET /aruco-tags/buscar-por-status/{status}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/aruco-tags/buscar-por-status/ativo`

### Buscar por Código
```http
GET /aruco-tags/buscar-por-codigo/{codigo}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/aruco-tags/buscar-por-codigo/TAG004`

### Criar ArUco Tag
```http
POST /aruco-tags/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "codigo": "TAG12345",
  "idMoto": 4,
  "status": "ATIVO"
}
```

### Atualizar ArUco Tag
```http
PUT /aruco-tags/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "codigo": "TAG99999",
  "idMoto": 5,
  "status": "INATIVO"
}
```

### Deletar ArUco Tag
```http
DELETE /aruco-tags/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 📊 Status

### Listar Status
```http
GET /status/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /status/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por Tipo de Status
```http
GET /status/buscar-por-tipo?tipoStatus={tipo}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/status/buscar-por-tipo?tipoStatus=BAIXA_BOLETIM_OCORRENCIA`

### Buscar por Descrição
```http
GET /status/buscar-por-descricao?descricao={descricao}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/status/buscar-por-descricao?descricao=Perda por BO`

### Buscar por Período
```http
GET /status/buscar-por-periodo?inicio={dataInicio}&fim={dataFim}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/status/buscar-por-periodo?inicio=2025-09-28T00:00:00&fim=2025-09-28T23:59:59`

### Criar Status
```http
POST /status/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "idMoto": 4,
  "tipoStatus": "DISPONIVEL",
  "descricao": "Moto disponível para uso",
  "idFuncionario": 3
}
```

### Atualizar Status
```http
PUT /status/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "idMoto": 4,
  "tipoStatus": "EM_MANUTENCAO",
  "descricao": "Moto em manutenção preventiva",
  "idFuncionario": 2
}
```

### Deletar Status
```http
DELETE /status/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## 📍 Localidades

### Listar Localidades
```http
GET /localidades/listar
Authorization: Bearer {jwt_token}
```

### Buscar por ID
```http
GET /localidades/buscar-por-id/{id}
Authorization: Bearer {jwt_token}
```

### Buscar por Pátio
```http
GET /localidades/buscar-por-patio/{idPatio}
Authorization: Bearer {jwt_token}
```

### Buscar por Ponto de Referência
```http
GET /localidades/buscar-por-ponto-referencia/{pontoReferencia}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/localidades/buscar-por-ponto-referencia/Vaga`

### Buscar por Período
```http
GET /localidades/buscar-por-periodo?dataInicio={dataInicio}&dataFim={dataFim}
Authorization: Bearer {jwt_token}
```
**Exemplo:** `/localidades/buscar-por-periodo?dataInicio=2025-09-06T08:00:00&dataFim=2025-09-08T08:20:00`

### Criar Localidade
```http
POST /localidades/cadastrar
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "idMoto": 1,
  "idPatio": 2,
  "pontoReferencia": "Vaga A15",
  "observacoes": "Próximo à entrada"
}
```

### Atualizar Localidade
```http
PUT /localidades/editar/{id}
Authorization: Bearer {jwt_token}
Content-Type: application/json

{
  "idMoto": 1,
  "idPatio": 2,
  "pontoReferencia": "Vaga B20",
  "observacoes": "Realocada para manutenção"
}
```

### Deletar Localidade
```http
DELETE /localidades/deletar/{id}
Authorization: Bearer {jwt_token}
```

---

## ⚠️ Tratamento de Erros

### Erro de Autenticação (401)
```json
{
  "timestamp": "2025-09-29T10:30:00",
  "status": 401,
  "error": "Unauthorized",
  "message": "Token JWT inválido ou expirado"
}
```

### Erro de Validação (400)
```json
{
  "timestamp": "2025-09-29T10:30:00",
  "status": 400,
  "error": "Bad Request",
  "message": "CPF já cadastrado no sistema"
}
```

### Erro de Recurso Não Encontrado (404)
```json
{
  "timestamp": "2025-09-29T10:30:00",
  "status": 404,
  "error": "Not Found",
  "message": "Funcionário não encontrado com o ID: 999"
}
```

---

## 📊 Códigos de Resposta HTTP

| Código | Descrição |
|--------|-----------|
| 200 | Sucesso na operação |
| 201 | Recurso criado com sucesso |
| 400 | Dados inválidos ou malformados |
| 401 | Token JWT ausente ou inválido |
| 403 | Acesso negado (permissões insuficientes) |
| 404 | Recurso não encontrado |
| 500 | Erro interno do servidor |

---

## 👥 Equipe de Desenvolvimento

<table>
<tr>
<td align="center">
<a href="https://github.com/thejaobiell">
<img src="https://github.com/thejaobiell.png" width="100px;" alt="João Gabriel"/><br>
<sub><b>João Gabriel Boaventura</b></sub><br>
<sub>RM554874 • 2TDSB2025</sub><br>
</a>
</td>
<td align="center">
<a href="https://github.com/leomotalima">
<img src="https://github.com/leomotalima.png" width="100px;" alt="Léo Mota"/><br>
<sub><b>Léo Mota Lima</b></sub><br>
<sub>RM557851 • 2TDSB2025</sub><br>
</a>
</td>
<td align="center">
<a href="https://github.com/LucasLDC">
<img src="https://github.com/LucasLDC.png" width="100px;" alt="Lucas Leal"/><br>
<sub><b>Lucas Leal das Chagas</b></sub><br>
<sub>RM551124 • 2TDSB2025</sub><br>
</a>
</td>
</tr>
</table>
