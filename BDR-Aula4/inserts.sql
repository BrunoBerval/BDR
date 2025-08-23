INSERT INTO categoria_usuario (idCategoria, nomeCategoria, descricaoCategoria) VALUES
(1, 'Usuário Comum', 'Usuário padrão com permissões básicas.'),
(2, 'Agente de Campo', 'Usuário responsável por monitorar e relatar incidentes no local.'),
(3, 'Administrador', 'Usuário com acesso total ao sistema.');


INSERT INTO tbUser (idUser, nomeUser, emailUser, senhaHash, id_Categoria) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'hash_senha_joao', 1),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', 'hash_senha_maria', 1),
(3, 'Carlos Santos', 'carlos.santos@email.com', 'hash_senha_carlos', 2),
(4, 'Ana Costa', 'ana.costa@email.com', 'hash_senha_ana', 3);


INSERT INTO tbLoc (idLoc, Lat, Lon, cidadeLoc, estadoLoc) VALUES
(1, '-23.550520', '-46.633308', 'São Paulo', 'SP'),
(2, '-22.906847', '-43.172897', 'Rio de Janeiro', 'RJ'),
(3, '-15.794229', '-47.882103', 'Brasília', 'DF'),
(4, '-25.428416', '-49.273259', 'Curitiba', 'PR');


INSERT INTO tbTE (idTE, nomeTE, descrTE) VALUES
(1, 'Incêndio', 'Evento de fogo não controlado.'),
(2, 'Inundação', 'Evento de água cobrindo uma área normalmente seca.'),
(3, 'Acidente de Trânsito', 'Colisão envolvendo veículos.');


INSERT INTO tbEvent (idEvent, nomeEvent, descrEvent, dataHora, status, id_TE, id_Loc) VALUES
(1, 'Incêndio na Zona Sul', 'Incêndio de grandes proporções em área residencial.', '2025-08-22 14:00:00', 'Ativo', 1, 1),
(2, 'Inundação em Copacabana', 'Alagamento após forte chuva no bairro de Copacabana.', '2025-08-22 16:30:00', 'Em monitoramento', 2, 2),
(3, 'Colisão na BR-116', 'Acidente entre dois carros e um caminhão.', '2025-08-21 10:00:00', 'Finalizado', 3, 4);


INSERT INTO tbRelato (idRelato, relato, dataHora, id_Event, id_User) VALUES
(1, 'Vi fumaça saindo do prédio. Parece grave.', '2025-08-22 14:05:00', 1, 1),
(2, 'A água já cobriu as calçadas e está subindo rapidamente.', '2025-08-22 16:35:00', 2, 2),
(3, 'Bombeiros e SAMU já estão no local.', '2025-08-22 14:20:00', 1, 3);


INSERT INTO tbAlert (idAlert, msg, dataHora, levelAlert, id_Event) VALUES
(1, 'Nível de alerta elevado. Incêndio fora de controle.', '2025-08-22 14:15:00', 3, 1),
(2, 'Aviso de evacuação de áreas de risco.', '2025-08-22 16:40:00', 2, 2),
(3, 'Tráfego bloqueado na rodovia devido ao acidente.', '2025-08-21 10:30:00', 1, 3);


INSERT INTO historico_evento (idHistorico, id_Event, id_User, dataHora, acao, observacao) VALUES
(1, 1, 4, '2025-08-22 14:02:00', 'Criação do Evento', 'Evento inicial cadastrado pelo administrador.'),
(2, 1, 3, '2025-08-22 14:25:00', 'Atualização do Status', 'Status alterado para "Em monitoramento" com base em relatos de campo.'),
(3, 2, 4, '2025-08-22 16:32:00', 'Criação do Evento', 'Alerta de inundação cadastrado via sistema.'),
(4, 3, 4, '2025-08-21 10:05:00', 'Criação do Evento', 'Evento de trânsito cadastrado.');