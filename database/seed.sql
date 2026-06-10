-- SEED — Dados mockados para desenvolvimento local
-- Execute após o schema.sql

-- Empresas
INSERT INTO Empresa (nome_empresa, cnpj, metas_esg) VALUES
('TechNordeste S.A.', '12.345.678/0001-90', 'Prioridade para talentos das regiões Norte e Nordeste do Brasil'),
('InovaBrasil Ltda.', '98.765.432/0001-10', 'Ampliar contratação de mulheres em cargos técnicos e talentos da região Norte'),
('DataSul Corp.', '11.222.333/0001-44', 'Diversidade racial e regional, foco em candidatos de estados com IDH abaixo da média');

-- Vagas
INSERT INTO Vaga (empresa_id, titulo_vaga, skills_exigidas, regiao) VALUES
(1, 'Desenvolvedora Back-end Pleno', 'Python, FastAPI, PostgreSQL, Docker', 'Nordeste'),
(1, 'Analista de Dados', 'Python, SQL, Power BI, Pandas', 'Nordeste'),
(2, 'Engenheira de Machine Learning', 'Python, PyTorch, FastAPI, REST API', 'Norte'),
(3, 'Desenvolvedora Full Stack', 'Python, JavaScript, PostgreSQL', 'Sul');

-- Candidatos (sem dados pessoais sensíveis além do necessário para o sistema)
INSERT INTO Candidato (nome_completo, email, skills_candidato, genero, raca, latitude, longitude) VALUES
('Candidato A', 'candidato.a@email.com', 'Python, FastAPI, MySQL, Docker', 'Feminino', 'Preta', -12.9714, -38.5014),
('Candidato B', 'candidato.b@email.com', 'Python, Flask, PostgreSQL, Redis', 'Masculino', 'Pardo', -3.7172, -38.5433),
('Candidato C', 'candidato.c@email.com', 'Python, PyTorch, FastAPI, LLMs, REST API', 'Feminino', 'Preta', -1.4558, -48.5044),
('Candidato D', 'candidato.d@email.com', 'Python, SQL, Power BI, ETL', 'Masculino', 'Branco', -23.5505, -46.6333),
('Candidato E', 'candidato.e@email.com', 'JavaScript, Python, PostgreSQL, React', 'Feminino', 'Parda', -30.0346, -51.2177),
('Candidato F', 'candidato.f@email.com', 'Python, Pandas, SQL, Databricks', 'Masculino', 'Preto', -9.6658, -35.7350);

-- Dataset Vísent CDRView (mockado)
INSERT INTO Visent_CDRView_Dados (zona_coordenadas, concentracao_talentos, cobertura_rede, latitude_antena, longitude_antena) VALUES
('Nordeste - Bahia', 'Alta', '4G', -12.9714, -38.5014),
('Nordeste - Ceará', 'Alta', '4G', -3.7172, -38.5433),
('Norte - Pará', 'Média', '3G', -1.4558, -48.5044),
('Sudeste - São Paulo', 'Muito Alta', '5G', -23.5505, -46.6333),
('Sul - Rio Grande do Sul', 'Média', '4G', -30.0346, -51.2177),
('Nordeste - Alagoas', 'Média', '4G', -9.6658, -35.7350);
