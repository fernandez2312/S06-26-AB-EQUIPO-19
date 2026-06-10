from fastapi import APIRouter
from models.schemas import VagaInput, VagaResponse

router = APIRouter(prefix="/vagas", tags=["Vagas"])


@router.post("/", response_model=VagaResponse, status_code=201)
def criar_vaga(vaga: VagaInput):
    """
    Publica uma nova vaga no sistema.
    A persistência no banco será implementada pelo time de back-end.
    """
    # TODO: persistir no banco de dados
    return VagaResponse(vaga_id=1, mensagem="Vaga publicada com sucesso.")
