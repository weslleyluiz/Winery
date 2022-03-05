CREATE TABLE avaliacoes (
    ava_id        INTEGER NOT NULL,
    ava_pontos    INTEGER,
    ava_descricao VARCHAR2(255),
    ava_cri_id    INTEGER NOT NULL,
    ava_vin_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE avaliacoes IS
    'Esta tabela armazena dados referentes a avaliação de cada vinho por cada crítico.';

COMMENT ON COLUMN avaliacoes.ava_pontos IS
    'Esta coluna armazena o dado de pontuação da avaliação pelo crítico.';

COMMENT ON COLUMN avaliacoes.ava_descricao IS
    'Esta coluna armazena o dado de descrição da avaliação do crítico.';

COMMENT ON COLUMN avaliacoes.ava_cri_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de críticos.';

COMMENT ON COLUMN avaliacoes.ava_vin_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de vinícolas.';

ALTER TABLE avaliacoes ADD CONSTRAINT pk_ava PRIMARY KEY ( ava_id );

CREATE TABLE criticos (
    cri_id              INTEGER NOT NULL,
    cri_nome            VARCHAR2(255),
    cri_twitter_account VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE criticos IS
    'Esta tabela armazena dados referentes aos avaliadores dos vinhos.';

COMMENT ON COLUMN criticos.cri_nome IS
    'Esta coluna armazena o dado nome do crítico.';

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

COMMENT ON COLUMN designacoes.des_descricao IS
    'Esta coluna armazena o dado de descrição da designação.';

ALTER TABLE designacoes ADD CONSTRAINT pk_des PRIMARY KEY ( des_id );

CREATE TABLE fabricantes (
    fab_id   INTEGER NOT NULL,
    fab_nome VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE fabricantes IS
    'Esta tabela armazena dados referentes aos fabricantes do vinho.';

COMMENT ON COLUMN fabricantes.fab_nome IS
    'Esta coluna armazena o dado nome do fabricante.';

ALTER TABLE fabricantes ADD CONSTRAINT pk_fab PRIMARY KEY ( fab_id );

CREATE TABLE localizacoes (
    loc_id        INTEGER NOT NULL,
    loc_provincia VARCHAR2(255),
    loc_reg_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE localizacoes IS
    'Esta tabela armazena dados referentes à localização do fabricante.';

COMMENT ON COLUMN localizacoes.loc_provincia IS
    'Esta coluna armazena o dado da província.';

COMMENT ON COLUMN localizacoes.loc_reg_id IS
    'Esta coluna armazena o dado fk da tabela de regiões.';

ALTER TABLE localizacoes ADD CONSTRAINT pk_loc PRIMARY KEY ( loc_id );

CREATE TABLE paises (
    pai_id   INTEGER NOT NULL,
    pai_pais VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE paises IS
    'Esta tabela armazena dados referentes aos países.';

COMMENT ON COLUMN paises.pai_pais IS
    'Esta coluna armazena o dado do nome do país.';

ALTER TABLE paises ADD CONSTRAINT pk_pai PRIMARY KEY ( pai_id );

CREATE TABLE regioes (
    reg_id        INTEGER NOT NULL,
    reg_descricao VARCHAR2(255),
    reg_pai_id    INTEGER NOT NULL,
    reg_sub_id    INTEGER NOT NULL
)
LOGGING;

COMMENT ON TABLE regioes IS
    'Esta tabela armazena dados referentes à região do vinho.';

COMMENT ON COLUMN regioes.reg_descricao IS
    'Esta coluna armazena o dado de descrição da região.';

COMMENT ON COLUMN regioes.reg_pai_id IS
    'Esta coluna armazena o dado id do país na tabela de países.';

COMMENT ON COLUMN regioes.reg_sub_id IS
    'Esta coluna armazena o dado fk da tabela de subregiões.';

ALTER TABLE regioes ADD CONSTRAINT pk_reg PRIMARY KEY ( reg_id );

CREATE TABLE subregioes (
    sub_id        INTEGER NOT NULL,
    sub_descricao VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE subregioes IS
    'Esta tabela armazena dados referentes à subregiões das regiões.';

COMMENT ON COLUMN subregioes.sub_descricao IS
    'Esta coluna armazena o dado de descrição da sub-região. ';

ALTER TABLE subregioes ADD CONSTRAINT pk_sub PRIMARY KEY ( sub_id );

CREATE TABLE variedades (
    var_id        INTEGER NOT NULL,
    var_descricao VARCHAR2(255)
)
LOGGING;

COMMENT ON TABLE variedades IS
    'Esta tabela armazena dados referentes às variedades dos vinhos.';

COMMENT ON COLUMN variedades.var_descricao IS
    'Esta coluna armazena o dado de descrição da variedade';

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

COMMENT ON COLUMN vinhos.vin_title IS
    'Esta coluna armazena o dado de título do vinho';

COMMENT ON COLUMN vinhos.vin_price IS
    'Esta coluna armazena o dado de preço do vinho';

COMMENT ON COLUMN vinhos.vin_fab_id IS
    'Esta coluna armazena o dado de id do fabricante';

COMMENT ON COLUMN vinhos.vin_var_id IS
    'Esta coluna armazena o dado de id da variedade';

COMMENT ON COLUMN vinhos.vin_des_id IS
    'Esta coluna armazena o dado de id da designação';

COMMENT ON COLUMN vinhos.vin_loc_id IS
    'Esta coluna armazena o dado de id da localização';

ALTER TABLE vinhos ADD CONSTRAINT pk_vin PRIMARY KEY ( vin_id );

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_cri FOREIGN KEY ( ava_cri_id )
        REFERENCES criticos ( cri_id )
    NOT DEFERRABLE;

ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_ava_vin FOREIGN KEY ( ava_vin_id )
        REFERENCES vinhos ( vin_id )
    NOT DEFERRABLE;

ALTER TABLE localizacoes
    ADD CONSTRAINT fk_loc_reg FOREIGN KEY ( loc_reg_id )
        REFERENCES regioes ( reg_id )
    NOT DEFERRABLE;

ALTER TABLE regioes
    ADD CONSTRAINT fk_reg_pai FOREIGN KEY ( reg_pai_id )
        REFERENCES paises ( pai_id )
    NOT DEFERRABLE;

ALTER TABLE regioes
    ADD CONSTRAINT fk_reg_sub FOREIGN KEY ( reg_sub_id )
        REFERENCES subregioes ( sub_id )
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
    ADD CONSTRAINT fk_vin_loc FOREIGN KEY ( vin_loc_id )
        REFERENCES localizacoes ( loc_id )
    NOT DEFERRABLE;

ALTER TABLE vinhos
    ADD CONSTRAINT fk_vin_var FOREIGN KEY ( vin_var_id )
        REFERENCES variedades ( var_id )
    NOT DEFERRABLE;