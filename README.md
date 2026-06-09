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

Para facilitar o desenvolvimento em paralelo, já definimos o contrato da rota principal do motor de inteligência.

### `POST /match`
Responsável por receber os dados da vaga e retornar a lista de candidatos pontuados pelo algoritmo anti-viés.

**Request (Front-end envia):**
```json
{
  "empresa_id": 1,
  "vaga": {
    "titulo": "Desenvolvedor Backend",
    "skills": ["Java", "Python"],
    "nivel": "Junior",
    "regiao": "Lauro de Freitas"
  },
  "filtros": {
    "anti_vies": true,
    "diversidade_minima": true
  }
}
