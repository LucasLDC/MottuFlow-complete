/*
                        MOTTU-FLOW
    Joao Gabriel Boaventura Marques e Silva | RM554874 | 2TDSB-2025
    Leo Motta Lima | RM557851 | 2TDSB-2025
    Lucas Leal das Chagas | RM551124 | 2TDSB-2025
*/

-- ============================================================
-- DROP DAS TABELAS CASO EXISTAM
-- ============================================================
DROP TABLE funcionario CASCADE CONSTRAINTS;
DROP TABLE patio CASCADE CONSTRAINTS;
DROP TABLE moto CASCADE CONSTRAINTS;
DROP TABLE aruco_tag CASCADE CONSTRAINTS;
DROP TABLE camera CASCADE CONSTRAINTS;
DROP TABLE localidade CASCADE CONSTRAINTS;
DROP TABLE registro_status CASCADE CONSTRAINTS;
DROP TABLE auditoria CASCADE CONSTRAINTS;
DROP TABLE fato_motos_status CASCADE CONSTRAINTS;


-- ============================================================
-- CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE funcionario (
    id_funcionario NUMBER(10) PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(14) NOT NULL UNIQUE,
    cargo VARCHAR2(50) NOT NULL,
    telefone VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL UNIQUE,
    senha VARCHAR2(255) NOT NULL,
    refresh_token VARCHAR2(255) DEFAULT NULL,
    expiracao_refresh_token TIMESTAMP DEFAULT NULL
);

CREATE TABLE patio (
    id_patio NUMBER(10) PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    endereco VARCHAR2(200) NOT NULL,
    capacidade_maxima NUMBER NOT NULL
);

CREATE TABLE moto (
    id_moto NUMBER(10) PRIMARY KEY,
    placa VARCHAR2(10) NOT NULL,
    modelo VARCHAR2(50) NOT NULL,
    fabricante VARCHAR2(50) NOT NULL,
    ano NUMBER(4) NOT NULL,
    id_patio NUMBER(10) NOT NULL,
    localizacao_atual VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_moto_patio FOREIGN KEY (id_patio) REFERENCES patio(id_patio)
);

CREATE TABLE camera (
    id_camera NUMBER(10) PRIMARY KEY,
    status_operacional VARCHAR2(20) NOT NULL,
    localizacao_fisica VARCHAR2(255) NOT NULL,
    id_patio NUMBER(10) NOT NULL,
    CONSTRAINT fk_camera_patio FOREIGN KEY (id_patio) REFERENCES patio(id_patio)
);

CREATE TABLE aruco_tag (
    id_tag NUMBER(10) PRIMARY KEY,
    codigo VARCHAR2(50) NOT NULL,
    status VARCHAR2(20) NOT NULL,
    id_moto NUMBER(10) NOT NULL,
    CONSTRAINT fk_aruco_moto FOREIGN KEY (id_moto) REFERENCES moto(id_moto)
);

CREATE TABLE localidade (
    id_localidade NUMBER(10) PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ponto_referencia VARCHAR2(100) NOT NULL,
    id_moto NUMBER(10) NOT NULL,
    id_patio NUMBER(10) NOT NULL,
    id_camera NUMBER(10) NOT NULL,
    CONSTRAINT fk_localidade_moto FOREIGN KEY (id_moto) REFERENCES moto(id_moto),
    CONSTRAINT fk_localidade_patio FOREIGN KEY (id_patio) REFERENCES patio(id_patio),
    CONSTRAINT fk_localidade_camera FOREIGN KEY (id_camera) REFERENCES camera(id_camera)
);

CREATE TABLE registro_status (
    id_status NUMBER(10) PRIMARY KEY,
    tipo_status VARCHAR2(50) NOT NULL,
    descricao VARCHAR2(255),
    data_status TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_moto NUMBER(10) NOT NULL,
    id_funcionario NUMBER(10) NOT NULL,
    CONSTRAINT fk_status_moto FOREIGN KEY (id_moto) REFERENCES moto(id_moto),
    CONSTRAINT fk_status_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE auditoria (
    id_auditoria NUMBER(10) PRIMARY KEY,
    nome_usuario VARCHAR2(50),
    tipo_operacao VARCHAR2(20),
    data_hora TIMESTAMP,
    valores_anteriores CLOB,
    valores_novos CLOB
);

CREATE TABLE fato_motos_status (
    id_patio NUMBER(10),
    tipo_status VARCHAR2(50),
    quantidade NUMBER,
    CONSTRAINT pk_fato_motos_status PRIMARY KEY (id_patio, tipo_status),
    CONSTRAINT fk_patio FOREIGN KEY (id_patio) REFERENCES patio(id_patio)
);
-- ============================================================
-- SEQUENCES
-- ============================================================
DROP SEQUENCE seq_registro_status;
DROP SEQUENCE seq_localidade;
DROP SEQUENCE auditoria_seq;


CREATE SEQUENCE seq_registro_status START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE seq_localidade START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE auditoria_seq START WITH 1 INCREMENT BY 1;

-- ============================================================
-- INSERTS
-- ============================================================
INSERT INTO funcionario VALUES (1, 'Joao Silva',  '12345678900', 'Gerente', '11999990001', 'joao.silva@email.com', 'senha123', NULL, NULL);
INSERT INTO funcionario VALUES (2, 'Maria Souza', '22345678900', 'Tecnico', '11999990002', 'maria.souza@email.com', 'senha123', NULL, NULL);
INSERT INTO funcionario VALUES (3, 'Carlos Lima', '32345678900', 'Analista', '11999990003', 'carlos.lima@email.com', 'senha123', NULL, NULL);
INSERT INTO funcionario VALUES (4, 'Ana Costa', '42345678900', 'Supervisor', '11999990004', 'ana.costa@email.com', 'senha123', NULL, NULL);
INSERT INTO funcionario VALUES (5, 'Pedro Rocha', '52345678900', 'Motorista', '11999990005', 'pedro.rocha@email.com', 'senha123', NULL, NULL);

INSERT INTO patio VALUES (1, 'Patio Central', 'Rua A 123', 50);
INSERT INTO patio VALUES (2, 'Patio Norte', 'Rua B 456', 30);
INSERT INTO patio VALUES (3, 'Patio Sul', 'Rua C 789', 40);
INSERT INTO patio VALUES (4, 'Patio Leste', 'Rua D 321', 20);
INSERT INTO patio VALUES (5, 'Patio Oeste', 'Rua E 654', 25);

INSERT INTO moto VALUES (1, 'ABC1234', 'CG150', 'Honda', 2020, 1, 'Rua A');
INSERT INTO moto VALUES (2, 'DEF5678', 'Biz110', 'Honda', 2021, 2, 'Rua B');
INSERT INTO moto VALUES (3, 'GHI9012', 'XRE300', 'Honda', 2019, 3, 'Rua C');
INSERT INTO moto VALUES (4, 'JKL3456', 'PCX150', 'Honda', 2022, 4, 'Rua D');
INSERT INTO moto VALUES (5, 'MNO7890', 'Fazer250', 'Yamaha', 2023, 5, 'Rua E');

INSERT INTO camera VALUES (1, 'Operacional', 'Entrada Patio Central', 1);
INSERT INTO camera VALUES (2, 'Manutencao', 'Saida Patio Norte', 2);
INSERT INTO camera VALUES (3, 'Operacional', 'Corredor Patio Sul', 3);
INSERT INTO camera VALUES (4, 'Inoperante', 'Portao Patio Leste', 4);
INSERT INTO camera VALUES (5, 'Operacional', 'Garagem Patio Oeste', 5);

INSERT INTO aruco_tag VALUES (1, 'TAG001', 'Ativo', 1);
INSERT INTO aruco_tag VALUES (2, 'TAG002', 'Ativo', 2);
INSERT INTO aruco_tag VALUES (3, 'TAG003', 'Inativo', 3);
INSERT INTO aruco_tag VALUES (4, 'TAG004', 'Ativo', 4);
INSERT INTO aruco_tag VALUES (5, 'TAG005', 'Manutencao', 5);

INSERT INTO localidade VALUES (1, TIMESTAMP '2025-05-16 08:00:00', 'Portao A', 1, 1, 1);
INSERT INTO localidade VALUES (2, TIMESTAMP '2025-05-16 08:10:00', 'Portao B', 2, 2, 2);
INSERT INTO localidade VALUES (3, TIMESTAMP '2025-05-16 08:20:00', 'Portao C', 3, 3, 3);
INSERT INTO localidade VALUES (4, TIMESTAMP '2025-05-16 08:30:00', 'Portao D', 4, 4, 4);
INSERT INTO localidade VALUES (5, TIMESTAMP '2025-05-16 08:40:00', 'Portao E', 5, 5, 5);

INSERT INTO registro_status VALUES (1, 'Disponivel', 'Moto pronta para uso.', TIMESTAMP '2025-05-16 08:00:00', 1, 1);
INSERT INTO registro_status VALUES (2, 'Inativo', 'Aguardando documentacao.', TIMESTAMP '2025-05-16 08:10:00', 2, 3);
INSERT INTO registro_status VALUES (3, 'Manutencao', 'Revisao geral.', TIMESTAMP '2025-05-16 08:20:00', 3, 2);
INSERT INTO registro_status VALUES (4, 'Reservado', 'Reservada via app.', TIMESTAMP '2025-05-16 08:30:00', 4, 4);
INSERT INTO registro_status VALUES (5, 'Baixa', 'Moto furtada.', TIMESTAMP '2025-05-16 08:40:00', 5, 1);

INSERT INTO fato_motos_status VALUES (1, 'Disponivel', 10);
INSERT INTO fato_motos_status VALUES (1, 'Manutencao', 5);
INSERT INTO fato_motos_status VALUES (2, 'Disponivel', 8);
INSERT INTO fato_motos_status VALUES (2, 'Reservado', 3);
INSERT INTO fato_motos_status VALUES (3, 'Disponivel', 7);
INSERT INTO fato_motos_status VALUES (3, 'Manutencao', 2);
INSERT INTO fato_motos_status VALUES (4, 'Reservado', 4);
INSERT INTO fato_motos_status VALUES (4, 'Disponivel', 6);
INSERT INTO fato_motos_status VALUES (5, 'Manutencao', 1);
INSERT INTO fato_motos_status VALUES (5, 'Disponivel', 9);

COMMIT;

-- ============================================================
-- CONSULTAS PARA VERIFICAR O CONTEÚDO DAS TABELAS
-- ============================================================
SELECT * FROM funcionario;
SELECT * FROM patio;
SELECT * FROM moto;
SELECT * FROM aruco_tag;
SELECT * FROM camera;
SELECT * FROM localidade;
SELECT * FROM registro_status;
SELECT * FROM auditoria;
SELECT * FROM fato_motos_status;

-- ============================================================
-- PROCEDURE 1 - JSON Funcionario + Motos
-- ============================================================
DROP PROCEDURE relatorio_funcionario_moto_status;

CREATE OR REPLACE PROCEDURE relatorio_funcionario_moto_status(p_id_funcionario IN NUMBER)
IS
    v_json CLOB;
BEGIN
    SELECT '{' ||
           '"id_funcionario": ' || f.id_funcionario || ', ' ||
           '"nome": "' || f.nome || '", ' ||
           '"cargo": "' || f.cargo || '", ' ||
           '"motos": [' ||
           NVL(
               LISTAGG(
                   '{"id_moto":' || m.id_moto ||
                   ',"placa":"' || m.placa || '"' ||
                   ',"status":"' || rs.tipo_status || '"}', ','
               ) WITHIN GROUP (ORDER BY m.id_moto),
               ''
           ) ||
           ']' ||
           '}'
    INTO v_json
    FROM funcionario f
    LEFT JOIN registro_status rs ON f.id_funcionario = rs.id_funcionario
    LEFT JOIN moto m ON rs.id_moto = m.id_moto
    WHERE f.id_funcionario = p_id_funcionario
    GROUP BY f.id_funcionario, f.nome, f.cargo;

    DBMS_OUTPUT.PUT_LINE(v_json);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Funcionario nao encontrado');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Mais de um funcionario retornado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/


-- ============================================================
-- PROCEDURE 2 - Soma por patio/status
-- ============================================================
DROP PROCEDURE soma_fato_motos;

CREATE OR REPLACE PROCEDURE soma_fato_motos IS
    -- Variáveis de controle
    v_id_patio       fato_motos_status.id_patio%TYPE;
    v_tipo_status    fato_motos_status.tipo_status%TYPE;
    v_quantidade     fato_motos_status.quantidade%TYPE;

    -- Variáveis de soma
    v_subtotal       NUMBER := 0;
    v_total_geral    NUMBER := 0;
    v_patio_atual    fato_motos_status.id_patio%TYPE;

    -- Cursor para ler os dados já ordenados
    CURSOR c_fato IS
        SELECT id_patio, tipo_status, quantidade
        FROM fato_motos_status
        ORDER BY id_patio, tipo_status;

BEGIN
    v_patio_atual := NULL;

    -- Loop pelos registros da tabela de fatos
    FOR r IN c_fato LOOP
        -- Mudança de grupo (novo pátio)
        IF v_patio_atual IS NOT NULL AND r.id_patio != v_patio_atual THEN
            -- Exibe subtotal do grupo anterior
            DBMS_OUTPUT.PUT_LINE('{"id_patio": ' || v_patio_atual || ', "tipo_status": null, "subtotal": ' || v_subtotal || '}');
            v_subtotal := 0;
        END IF;

        -- Exibe linha detalhada
        DBMS_OUTPUT.PUT_LINE('{"id_patio": ' || r.id_patio || ', "tipo_status": "' || r.tipo_status || '", "quantidade": ' || r.quantidade || '}');

        -- Acumula subtotal e total geral
        v_subtotal    := v_subtotal + r.quantidade;
        v_total_geral := v_total_geral + r.quantidade;

        v_patio_atual := r.id_patio;
    END LOOP;

    -- Subtotal do último grupo
    IF v_patio_atual IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('{"id_patio": ' || v_patio_atual || ', "tipo_status": null, "subtotal": ' || v_subtotal || '}');
    END IF;

    -- Total geral
    DBMS_OUTPUT.PUT_LINE('{"id_patio": null, "tipo_status": null, "total_geral": ' || v_total_geral || '}');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('{"erro": "Nenhum dado encontrado na tabela de fatos."}');
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('{"erro": "Violação de chave única detectada."}');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('{"erro": "Erro inesperado: ' || SQLERRM || '"}');
END soma_fato_motos;
/


-- ============================================================
-- FUNÇÃO 1 - Moto para JSON
-- ============================================================
DROP FUNCTION moto_to_json;

CREATE OR REPLACE FUNCTION moto_to_json(p_id_moto IN NUMBER) RETURN CLOB
IS
    v_json CLOB;
BEGIN
    SELECT '{' ||
           '"id_moto": ' || id_moto || ', ' ||
           '"placa": "' || placa || '", ' ||
           '"modelo": "' || modelo || '", ' ||
           '"fabricante": "' || fabricante || '", ' ||
           '"ano": ' || ano || ', ' ||
           '"id_patio": ' || id_patio || ', ' ||
           '"localizacao_atual": "' || localizacao_atual || '"' ||
           '}'
    INTO v_json
    FROM moto
    WHERE id_moto = p_id_moto;

    RETURN v_json;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '{"erro": "Moto nao encontrada"}';
    WHEN OTHERS THEN
        RETURN '{"erro": "' || SQLERRM || '"}';
END;
/

-- ============================================================
-- FUNÇÃO 2 - Validar senha do funcionario
-- ============================================================
DROP FUNCTION validar_senha;

CREATE OR REPLACE FUNCTION validar_senha(p_id_funcionario IN NUMBER, p_senha IN VARCHAR2) RETURN VARCHAR2
IS
    v_senha VARCHAR2(255);
BEGIN
    SELECT senha INTO v_senha FROM funcionario WHERE id_funcionario = p_id_funcionario;

    IF v_senha = p_senha THEN
        RETURN 'Valido';
    ELSE
        RETURN 'Invalido';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Funcionario nao encontrado';
    WHEN OTHERS THEN
        RETURN 'Erro: ' || SQLERRM;
END;
/

-- ============================================================
-- TRIGGER DE AUDITORIA PARA MOTO
-- ============================================================
DROP TRIGGER auditoria_moto;

CREATE OR REPLACE TRIGGER auditoria_moto
AFTER INSERT OR UPDATE OR DELETE ON moto
FOR EACH ROW
DECLARE
    v_tipo_operacao      VARCHAR2(10);
    v_valores_anteriores CLOB;
    v_valores_novos      CLOB;
BEGIN
    -- Define o tipo de operação e os valores
    IF INSERTING THEN
        v_tipo_operacao := 'INSERT';
        v_valores_anteriores := NULL;
        v_valores_novos := 
            '{' ||
            '"id_moto": ' || :NEW.id_moto || ',' ||
            '"placa": "' || :NEW.placa || '",' ||
            '"modelo": "' || :NEW.modelo || '",' ||
            '"fabricante": "' || :NEW.fabricante || '",' ||
            '"ano": ' || :NEW.ano || ',' ||
            '"id_patio": ' || :NEW.id_patio || ',' ||
            '"localizacao_atual": "' || :NEW.localizacao_atual || '"' ||
            '}';

    ELSIF UPDATING THEN
        v_tipo_operacao := 'UPDATE';
        v_valores_anteriores := 
            '{' ||
            '"id_moto": ' || :OLD.id_moto || ',' ||
            '"placa": "' || :OLD.placa || '",' ||
            '"modelo": "' || :OLD.modelo || '",' ||
            '"fabricante": "' || :OLD.fabricante || '",' ||
            '"ano": ' || :OLD.ano || ',' ||
            '"id_patio": ' || :OLD.id_patio || ',' ||
            '"localizacao_atual": "' || :OLD.localizacao_atual || '"' ||
            '}';
        v_valores_novos := 
            '{' ||
            '"id_moto": ' || :NEW.id_moto || ',' ||
            '"placa": "' || :NEW.placa || '",' ||
            '"modelo": "' || :NEW.modelo || '",' ||
            '"fabricante": "' || :NEW.fabricante || '",' ||
            '"ano": ' || :NEW.ano || ',' ||
            '"id_patio": ' || :NEW.id_patio || ',' ||
            '"localizacao_atual": "' || :NEW.localizacao_atual || '"' ||
            '}';

    ELSIF DELETING THEN
        v_tipo_operacao := 'DELETE';
        v_valores_anteriores := 
            '{' ||
            '"id_moto": ' || :OLD.id_moto || ',' ||
            '"placa": "' || :OLD.placa || '",' ||
            '"modelo": "' || :OLD.modelo || '",' ||
            '"fabricante": "' || :OLD.fabricante || '",' ||
            '"ano": ' || :OLD.ano || ',' ||
            '"id_patio": ' || :OLD.id_patio || ',' ||
            '"localizacao_atual": "' || :OLD.localizacao_atual || '"' ||
            '}';
        v_valores_novos := NULL;
    END IF;

    -- Faz o insert na tabela de auditoria
    INSERT INTO auditoria (
        id_auditoria,
        nome_usuario,
        tipo_operacao,
        data_hora,
        valores_anteriores,
        valores_novos
    )
    VALUES (
        auditoria_seq.NEXTVAL,
        USER,
        v_tipo_operacao,
        SYSTIMESTAMP,
        v_valores_anteriores,
        v_valores_novos
    );
END;
/

