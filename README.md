## Como rodar

1. Clone o repositório
2. Copie `.env.example` para `.env` e preencha as variáveis
3. Execute `docker compose up --build`
4. Acesse `http://localhost:3000`

## Credenciais iniciais
- Email: admin@capp.com
- Senha: admin123

## Observação
- Caso seu codigo apresente erro ao subir a aplicação pela segunda vez, limpe o cache de construção do Docker usando `docker builder prune -a`
- Caso de erro de volume do docker use `docker compose down -v` e logo apos crie o BD de testes com `docker compose exec web rails db:create db:migrate RAILS_ENV=test`
- Para dar restart no docker use `docker compose restart web`
- Rode os testes com `docker compose exec web rails test`