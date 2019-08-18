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
-- Name: secondshortlist; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE secondshortlist (
    id integer NOT NULL,
    applicationid integer,
    jobid integer,
    userid integer,
    seekerid integer,
    internalcomment character varying(255),
    seekercomment character varying(255),
    publiccomment character varying(255),
    datemodified timestamp without time zone DEFAULT now() NOT NULL,
    hired boolean
);


ALTER TABLE public.secondshortlist OWNER TO work;

--
-- Name: secondshortlist_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE secondshortlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secondshortlist_id_seq OWNER TO work;

--
-- Name: secondshortlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE secondshortlist_id_seq OWNED BY secondshortlist.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist ALTER COLUMN id SET DEFAULT nextval('secondshortlist_id_seq'::regclass);


--
-- Name: secondshortlist_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT secondshortlist_pkey PRIMARY KEY (id);


--
-- Name: fk_secondshortlist_applicationid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT fk_secondshortlist_applicationid FOREIGN KEY (applicationid) REFERENCES applications(id);


--
-- Name: fk_secondshortlist_jobid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT fk_secondshortlist_jobid FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: fk_secondshortlist_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT fk_secondshortlist_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_secondshortlist_userid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT fk_secondshortlist_userid FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: secondshortlist_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT secondshortlist_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: secondshortlist_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT secondshortlist_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: secondshortlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT secondshortlist_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: secondshortlist; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE secondshortlist FROM PUBLIC;
REVOKE ALL ON TABLE secondshortlist FROM work;
GRANT ALL ON TABLE secondshortlist TO work;
GRANT SELECT ON TABLE secondshortlist TO workrealm;


--
-- Name: secondshortlist_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE secondshortlist_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE secondshortlist_id_seq FROM work;
GRANT ALL ON SEQUENCE secondshortlist_id_seq TO work;


--
-- PostgreSQL database dump complete
--

