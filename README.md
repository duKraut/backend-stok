# stok — Backend

> API REST do sistema **Stok**, desenvolvido com Quarkus para gerenciamento de patrimônio, almoxarifado e fornecedores.

---

## Tecnologias

| Tecnologia | Versão |
|---|---|
| Java | 21 |
| Quarkus | 3.36.0 |
| PostgreSQL | 14+ |
| Flyway | (via quarkus-flyway) |
| Hibernate ORM Panache | (via quarkus-hibernate-orm-panache) |
| JJWT | 0.12.6 |
| jBCrypt | 0.4 |

---

## Pré-requisitos

- **Java 21** ou superior — [Instalar](https://adoptium.net/)
- **Maven 3.9+** — ou use o wrapper `./mvnw` incluído no projeto (não precisa instalar)
- **PostgreSQL 14+** — [Instalar](https://www.postgresql.org/download/)

> Não é necessário instalar dependências manualmente. O Maven Wrapper (`mvnw`) baixa tudo automaticamente na primeira execução.

---

## Configuração do banco de dados

### 1. Acesse o PostgreSQL

```bash
psql -U postgres
```

### 2. Crie o banco e o usuário

```sql
CREATE USER stok WITH PASSWORD 'kamvas';
CREATE DATABASE stok_db OWNER stok;
GRANT ALL PRIVILEGES ON DATABASE stok_db TO stok;
\q
```

> As tabelas são criadas automaticamente pelo **Flyway** ao iniciar a aplicação (migrações V1 a V13, incluindo dados de seed).

---

## Configuração da aplicação

As configurações ficam em `src/main/resources/application.properties`.

```properties
# Banco de dados
quarkus.datasource.db-kind=postgresql
quarkus.datasource.username=stok
quarkus.datasource.password=kamvas
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/stok_db

# Flyway — migrações automáticas
quarkus.flyway.migrate-at-start=true

# CORS — permite chamadas do frontend Angular
quarkus.http.cors.enabled=true
quarkus.http.cors.origins=http://localhost:4200

# JWT — chave secreta (mínimo 32 caracteres)
stok.jwt.secret=stok-sistema-secret-key-tcc-2025-must-be-at-least-32-characters-long

# E-mail (recuperação de senha) — crie uma conta gratuita em resend.com
resend.api.key=COLOQUE_SUA_API_KEY_AQUI
resend.from.email=onboarding@resend.dev
```

> **E-mail opcional:** a funcionalidade de recuperação de senha usa a API do [Resend](https://resend.com). Sem configurar a chave, o restante do sistema funciona normalmente.

---

## Como rodar

### 1. Clone o repositório

```bash
git clone https://github.com/duKraut/backend-stok.git
cd backend-stok
```

### 2. Modo desenvolvimento (com hot reload)

```bash
./mvnw quarkus:dev
```

A API estará disponível em **`http://localhost:8080`**.

### Modo produção (JAR)

```bash
# Compilar
./mvnw package

# Executar
java -jar target/quarkus-app/quarkus-run.jar
```

---

## Primeiro acesso

Na primeira inicialização, o sistema cria automaticamente um usuário administrador:

| Campo | Valor |
|---|---|
| E-mail | `admin@stok.com` |
| Senha | `Admin@123` |
| Perfil | Administrador |

> Esse usuário tem acesso completo a todos os módulos. Novos usuários podem ser criados pelo painel de Configurações.

---

## Endpoints da API

Todas as rotas (exceto `/auth/*`) exigem o header:

```
Authorization: Bearer <token>
```

### Autenticação

| Método | Rota | Descrição | Autenticação |
|---|---|---|---|
| `POST` | `/auth/login` | Login — retorna JWT | Não |
| `POST` | `/auth/forgot-password` | Envia e-mail de recuperação | Não |
| `POST` | `/auth/reset-password` | Redefine senha com token | Não |

### Usuários

| Método | Rota | Descrição | Perfil mínimo |
|---|---|---|---|
| `GET` | `/users` | Lista todos os usuários | Administrador |
| `GET` | `/users/active` | Lista usuários ativos (id + nome) | Qualquer |
| `GET` | `/users/{id}` | Busca usuário por ID | Administrador |
| `POST` | `/users` | Cria usuário | Administrador |
| `PUT` | `/users/{id}` | Atualiza usuário | Administrador |
| `PUT` | `/users/me` | Atualiza próprio e-mail/senha | Qualquer |
| `DELETE` | `/users/{id}` | Desativa usuário | Administrador |

### Fornecedores

| Método | Rota | Descrição | Módulo |
|---|---|---|---|
| `GET` | `/suppliers` | Lista fornecedores | FORNECEDORES |
| `GET` | `/suppliers/{id}` | Busca por ID | FORNECEDORES |
| `POST` | `/suppliers` | Cria fornecedor | FORNECEDORES |
| `PUT` | `/suppliers/{id}` | Atualiza fornecedor | FORNECEDORES |
| `DELETE` | `/suppliers/{id}` | Desativa fornecedor | FORNECEDORES |

### Patrimônio (Bens)

| Método | Rota | Descrição | Módulo |
|---|---|---|---|
| `GET` | `/assets` | Lista bens | PATRIMONIO |
| `GET` | `/assets/{id}` | Busca por ID | PATRIMONIO |
| `POST` | `/assets` | Cadastra bem | PATRIMONIO |
| `PUT` | `/assets/{id}` | Atualiza bem | PATRIMONIO |
| `DELETE` | `/assets/{id}` | Baixa bem | PATRIMONIO |
| `GET` | `/assets/movements` | Lista movimentações (filtro: `?assetId=`) | PATRIMONIO |
| `GET` | `/assets/movements/{id}` | Busca movimentação por ID | PATRIMONIO |
| `POST` | `/assets/movements` | Registra movimentação | PATRIMONIO |

### Almoxarifado (Estoque)

| Método | Rota | Descrição | Módulo |
|---|---|---|---|
| `GET` | `/inventory/items` | Lista itens | ALMOXARIFADO |
| `GET` | `/inventory/items/{id}` | Busca item por ID | ALMOXARIFADO |
| `POST` | `/inventory/items` | Cadastra item | ALMOXARIFADO |
| `PUT` | `/inventory/items/{id}` | Atualiza item | ALMOXARIFADO |
| `DELETE` | `/inventory/items/{id}` | Desativa item | ALMOXARIFADO |
| `GET` | `/inventory/movements` | Lista movimentações (filtro: `?itemId=`) | ALMOXARIFADO |
| `GET` | `/inventory/movements/{id}` | Busca movimentação por ID | ALMOXARIFADO |
| `POST` | `/inventory/movements` | Registra entrada/saída | ALMOXARIFADO |

---

## Perfis e permissões

| Perfil | Visualizar | Criar/Editar | Desativar | Gerenciar usuários |
|---|---|---|---|---|
| **ADMINISTRADOR** | ✅ | ✅ | ✅ | ✅ |
| **GERENTE** | ✅ | ✅ | ✅ | ❌ |
| **OPERADOR** | ✅ | ✅ | ❌ | ❌ |
| **VISUALIZADOR** | ✅ | ❌ | ❌ | ❌ |

> O acesso a cada módulo (PATRIMONIO, ALMOXARIFADO, FORNECEDORES, RELATORIOS) é concedido individualmente pelo administrador para cada usuário.

---

## Estrutura do projeto

```
src/main/java/com/stok/
├── auth/           # Login, JWT, filtro de autenticação, recuperação de senha
├── startup/        # Criação do admin padrão na primeira inicialização
├── user/           # Entidade User, perfis, permissões de módulo
├── supplier/       # Fornecedores
├── asset/          # Bens patrimoniais
├── assetmovement/  # Movimentações de patrimônio
├── inventory/      # Itens de estoque
└── inventorymovement/ # Entradas e saídas de estoque

src/main/resources/
├── application.properties
└── db/migration/   # Migrações Flyway (V1–V13)
```

---

## Migrações do banco

As migrações são aplicadas automaticamente pelo Flyway ao iniciar a aplicação.

| Versão | Descrição |
|---|---|
| V1 | Criação da tabela `suppliers` |
| V2 | Campos de contato e endereço em fornecedores |
| V3 | Constraints em fornecedores |
| V4 | Criação da tabela `assets` |
| V5 | Criação da tabela `asset_movements` |
| V6–V8 | Ajustes nos status de conservação e tipos de movimentação |
| V9 | Criação da tabela `inventory` |
| V10 | Criação da tabela `inventory_movements` |
| V11 | Criação da tabela `users` |
| V12 | Criação da tabela `password_reset_tokens` |
| V13 | Dados de seed (fornecedores, bens, estoque e movimentações de exemplo) |

---

## Redefinindo o banco (desenvolvimento)

Para recriar o banco do zero e reaplicar todas as migrações:

```bash
psql -U postgres -c "DROP DATABASE IF EXISTS stok_db;"
psql -U postgres -c "CREATE DATABASE stok_db OWNER stok;"
./mvnw quarkus:dev
```
