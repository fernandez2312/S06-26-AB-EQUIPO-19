# App BiT — Portal B2B de Matching Inclusivo com Filtro ESG

Bem-vindo ao repositório oficial da **Equipe 19** — Hackathon No Country S06-26.

Este projeto é um MVP de plataforma B2B que conecta empresas com metas ESG a talentos de grupos sub-representados, utilizando um motor de IA para matching técnico com filtro anti-viés e dados de geolocalização para visualização de concentração de talentos por região.

---

## Índice

- [O Desafio](#o-desafio)
- [Arquitetura do Sistema](#arquitetura-do-sistema)
- [Modelagem de Dados](#modelagem-de-dados)
- [Stack Tecnológica](#stack-tecnológica)
- [Contratos de Integração (API)](#contratos-de-integração-api)
- [Variáveis de Ambiente](#variáveis-de-ambiente)
- [Como Rodar Localmente](#como-rodar-localmente)
- [Estrutura de Pastas](#estrutura-de-pastas)
- [Equipe](#equipe)

---

## O Desafio

Empresas com metas ESG não conseguem encontrar e contratar talentos de grupos sub-representados de forma eficiente e sem viés.

Nossa solução: um portal B2B onde empresas publicam vagas com filtros de diversidade, e um agente de IA retorna uma shortlist de candidatos com **score de compatibilidade técnica** e **badge de diversidade geográfica** — sem expor atributos pessoais ao processo de seleção.

---

## Arquitetura do Sistema

Nossa arquitetura separa claramente as responsabilidades de interface, lógica de negócio e processamento de IA.

<img width="1174" height="373" alt="Diagrama de Blocos" src="https://github.com/user-attachments/assets/df259499-560a-4b7a-be3c-7ed48a4e6323" />

**Fluxo principal:**
1. Recrutador acessa o portal e define filtros ESG no Front-end
2. Front-end envia `POST /match` com os dados da vaga para o Back-end (Python)
3. Back-end consulta candidatos e vagas no Banco de Dados
4. Back-end envia perfis para o Motor de IA e recebe scores
5. Back-end consulta dados geográficos na API de geolocalização
6. Shortlist com scores e badges é retornada ao Front-end

---

## Modelagem de Dados

A base de dados foi estruturada focando no relacionamento direto entre Empresa, Vaga e Candidato, centralizando o histórico de matching na tabela `Match_Score`.

O schema cobre os 5 módulos do ecossistema App BiT: Empregabilidade, Formações, Experiências Estruturantes, Mentorias e Saúde do Time — além da integração com o dataset Vísent CDRView.

<img width="624" height="546" alt="Diagrama de Classes" src="https://github.com/user-attachments/assets/7542c629-c82e-4328-a726-3e2463ca71af" />

---

## Stack Tecnológica

| Camada | Tecnologia | Status |
|--------|-----------|--------|
| Back-end | Python | ✅ Definido (votação da equipe, 75%) |
| Front-end | A definir com a equipe | ⏳ Pendente |
| Banco de Dados | A definir com a equipe | ⏳ Pendente |
| Motor de IA | A definir com a equipe | ⏳ Pendente |
| Dados Geográficos | A definir com a equipe | ⏳ Pendente |
| Deploy | A definir com a equipe | ⏳ Pendente |

---

## Contratos de Integração (API)

Base URL: `http://localhost:8080`

---

### `POST /match`

Recebe os dados de uma vaga e retorna a shortlist de candidatos compatíveis com score e badge de diversidade.

**Request Body:**
```json
{
  "empresa_id": 1,
  "vaga": {
    "titulo": "Desenvolvedora Back-end Pleno",
    "skills": "Python, FastAPI, PostgreSQL, Docker",
    "nivel": "Pleno",
    "regiao": "Nordeste"
  },
  "filtros": {
    "anti_vies": true,
    "diversidade_minima": 0.3
  }
}
```

**Response `200 OK`:**
```json
{
  "total_analisados": 48,
  "diversidade_resultado": 0.42,
  "candidatos": [
    {
      "candidato_id": 7,
      "score_match": 91.5,
      "badge_diversidade": true,
      "skills": "Python, FastAPI, MySQL, Docker",
      "lat": -12.9714,
      "lng": -38.5014
    },
    {
      "candidato_id": 23,
      "score_match": 78.0,
      "badge_diversidade": false,
      "skills": "Python, Flask, PostgreSQL",
      "lat": -3.7172,
      "lng": -38.5433
    }
  ]
}
```

> ⚠️ **Segurança:** o endpoint **não retorna** `nome`, `email`, `genero`, `raca` ou qualquer atributo pessoal. Esses dados ficam no banco e nunca trafegam até o motor de IA ou para o front-end na shortlist.

---

### `GET /insights`

Retorna dados de concentração de talentos por região para o mapa interativo.

**Response `200 OK`:**
```json
{
  "mapa_talentos": [
    {
      "regiao": "Nordeste - Bahia",
      "concentracao": 0.78,
      "cobertura_rede": "4G",
      "perfis_disponiveis": 134
    },
    {
      "regiao": "Norte - Pará",
      "concentracao": 0.61,
      "cobertura_rede": "3G",
      "perfis_disponiveis": 89
    }
  ]
}
```

---

### `POST /vagas`

Cria uma nova vaga no sistema.

**Request Body:**
```json
{
  "empresa_id": 1,
  "titulo_vaga": "Analista de Dados",
  "skills_exigidas": "Python, SQL, Power BI",
  "regiao": "Sul"
}
```

**Response `201 Created`:**
```json
{
  "vaga_id": 12,
  "mensagem": "Vaga publicada com sucesso."
}
```

---

## Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto copiando o `.env.example`:

```bash
cp .env.example .env
```

| Variável | Descrição |
|----------|-----------|
| `PORT` | Porta do servidor (padrão: 8080) |
| `DATABASE_URL` | URL de conexão com o banco de dados |
| `DB_USER` | Usuário do banco de dados |
| `DB_PASSWORD` | Senha do banco de dados |
| `IA_API_KEY` | Chave da API do motor de IA |

> 🔒 **Nunca suba o arquivo `.env` para o repositório.**

---

## Como Rodar Localmente

> ⚠️ As instruções completas de execução serão adicionadas após a definição do stack completo pela equipe.

```bash
# 1. Clone o repositório
git clone https://github.com/No-Country-simulation/S06-26-AB-EQUIPO-19.git
cd S06-26-AB-EQUIPO-19

# 2. Configure as variáveis de ambiente
cp .env.example .env
# Edite o .env com suas chaves
```

---

## Estrutura de Pastas

```
S06-26-AB-EQUIPO-19/
├── database/
│   └── schema.sql          # Script de criação das tabelas (todos os módulos)
├── .env.example
├── .gitignore
├── SYSTEM_PROMPT_APP_BIT.md
└── README.md
```

> A estrutura será expandida conforme o stack e as frentes de trabalho forem definidas pela equipe.

---

## Equipe

| Nome | Papel | GitHub |
|------|-------|--------|
| Matheus Bauer | Architect (Software / Solution Architect) | [@obauercosta](https://github.com/obauercosta) |
| Geordani Machado | Frontend Developer | — |
| Wesley Muniz França | Graphic Designer | — |
| Erick Levi Souza Machado | Game Developer | — |
| Fernando Henrique Pereira Fernandez | Data Analyst | — |
| Carlos André Alves Bezerra | Backend Developer | — |

---

*Hackathon No Country — S06-26 · Equipe 19*
