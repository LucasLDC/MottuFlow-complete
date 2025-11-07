# 🔐 Credenciais de Login - MottuFlow H2

## ✅ Backend Rodando com H2

O backend está configurado e rodando com banco de dados H2 em memória.

---

## 👤 Usuários Padrão (Seed do Flyway)

### 1. **ADMIN** (Acesso Total)

```
Email:    admin@email.com
Senha:    adminmottu
Cargo:    ADMIN
CPF:      000.000.000-00
```

### 2. **MECÂNICO** (Acesso Limitado)

```
Email:    joao@email.com
Senha:    joao123
Cargo:    MECANICO
CPF:      111.111.111-11
```

### 3. **GERENTE** (Acesso Gerencial)

```
Email:    maria@email.com
Senha:    maria123
Cargo:    GERENTE
CPF:      222.222.222-22
```

---

## 🚀 Como Fazer Login

### Opção 1: Via Swagger UI (Recomendado)

1. Acesse: http://localhost:8080/swagger-ui/index.html

2. Localize o endpoint **POST /api/login**

3. Clique em **"Try it out"**

4. Cole o JSON:

```json
{
  "email": "admin@email.com",
  "senha": "adminmottu"
}
```

5. Clique em **Execute**

6. Copie o `tokenAcesso` da resposta e use no header:

```
Authorization: Bearer SEU_TOKEN_AQUI
```

---

### Opção 2: Via PowerShell (cURL)

```powershell
# Fazer login e obter token
$body = @{
    email = "admin@email.com"
    senha = "adminmottu"
} | ConvertTo-Json

$response = Invoke-RestMethod `
    -Method Post `
    -Uri "http://localhost:8080/api/login" `
    -ContentType "application/json" `
    -Body $body

# Exibir token
Write-Host "Token de Acesso:" -ForegroundColor Green
Write-Host $response.tokenAcesso

# Salvar token em variável para uso posterior
$token = $response.tokenAcesso

# Exemplo: Usar token para listar funcionários
$headers = @{
    "Authorization" = "Bearer $token"
}

Invoke-RestMethod `
    -Method Get `
    -Uri "http://localhost:8080/api/funcionario/listar" `
    -Headers $headers
```

---

### Opção 3: Via Postman

1. **Import a collection**:

   - URL: https://github.com/thejaobiell/MottuFlowJava/blob/main/MottuFlow/jsonsAPIREST/API%20-%20MottuFlow.postman_collection.json

2. **Execute POST Pegar Token JWT**:

   - Body:
     ```json
     {
       "email": "admin@email.com",
       "senha": "adminmottu"
     }
     ```

3. **Copie o `tokenAcesso`**

4. **Configure a variável `jwt`**:
   - API - MottuFlow → Variables
   - Substitua o valor de `jwt` pelo token obtido

---

### Opção 4: Via Interface Web (Thymeleaf)

1. Acesse: http://localhost:8080/login

2. Use as credenciais:

   - **Email**: admin@email.com
   - **Senha**: adminmottu

3. Será redirecionado para o dashboard: http://localhost:8080/menu

---

## 📡 URLs Úteis

| Serviço           | URL                                         | Descrição                |
| ----------------- | ------------------------------------------- | ------------------------ |
| **Interface Web** | http://localhost:8080                       | Dashboard Thymeleaf      |
| **Swagger UI**    | http://localhost:8080/swagger-ui/index.html | Documentação interativa  |
| **H2 Console**    | http://localhost:8080/h2-console            | Console do banco H2      |
| **API Login**     | http://localhost:8080/api/login             | Endpoint de autenticação |

---

## 🗄️ H2 Console (Acesso Direto ao Banco)

Para ver os dados diretamente no banco H2:

1. Acesse: http://localhost:8080/h2-console

2. Configure:

   ```
   JDBC URL:  jdbc:h2:mem:mottuflow
   User Name: sa
   Password:  (deixe vazio)
   ```

3. Clique em **Connect**

4. Execute queries:

   ```sql
   -- Ver todos os funcionários
   SELECT * FROM funcionario;

   -- Ver usuário admin
   SELECT * FROM funcionario WHERE email = 'admin@email.com';

   -- Ver todas as tabelas
   SHOW TABLES;
   ```

---

## 🔑 Estrutura do Token JWT

Resposta do login:

```json
{
  "tokenAcesso": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refreshToken": "f47ac10b-58cc-4372-a567-0e02b2c3d479...",
  "expiracaoRefresh": "2025-11-06T14:30:00"
}
```

- **tokenAcesso**: Use em todas as requisições protegidas (válido por 2 horas)
- **refreshToken**: Use para renovar o token sem fazer login novamente
- **expiracaoRefresh**: Data/hora de expiração do refresh token (7 dias)

---

## 🛡️ Testando Endpoints Protegidos

Exemplo: Listar Motos

```powershell
# Com token obtido anteriormente
$headers = @{
    "Authorization" = "Bearer $token"
}

# GET /api/motos/listar
Invoke-RestMethod `
    -Method Get `
    -Uri "http://localhost:8080/api/motos/listar" `
    -Headers $headers
```

---

## ⚠️ Troubleshooting

### Token expirado

```json
{
  "timestamp": "2025-10-30T15:00:00",
  "status": 401,
  "error": "Unauthorized",
  "message": "Token JWT inválido ou expirado"
}
```

**Solução**: Faça login novamente ou use o `/api/atualizar-token` com o refreshToken.

### Senha incorreta

```json
{
  "timestamp": "2025-10-30T15:00:00",
  "status": 401,
  "error": "Unauthorized",
  "message": "Bad credentials"
}
```

**Solução**: Verifique se está usando a senha correta (`adminmottu`).

---

## 🎯 Próximos Passos

1. ✅ Backend rodando com H2
2. ✅ Usuários seed criados via Flyway
3. ✅ Fazer login e obter JWT
4. 🔄 Testar endpoints no Swagger
5. 🔄 Integrar com mobile app (se necessário)

---

## 📞 Dicas Rápidas

- **Recomendação**: Use a conta `admin@email.com` para testes completos
- **Token JWT**: Válido por 2 horas
- **Refresh Token**: Válido por 7 dias
- **Hierarquia de Roles**: ADMIN > GERENTE > MECANICO
- **Swagger**: Melhor ferramenta para testar a API

---

<div align="center">
  <p><strong>MottuFlow - Sistema Completo de Gerenciamento de Frotas</strong></p>
  <p>Sprint 3 - 2025</p>
</div>
