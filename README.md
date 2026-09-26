# Controle Financeiro Pessoal — API REST

API desenvolvida com Java 17 e Spring Boot 3.5 para o aplicativo de controle financeiro pessoal.

## Tecnologias
- Java 17
- Spring Boot 3.5.6
- Spring Web
- Spring Data JPA
- Bean Validation
- H2 para desenvolvimento
- PostgreSQL para produção
- Swagger/OpenAPI
- Maven

## Funcionalidades da etapa final

- Regras de negócio na camada Service.
- Validação de dados com Bean Validation.
- Tratamento global de exceções.
- Paginação e filtro de lançamentos por tecnologia/tag.
- Cadastro de avaliação com nota de 1 a 5 e comentário.
- Cálculo automático da nota média.
- Incremento de upvotes/estrelas.
- Swagger/OpenAPI.

## Principais endpoints

### Lançamentos
- `POST /api/projects`
- `GET /api/projects?page=0&size=10`
- `GET /api/projects?tecnologia=Alimentação&page=0&size=10`
- `PUT /api/projects/{id}`

### Avaliações
- `POST /api/projects/{id}/feedbacks`
```json
{
  "nota": 5,
  "comentario": "Lançamento conferido e organizado."
}
```

### Curtidas/estrelas
- `PUT /api/projects/{id}/upvote`

### Perfis
- `POST /api/profiles`
- `GET /api/profiles/{id}`

### Tags
- `POST /api/technologies`
- `GET /api/technologies`

## Swagger

Após iniciar a aplicação:

`http://localhost:8080/swagger-ui.html`

OpenAPI JSON:

`http://localhost:8080/v3/api-docs`

## Execução local

```bash
mvn spring-boot:run
```

Por padrão a aplicação usa H2 em memória.

## PostgreSQL em produção

Configure as variáveis de ambiente:

```text
SPRING_DATASOURCE_URL=jdbc:postgresql://HOST:5432/DATABASE?sslmode=require
SPRING_DATASOURCE_USERNAME=USUARIO
SPRING_DATASOURCE_PASSWORD=SENHA
SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_H2_CONSOLE_ENABLED=false
```

O Render fornece a porta pela variável `PORT`, que já é utilizada pelo projeto.

## Deploy

O projeto pode ser conectado ao GitHub no Render como Web Service. O comando de build é:

```bash
./mvnw clean package -DskipTests
```

ou, caso o wrapper não esteja no repositório:

```bash
mvn clean package -DskipTests
```

O comando de inicialização:

```bash
java -jar target/controle-financeiro-api-0.0.2-SNAPSHOT.jar
```

## Render + Supabase

O arquivo `render.yaml` deixa a configuração do Web Service preparada para o Render.
Crie o banco PostgreSQL no Supabase e copie a connection string do painel **Connect**.
No Render, configure `SPRING_DATASOURCE_URL` com uma URL JDBC equivalente:

`jdbc:postgresql://HOST:PORT/DATABASE?sslmode=require`

e informe usuário e senha nas variáveis `SPRING_DATASOURCE_USERNAME` e
`SPRING_DATASOURCE_PASSWORD`.

Não coloque senhas no GitHub.
