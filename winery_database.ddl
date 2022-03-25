CREATE TABLE avaliacoes (
    ava_id        INTEGER,
    ava_pontos    INTEGER,
    ava_descricao VARCHAR2(255),
    ava_cri_id    INTEGER,
    ava_vin_id    INTEGER,
    CONSTRAINT pk_ava PRIMARY KEY ( ava_id )
);

CREATE TABLE criticos (
    cri_id              INTEGER,
    cri_nome            VARCHAR2(255),
    cri_twitter_account VARCHAR2(255),
    CONSTRAINT pk_cri PRIMARY KEY ( cri_id )
);

CREATE TABLE designacoes (
    des_id        INTEGER,
    des_descricao VARCHAR2(255),
    CONSTRAINT pk_des PRIMARY KEY ( des_id )
);

CREATE TABLE fabricantes (
    fab_id   INTEGER,
    fab_nome VARCHAR2(255),
    CONSTRAINT pk_fab PRIMARY KEY ( fab_id )
);

CREATE TABLE paises (
    pai_id     INTEGER,
    pai_pais   VARCHAR2(255),
    pai_pro_id INTEGER,
    CONSTRAINT pk_pai PRIMARY KEY ( pai_id )
);

CREATE TABLE provincias (
    pro_id        INTEGER,
    pro_provincia VARCHAR2(255),
    pro_reg_id    INTEGER,
    CONSTRAINT pk_pro PRIMARY KEY ( pro_id )
);

CREATE TABLE regioes (
    reg_id        INTEGER,
    reg_descricao VARCHAR2(255),
    reg_sub_id    INTEGER,
    CONSTRAINT pk_reg PRIMARY KEY ( reg_id )
);

CREATE TABLE subregioes (
    sub_id        INTEGER,
    sub_descricao VARCHAR2(255),
    sub_vin_id    INTEGER,
    CONSTRAINT pk_sub PRIMARY KEY ( sub_id )
);

CREATE TABLE variedades (
    var_id        INTEGER,
    var_descricao VARCHAR2(255),
    CONSTRAINT pk_var PRIMARY KEY ( var_id )
);

CREATE TABLE vinhos (
    vin_id     INTEGER,
    vin_title  VARCHAR2(255),
    vin_price  NUMBER(8, 2),
    vin_fab_id INTEGER,
    vin_var_id INTEGER,
    vin_des_id INTEGER,
    vin_pro_id INTEGER,
    CONSTRAINT pk_vin PRIMARY KEY ( vin_id )
);

CREATE SEQUENCE seq_ava nocache;

CREATE TRIGGER tg_bi_ava
BEFORE INSERT ON avaliacoes
FOR EACH ROW
BEGIN
    :new.ava_id := seq_ava.nextval;
END;
/

CREATE SEQUENCE seq_cri nocache;

CREATE TRIGGER tg_bi_cri
BEFORE INSERT ON criticos
FOR EACH ROW
BEGIN
    :new.cri_id := seq_cri.nextval;
END;
/

CREATE SEQUENCE seq_des nocache;

CREATE TRIGGER tg_bi_des
BEFORE INSERT ON designacoes
FOR EACH ROW
BEGIN
    :new.des_id := seq_des.nextval;
END;
/

CREATE SEQUENCE seq_fab nocache;

CREATE TRIGGER tg_bi_fab
BEFORE INSERT ON fabricantes
FOR EACH ROW
BEGIN
    :new.fab_id := seq_fab.nextval;
END;
/

CREATE SEQUENCE seq_pro nocache;

CREATE TRIGGER tg_bi_pro
BEFORE INSERT ON provincias
FOR EACH ROW
BEGIN
    :new.pro_id := seq_pro.nextval;
END;
/

CREATE SEQUENCE seq_pai nocache;

CREATE TRIGGER tg_bi_pai
BEFORE INSERT ON paises
FOR EACH ROW
BEGIN
    :new.pai_id := seq_pai.nextval;
END;
/

CREATE SEQUENCE seq_reg nocache;

CREATE TRIGGER tg_bi_reg
BEFORE INSERT ON regioes
FOR EACH ROW
BEGIN
    :new.reg_id := seq_reg.nextval;
END;
/

CREATE SEQUENCE seq_var nocache;

CREATE TRIGGER tg_bi_var
BEFORE INSERT ON variedades
FOR EACH ROW 
BEGIN
   :new.var_id  :=  seq_var.NEXTVAL;
END;
/

CREATE SEQUENCE seq_vin nocache;

CREATE TRIGGER tg_bi_vin
BEFORE INSERT ON vinhos
FOR EACH ROW 
BEGIN
   :new.vin_id  :=  seq_vin.NEXTVAL;
END;
/

CREATE SEQUENCE seq_sub nocache;

CREATE TRIGGER tg_bi_sub
BEFORE INSERT ON subregioes
FOR EACH ROW 
BEGIN
   :new.sub_id  :=  seq_sub.NEXTVAL;
END;
/


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



COMMENT ON TABLE avaliacoes IS
    'Esta tabela armazena dados referentes a avaliação de cada vinho por cada crítico.';

COMMENT ON COLUMN avaliacoes.ava_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN avaliacoes.ava_pontos IS
    'Esta coluna armazena o dado de pontuação da avaliação pelo crítico.';

COMMENT ON COLUMN avaliacoes.ava_descricao IS
    'Esta coluna armazena o dado de descrição da avaliação do crítico.';

COMMENT ON COLUMN avaliacoes.ava_cri_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de críticos.';

COMMENT ON COLUMN avaliacoes.ava_vin_id IS
    'Esta coluna armazena a chave estrangeira para a tabela de vinícolas.';



COMMENT ON TABLE criticos IS
    'Esta tabela armazena dados referentes aos avaliadores dos vinhos.';

COMMENT ON COLUMN criticos.cri_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN criticos.cri_nome IS
    'Esta coluna armazena o dado nome do crítico.';

COMMENT ON COLUMN criticos.cri_twitter_account IS
    'Esta coluna armazena o dado da conta do twitter do avaliador.';



COMMENT ON TABLE designacoes IS
    'Esta tabela armazena dados referentes aos vinhedos dos fabricantes.';

COMMENT ON COLUMN designacoes.des_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN designacoes.des_descricao IS
    'Esta coluna armazena o dado de descrição da designação.';



COMMENT ON TABLE fabricantes IS
    'Esta tabela armazena dados referentes aos fabricantes do vinho.';

COMMENT ON COLUMN fabricantes.fab_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN fabricantes.fab_nome IS
    'Esta coluna armazena o dado nome do fabricante.';



COMMENT ON TABLE paises IS
    'Esta tabela armazena dados referentes aos países.';

COMMENT ON COLUMN paises.pai_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN paises.pai_pais IS
    'Esta coluna armazena o dado do nome do país.';

COMMENT ON COLUMN paises.pai_pro_id IS
    'Esta coluna armazena o dado id de provincias.';



COMMENT ON TABLE provincias IS
    'Esta tabela armazena dados referentes à localização do fabricante.';

COMMENT ON COLUMN provincias.pro_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN provincias.pro_provincia IS
    'Esta coluna armazena o dado da província.';

COMMENT ON COLUMN provincias.pro_reg_id IS
    'Esta coluna armazena o dado id de regi�es.';



COMMENT ON TABLE regioes IS
    'Esta tabela armazena dados referentes à região do vinho.';

COMMENT ON COLUMN regioes.reg_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN regioes.reg_descricao IS
    'Esta coluna armazena o dado de descrição da região.';

COMMENT ON COLUMN regioes.reg_sub_id IS
    'Esta coluna armazena o dado id de subregi�o.';



COMMENT ON TABLE subregioes IS
    'Esta tabela armazena dados referentes à subregiões das regiões.';

COMMENT ON COLUMN subregioes.sub_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN subregioes.sub_descricao IS
    'Esta coluna armazena o dado de descrição da sub-região. ';

COMMENT ON COLUMN subregioes.sub_vin_id IS
    'Esta coluna armazena o dado id de vinhos.';



COMMENT ON TABLE variedades IS
    'Esta tabela armazena dados referentes às variedades dos vinhos.';

COMMENT ON COLUMN variedades.var_id IS
    'Esta coluna � a pk da rela��o.';

COMMENT ON COLUMN variedades.var_descricao IS
    'Esta coluna armazena o dado de descrição da variedade';



COMMENT ON TABLE vinhos IS
    'Esta tabela armazena dados referentes aos vinhos.';

COMMENT ON COLUMN vinhos.vin_id IS
    'Esta coluna � a pk da rela��o.';

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

COMMENT ON COLUMN vinhos.vin_pro_id IS
    'Esta coluna armazena o dado de id da localização';