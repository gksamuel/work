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
-- Name: notes; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    applicationid integer NOT NULL,
    userid integer NOT NULL,
    parent integer,
    stage character varying(15) NOT NULL,
    comment character varying(255) NOT NULL,
    datecreated timestamp with time zone,
    datemodified timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notes OWNER TO work;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO work;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: notes_applicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_applicationid_fkey FOREIGN KEY (applicationid) REFERENCES applications(id);


--
-- Name: notes_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

