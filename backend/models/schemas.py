from pydantic import BaseModel
from typing import List, Optional


# ─── VAGAS ────────────────────────────────────────────────────────────────────

class VagaInput(BaseModel):
    empresa_id: int
    titulo_vaga: str
    skills_exigidas: str
    regiao: str


class VagaResponse(BaseModel):
    vaga_id: int
    mensagem: str


# ─── MATCH ────────────────────────────────────────────────────────────────────

class VagaFiltro(BaseModel):
    titulo: str
    skills: str
    nivel: str
    regiao: str


class FiltrosMatch(BaseModel):
    anti_vies: bool = True
    diversidade_minima: float = 0.0


class MatchRequest(BaseModel):
    empresa_id: int
    vaga: VagaFiltro
    filtros: FiltrosMatch


class CandidatoResult(BaseModel):
    candidato_id: int
    score_match: float
    badge_diversidade: bool
    skills: str
    lat: Optional[float] = None
    lng: Optional[float] = None


class MatchResponse(BaseModel):
    total_analisados: int
    diversidade_resultado: float
    candidatos: List[CandidatoResult]


# ─── INSIGHTS ─────────────────────────────────────────────────────────────────

class RegiaoInsight(BaseModel):
    regiao: str
    concentracao: float
    cobertura_rede: str
    perfis_disponiveis: int


class InsightsResponse(BaseModel):
    mapa_talentos: List[RegiaoInsight]
