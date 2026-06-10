"""
Serviço de integração com a API de dados geográficos.

Responsável por:
- Consultar concentração de talentos por região
- Retornar dados de cobertura de rede por zona

TODO (time de back-end):
- Definir qual API de geolocalização será utilizada
- Implementar a chamada real abaixo
"""


def get_dados_regiao(regiao: str) -> dict:
    """
    Consulta dados geográficos de uma região.

    ATENÇÃO: retorna valores mockados até implementação real.
    """
    # TODO: substituir pela chamada real à API de geolocalização
    return {
        "regiao": regiao,
        "concentracao": 0.70,
        "cobertura_rede": "4G",
        "perfis_disponiveis": 100,
    }
