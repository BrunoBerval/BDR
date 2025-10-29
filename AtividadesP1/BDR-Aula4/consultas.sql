-- 1. Encontrar um usuário pelo e-mail
SELECT idUser, nomeUser, emailUser
FROM tbUser
WHERE emailUser = 'pedro.soares@email.com';

---

-- 2. Encontrar eventos que ainda estão em andamento
SELECT idEvent, nomeEvent, status, dataHora
FROM tbEvent
WHERE status = 'Investigação' OR status = 'Crítico';

---

-- 3. Encontrar um tipo de evento pela descrição
SELECT idTE, nomeTE, descrTE
FROM tbTE
WHERE descrTE LIKE '%Cibernético%';

---

-- 4. Encontrar relatos de um evento específico
SELECT idRelato, relato, dataHora
FROM tbRelato
WHERE id_Event = 1;

---

-- 5. Encontrar alertas de nível alto
SELECT idAlert, msg, levelAlert
FROM tbAlert
WHERE levelAlert >= 2;