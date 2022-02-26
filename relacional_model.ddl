-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-02-26 18:49:23 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE avaliacoes (
    ava_id        INTEGER NOT NULL,
    ava_pontos    INTEGER,
    ava_descricao VARCHAR2(255),
    ava_cri_id    INTEGER NOT NULL,
    ava_vin_id    unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE avaliacoes ADD CONSTRAINT pk_ava PRIMARY KEY ( ava_id );

CREATE TABLE criticos (
    cri_id              INTEGER NOT NULL,
    cri_nome            VARCHAR2(255),
    cri_twitter_account VARCHAR2(255)
);

ALTER TABLE criticos ADD CONSTRAINT pk_cri PRIMARY KEY ( cri_id );

CREATE TABLE designacoes (
    des_id        INTEGER NOT NULL,
    des_descricao VARCHAR2(255)
);

ALTER TABLE designacoes ADD CONSTRAINT pk_des PRIMARY KEY ( des_id );

CREATE TABLE fabricantes (
    fab_id   INTEGER NOT NULL,
    fab_nome VARCHAR2(255)
);

ALTER TABLE fabricantes ADD CONSTRAINT pk_fab PRIMARY KEY ( fab_id );

CREATE TABLE localizacoes (
    loc_id        INTEGER NOT NULL,
    loc_provincia VARCHAR2(255),
    loc_reg_id    INTEGER NOT NULL
);

ALTER TABLE localizacoes ADD CONSTRAINT pk_loc PRIMARY KEY ( loc_id );

CREATE TABLE paises (
    pai_id   INTEGER NOT NULL,
    pai_pais VARCHAR2(255)
);

ALTER TABLE paises ADD CONSTRAINT pk_pai PRIMARY KEY ( pai_id );

CREATE TABLE regioes (
    reg_id        INTEGER NOT NULL,
    reg_descricao VARCHAR2(255),
    reg_pai_id    INTEGER NOT NULL,
    reg_sub_id    INTEGER NOT NULL
);

ALTER TABLE regioes ADD CONSTRAINT pk_reg PRIMARY KEY ( reg_id );

CREATE TABLE subregioes (
    sub_id        INTEGER NOT NULL,
    sub_descricao VARCHAR2(255)
);

ALTER TABLE subregioes ADD CONSTRAINT pk_sub PRIMARY KEY ( sub_id );

CREATE TABLE variedades (
    var_id        INTEGER NOT NULL,
    var_descricao VARCHAR2(255)
);

ALTER TABLE variedades ADD CONSTRAINT pk_var PRIMARY KEY ( var_id );

CREATE TABLE vinhos (
    vin_id     unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    vin_title  VARCHAR2(255),
    vin_price  NUMBER,
    vin_fab_id INTEGER NOT NULL,
    vin_var_id INTEGER NOT NULL,
    vin_des_id INTEGER NOT NULL,
    vin_loc_id INTEGER NOT NULL
);

ALTER TABLE vinhos ADD CONSTRAINT pk_vin PRIMARY KEY ( vin_id );

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_cri FOREIGN KEY ( ava_cri_id )
        REFERENCES criticos ( cri_id );

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_vin FOREIGN KEY ( ava_vin_id )
        REFERENCES vinhos ( vin_id );

ALTER TABLE localizacoes
    ADD CONSTRAINT fk_loc_reg FOREIGN KEY ( loc_reg_id )
        REFERENCES regioes ( reg_id );

ALTER TABLE regioes
    ADD CONSTRAINT fk_reg_pai FOREIGN KEY ( reg_pai_id )
        REFERENCES paises ( pai_id );

ALTER TABLE regioes
    ADD CONSTRAINT fk_reg_sub FOREIGN KEY ( reg_sub_id )
        REFERENCES subregioes ( sub_id );

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_des FOREIGN KEY ( vin_des_id )
        REFERENCES designacoes ( des_id );

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_fab FOREIGN KEY ( vin_fab_id )
        REFERENCES fabricantes ( fab_id );

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_loc FOREIGN KEY ( vin_loc_id )
        REFERENCES localizacoes ( loc_id );

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_var FOREIGN KEY ( vin_var_id )
        REFERENCES variedades ( var_id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
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
-- ERRORS                                   2
-- WARNINGS                                 0
