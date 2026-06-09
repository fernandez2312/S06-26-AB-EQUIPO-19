-- 1. MÓDULO BASE (EMPREGABILIDADE E EMPRESAS)
CREATE TABLE Empresa (
    id SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    metas_esg TEXT
);

CREATE TABLE Vaga (
    id SERIAL PRIMARY KEY,
    empresa_id INT NOT NULL,
    titulo_vaga VARCHAR(255) NOT NULL,
    skills_exigidas VARCHAR(255) NOT NULL,
    regiao VARCHAR(100) NOT NULL,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE CASCADE
);

CREATE TABLE Candidato (
    id SERIAL PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    skills_candidato VARCHAR(255) NOT NULL,
    genero VARCHAR(50),
    raca VARCHAR(50),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE Match_Score (
    id SERIAL PRIMARY KEY,
    vaga_id INT NOT NULL,
    candidato_id INT NOT NULL,
    porcentagem_compatibilidade FLOAT NOT NULL,
    badge_diversidade BOOLEAN DEFAULT FALSE,
    justificativa_analise TEXT,
    FOREIGN KEY (vaga_id) REFERENCES Vaga(id) ON DELETE CASCADE,
    FOREIGN KEY (candidato_id) REFERENCES Candidato(id) ON DELETE CASCADE
);

-- 2. MÓDULO DE FORMAÇÕES
CREATE TABLE Curso_Trilha (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    carga_horaria INT
);

CREATE TABLE Progresso_Treinamento (
    id SERIAL PRIMARY KEY,
    empresa_id INT NOT NULL,
    curso_id INT NOT NULL,
    status_conclusao VARCHAR(50) DEFAULT 'Em Andamento',
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES Curso_Trilha(id) ON DELETE CASCADE
);

-- 3. MÓDULO DE EXPERIÊNCIAS ESTRUTURANTES
CREATE TABLE Evento_Corporativo (
    id SERIAL PRIMARY KEY,
    titulo_evento VARCHAR(255) NOT NULL,
    palestrante VARCHAR(255),
    data_evento TIMESTAMP,
    tipo_evento VARCHAR(100) DEFAULT 'Painel/Palestra'
);

-- 4. MÓDULO DE MENTORIAS
CREATE TABLE Mentoria_Networking (
    id SERIAL PRIMARY KEY,
    empresa_origem_id INT NOT NULL,
    empresa_destino_id INT NOT NULL,
    pauta_discussao TEXT,
    data_agendamento TIMESTAMP,
    FOREIGN KEY (empresa_origem_id) REFERENCES Empresa(id) ON DELETE CASCADE,
    FOREIGN KEY (empresa_destino_id) REFERENCES Empresa(id) ON DELETE CASCADE
);

-- 5. MÓDULO DE SAÚDE DO TIME (DADOS ANONIMIZADOS)
CREATE TABLE Saude_Time_Dashboard (
    id SERIAL PRIMARY KEY,
    regiao VARCHAR(100) NOT NULL,
    perfil_demografico VARCHAR(100),
    indice_burnout_medio FLOAT,
    indice_exclusao_medio FLOAT,
    data_coleta DATE DEFAULT CURRENT_DATE
);

-- 6. DATASET INTEGRADO VÍSENT CDRVIEW (ANATEL COBERTURA)
CREATE TABLE Visent_CDRView_Dados (
    id SERIAL PRIMARY KEY,
    zona_coordenadas VARCHAR(255) NOT NULL,
    concentracao_talentos VARCHAR(50),
    cobertura_rede VARCHAR(50), -- 5G/4G/3G
    latitude_antena FLOAT,
    longitude_antena FLOAT
);
