-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-03-24 23:35:01 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE avaliacoes (
    ava_id        INTEGER NOT NULL,
    ava_pontos    INTEGER,
    ava_descricao VARCHAR2(255),
    ava_cri_id    INTEGER NOT NULL,
    ava_vin_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE avaliacoes IS
    'Esta tabela armazena dados referentes a avalia√ß√£o de cada vinho por cada cr√≠tico.';

COMMENT ON COLUMN avaliacoes.ava_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN avaliacoes.ava_pontos IS
    'Esta coluna armazena o dado de pontua√ß√£o da avalia√ß√£o pelo cr√≠tico.';

COMMENT ON COLUMN avaliacoes.ava_descricao IS
    'Esta coluna armazena o dado de descri√ß√£o da avalia√ß√£o do cr√≠tico.';

COMMENT ON COLUMN avaliacoes.ava_cri_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de cr√≠ticos.';

COMMENT ON COLUMN avaliacoes.ava_vin_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de vin√≠colas.';

ALTER TABLE avaliacoes ADD CONSTRAINT pk_ava PRIMARY KEY ( ava_id );

CREATE TABLE criticos (
    cri_id              INTEGER NOT NULL,
    cri_nome            VARCHAR2(255),
    cri_twitter_account VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE criticos IS
    'Esta tabela armazena dados referentes aos avaliadores dos vinhos.';

COMMENT ON COLUMN criticos.cri_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN criticos.cri_nome IS
    'Esta coluna armazena o dado nome do cr√≠tico.';

COMMENT ON COLUMN criticos.cri_twitter_account IS
    'Esta coluna armazena o dado da conta do twitter do avaliador.';

ALTER TABLE criticos ADD CONSTRAINT pk_cri PRIMARY KEY ( cri_id );

CREATE TABLE designacoes (
    des_id        INTEGER NOT NULL,
    des_descricao VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE designacoes IS
    'Esta tabela armazena dados referentes aos vinhedos dos fabricantes.';

COMMENT ON COLUMN designacoes.des_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN designacoes.des_descricao IS
    'Esta coluna armazena o dado de descri√ß√£o da designa√ß√£o.';

ALTER TABLE designacoes ADD CONSTRAINT pk_des PRIMARY KEY ( des_id );

CREATE TABLE fabricantes (
    fab_id   INTEGER NOT NULL,
    fab_nome VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE fabricantes IS
    'Esta tabela armazena dados referentes aos fabricantes do vinho.';

COMMENT ON COLUMN fabricantes.fab_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN fabricantes.fab_nome IS
    'Esta coluna armazena o dado nome do fabricante.';

ALTER TABLE fabricantes ADD CONSTRAINT pk_fab PRIMARY KEY ( fab_id );

CREATE TABLE paises (
    pai_id     INTEGER NOT NULL,
    pai_pais   VARCHAR2(255),
    pai_pro_id INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE paises IS
    'Esta tabela armazena dados referentes aos pa√≠ses.';

COMMENT ON COLUMN paises.pai_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN paises.pai_pais IS
    'Esta coluna armazena o dado do nome do pa√≠s.';

COMMENT ON COLUMN paises.pai_pro_id IS
    'Esta coluna armazena o dado id de provincias.';

ALTER TABLE paises ADD CONSTRAINT pk_pai PRIMARY KEY ( pai_id );

CREATE TABLE provincias (
    pro_id        INTEGER NOT NULL,
    pro_provincia VARCHAR2(255),
    pro_reg_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE provincias IS
    'Esta tabela armazena dados referentes √† localiza√ß√£o do fabricante.';

COMMENT ON COLUMN provincias.pro_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN provincias.pro_provincia IS
    'Esta coluna armazena o dado da prov√≠ncia.';

COMMENT ON COLUMN provincias.pro_reg_id IS
    'Esta coluna armazena o dado id de regiıes.';

ALTER TABLE provincias ADD CONSTRAINT pk_loc PRIMARY KEY ( pro_id );

CREATE TABLE regioes (
    reg_id        INTEGER NOT NULL,
    reg_descricao VARCHAR2(255),
    reg_sub_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE regioes IS
    'Esta tabela armazena dados referentes √† regi√£o do vinho.';

COMMENT ON COLUMN regioes.reg_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN regioes.reg_descricao IS
    'Esta coluna armazena o dado de descri√ß√£o da regi√£o.';

COMMENT ON COLUMN regioes.reg_sub_id IS
    'Esta coluna armazena o dado id de subregi„o.';

ALTER TABLE regioes ADD CONSTRAINT pk_reg PRIMARY KEY ( reg_id );

CREATE TABLE subregioes (
    sub_id        INTEGER NOT NULL,
    sub_descricao VARCHAR2(255),
    sub_vin_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE subregioes IS
    'Esta tabela armazena dados referentes √† subregi√µes das regi√µes.';

COMMENT ON COLUMN subregioes.sub_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN subregioes.sub_descricao IS
    'Esta coluna armazena o dado de descri√ß√£o da sub-regi√£o. ';

COMMENT ON COLUMN subregioes.sub_vin_id IS
    'Esta coluna armazena o dado id de vinhos.';

ALTER TABLE subregioes ADD CONSTRAINT pk_sub PRIMARY KEY ( sub_id );

CREATE TABLE variedades (
    var_id        INTEGER NOT NULL,
    var_descricao VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE variedades IS
    'Esta tabela armazena dados referentes √†s variedades dos vinhos.';

COMMENT ON COLUMN variedades.var_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN variedades.var_descricao IS
    'Esta coluna armazena o dado de descri√ß√£o da variedade';

ALTER TABLE variedades ADD CONSTRAINT pk_var PRIMARY KEY ( var_id );

CREATE TABLE vinhos (
    vin_id     INTEGER NOT NULL,
    vin_title  VARCHAR2(255),
    vin_price  NUMBER(8, 2),
    vin_fab_id INTEGER NOT NULL,
    vin_var_id INTEGER NOT NULL,
    vin_des_id INTEGER NOT NULL,
    vin_loc_id INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE vinhos IS
    'Esta tabela armazena dados referentes aos vinhos.';

COMMENT ON COLUMN vinhos.vin_id IS
    'Esta coluna È a pk da relaÁ„o.';

COMMENT ON COLUMN vinhos.vin_title IS
    'Esta coluna armazena o dado de t√≠tulo do vinho';

COMMENT ON COLUMN vinhos.vin_price IS
    'Esta coluna armazena o dado de pre√ßo do vinho';

COMMENT ON COLUMN vinhos.vin_fab_id IS
    'Esta coluna armazena o dado de id do fabricante';

COMMENT ON COLUMN vinhos.vin_var_id IS
    'Esta coluna armazena o dado de id da variedade';

COMMENT ON COLUMN vinhos.vin_des_id IS
    'Esta coluna armazena o dado de id da designa√ß√£o';

COMMENT ON COLUMN vinhos.vin_loc_id IS
    'Esta coluna armazena o dado de id da localiza√ß√£o';

ALTER TABLE vinhos ADD CONSTRAINT pk_vin PRIMARY KEY ( vin_id );

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_cri FOREIGN KEY ( ava_cri_id )
        REFERENCES criticos ( cri_id )
    NOT DEFERRABLE;

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_vin FOREIGN KEY ( ava_vin_id )
        REFERENCES vinhos ( vin_id )
    NOT DEFERRABLE;

ALTER TABLE paises
    ADD CONSTRAINT fk_pai_pro FOREIGN KEY ( pai_pro_id )
        REFERENCES provincias ( pro_id )
    NOT DEFERRABLE;

ALTER TABLE provincias
    ADD CONSTRAINT fk_pro_reg FOREIGN KEY ( pro_reg_id )
        REFERENCES regioes ( reg_id )
    NOT DEFERRABLE;

ALTER TABLE regioes
    ADD CONSTRAINT fk_reg_sub FOREIGN KEY ( reg_sub_id )
        REFERENCES subregioes ( sub_id )
    NOT DEFERRABLE;

ALTER TABLE subregioes
    ADD CONSTRAINT fk_sub_vin FOREIGN KEY ( sub_vin_id )
        REFERENCES vinhos ( vin_id )
    NOT DEFERRABLE;

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_des FOREIGN KEY ( vin_des_id )
        REFERENCES designacoes ( des_id )
    NOT DEFERRABLE;

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_fab FOREIGN KEY ( vin_fab_id )
        REFERENCES fabricantes ( fab_id )
    NOT DEFERRABLE;

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_var FOREIGN KEY ( vin_var_id )
        REFERENCES variedades ( var_id )
    NOT DEFERRABLE;



-- RelatÛrio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
