# MVP - Portal B2B de Vagas com Match Inteligente e Filtro ESG

Bem-vindo ao repositório oficial da **Equipe 19**! 
Este projeto é um MVP focado em conectar talentos a oportunidades de forma justa, utilizando análise de dados sociodemográficos e Inteligência Artificial para mitigar vieses inconscientes no recrutamento.

## O Desafio
Criar um portal B2B onde empresas publicam vagas com metas de ESG, e candidatos são ranqueados através de um algoritmo de "match" que cruza skills técnicas com dados geográficos (via API Vísent) e aplica um filtro anti-viés (via LLM).

---

## Arquitetura do Sistema

Nossa arquitetura foi desenhada para separar claramente as responsabilidades de interface, lógica de negócios e processamento de IA.

<img width="1174" height="373" alt="Diagrama de Blocos drawio (2)" src="https://github.com/user-attachments/assets/df259499-560a-4b7a-be3c-7ed48a4e6323" />

---

## Modelagem de Dados

A base de dados foi estruturada focando no relacionamento direto entre a Empresa, a Vaga e o Candidato, centralizando o histórico de aprovação na tabela de `Match_Score`.

<img width="624" height="546" alt="diagrama drawio" src="https://github.com/user-attachments/assets/7542c629-c82e-4328-a726-3e2463ca71af" />

---

## Contratos de Integração (API)

*A definir e estruturar em conjunto com a equipe de Back-end.*

---

## Stack Tecnológica 
- Front-end: (A definir com a equipe)
- Back-end: Python (FastAPI/Flask)
- Banco de Dados: (A definir com a equipe)
- Integrações: API Vísent (Mapa interativo) & IA Generativa (Filtro de viés)

---

## Como rodar o projeto localmente
1. Faça o clone do repositório.
2. Crie um arquivo `.env` na raiz do projeto baseado no `.env.example`.
3. (Instruções de inicialização do servidor serão adicionadas pela equipe em breve).
