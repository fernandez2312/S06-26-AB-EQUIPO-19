from fastapi import APIRouter
from models.schemas import InsightsResponse, RegiaoInsight

router = APIRouter(prefix="/insights", tags=["Insights"])


@router.get("/", response_model=InsightsResponse)
def get_insights():
    """
    Retorna dados de concentração de talentos por região.

    ATENÇÃO: retorna dados mockados até integração com a API de geolocalização.
    """
    # TODO: integrar com API de dados geográficos
    regioes_mock = [
        RegiaoInsight(
            regiao="Nordeste - Bahia",
            concentracao=0.78,
            cobertura_rede="4G",
            perfis_disponiveis=134,
        ),
        RegiaoInsight(
            regiao="Norte - Pará",
            concentracao=0.61,
            cobertura_rede="3G",
            perfis_disponiveis=89,
        ),
        RegiaoInsight(
            regiao="Nordeste - Ceará",
            concentracao=0.55,
            cobertura_rede="4G",
            perfis_disponiveis=112,
        ),
    ]

    return InsightsResponse(mapa_talentos=regioes_mock)
