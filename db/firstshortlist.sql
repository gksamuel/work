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
-- Name: firstshortlist; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE firstshortlist (
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


ALTER TABLE public.firstshortlist OWNER TO work;

--
-- Name: firstshortlist_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE firstshortlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firstshortlist_id_seq OWNER TO work;

--
-- Name: firstshortlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE firstshortlist_id_seq OWNED BY firstshortlist.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist ALTER COLUMN id SET DEFAULT nextval('firstshortlist_id_seq'::regclass);


--
-- Name: firstshortlist_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_pkey PRIMARY KEY (id);


--
-- Name: firstshortlist_applicationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_applicationid_fkey FOREIGN KEY (applicationid) REFERENCES applications(id);


--
-- Name: firstshortlist_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: firstshortlist_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: firstshortlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: fk_firstshortlist_jobid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT fk_firstshortlist_jobid FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: fk_firstshortlist_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT fk_firstshortlist_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_firstshortlist_userid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT fk_firstshortlist_userid FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: firstshortlist; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE firstshortlist FROM PUBLIC;
REVOKE ALL ON TABLE firstshortlist FROM work;
GRANT ALL ON TABLE firstshortlist TO work;
GRANT SELECT ON TABLE firstshortlist TO workrealm;


--
-- Name: firstshortlist_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE firstshortlist_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE firstshortlist_id_seq FROM work;
GRANT ALL ON SEQUENCE firstshortlist_id_seq TO work;


--
-- PostgreSQL database dump complete
--

