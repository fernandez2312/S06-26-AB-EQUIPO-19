from fastapi import APIRouter
from models.schemas import MatchRequest, MatchResponse, CandidatoResult

router = APIRouter(prefix="/match", tags=["Match"])


@router.post("/", response_model=MatchResponse)
def match_candidatos(payload: MatchRequest):
    """
    Recebe dados de uma vaga e retorna shortlist de candidatos
    com score de compatibilidade e badge de diversidade.

    ATENÇÃO: retorna dados mockados até integração com banco e motor de IA.
    Atributos pessoais (nome, email, genero, raca) nunca são retornados aqui.
    """
    # TODO: buscar candidatos reais do banco de dados
    # TODO: chamar ia_service para calcular score e badge
    candidatos_mock = [
        CandidatoResult(
            candidato_id=1,
            score_match=91.5,
            badge_diversidade=True,
            skills="Python, FastAPI, Docker",
            lat=-12.9714,
            lng=-38.5014,
        ),
        CandidatoResult(
            candidato_id=2,
            score_match=78.0,
            badge_diversidade=False,
            skills="Python, Flask",
            lat=-3.7172,
            lng=-38.5433,
        ),
    ]

    return MatchResponse(
        total_analisados=10,
        diversidade_resultado=0.42,
        candidatos=candidatos_mock,
    )
