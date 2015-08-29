--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: evolucao_campos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE evolucao_campos (
    id integer NOT NULL,
    nome character varying(255),
    tipo_campo character varying(255),
    titulo character varying(255),
    requerido boolean,
    evolucao_tipo_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: evolucao_campos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE evolucao_campos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evolucao_campos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE evolucao_campos_id_seq OWNED BY evolucao_campos.id;


--
-- Name: evolucao_tipos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE evolucao_tipos (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    inativo boolean
);


--
-- Name: evolucao_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE evolucao_tipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evolucao_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE evolucao_tipos_id_seq OWNED BY evolucao_tipos.id;


--
-- Name: evolucaos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE evolucaos (
    id integer NOT NULL,
    paciente_id integer,
    data date,
    evolucao_tipo_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    propriedades hstore
);


--
-- Name: evolucaos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE evolucaos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evolucaos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE evolucaos_id_seq OWNED BY evolucaos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY evolucao_campos ALTER COLUMN id SET DEFAULT nextval('evolucao_campos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY evolucao_tipos ALTER COLUMN id SET DEFAULT nextval('evolucao_tipos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY evolucaos ALTER COLUMN id SET DEFAULT nextval('evolucaos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: evolucao_campos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY evolucao_campos
    ADD CONSTRAINT evolucao_campos_pkey PRIMARY KEY (id);


--
-- Name: evolucao_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY evolucao_tipos
    ADD CONSTRAINT evolucao_tipos_pkey PRIMARY KEY (id);


--
-- Name: evolucaos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY evolucaos
    ADD CONSTRAINT evolucaos_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: evolocaos_propriedades; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX evolocaos_propriedades ON evolucaos USING gin (propriedades);


--
-- Name: index_evolucao_campos_on_evolucao_tipo_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_evolucao_campos_on_evolucao_tipo_id ON evolucao_campos USING btree (evolucao_tipo_id);


--
-- Name: index_evolucaos_on_paciente_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_evolucaos_on_paciente_id ON evolucaos USING btree (paciente_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO gestho, public;

INSERT INTO schema_migrations (version) VALUES ('20150624235000');

INSERT INTO schema_migrations (version) VALUES ('20150625002619');

INSERT INTO schema_migrations (version) VALUES ('20150626014540');

INSERT INTO schema_migrations (version) VALUES ('20150628194838');

INSERT INTO schema_migrations (version) VALUES ('20150628194939');

INSERT INTO schema_migrations (version) VALUES ('20150628195027');

INSERT INTO schema_migrations (version) VALUES ('20150804223618');

INSERT INTO schema_migrations (version) VALUES ('20150829145619');
