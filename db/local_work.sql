--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abuse; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE abuse (
    id integer NOT NULL,
    jobid integer NOT NULL,
    seekerid integer NOT NULL,
    comment character varying(255) NOT NULL,
    datesubmitted timestamp with time zone NOT NULL
);


ALTER TABLE public.abuse OWNER TO work;

--
-- Name: abuse_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE abuse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abuse_id_seq OWNER TO work;

--
-- Name: abuse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE abuse_id_seq OWNED BY abuse.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    mainaccount boolean DEFAULT false NOT NULL,
    companyid integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    datecreated timestamp with time zone
);


ALTER TABLE public.accounts OWNER TO work;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO work;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: agent; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE agent (
    id integer NOT NULL,
    agentname character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    contactperson character varying(100),
    contactname character varying(15),
    messageid integer,
    access integer,
    feedback text,
    active boolean,
    email2 character varying(100) DEFAULT ''::character varying NOT NULL,
    mobile character varying(15),
    mobile2 character varying(100),
    lastmessage timestamp with time zone,
    accesstime timestamp with time zone
);


ALTER TABLE public.agent OWNER TO work;

--
-- Name: agent_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agent_id_seq OWNER TO work;

--
-- Name: agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE agent_id_seq OWNED BY agent.id;


--
-- Name: applications; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE applications (
    id integer NOT NULL,
    jobid integer,
    seekerid integer,
    datemodified timestamp with time zone DEFAULT now() NOT NULL,
    letter text,
    comment character varying(255),
    viewed boolean DEFAULT false NOT NULL,
    userid integer,
    commentdate timestamp without time zone,
    attachment character varying(100)
);


ALTER TABLE public.applications OWNER TO work;

--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_id_seq OWNER TO work;

--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE applications_id_seq OWNED BY applications.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.category OWNER TO work;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO work;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: company; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE company (
    id integer NOT NULL,
    name character varying(100),
    expiry timestamp without time zone,
    email character varying(100) NOT NULL,
    mobile character varying(15),
    phone character varying(15),
    website character varying(100),
    address character varying(100),
    location character varying(100),
    contactperson character varying(100),
    contactmobile character varying(15),
    contactemail character varying(100),
    description text,
    logo character varying(100),
    statusid integer,
    applicationemail character varying(100),
    datemodified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.company OWNER TO work;

--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_seq OWNER TO work;

--
-- Name: company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE company_id_seq OWNED BY company.id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    seekerid integer,
    companyid integer,
    userid integer,
    comment character varying(255) NOT NULL,
    commentdate timestamp with time zone NOT NULL,
    response character varying(255),
    responsedate timestamp with time zone
);


ALTER TABLE public.contact OWNER TO work;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO work;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: content; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE content (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text
);


ALTER TABLE public.content OWNER TO work;

--
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_id_seq OWNER TO work;

--
-- Name: content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE content_id_seq OWNED BY content.id;


--
-- Name: coverletters; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE coverletters (
    id integer NOT NULL,
    seekerid integer,
    name character varying(100),
    letter text,
    datemodified timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.coverletters OWNER TO work;

--
-- Name: coverletters_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE coverletters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coverletters_id_seq OWNER TO work;

--
-- Name: coverletters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE coverletters_id_seq OWNED BY coverletters.id;


--
-- Name: education; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE education (
    id integer NOT NULL,
    seekerid integer,
    startdate date,
    enddate date,
    institution character varying(150),
    website character varying(100),
    location character varying(100),
    certification character varying(100),
    refereename character varying(100),
    address character varying(100),
    email character varying(100),
    mobileno character varying(15),
    datemodified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.education OWNER TO work;

--
-- Name: education_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_id_seq OWNER TO work;

--
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE education_id_seq OWNED BY education.id;


--
-- Name: filecategory; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE filecategory (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.filecategory OWNER TO work;

--
-- Name: filecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE filecategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filecategory_id_seq OWNER TO work;

--
-- Name: filecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE filecategory_id_seq OWNED BY filecategory.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE files (
    id integer NOT NULL,
    seekerid integer NOT NULL,
    filename character varying(100) NOT NULL,
    originalfilename character varying(100) NOT NULL,
    filesize integer,
    filetype character varying(100),
    description character varying(200),
    metadata character varying(1),
    datemodified timestamp without time zone DEFAULT now() NOT NULL,
    filecategoryid integer NOT NULL,
    viewable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.files OWNER TO work;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO work;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: filetypes; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE filetypes (
    id integer NOT NULL,
    filetype character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    uploads boolean DEFAULT false NOT NULL,
    cv boolean DEFAULT false NOT NULL,
    image boolean DEFAULT false NOT NULL
);


ALTER TABLE public.filetypes OWNER TO work;

--
-- Name: filetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE filetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filetypes_id_seq OWNER TO work;

--
-- Name: filetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE filetypes_id_seq OWNED BY filetypes.id;


--
-- Name: firstshortlist; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE firstshortlist (
    id integer NOT NULL,
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
-- Name: formanswers; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE formanswers (
    id integer NOT NULL,
    formid integer NOT NULL,
    seekerid integer NOT NULL,
    formquestionid integer NOT NULL,
    question character varying(255) NOT NULL,
    answer text NOT NULL,
    datemodified timestamp with time zone
);


ALTER TABLE public.formanswers OWNER TO work;

--
-- Name: formanswers_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE formanswers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formanswers_id_seq OWNER TO work;

--
-- Name: formanswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE formanswers_id_seq OWNED BY formanswers.id;


--
-- Name: formquestions; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE formquestions (
    id integer NOT NULL,
    formid integer NOT NULL,
    questiontypeid integer NOT NULL,
    question character varying(255) NOT NULL
);


ALTER TABLE public.formquestions OWNER TO work;

--
-- Name: formquestions_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE formquestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formquestions_id_seq OWNER TO work;

--
-- Name: formquestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE formquestions_id_seq OWNED BY formquestions.id;


--
-- Name: forms; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE forms (
    id integer NOT NULL,
    companyid integer NOT NULL,
    userid integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    datemodified timestamp with time zone
);


ALTER TABLE public.forms OWNER TO work;

--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_id_seq OWNER TO work;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE forms_id_seq OWNED BY forms.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(10)
);


ALTER TABLE public.groups OWNER TO work;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO work;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: inmessage; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE inmessage (
    id integer NOT NULL,
    source character varying(15) NOT NULL,
    message character varying(320) NOT NULL,
    datecreated timestamp with time zone DEFAULT now()
);


ALTER TABLE public.inmessage OWNER TO work;

--
-- Name: inmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE inmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inmessage_id_seq OWNER TO work;

--
-- Name: inmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE inmessage_id_seq OWNED BY inmessage.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    companyid integer,
    userid integer,
    referenceno character varying(20),
    title character varying(100),
    summary character varying(255),
    jobdescription text,
    qualifications text,
    experience text,
    instructions text,
    startdate date,
    enddate date,
    email character varying(100),
    maxapplications integer,
    datemodified timestamp without time zone DEFAULT now() NOT NULL,
    attachment character varying(100),
    formid integer,
    positionsid integer,
    salaryid integer,
    categoryid integer NOT NULL,
    accountid integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO work;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO work;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: lostpassword; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE lostpassword (
    id integer NOT NULL,
    code character varying(6) NOT NULL,
    username character varying(100) NOT NULL,
    datemodified timestamp with time zone DEFAULT now()
);


ALTER TABLE public.lostpassword OWNER TO work;

--
-- Name: lostpassword_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE lostpassword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lostpassword_id_seq OWNER TO work;

--
-- Name: lostpassword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE lostpassword_id_seq OWNED BY lostpassword.id;


--
-- Name: mpesa; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE mpesa (
    id integer NOT NULL,
    inmessageid integer NOT NULL,
    source bigint NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(15) NOT NULL,
    amount numeric(7,2) NOT NULL,
    paytime timestamp with time zone NOT NULL,
    receivetime timestamp with time zone DEFAULT now() NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    processtime timestamp with time zone,
    fromtime timestamp with time zone,
    totime timestamp with time zone,
    seekerid integer,
    companyid integer
);


ALTER TABLE public.mpesa OWNER TO work;

--
-- Name: mpesa_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE mpesa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mpesa_id_seq OWNER TO work;

--
-- Name: mpesa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE mpesa_id_seq OWNED BY mpesa.id;


--
-- Name: mpesatarrifs; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE mpesatarrifs (
    id integer NOT NULL,
    tarrif character varying(20) NOT NULL,
    description character varying(20) NOT NULL,
    days integer NOT NULL,
    membership integer NOT NULL,
    sending integer NOT NULL,
    withdrawal integer NOT NULL
);


ALTER TABLE public.mpesatarrifs OWNER TO work;

--
-- Name: mpesatarrifs_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE mpesatarrifs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mpesatarrifs_id_seq OWNER TO work;

--
-- Name: mpesatarrifs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE mpesatarrifs_id_seq OWNED BY mpesatarrifs.id;


--
-- Name: outmessage; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE outmessage (
    id integer NOT NULL,
    htmlmessage text,
    textmessage text
);


ALTER TABLE public.outmessage OWNER TO work;

--
-- Name: outmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE outmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outmessage_id_seq OWNER TO work;

--
-- Name: outmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE outmessage_id_seq OWNED BY outmessage.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    seekerid integer,
    title character varying(100),
    content text,
    datemodified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pages OWNER TO work;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO work;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: paypal; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE paypal (
    id integer NOT NULL,
    txn_id character varying(20) NOT NULL,
    mc_gross numeric(7,2) NOT NULL,
    protection_eligibility character varying(30),
    payer_id character varying(100) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    payer_email character varying(100) NOT NULL,
    residence_country character varying(100) NOT NULL,
    payer_status character varying(20),
    tax numeric(7,2),
    payment_date timestamp without time zone,
    option_selection1 character varying(20),
    payment_status character varying(20),
    charset character varying(20),
    mc_fee numeric(7,2),
    custom character varying(100),
    receiver_email character varying(100) NOT NULL,
    business character varying(100) NOT NULL,
    quantity integer NOT NULL,
    option_name1 character varying(100) NOT NULL,
    payment_type character varying(20) NOT NULL,
    btn_id integer,
    payment_fee numeric(7,2),
    shipping_discount numeric(7,2),
    insurance_amount numeric(7,2),
    receiver_id character varying(13),
    pending_reason character varying(30),
    txn_type character varying(30),
    item_name character varying(30),
    discount numeric(7,2),
    mc_currency character varying(20),
    item_number character varying(100),
    shipping_method character varying(30),
    handling_amount numeric(7,2),
    transaction_subject character varying(100),
    payment_gross numeric(7,2),
    shipping numeric(7,2),
    processtime timestamp with time zone,
    fromtime timestamp with time zone,
    totime timestamp with time zone,
    seekerid integer,
    companyid integer
);


ALTER TABLE public.paypal OWNER TO work;

--
-- Name: paypal_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE paypal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paypal_id_seq OWNER TO work;

--
-- Name: paypal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE paypal_id_seq OWNED BY paypal.id;


--
-- Name: paypaltarrifs; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE paypaltarrifs (
    id integer NOT NULL,
    tarrif character varying(20) NOT NULL,
    description character varying(20) NOT NULL,
    days integer NOT NULL,
    membership integer NOT NULL
);


ALTER TABLE public.paypaltarrifs OWNER TO work;

--
-- Name: paypaltarrifs_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE paypaltarrifs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paypaltarrifs_id_seq OWNER TO work;

--
-- Name: paypaltarrifs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE paypaltarrifs_id_seq OWNED BY paypaltarrifs.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE positions (
    id integer NOT NULL,
    noofpositions character varying(30) NOT NULL
);


ALTER TABLE public.positions OWNER TO work;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO work;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: questiontypes; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE questiontypes (
    id integer NOT NULL,
    questiontype character varying(30) NOT NULL
);


ALTER TABLE public.questiontypes OWNER TO work;

--
-- Name: questiontypes_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE questiontypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questiontypes_id_seq OWNER TO work;

--
-- Name: questiontypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE questiontypes_id_seq OWNED BY questiontypes.id;


--
-- Name: registration; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE registration (
    id integer NOT NULL,
    email character varying(100),
    username character varying(100),
    password character varying(100),
    createdate timestamp without time zone DEFAULT now(),
    code character varying(6),
    groupid integer NOT NULL
);


ALTER TABLE public.registration OWNER TO work;

--
-- Name: registration_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_id_seq OWNER TO work;

--
-- Name: registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE registration_id_seq OWNED BY registration.id;


--
-- Name: salary; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE salary (
    id integer NOT NULL,
    salaryrange character varying(40)
);


ALTER TABLE public.salary OWNER TO work;

--
-- Name: salary_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE salary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salary_id_seq OWNER TO work;

--
-- Name: salary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE salary_id_seq OWNED BY salary.id;


--
-- Name: secondshortlist; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE secondshortlist (
    id integer NOT NULL,
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
-- Name: seekers; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE seekers (
    id integer NOT NULL,
    groupid integer,
    statusid integer,
    username character varying(30) NOT NULL,
    password character varying(64) NOT NULL,
    expiry timestamp with time zone NOT NULL,
    email character varying(100) NOT NULL,
    mobile character varying(12),
    othernumber character varying(12),
    photo character varying(100),
    firstname character varying(15),
    lastname character varying(15),
    middlename character varying(15),
    address character varying(50),
    dateofbirth date,
    gender boolean,
    website character varying(100),
    maritalstatus character varying(20),
    idnumber character varying(12),
    pinnumber character varying(20),
    passport character varying(20),
    driverslicence character varying(20),
    points integer,
    salaryid integer,
    datemodified timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.seekers OWNER TO work;

--
-- Name: seekers_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE seekers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seekers_id_seq OWNER TO work;

--
-- Name: seekers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE seekers_id_seq OWNED BY seekers.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE status (
    id integer NOT NULL,
    description character varying(30)
);


ALTER TABLE public.status OWNER TO work;

--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO work;

--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- Name: tellafriend; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE tellafriend (
    id integer NOT NULL,
    seekerid integer NOT NULL,
    jobid integer NOT NULL,
    friend character varying(100) NOT NULL,
    datecreated timestamp with time zone NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.tellafriend OWNER TO work;

--
-- Name: tellafriend_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE tellafriend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tellafriend_id_seq OWNER TO work;

--
-- Name: tellafriend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE tellafriend_id_seq OWNED BY tellafriend.id;


--
-- Name: thirdshortlist; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE thirdshortlist (
    id integer NOT NULL,
    jobid integer,
    userid integer,
    seekerid integer,
    internalcomment character varying(255),
    seekercomment character varying(255),
    publiccomment character varying(255),
    datemodified timestamp without time zone DEFAULT now() NOT NULL,
    hired boolean
);


ALTER TABLE public.thirdshortlist OWNER TO work;

--
-- Name: thirdshortlist_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE thirdshortlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thirdshortlist_id_seq OWNER TO work;

--
-- Name: thirdshortlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE thirdshortlist_id_seq OWNED BY thirdshortlist.id;


--
-- Name: tip; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE tip (
    id integer NOT NULL,
    submittedby character varying(100),
    tip character varying(255) NOT NULL,
    rate integer DEFAULT 0 NOT NULL,
    datesubmited timestamp with time zone
);


ALTER TABLE public.tip OWNER TO work;

--
-- Name: tip_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE tip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tip_id_seq OWNER TO work;

--
-- Name: tip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE tip_id_seq OWNED BY tip.id;


--
-- Name: tiprate; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE tiprate (
    id integer NOT NULL,
    tipid integer NOT NULL,
    rate integer NOT NULL,
    userid integer,
    seekerid integer
);


ALTER TABLE public.tiprate OWNER TO work;

--
-- Name: tiprate_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE tiprate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tiprate_id_seq OWNER TO work;

--
-- Name: tiprate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE tiprate_id_seq OWNED BY tiprate.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    companyid integer,
    accountid integer NOT NULL,
    groupid integer DEFAULT 2 NOT NULL,
    username character varying(20) NOT NULL,
    name character varying(50),
    email character varying(100) NOT NULL,
    description character varying(100),
    admin boolean DEFAULT false,
    active boolean DEFAULT false,
    password character varying(64) NOT NULL,
    datemodified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO work;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO work;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: work; Type: TABLE; Schema: public; Owner: work; Tablespace: 
--

CREATE TABLE work (
    id integer NOT NULL,
    seekerid integer,
    startdate date,
    enddate date,
    company character varying(100),
    website character varying(100),
    address character varying(100),
    companyphone character varying(15),
    location character varying(100),
    "position" character varying(100),
    jobdescription character varying(300),
    refereename character varying(100),
    refereeemail character varying(100),
    refereemobile character varying(12),
    datemodified timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.work OWNER TO work;

--
-- Name: work_id_seq; Type: SEQUENCE; Schema: public; Owner: work
--

CREATE SEQUENCE work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_id_seq OWNER TO work;

--
-- Name: work_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: work
--

ALTER SEQUENCE work_id_seq OWNED BY work.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY abuse ALTER COLUMN id SET DEFAULT nextval('abuse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY agent ALTER COLUMN id SET DEFAULT nextval('agent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications ALTER COLUMN id SET DEFAULT nextval('applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY company ALTER COLUMN id SET DEFAULT nextval('company_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY content ALTER COLUMN id SET DEFAULT nextval('content_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY coverletters ALTER COLUMN id SET DEFAULT nextval('coverletters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY education ALTER COLUMN id SET DEFAULT nextval('education_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY filecategory ALTER COLUMN id SET DEFAULT nextval('filecategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY filetypes ALTER COLUMN id SET DEFAULT nextval('filetypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY firstshortlist ALTER COLUMN id SET DEFAULT nextval('firstshortlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY formanswers ALTER COLUMN id SET DEFAULT nextval('formanswers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY formquestions ALTER COLUMN id SET DEFAULT nextval('formquestions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY forms ALTER COLUMN id SET DEFAULT nextval('forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY inmessage ALTER COLUMN id SET DEFAULT nextval('inmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY lostpassword ALTER COLUMN id SET DEFAULT nextval('lostpassword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY mpesa ALTER COLUMN id SET DEFAULT nextval('mpesa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY mpesatarrifs ALTER COLUMN id SET DEFAULT nextval('mpesatarrifs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY outmessage ALTER COLUMN id SET DEFAULT nextval('outmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY paypal ALTER COLUMN id SET DEFAULT nextval('paypal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY paypaltarrifs ALTER COLUMN id SET DEFAULT nextval('paypaltarrifs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY questiontypes ALTER COLUMN id SET DEFAULT nextval('questiontypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY registration ALTER COLUMN id SET DEFAULT nextval('registration_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY salary ALTER COLUMN id SET DEFAULT nextval('salary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY secondshortlist ALTER COLUMN id SET DEFAULT nextval('secondshortlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers ALTER COLUMN id SET DEFAULT nextval('seekers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY tellafriend ALTER COLUMN id SET DEFAULT nextval('tellafriend_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist ALTER COLUMN id SET DEFAULT nextval('thirdshortlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY tip ALTER COLUMN id SET DEFAULT nextval('tip_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY tiprate ALTER COLUMN id SET DEFAULT nextval('tiprate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: work
--

ALTER TABLE ONLY work ALTER COLUMN id SET DEFAULT nextval('work_id_seq'::regclass);


--
-- Data for Name: abuse; Type: TABLE DATA; Schema: public; Owner: work
--

COPY abuse (id, jobid, seekerid, comment, datesubmitted) FROM stdin;
3	681	2	test	2016-06-01 07:59:52.554+03
4	681	2	test	2016-06-01 08:08:55.513+03
5	681	2	test	2016-06-01 08:09:20.214+03
6	681	2	test	2016-06-01 08:09:29.478+03
2	681	2	best	2016-06-01 08:20:23.228+03
1	681	2	zzzzz	2016-06-01 09:00:51.543+03
7	677	2	rest	2016-06-01 09:01:18.359+03
\.


--
-- Name: abuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('abuse_id_seq', 7, true);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: work
--

COPY accounts (id, mainaccount, companyid, name, description, datecreated) FROM stdin;
1	t	1	MAIN ACCOUNT	\N	2014-05-26 07:40:39.982+03
2	t	2	MAIN ACCOUNT	\N	2014-06-04 11:36:41.019+03
3	f	1	suecompany	my client	2014-06-10 11:02:53.609+03
4	t	3	MAIN ACCOUNT	\N	2014-07-14 18:29:59.937+03
5	t	4	MAIN ACCOUNT	\N	2015-01-11 18:02:19.581+03
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('accounts_id_seq', 5, true);


--
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: work
--

COPY agent (id, agentname, email, contactperson, contactname, messageid, access, feedback, active, email2, mobile, mobile2, lastmessage, accesstime) FROM stdin;
42	Madina Express	madinaexpress@yahoo.com	Madina/Dawood Mugga	Madina	1	\N		t		0722330882		2013-06-02 14:39:07.906+03	\N
44	Al-Salfa Manpower Agency	faridasaid73@yah00.com	Farida Mohammed	Farida 	1	\N		t		0722688826		2013-06-02 14:39:10.337+03	\N
45	Jatar Recruitment Agency	jataragencies94@yahoo.com	George Karanu waweru	George 	1	\N		t		0722756858		2013-06-02 14:39:10.783+03	\N
46	Summit Recruitment Agency	info@summitrecruitment-kenya.com	Sue Withers	Sue 	1	\N		t		0713461279		2013-06-02 14:39:11.413+03	\N
47	Alwatan Agencies	alwatanagency@hotmail.com	Swaleh Bamahriz	Swaleh 	1	\N		t		0722959623		2013-06-02 14:39:12.431+03	\N
48	Al Nadhir Agency	alnadhir@yahoo.com	Mohamed Abubakar	Mohamed 	1	\N		t		0720229836		2013-06-02 14:39:13.267+03	\N
49	Sue Manpower	info@suemanpower.com	Susan Kanja	Susan 	1	\N		t		 		2013-06-02 14:39:14.373+03	\N
50	Fast Achievers Agency	fatumamahed11@yahoo.com	Fatuma Mwinyi	Fatuma 	1	\N		t		0714973761		2013-06-02 14:39:16.046+03	\N
21	Abdulsalaam Agency	abdulsalaammuhaji@yahoo.com	Abdulsalaam Muhaji	Abdulsalaam 	1	\N		t		0722128538		2013-06-02 14:39:05.82+03	\N
22	Smart Flyers &Travel Acting	njarama@gmail.com	Rahab M. Njau/Joseph Njau	Rahab 	1	\N		t		0716607773		2013-06-02 14:39:07.05+03	\N
67	Afro - Arab Mediation Co. Ltd.	info@afroarabmediationco.com	Nahla Abdul Hafedh	Nahla 	1	1		t		0723625962		2013-06-02 14:39:22.752+03	2013-06-03 16:17:23.013+03
76	Jawabu Consultancy	info@jawabu.co.ke	Musyoka/priscah	Musyoka	1	\N		t		0725135478		2013-06-02 14:39:16.934+03	\N
77	Bashadi Agency	bashadimohamed@hotmail.com	Mohamed Brek	Mohamed 	1	\N		t		0736995539		2013-06-02 14:39:17.475+03	\N
78	Al Habib Travel Agency	alhabibagency@gmail.com	Hafsa Mohamed	Hafsa 	1	\N		t		0712298279		2013-06-02 14:39:17.845+03	\N
79	Firdaus Agency	assuu786@gmail.com	Asman Wachira	Asman 	1	\N		t		0721237441		2013-06-02 14:39:19.236+03	\N
80	Dawaat Agencies Co.	manderasaleh@gmail.com	Swalah.M.Abdallah	Swalah.	1	\N		t	dawaatagencies10@gmail.com	0722507919	0724445333	2013-06-02 14:39:19.666+03	\N
3	Dammy Agencies	agentairlight@yahoo.com	Geofrey Gitau	Geofrey 	1	\N		t		0727634114		2013-06-02 14:39:17.743+03	\N
4	Anyiro Agency	anyiroagency@gmail.com	Abedarn Khadohi	Abedarn 	1	\N		t		0722263475		2013-06-02 14:39:18.062+03	\N
5	Al-jawal Agencies	aljawhar02@yahoo.com	Kasim mustafa	Kasim 	1	\N		t		0722861973		2013-06-02 14:39:19.262+03	\N
7	Two-Star Agency	info@finham.co.ke	Imran Mumia	Imran 	1	\N		t		0733404547		2013-06-02 14:39:20.322+03	\N
8	Alfataqi Recruitment Agency	shamnjagi@yahoo.com	Shamsa Wanjuki Njagi	Shamsa 	1	\N		t		0721485176		2013-06-02 14:39:20.888+03	\N
51	Al-Iman Human Power	bamfatma@gmail.com	Fatuma Mohamed	Fatuma 	1	\N		t		072632162		2013-06-02 14:39:11.741+03	\N
54	Interlead  Ltd	kensaudi05@yahoo.com	Ali Mohamed	Ali 	1	\N		t		0722523020		2013-06-02 14:39:14.256+03	\N
56	Khobeshah Agencies	khobeshah@gmail.com	Khadija Ali Asman	Khadija 	1	\N		t		0733768927  	0724395939	2013-06-02 14:39:20.819+03	\N
57	Afro gulf General Agency	hmadnan@gmail.com	Hussein Adnan	Hussein 	1	\N		t		0721457533		2013-06-02 14:39:22.263+03	\N
58	Bin Mousah General Agencies	binmousah@gmail.com	Musa Ahmed	Musa 	1	\N		t		0725299137		2013-06-02 14:39:22.717+03	\N
81	Al-Hadeeqah agencies	akhayoyo@yahoo.com	Fidelis Onjari	Fidelis 	1	\N		t	idrism2004@yahoo.com	0725691138		2013-06-02 14:39:12.086+03	\N
82	Al - Rahman General Agencies	akhassanke@yahoo.com	Abbas H. Keya	Abbas 	1	\N		t	info@alrahaman.com	0721217315	0737502862	2013-06-02 14:39:12.661+03	\N
83	Annubal Al-Arabia Agency	annubalarabia@gmail.com	Ramla Yusuf	Ramla 	1	\N		t	yusuframla@yahoo.com	0701029611		2013-06-02 14:39:13.327+03	\N
84	Star Agency&General 	starinternationalagency@yahoo.com	Fatma Hamid Mohammad	Fatma 	1	\N		t		0711133233		2013-06-02 14:39:20.348+03	\N
85	Tusano Combined Supplies	tusanocombined@yahoo.com	Fatuma Nyokabi	Fatuma 	1	\N		t		0722378329		2013-06-02 14:39:20.887+03	\N
31	Insight Management Co. Ltd	gndiritu@insightconsult.co.ke	Gerald Ndiritu	Gerald 	1	\N		t		0722634909	0722564936	2013-06-02 14:39:13.327+03	\N
32	Asaliheen General Agency	kichepe@yahoo.com	Abdulaziz Ali	Abdulaziz 	1	\N		t		0722146644		2013-06-02 14:39:25.005+03	\N
33	Mora International	moraint@gmail.com	Paul Nyawanda Okelo	Paul 	1	\N		t		0721202049		2013-06-02 14:39:25.501+03	\N
34	Al-khaleej   Agencies	alkhaleej.agencies@gmail.com	Faris hadi Rubeya	Faris 	1	\N		t		0722344710		2013-06-02 14:39:26.05+03	\N
35	Noorain Agency	munaticree11@yahoo.com	Athman Khamisi	Athman 	1	\N		t		0720177235		2013-06-02 14:39:26.438+03	\N
36	Bintalib International Group	gwangare@yahoo.com	Siam Mohammed	Siam 	1	\N		t		0726392825		2013-06-02 14:39:26.74+03	\N
38	Alsair Travel&Tourism	alsairrecruitment@yahoo.com	Ahmed Billal	Ahmed 	1	\N		t		0718795193		2013-06-02 14:39:27.412+03	\N
61	Al-waqeel Agency	alwqeegency@yahoo.com	Said Hassan	Said 	1	\N		t		0721996193  	0729274026	2013-06-02 14:39:05.888+03	\N
62	Al Ekhlaas Agencies	famau2002@yahoo.com	Zeinab S. Famau	Zeinab 	1	\N		t		0722234488		2013-06-02 14:39:13.097+03	\N
64	Alshira Travel, Tourism & Recruitment Co Ltd.	alshirarecruitmentkenya@yahoo.com	Eihab Mohamed Elsayed	Eihab 	1	\N		t		0727158873	0716666213 0717666202	2013-06-02 14:39:20.263+03	\N
65	Wayukeyuki Agencies	wayukeyuki@yahoo.com	Esther Wambui	Esther 	1	\N		t		0713002963		2013-06-02 14:39:20.76+03	\N
66	Al- dhamana Agency	aldhamana@yahoo.com	Abubakar Ahmed	Abubakar 	1	\N		t		0711796198	0721128989	2013-06-02 14:39:21.105+03	\N
68	Al-Mutahid Agencies	sabrasalim@yahoo.com	Swabra Salim	Swabra 	1	\N		t		0702927322		2013-06-02 14:39:23.172+03	\N
6	Royal Manpower Solutions	royalmanpower@yahoo.com	Fredrick Herman Oduor	Fredrick 	1	1		t		0714669696		2013-06-02 14:39:19.792+03	2013-06-02 14:45:47.864+03
30	Swideeq Investement Agency	swideeqinvestmentagency@yahoo.com		Swideeq	1	1		t		0721226822		2013-06-02 14:39:18.123+03	2013-06-03 08:11:58.082+03
63	Al-kaki Enterprises	kimemiaj@yahoo.com	James Kimemia	James 	1	\N		f		0722236648		2013-06-02 14:39:14.154+03	\N
11	Al-Wadi Agency	alwadieastafrica@yahoo.com	Sala fadul suleiman	Sala 	1	\N		t		0726124580	0706313618	2013-06-02 14:39:05.889+03	\N
12	Muthuma International Agency	g.wangare@yahoo.com	Grace .W.Muthuma	Grace 	1	\N		t		0729165297  	0735808868	2013-06-02 14:39:07.907+03	\N
13	Al-hilali Agencies	waheedas2002@yahoo.com	Waheeda	Waheeda	1	\N		t		0722326045		2013-06-02 14:39:08.87+03	\N
14	Naim Investment	abadalladash@yahoo.co.nz	Abdalla Mohamed	Abdalla 	1	\N		t		0734695847	0720931164	2013-06-02 14:39:09.36+03	\N
15	Manakib Manpower Link	man.manlink@gmail.com	Abubakar manakib	Abubakar 	1	\N		t		0722858622	0722695241	2013-06-02 14:39:10.262+03	\N
16	Silver ray ltd.	info@silverrayhr.com	Margaret Mugwanja	Margaret 	1	\N		t		0722769330		2013-06-02 14:39:10.725+03	\N
17	El enjaz Recruitment Agency	elenjaz.nairobi@yahoo.com	Atif Hashim Abdelrahim	Atif 	1	\N		t	olalachristian@yahoo.com	0722232837		2013-06-02 14:39:11.303+03	\N
19	Al-Hujura Agency Ltd	tammyslim95@yahoo.com	Tamima Mohamed	Tamima 	1	\N		t		0722112432		2013-06-02 14:39:13.216+03	\N
20	Al-Muumin  Agencies	almuuminagencies@yahoo.com	Peter.K.Charo	Peter.	1	\N		t		0721527281		2013-06-02 14:39:14.256+03	\N
41	Overseas Placement Kenya Ltd.	info@opk.co.ke	Gladys Aganyo	Gladys 	1	\N		t		0711536911		2013-06-02 14:39:06.506+03	\N
43	Al Qubtan Recruitment Agency	ihabihab99@gmail.com	Mary Omari	Mary 	1	\N		t		0722756244		2013-06-02 14:39:08.869+03	\N
23	Quality Staff Ltd.	qualityservicecompany@gmail.com	Julie Mbabu	Julie 	1	\N		t		0723432460		2013-06-02 14:39:13.099+03	\N
24	Talent Quest Africa Ltd.	info@talentquestafrica.com	David C. Njoroge	David 	1	\N		t		0710584830		2013-06-02 14:39:14.34+03	\N
25	Elmvale Agency	elmvaleagency@yahoo.co.uk	Esther Kamau	Esther 	1	\N		t		0722359558		2013-06-02 14:39:15.382+03	\N
26	Alrazak Yarazak Agency	alrazakinvent@yahoo.com	Asuman Hubesi	Asuman 	1	\N		t		0722632686		2013-06-02 14:39:16.044+03	\N
27	Forbes Global	fabian@forbesgbl.com	Fabian Muli	Fabian 	1	\N		t		0713089553		2013-06-02 14:39:16.757+03	\N
28	Shanawa Agencies	munaticrew11@yahoo.com	Carol Muthuma	Carol 	1	\N		t		0721251609		2013-06-02 14:39:17.29+03	\N
29	Al- yusra Agencies	alyusra2010@hotmail.co.uk	Ali Omari	Ali 	1	\N		t		0722527884		2013-06-02 14:39:17.844+03	\N
71	Al Faizin Agencies Ltd	alfaizinagencies@yahoo.com	Abubakar Ahmed	Abubakar 	1	\N		t		0722677280		2013-06-02 14:39:07.05+03	\N
72	HR. Connection Ltd.	bagha@hrconnection.co.ke	Abuqadir Bagha	Abuqadir 	1	\N		t		0722983380		2013-06-02 14:39:08.316+03	\N
73	Aljazeera Agencies	aljazeera.agencies@gmail.com	Abubakar Bunu	Abubakar 	1	\N		t		0726677717		2013-06-02 14:39:08.871+03	\N
74	Al Marwa Agencies Ltd	almarwa67@yahoo.com	Shufaa Naaman	Shufaa 	1	\N		t		0722955280		2013-06-02 14:39:09.181+03	\N
75	Rumorth International	rumorthgroup@yahoo.com	Ruth Morara	Ruth 	1	\N		t		0726815722		2013-06-02 14:39:10.725+03	\N
1	Kazi Intenational Ltd	admin@kaziinternational.co.ke	Yasmin Lyall	Yasmin 	1	\N		t		0725085015	0203750202	2013-06-02 14:39:11.707+03	\N
2	Nassam Solutions Manpower	aminazani0405@yahoo.co.uk	Amina M Zani	Amina 	1	\N		t		0723500651  	0732995927	2013-06-02 14:39:17.364+03	\N
9	Asali Commercial Agencies	asalicommercialagencies@gmail.com	Maimuna Hassan	Maimuna 	1	\N		t		0726449673		2013-06-02 14:39:22.347+03	\N
10	Al-Haqq Agencies	khadijawanjiku@yahoo.com	Mohamed Abdi	Mohamed 	1	\N		t		0716656833  	0727520054	2013-06-02 14:39:22.769+03	\N
52	Al Zahran Agencies	thirsty39@gmail.com	Abdulmajid Omar	Abdulmajid 	1	\N		t		0717433802		2013-06-02 14:39:12.381+03	\N
53	Dij Star Agency	dijstar2011@yahoo.com	Salome Mungai	Salome 	1	\N		t		0711810720		2013-06-02 14:39:13.047+03	\N
55	Al -Afif Global Agency	afif_agencies@yahoo.com	Esha Ali	Esha 	1	\N		t		0722721102		2013-06-02 14:39:20.349+03	\N
59	Sauman Services	sauman1973@hotmail.com	Saumu Seif Salim/Gharib	Saumu 	1	\N		t		0718666385		2013-06-02 14:39:23.172+03	\N
60	Sentry Security	jack@sentrysecurityofeastafrica.com	Jack Kimuri	Jack 	1	\N		t		0729279111		2013-06-02 14:39:24.315+03	\N
86	gmail agent	gksamuel1@gmail.com	samuel gachanja	gachanja	1	\N		t		0720920293		2013-06-02 14:39:22.263+03	\N
87	yahoo agent	samuelgk2001@yahoo.com.au	samuel gachanja	gachanja	1	\N		t		0720920293		2013-06-02 14:39:22.77+03	\N
88	hotmail agent	gksamuel@hotmail.com	samuel gachanja	gachanja	1	\N		t		0720920293		2013-06-02 14:39:24.189+03	\N
89	myjob agent	customerservice@myjob.co.ke	samuel gachanja	gachanja	1	\N	\N	t		0720920293	\N	2013-06-02 14:39:24.359+03	\N
37	Adbas Recruitment Agency	adbas@hotmail.com	A. A. Shee	Shee	1	\N		t		0733219003		2013-06-02 14:39:27.034+03	\N
39	Al-Emtyaz Travel Agency	alyassin999@hotmail.com	Rukia Sani/Yassin Mohamed Yassin	Rukia 	1	\N		t		0734093031	0708802100	2013-06-02 14:39:27.706+03	\N
40	Sister-Sister Agency	sidijira@yahoo.com	Margaret Sidi Mwaro	Margaret 	1	\N		t		0727109681		2013-06-02 14:39:28.017+03	\N
69	Beyond Borders	beyondborders.agency@gmail.com	John Ngigi Kuria	John 	1	\N		t		0722840029		2013-06-02 14:39:24.155+03	\N
70	Stronghold Manpower	strongholdmanpowerinternational@yahoo.com	Saad M Saad	Saad 	1	\N		t		0722776056	020313763	2013-06-02 14:39:29.422+03	\N
18	Polar Agencies (K) Ltd.	info@polaragencies.com	Hudson Mutai	Hudson 	1	2		t		0723277996		2013-06-02 14:39:12.576+03	2013-06-03 12:19:33.905+03
\.


--
-- Name: agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('agent_id_seq', 89, true);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: work
--

COPY applications (id, jobid, seekerid, datemodified, letter, comment, viewed, userid, commentdate, attachment) FROM stdin;
95	681	38	2016-05-02 15:50:28.96+03	\N	\N	f	\N	\N	\N
96	681	2	2016-05-13 23:06:53.136+03	7	\N	f	\N	\N	\N
\.


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('applications_id_seq', 96, true);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: work
--

COPY category (id, name) FROM stdin;
1	Accounting, Finance and Insurance
2	Agriculture/Forestry/Fishing 
3	Creative/Design and Architecture
4	Customer Services and Retail
5	Education
6	Electronics
7	Engineering and Construction
8	Government
9	HR and Training
10	Information Technology and Telecoms
11	Legal
12	Logistics, Transportation and Manufacturing
13	Media, Communications and PR
14	Medicine, Healthcare and Pharmaceutical
15	NGO, Community/Social Devt and Fundraising
16	Office and Admin
17	Project/Programme Management
18	Research, Science and Biotech
19	Sales and Marketing
20	Senior Management
21	Supplies Management
22	Tourism, Catering and Hospitality
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('category_id_seq', 22, true);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: work
--

COPY company (id, name, expiry, email, mobile, phone, website, address, location, contactperson, contactmobile, contactemail, description, logo, statusid, applicationemail, datemodified) FROM stdin;
4	Isiolo County Government	2015-02-13 20:44:26.064833	gksamuel1@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	isioloCountyLogo.jpg	\N	\N	2015-01-11 10:02:19.58
2		2014-06-05 04:36:41.015	velvetconcepts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	CONTACT.jpg	\N	\N	2014-06-04 04:36:41.018
3		2014-07-15 11:29:59.929	desshila@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 11:29:59.935
1	name	2015-09-19 13:16:25.788	customerservice@myjob.co.ke	0720920293								test<br>test<br>test<br>test<br>test<br>test<br>test<br>test<br>test<br>	\N	\N		2014-05-26 00:40:39.981
5	Bomet County	\N	bometcounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.1302
6	Bungoma County	\N	bungomacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.150954
7	Busia County	\N	busiacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.15925
8	Elgeyo-Marakwet County	\N	elgeyo-marakwetcounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.167582
9	Embu County	\N	embucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.175851
10	Garissa County	\N	garissacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.184224
11	Homabay County	\N	homabaycounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.192927
12	Isiolo County	\N	isiolocounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.200948
13	Kajiado County	\N	kajiadocounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.209197
14	Kakamega County	\N	kakamegacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.217613
15	Kericho County	\N	kerichocounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.225886
16	Kiambu County	\N	kiambucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.234195
17	Kilifi County	\N	kilificounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.24254
18	Kirinyaga County	\N	kirinyagacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.275896
19	Kisii County	\N	kisiicounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.284198
20	Kisumu County	\N	kisumucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.292603
21	Kitui County	\N	kituicounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.300909
22	Kwale County	\N	kwalecounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.309237
23	Laikipia County	\N	laikipiacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.317518
24	Lamu County	\N	lamucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.325932
25	Machakos County	\N	machakoscounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.334256
26	Makueni County	\N	makuenicounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.34258
27	Mandera County	\N	manderacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.350942
28	Marsabit County	\N	marsabitcounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.35925
29	Meru County	\N	merucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.367653
30	Migori County	\N	migoricounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.375898
31	Mombasa County	\N	mombasacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.384292
32	Muranga County	\N	murangacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.392624
33	Nairobi City County	\N	nairobicitycounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.400901
34	Nakuru County	\N	nakurucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.409284
35	Nandi County	\N	nandicounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.417615
36	Narok County	\N	narokcounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.425953
37	Nyamira County	\N	nyamiracounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.434251
38	Nyandarua County	\N	nyandaruacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.442571
39	Nyeri County	\N	nyericounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.450912
40	Samburu County	\N	samburucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.459305
41	Siaya County	\N	siayacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.467622
42	Taita-Taveta County	\N	taita-tavetacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.475909
43	Tana River County	\N	tanarivercounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.484233
44	Tharaka-Nithi County	\N	tharaka-nithicounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.49266
45	Trans Nzoia County	\N	transnzoiacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.500886
46	Turkana County	\N	turkanacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.509228
47	Uasin Gishu County	\N	uasingishucounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.517642
48	Vihiga County	\N	vihigacounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.526081
49	Wajir County	\N	wajircounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.53433
50	West Pokot County	\N	westpokotcounty@kenyacountyjobs.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-24 21:20:01.54265
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('company_id_seq', 50, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: work
--

COPY contact (id, seekerid, companyid, userid, comment, commentdate, response, responsedate) FROM stdin;
1	2	\N	1	How do i delete a vacancy?<br>	2014-06-10 12:29:36.357+03	fuck you	\N
2	2	\N	\N	test	2016-05-28 00:21:58.171+03	\N	\N
3	2	\N	\N	test2	2016-05-28 00:22:17.878+03	\N	\N
4	2	\N	\N	how do i know if someone has seen my application?	2016-05-28 00:22:45.585+03	\N	\N
5	38	\N	\N	test	2016-05-28 03:56:15.568+03	\N	\N
6	38	\N	\N	test2	2016-05-28 03:56:22.255+03	\N	\N
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('contact_id_seq', 6, true);


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: work
--

COPY content (id, title, content) FROM stdin;
3	Welcome Page	<strong>REMEMBER: "if you are not paying for a service, you are not the customer; you are the product being sold!!!!!!"</strong><br/>Usually the people who are paying are the customers. We want you to be the customer.<br/>Here we make every effort to bridge the gap between job seekers and employers.<br/>We offer advanced tools for both the job seeker and the employer.<br/>For the employer to fill in vacancies with the right personnel, and for job seekers to quickly get the job that suits them.<br/>
4	Splash Page	<div id="slidehtml1" class="cc-html"> <h3>Full Profile</h3> <p> <strong>Rapid Job Applications</strong><br/> <strong>Submit Attachments</strong><br/> <strong>Application Tracking</strong><br/> <strong>User Rating</strong><br/> </p> </div> <div id="slidehtml2" class="cc-html"> <h3>User Management</h3> <p> <strong>No Adverts</strong><br/> <strong>Applicant Rating</strong><br/> <strong>Audit Trails</strong><br/> <strong>Much more....</strong><br/> </p> </div>
5	Mpesa Instructions	To extend your membership use <strong>LIPA NA MPESA</strong> to send payments to <strong><font color="red">Till number 116125</font></strong> (Silver Ray I.T Solutions)<br/>\n<br>\n<strong>INSTRUCTIONS</strong>\n<ol>\n<li>Go to M-PESA on your phone.</li>\n<li>Select <strong><font color="blue">Lipa na M-PESA</font></strong>.</li>\n<li>Select <strong><font color="blue">Buy Goods and Services</font></strong>.</li>\n<li>Enter <strong><font color="red">Till number 116125</font></strong>.</li>\n<li>Enter Amount then your M-PESA PIN.</li>\n<li>Confirm that you have entered <strong><font color="red">Till number 116125</font></strong>.</li>\n<li>Wait for response from M-PESA.</li>\n<li>Enter the <strong><font color="blue">mobile number</font></strong> that you used to send below.</li>\n\n</ol>
2	Company Registration Email	<table style="font-family:Verdana,Arial,sans-serif;font-size: 12px; margin:0px;width: 100%;min-height: 100%;background-color: #008bcf;">\n    <tr>\n        <td>\n            <table style="border:2px solid #006b9d;background-color: #ffffff; width:80%;margin-left:10%;margin-right:10%;">\n                <tr><td style="padding:5px;font-weight: bold;font-size: 14px;color:#ffffff;background-color: #003f7f;">Welcome</td></tr>\n                <tr><td style="padding:5px;">\n                        Hi UUUUU,<br>Please <a href="http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU" style="font-weight: bold;">CLICK HERE</a> to complete your registration. Alternatively you can copy the link below and paste it on your browser<br><br>http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU<br><br>\n                        As a registered member of MyJob.co.ke you will enjoy the following features\n                    </td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Virus Scanning</td></tr>\n                <tr><td style="padding:5px;">Avoid virus infected files from potential employees</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">File Attachments</td></tr>\n                <tr><td style="padding:5px;">Attach files to vacancies and receive attachments</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Instant results</td></tr>\n                <tr><td style="padding:5px;">For each vacancy you add our system will search our database of potential employees and give you instant results</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Multiple Users</td></tr>\n                <tr><td style="padding:5px;">This single registration will cater for all the users within your organisation</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Applicant Rating</td></tr>\n                <tr><td style="padding:5px;">Our system grades applicants for a vacancy giving you recommendations for the most qualified for the job</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Full Profile</td></tr>\n                <tr><td style="padding:5px;">Our system allows potential applicants to add all the necessary details they feel will assist them to secure the job, including photo and attachments</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Shortlisting</td></tr>\n                <tr><td style="padding:5px;">Our provides for shortlist management</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Feedback</td></tr>\n                <tr><td style="padding:5px;">Our system allows you to give feedback to the potential candidates</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Notes</td></tr>\n                <tr><td style="padding:5px;">Our system allows you to take down notes for each applicant</td></tr>\n            </table>\n        </td>\n    </tr>\n</table>
6	Terms and Conditions	Welcome to our website.<br/>If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Silver Ray I.T Solutions's relationship with you in relation to this website.<br/> If you disagree with any part of these terms and conditions, please do not use our website.<br/><br/>\n \n \n The term 'Silver Ray I.T Solutions' or 'us' or 'we' refers to the owner of the website whose registered address is P.O Box 68003, 00200 Nairobi, Kenya. Our company registration number is C. 132940 Registered in the Republic of Kenya.<br/>The term 'you' refers to the user or viewer of our website.<br/><br/>\n \n \n The use of this website is subject to the following terms of use:<br/><br/>\n \n \n <ul><li>The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>\n <li>This website uses cookies to monitor browsing preferences.</li>\n <li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\n <li>Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li>\n <li>This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>\n <li>All trade marks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>\n <li>Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.</li>\n <li>From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</li>\n <li>Your use of this website and any dispute arising out of such use of the website is subject to the laws of Kenya.</li>
1	Seeker Registration Email	<table style="font-family:Verdana,Arial,sans-serif;font-size: 12px; margin:0px;width: 100%;min-height: 100%;background-color: #008bcf;">\n    <tr>\n        <td>\n            <table style="border:2px solid #006b9d;background-color: #ffffff;width:80%;margin-left:10%;margin-right:10%;">\n                <tr><td style="padding: 5px;font-weight: bold;font-size: 14px;color:#ffffff;background-color: #003f7f;">Welcome</td></tr>\n                <tr><td style="padding: 5px;">\n                        Hi UUUUU,<br>Please <a href="http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU" style="font-weight: bold;">CLICK HERE</a> to complete your registration. Alternatively you can copy the link below and paste it on your browser<br><br>http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU<br><br>\n                        As a registered member of MyJob.co.ke you will enjoy the following features\n                    </td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Full Profile</td></tr>\n                <tr><td style="padding: 5px;">Our system allows you to set up your full profile </td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Community Policing</td></tr>\n                <tr><td style="padding: 5px;">Report suspicious vacancies</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Avoid Duplicate Applications</td></tr>\n                <tr><td style="padding: 5px;">Our system will let  you know when you are applying for a vacancy that you have already applied before</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Edit After Application</td></tr>\n                <tr><td style="padding: 5px;">Our system allows you to edit you application after you have already sent it</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Withdraw Application</td></tr>\n                <tr><td style="padding: 5px;">After you have applied for a vacancy, you can still withdraw it.</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Attachments</td></tr>\n                <tr><td style="padding: 5px;">Send attachments with your application</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Employer Feedback</td></tr>\n                <tr><td style="padding: 5px;">Get feedback from your potential employer</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">User Feedback</td></tr>\n                <tr><td style="padding: 5px;">We give you the opportunity to let us know how we can improve the service</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Sharing</td></tr>\n                <tr><td style="padding: 5px;">Let your friends know when you have spotted a vacancy that is suitable for them</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Advise</td></tr>\n                <tr><td style="padding: 5px;">Get and contribute job searching tips with other job seekers</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Virus Scanning </td></tr>\n                <tr><td style="padding: 5px;">We scan your C.V and other files you upload for viruses</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Application Management</td></tr>\n                <tr><td style="padding: 5px;">You will be able to see when a potential employer has viewed your application</td></tr>\n                <tr><td style="padding: 5px;background-color: #aad4ff;font-weight: bold;border:1px solid #b2b2b2;">Application Letter Management</td></tr>\n                <tr><td style="padding: 5px;">Save several application letters in advance and choose the one you would like a potential employer to view</td></tr>\n            </table>\n        </td>\n    </tr>\n</table>\n
\.


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('content_id_seq', 6, true);


--
-- Data for Name: coverletters; Type: TABLE DATA; Schema: public; Owner: work
--

COPY coverletters (id, seekerid, name, letter, datemodified) FROM stdin;
3	27	DIRECTOR, INFORMATION COMMUNICATION TECHNOLOGY	<!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Author>Aloise</o:Author>\r\n  <o:Version>12.00</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b style="mso-bidi-font-weight:\r\nnormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;</span></b></span><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span>JOSHUA MAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAIROBI.</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;</span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">DIRECTOR, INFORMATION COMMUNICATION\r\nTECHNOLOGY </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b><u><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="text-decoration:none"></span></span></u></b><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I\r\nhave more than eight years experience gained in my various engagements and\r\ntherefore I hold a strong conviction that given this opportunity, I will\r\ntirelessly put this experience into good use to enhance the institution’s\r\nproductivity and growth as well as my career development.</span><span style="font-size:12.0pt;line-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\nJoshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:10.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-bidi-font-family:"Times New Roman";}\r\n</style>\r\n<![endif]-->	2015-01-23 14:39:50.193+03
4	27	Application Letter	<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JOSHUA\r\nMAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>NAIROBI.</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">COHESION OFFICER </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I have\r\nmore than eight years experience gained in my various engagements and therefore\r\nI hold a strong conviction that given this opportunity, I will tirelessly put\r\nthis experience into good use to enhance the institution’s productivity and\r\ngrowth as well as my career development.</span><span style="font-size:12.0pt;\r\nline-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\n</span></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Joshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:11.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-ascii-font-family:Calibri;\r\n\tmso-ascii-theme-font:minor-latin;\r\n\tmso-fareast-font-family:"Times New Roman";\r\n\tmso-fareast-theme-font:minor-fareast;\r\n\tmso-hansi-font-family:Calibri;\r\n\tmso-hansi-theme-font:minor-latin;\r\n\tmso-bidi-font-family:"Times New Roman";\r\n\tmso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->	2015-01-23 15:35:01.899+03
1	27	ngo application letter	my application letter	2016-03-05 23:32:01.546+03
7	2	tes	test	2016-05-13 23:02:16.65+03
\.


--
-- Name: coverletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('coverletters_id_seq', 7, true);


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: work
--

COPY education (id, seekerid, startdate, enddate, institution, website, location, certification, refereename, address, email, mobileno, datemodified) FROM stdin;
12	27	1997-05-01	2014-05-01	University of Nairobi	asdf	asdf	asdf	asdf	asdf	asdf	asdf	2016-03-05 03:31:23.674
5	27	2015-10-31	2014-12-31	Kebirigo High School			KCSE CERTIFICATE					2015-01-23 06:31:23.86
8	27	2016-01-31	2014-09-30	JBC Computers Ltd	N/A	Coventry	City& Guilds Diploma ICT Professional Competence, Level 3	Mr Bill Jaspal	JBC Computers LTD	N/A	02476719720	2015-01-23 16:12:40.439
9	27	2016-02-29	2014-08-31	University of South Wales,UK	http://www.southwales.ac.uk/	Treforest, Wales,UK	Bsc Hons Information Technology	Student Service	Pontypridd, UK. CF37 1DL	international.support@southwales.ac.uk 	+441443 482083	2015-01-23 16:25:11.673
4	27	2015-09-30	2015-01-31	St John's Riruta Computer College	test	test	test	test	test	test	test	2015-01-23 06:29:36
3	27	2015-08-01	2019-02-01	Kenya Institute of Professional Studios	test	test	Higher Diploma in ICT	test	test	test	test	2016-03-05 03:30:38.176
14	3	2016-07-31	2014-03-31	institution - 14	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
15	1	2016-08-31	2014-02-28	institution - 15	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
16	4	2016-09-30	2014-01-31	institution - 16	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
17	5	2016-10-31	2013-12-31	institution - 17	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
18	6	2016-11-30	2013-11-30	institution - 18	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
19	7	2016-12-31	2013-10-31	institution - 19	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
20	8	2017-01-31	2013-09-30	institution - 20	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
21	9	2017-02-28	2013-08-31	institution - 21	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
22	10	2017-03-31	2013-07-31	institution - 22	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
23	12	2017-04-30	2013-06-30	institution - 23	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
24	11	2017-05-31	2013-05-31	institution - 24	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
25	13	2017-06-30	2013-04-30	institution - 25	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
26	2	2017-07-31	2013-03-31	institution - 26	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
27	17	2017-08-31	2013-02-28	institution - 27	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:21.153007
28	3	2017-09-30	2013-01-31	institution - 28	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
29	1	2017-10-31	2012-12-31	institution - 29	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
30	4	2017-11-30	2012-11-30	institution - 30	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
31	5	2017-12-31	2012-10-31	institution - 31	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
32	6	2018-01-31	2012-09-30	institution - 32	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
33	7	2018-02-28	2012-08-31	institution - 33	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
34	8	2018-03-31	2012-07-31	institution - 34	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
35	9	2018-04-30	2012-06-30	institution - 35	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
36	10	2018-05-31	2012-05-31	institution - 36	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
37	12	2018-06-30	2012-04-30	institution - 37	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
38	11	2018-07-31	2012-03-31	institution - 38	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
39	13	2018-08-31	2012-02-29	institution - 39	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
40	2	2018-09-30	2012-01-31	institution - 40	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
41	17	2018-10-31	2011-12-31	institution - 41	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:22.3609
42	3	2018-11-30	2011-11-30	institution - 42	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
43	1	2018-12-31	2011-10-31	institution - 43	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
44	4	2019-01-31	2011-09-30	institution - 44	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
45	5	2019-02-28	2011-08-31	institution - 45	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
46	6	2019-03-31	2011-07-31	institution - 46	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
47	7	2019-04-30	2011-06-30	institution - 47	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
48	8	2019-05-31	2011-05-31	institution - 48	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
49	9	2019-06-30	2011-04-30	institution - 49	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
50	10	2019-07-31	2011-03-31	institution - 50	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
51	12	2019-08-31	2011-02-28	institution - 51	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
52	11	2019-09-30	2011-01-31	institution - 52	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
53	13	2019-10-31	2010-12-31	institution - 53	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
54	2	2019-11-30	2010-11-30	institution - 54	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
55	17	2019-12-31	2010-10-31	institution - 55	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.033091
56	3	2020-01-31	2010-09-30	institution - 56	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
57	1	2020-02-29	2010-08-31	institution - 57	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
58	4	2020-03-31	2010-07-31	institution - 58	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
59	5	2020-04-30	2010-06-30	institution - 59	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
60	6	2020-05-31	2010-05-31	institution - 60	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
61	7	2020-06-30	2010-04-30	institution - 61	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
62	8	2020-07-31	2010-03-31	institution - 62	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
63	9	2020-08-31	2010-02-28	institution - 63	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
64	10	2020-09-30	2010-01-31	institution - 64	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
65	12	2020-10-31	2009-12-31	institution - 65	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
66	11	2020-11-30	2009-11-30	institution - 66	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
67	13	2020-12-31	2009-10-31	institution - 67	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
68	2	2021-01-31	2009-09-30	institution - 68	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
69	17	2021-02-28	2009-08-31	institution - 69	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:23.656945
70	3	2021-03-31	2009-07-31	institution - 70	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
71	1	2021-04-30	2009-06-30	institution - 71	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
72	4	2021-05-31	2009-05-31	institution - 72	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
73	5	2021-06-30	2009-04-30	institution - 73	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
74	6	2021-07-31	2009-03-31	institution - 74	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
75	7	2021-08-31	2009-02-28	institution - 75	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
76	8	2021-09-30	2009-01-31	institution - 76	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
77	9	2021-10-31	2008-12-31	institution - 77	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
78	10	2021-11-30	2008-11-30	institution - 78	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
79	12	2021-12-31	2008-10-31	institution - 79	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
80	11	2022-01-31	2008-09-30	institution - 80	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
81	13	2022-02-28	2008-08-31	institution - 81	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
82	2	2022-03-31	2008-07-31	institution - 82	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
83	17	2022-04-30	2008-06-30	institution - 83	\N	\N	\N	\N	\N	\N	\N	2015-05-31 18:26:24.369089
85	2	1997-05-01	2016-05-26	Test School			Degree					2016-05-27 18:47:17.771
\.


--
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('education_id_seq', 85, true);


--
-- Data for Name: filecategory; Type: TABLE DATA; Schema: public; Owner: work
--

COPY filecategory (id, name) FROM stdin;
1	CV
2	Certificate
3	Identification
4	Sample Work
5	Other
\.


--
-- Name: filecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('filecategory_id_seq', 5, true);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: work
--

COPY files (id, seekerid, filename, originalfilename, filesize, filetype, description, metadata, datemodified, filecategoryid, viewable) FROM stdin;
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('files_id_seq', 54, true);


--
-- Data for Name: filetypes; Type: TABLE DATA; Schema: public; Owner: work
--

COPY filetypes (id, filetype, description, uploads, cv, image) FROM stdin;
1	application/pdf		t	t	f
2	application/msword		t	t	f
3	application/vnd.openxmlformats-officedocument.wordprocessingml.document		t	t	f
4	application/vnd.ms-excel		t	t	f
5	text/html		t	t	f
6	text/plain		t	t	f
7	application/vnd.oasis.opendocument.spreadsheet		t	t	f
10	application/vnd.oasis.opendocument.text		t	t	f
11	application/x-tika-msoffice		t	t	f
8	image/jpeg		t	f	t
9	image/png		t	f	t
\.


--
-- Name: filetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('filetypes_id_seq', 11, true);


--
-- Data for Name: firstshortlist; Type: TABLE DATA; Schema: public; Owner: work
--

COPY firstshortlist (id, jobid, userid, seekerid, internalcomment, seekercomment, publiccomment, datemodified, hired) FROM stdin;
4	3	1	2	\N	\N	\N	2015-05-31 19:50:05.920573	\N
5	3	1	3	\N	\N	\N	2015-05-31 19:50:05.920573	\N
6	3	1	4	\N	\N	\N	2015-05-31 19:50:05.920573	\N
7	3	1	5	\N	\N	\N	2015-05-31 19:50:05.920573	\N
8	3	1	6	\N	\N	\N	2015-05-31 19:50:05.920573	\N
9	3	1	7	\N	\N	\N	2015-05-31 19:50:05.920573	\N
10	3	1	12	\N	\N	\N	2015-05-31 19:50:05.920573	\N
11	3	1	2	\N	\N	\N	2015-05-31 19:50:05.920573	\N
12	3	1	17	\N	\N	\N	2015-05-31 19:50:05.920573	\N
13	3	1	11	\N	\N	\N	2015-05-31 19:50:05.920573	\N
14	3	1	8	\N	\N	\N	2015-05-31 19:50:05.920573	\N
15	3	1	9	\N	\N	\N	2015-05-31 19:50:05.920573	\N
16	3	1	10	\N	\N	\N	2015-05-31 19:50:05.920573	\N
17	3	1	13	\N	\N	\N	2015-05-31 19:50:05.920573	\N
18	3	1	1	\N	\N	\N	2015-05-31 19:50:05.920573	\N
19	3	1	3	\N	\N	\N	2015-05-31 19:50:05.920573	\N
20	3	1	4	\N	\N	\N	2015-05-31 19:50:05.920573	\N
21	3	1	5	\N	\N	\N	2015-05-31 19:50:05.920573	\N
22	3	1	6	\N	\N	\N	2015-05-31 19:50:05.920573	\N
23	3	1	7	\N	\N	\N	2015-05-31 19:50:05.920573	\N
24	3	1	8	\N	\N	\N	2015-05-31 19:50:05.920573	\N
25	3	1	9	\N	\N	\N	2015-05-31 19:50:05.920573	\N
26	3	1	10	\N	\N	\N	2015-05-31 19:50:05.920573	\N
27	3	1	11	\N	\N	\N	2015-05-31 19:50:05.920573	\N
28	3	1	12	\N	\N	\N	2015-05-31 19:50:05.920573	\N
29	3	1	13	\N	\N	\N	2015-05-31 19:50:05.920573	\N
30	3	1	1	\N	\N	\N	2015-05-31 19:50:05.920573	\N
31	3	1	17	\N	\N	\N	2015-05-31 19:50:05.920573	\N
32	3	1	1	\N	\N	\N	2015-05-31 19:50:05.920573	\N
33	3	1	2	\N	\N	\N	2015-05-31 19:50:05.920573	\N
34	3	1	3	\N	\N	\N	2015-05-31 19:50:05.920573	\N
35	3	1	4	\N	\N	\N	2015-05-31 19:50:05.920573	\N
36	3	1	5	\N	\N	\N	2015-05-31 19:50:05.920573	\N
37	3	1	6	\N	\N	\N	2015-05-31 19:50:05.920573	\N
38	3	1	7	\N	\N	\N	2015-05-31 19:50:05.920573	\N
39	3	1	8	\N	\N	\N	2015-05-31 19:50:05.920573	\N
40	3	1	9	\N	\N	\N	2015-05-31 19:50:05.920573	\N
41	3	1	10	\N	\N	\N	2015-05-31 19:50:05.920573	\N
42	3	1	11	\N	\N	\N	2015-05-31 19:50:05.920573	\N
43	3	1	12	\N	\N	\N	2015-05-31 19:50:05.920573	\N
44	3	1	13	\N	\N	\N	2015-05-31 19:50:05.920573	\N
45	3	1	17	\N	\N	\N	2015-05-31 19:50:05.920573	\N
46	3	1	1	\N	\N	\N	2015-05-31 19:50:05.920573	\N
47	3	1	2	\N	\N	\N	2015-05-31 19:50:05.920573	\N
48	3	1	3	\N	\N	\N	2015-05-31 19:50:05.920573	\N
49	3	1	4	\N	\N	\N	2015-05-31 19:50:05.920573	\N
50	3	1	5	\N	\N	\N	2015-05-31 19:50:05.920573	\N
51	3	1	6	\N	\N	\N	2015-05-31 19:50:05.920573	\N
52	3	1	7	\N	\N	\N	2015-05-31 19:50:05.920573	\N
53	3	1	8	\N	\N	\N	2015-05-31 19:50:05.920573	\N
54	3	1	9	\N	\N	\N	2015-05-31 19:50:05.920573	\N
55	3	1	10	\N	\N	\N	2015-05-31 19:50:05.920573	\N
56	3	1	11	\N	\N	\N	2015-05-31 19:50:05.920573	\N
57	3	1	12	\N	\N	\N	2015-05-31 19:50:05.920573	\N
58	3	1	13	\N	\N	\N	2015-05-31 19:50:05.920573	\N
59	3	1	17	\N	\N	\N	2015-05-31 19:50:05.920573	\N
\.


--
-- Name: firstshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('firstshortlist_id_seq', 59, true);


--
-- Data for Name: formanswers; Type: TABLE DATA; Schema: public; Owner: work
--

COPY formanswers (id, formid, seekerid, formquestionid, question, answer, datemodified) FROM stdin;
9	1	2	1	Test Question 1 Form id = 1	ANSWER - Test Question 1 Form id = 1	2015-01-25 12:09:04.451+03
10	1	2	2	Test Question 2 Form id = 1	ANSWER - Test Question 2 Form id = 1	2015-01-25 12:09:11.716+03
11	1	2	3	Test Question 3 Form id = 1	ANSWER - Test Question 3 Form id = 1	2015-01-25 12:09:14.217+03
12	1	2	4	Test Question 4 Form id = 1	ANSWER - Test Question 4 Form id = 1	2015-01-25 12:09:16.393+03
13	2	2	5	Test Question 5 Form id = 2	a	2015-01-25 12:12:59.469+03
14	2	2	6	Test Question 6 Form id = 2	a	2015-01-25 12:13:01.479+03
15	2	2	7	Test Question 7 Form id = 2	a	2015-01-25 12:13:03.503+03
16	2	2	8	Test Question 8 Form id = 2	a	2015-01-25 12:13:05.484+03
\.


--
-- Name: formanswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('formanswers_id_seq', 16, true);


--
-- Data for Name: formquestions; Type: TABLE DATA; Schema: public; Owner: work
--

COPY formquestions (id, formid, questiontypeid, question) FROM stdin;
1	1	1	Test Question 1 Form id = 1
2	1	1	Test Question 2 Form id = 1
3	1	1	Test Question 3 Form id = 1
4	1	1	Test Question 4 Form id = 1
5	2	1	Test Question 5 Form id = 2
6	2	1	Test Question 6 Form id = 2
7	2	1	Test Question 7 Form id = 2
8	2	1	Test Question 8 Form id = 2
\.


--
-- Name: formquestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('formquestions_id_seq', 8, true);


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: work
--

COPY forms (id, companyid, userid, title, description, datemodified) FROM stdin;
1	1	1	Form 1	Form description 1	2015-01-25 11:16:29.573+03
2	1	1	Form 2	Form description 2	2015-01-25 11:42:02.3+03
\.


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('forms_id_seq', 2, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: work
--

COPY groups (id, name) FROM stdin;
1	seekers
2	companies
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('groups_id_seq', 3, false);


--
-- Data for Name: inmessage; Type: TABLE DATA; Schema: public; Owner: work
--

COPY inmessage (id, source, message, datecreated) FROM stdin;
1	123	test	2014-05-25 18:24:16.143+03
2	254720920293	Wassup?	2014-05-25 20:35:53.569+03
3	254720920293	Test	2014-05-26 06:36:08.177+03
4	MPESA	FC75UQ631 Confirmed. on 26/5/14 at 8:02 AM Ksh10.00 received from  254720920293 SAMUEL GACHANJA. New Account balance is Ksh60.00	2014-05-26 08:02:28.438+03
5	254720920293	FC75VI520 Confirmed. You have received Ksh10.00 from SAMUEL GACHANJA 254720920293 on 26/5/14 at 8:05 AM New M-PESA balance is Ksh10.00.PIN YAKO SIRI YAKO	2014-05-26 08:06:27.125+03
6	MPESA	FC87YF782 Confirmed. on 27/5/14 at 7:52 AM Ksh10.00 received from  254720920293 SAMUEL GACHANJA. New Account balance is Ksh70.00	2014-05-27 07:52:47.753+03
7	MPESA	FC88AU196 Confirmed. on 27/5/14 at 8:04 AM Ksh10.00 received from  254720920293 SAMUEL GACHANJA. New Account balance is Ksh80.00	2014-05-27 08:04:22.543+03
8	MPESA	FC88EY682 Confirmed. on 27/5/14 at 8:20 AM Ksh10.00 received from  254720920293 SAMUEL GACHANJA. New Account balance is Ksh90.00	2014-05-27 08:20:48.957+03
9	MPESA	FC92RC861 Confirmed. on 27/5/14 at 2:17 PM Ksh10.00 received from  254720920293 SAMUEL GACHANJA. New Account balance is Ksh100.00	2014-05-27 14:17:45.17+03
10	Safaricom	Please wait while Safaricom sends IEBC settings to your phone .	2014-05-29 09:04:47.091+03
11	254720920293	Test	2014-07-13 15:45:02.252+03
12	254720920293	Test	2014-07-13 15:46:16.175+03
13	254720920293	Test	2014-07-13 15:48:08.539+03
14	254720920293	Rest	2014-07-13 15:49:06.724+03
15	254720920293	Test	2014-07-13 15:53:57.027+03
16	254720920293	Test	2014-07-13 16:03:15.666+03
17	254720920293	Test	2014-07-13 16:08:33.991+03
18	254720920293	Test	2014-07-13 16:12:42.831+03
19	254720920293	Test	2014-07-13 16:14:06.36+03
20	254720920293	Test	2014-07-13 16:14:38.751+03
21	254720920293	Test	2014-07-19 09:24:36.87+03
22	254720920293	Test	2014-07-19 09:25:14.321+03
23	254720920293	Test	2014-07-19 09:26:18.643+03
24	254720920293	New test	2014-07-19 09:26:48.966+03
25	MPESA	FJ55EL103 Confirmed.\non 19/7/14 at 9:29 AM\nKsh10.00 received from \n254720920293 SAMUEL GACHANJA.\nNew Account balance is Ksh170.00	2014-07-19 09:29:54.502+03
26	254720920293	Test	2014-07-19 09:41:15.466+03
27	254720920293	Latest test	2014-07-19 09:42:06.948+03
28	MPESA	FJ55IP092 Confirmed.on 19/7/14 at 9:42 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh180.00	2014-07-19 09:42:43.357+03
29	254720920293	Test	2014-07-19 09:50:57.907+03
30	254720920293	New test	2014-07-19 09:51:23.002+03
31	MPESA	FJ55LQ468 Confirmed. on 19/7/14 at 9:51 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh190.00	2014-07-19 09:52:01.848+03
32	MPESA	FJ55LQ468 Confirmed. on 19/7/14 at 9:51 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh190.00	2014-07-19 09:57:21.244+03
33	Safaricom	Your Data Bundle balance is below 2.00 MB. Dial *544# to purchase another bundle.	2014-07-19 10:14:19.465+03
34	254720920293	Test	2014-07-19 10:16:01.591+03
35	MPESA	FJ55TZ487 Confirmed. on 19/7/14 at 10:16 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh200.00	2014-07-19 10:17:00.051+03
36	Safaricom	You have received 30.000 MB from 720920293.New balance is 30.000 MB.SMS 29555 play&win 	2014-07-20 07:41:43.804+03
37	MPESA	FJ66WX071 Confirmed. on 20/7/14 at 8:54 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh210.00	2014-07-20 08:54:54.826+03
38	254720920293	Test	2014-07-29 07:48:55.214+03
39	254720920293	Test2	2014-07-29 08:01:06.943+03
40	254720920293	Test3	2014-07-29 08:03:01.303+03
41	254720920293	Test4	2014-07-29 08:04:30.818+03
42	254720920293	Test5	2014-07-29 08:11:09.779+03
43	254720920293	Test6	2014-07-29 08:15:54.112+03
44	254720920293	Test7	2014-07-29 08:16:48.682+03
45	254720920293	Test8	2014-07-29 08:19:04.878+03
46	254720920293	Test9	2014-07-29 08:19:31.952+03
47	test	browser	2014-07-29 08:41:20.329+03
48	254720920293	Test10	2014-07-29 08:45:20.736+03
49	254720920293	Test11	2014-07-29 08:49:29.337+03
50	MPESA	FK72WO915 Confirmed. on 29/7/14 at 8:51 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh220.00	2014-07-29 08:51:23.959+03
51	MPESA	FK73BX419 Confirmed. on 29/7/14 at 9:09 AM Ksh10.00 received from 254724541318 ANN WANGARI. New Account balance is Ksh230.00	2014-07-29 09:09:51.706+03
52	254720920293	Test3	2014-07-29 09:11:58.145+03
53	254720920293	Test15	2014-07-29 09:23:13.349+03
54	0727876561	I tried to call you at 17:12 on 30 Jul Please call back.	2014-07-30 17:49:18.173+03
55	254720606167	Username: kimflex34@googlemail.com password: machakos.,	2014-07-30 18:12:04.264+03
56	0722400737	I tried to call you at 18:22 on 30 Jul Please call back.	2014-07-30 18:29:51.676+03
57	0722644995	I tried to call you at 18:23 on 30 Jul Please call back.	2014-07-30 18:29:54.615+03
58	254722644995	Hi Abel. I can't seem to get through to for some reason. I'm Paul and I have someone looking for a developer to create an app for their online magazine. 	2014-07-30 19:35:14.916+03
59	254722644995	For now they need an Android app. If you are available, can I forward your contacts to them and let them carry on from there? Do let me know soonest.	2014-07-30 19:35:15.542+03
60	0722400737	I tried to call you at 18:30 on 30 Jul Please call back.	2014-07-30 19:35:16.201+03
61	0722644995	I tried to call you at 18:33 on 30 Jul Please call back.	2014-07-30 19:35:16.82+03
62	0722644995	I tried to call you at 18:44 on 30 Jul Please call back.	2014-07-30 19:35:17.395+03
63	254737954882	Seen that's standard..sent you what am using what's the size of the image? I think that might be the issue	2014-07-30 20:09:19.734+03
64	Safaricom	Recharge was successful.Balance:100.29 KSH,expiry date:21-11-2014.Tariff:Uwezo.<ad>Tetemesha!Top up & win,Be a millionaire today.	2014-07-30 21:11:37.666+03
65	Safaricom	Congratulations!You have been awarded 10 Tetemesha Entries.New Balance:252 Tetemesha Entries.Expiry Date:13-09-2014 .	2014-07-30 21:11:40.033+03
66	MPESA	FK94TR383 confirmed. You bought Ksh100.00 of airtime on 30/7/14 at 9:11 PM New M-PESA balance is Ksh10,428.00.Save your MPESA contacts in your SIM card	2014-07-30 21:11:42.394+03
67	254737954882	Yes ...will do leo	2014-07-30 21:12:28.056+03
68	MPESA	FK95CZ918 Confirmed. on 30/7/14 at 9:50 PM Withdraw Ksh1,000.00 from 156630 - Brilecy Comm Umoja One Estate At MomanyiS Shop New M-PESA balance is Ksh9,4	2014-07-30 21:50:59.733+03
69	MPESA	01.00.Save & get a loan on MShwari	2014-07-30 21:51:00.318+03
70	254728107303	tune in to ktn	2014-07-30 23:01:07.52+03
71	254728107303	interestin interview u can wstch as u code	2014-07-30 23:01:28.155+03
72	254737954882	+254 723 268206 Charles Munene	2014-07-31 09:42:41.734+03
73	0723268206	I tried to call you at 11:26 on 31 Jul Please call back.	2014-07-31 11:50:18.132+03
74	0723268206	I tried to call you at 11:31 on 31 Jul Please call back.	2014-07-31 11:50:49.024+03
75	0723268206	I tried to call you at 11:47 on 31 Jul Please call back.	2014-07-31 11:50:49.694+03
76	Safaricom	Your Data Bundle balance is below 2.00 MB. Dial *544# to purchase another bundle.	2014-07-31 20:33:46.388+03
77	254713979356	Good night	2014-07-31 21:03:38.885+03
78	254700704141	gudnait	2014-07-31 21:20:22.892+03
79	0737954882	I tried to call you at 23:07 on 31 Jul Please call back.	2014-07-31 23:07:31.464+03
80	254737954882	Villagedorman@artcaffe.co.ke village2014	2014-07-31 23:16:25.861+03
81	254737954882	airkenya@artcaffe.co.ke pass airkenya2014	2014-07-31 23:18:52.419+03
82	254737954882	airkenya@artcaffe.co.ke pass airkenya2014	2014-07-31 23:21:25.555+03
83	254720512128	Abel, the mac guy is called Chris. His number is 0713 509149 I've already given him a heads up.	2014-08-01 11:50:10.517+03
84	Safaricom	Recharge was successful.Balance:100.03 KSH,expiry date:28-11-2014.Tariff:Uwezo.<ad>Tetemesha!Top up & win,Be a millionaire today.	2014-08-01 14:15:46.662+03
85	Safaricom	te:15-09-2014 .	2014-08-01 14:15:47.293+03
86	MPESA	FL14HY873 confirmed. You bought Ksh100.00 of airtime on 1/8/14 at 2:15 PM New M-PESA balance is Ksh8,301.00.Save your MPESA contacts in your SIM card	2014-08-01 14:15:47.964+03
87	Safaricom	Congratulations!You have been awarded 100.00 KSH Tetemesha Bonus Airtime.Expiry Date:06-08-2014 10 Tetemesha Entries.New Balance:362 Tetemesha Entries.Expiry Da	2014-08-01 14:15:56.193+03
88	0713757122	I tried to call you at 14:24 on 01 Aug Please call back.	2014-08-01 14:35:06.592+03
89	0723268206	I tried to call you at 14:27 on 01 Aug Please call back.	2014-08-01 14:35:07.739+03
90	0774123400	I tried to call you at 14:31 on 01 Aug Please call back.	2014-08-01 14:35:08.392+03
91	254737954882	I have trained village ArtCaffe n dormans..going to Trm...zile apps shells niaje?confirm n Egerton	2014-08-01 16:36:08.179+03
92	254737954882	Yesterday	2014-08-01 16:40:16.275+03
93	254725521694	Hi Abel! I have a request. Can you be able to lend me 5k I refund by @ least 15th this month or even earlier? Its urgent. Pliz if you can al appreciate.	2014-08-01 16:59:20.421+03
94	MPESA	FL16VD652 Confirmed. Ksh2,000.00 sent to EPHEL AGARE 0725521694 on 1/8/14 at 5:04 PM New M-PESA balance is Ksh6,268.00.PIN YAKO SIRI YAKO	2014-08-01 17:05:00.537+03
95	254725521694	Thanks so much. I really appreciate. Will sort you out.	2014-08-01 17:06:56.602+03
96	Safaricom	Recharge was successful.Balance:197.03 KSH,expiry date:28-11-2014.Tariff:Uwezo.<ad>Tetemesha!Top up & win,Be a millionaire today.	2014-08-01 18:18:15.219+03
97	Safaricom	Congratulations!You have been awarded 10 Tetemesha Entries.New Balance:372 Tetemesha Entries.Expiry Date:15-09-2014 .	2014-08-01 18:18:15.747+03
98	MPESA	FL18CB334 confirmed. You bought Ksh100.00 of airtime on 1/8/14 at 6:18 PM New M-PESA balance is Ksh6,168.00.Save your MPESA contacts in your SIM card	2014-08-01 18:18:18.236+03
99	254717091862	Iza simu imejidial	2014-08-01 19:44:31.643+03
100	254717091862	Niko fiti na wewe?	2014-08-01 19:55:45.326+03
101	254717091862	Yeah wewe uko job?	2014-08-01 20:17:56.409+03
102	254717091862	Inabidi	2014-08-01 20:53:34.086+03
103	254717091862	Iko poa na ata naona buildings zingali mpya malecturers wanafunza wanafunzi wanasoma	2014-08-01 21:12:10.165+03
104	254717091862	Me ni mfunny sindio?	2014-08-01 21:14:37.55+03
106	254728560893	I'll call you right back.	2014-08-02 10:33:42.514+03
107	MPESA	FL25SY982 Confirmed. Ksh550.00 sent to JOHN KAMARU 0712228470 on 2/8/14 at 12:21 PM New M-PESA balance is Ksh5,585.00.PIN YAKO SIRI YAKO	2014-08-02 12:21:34.359+03
108	254719877135	Mwangi_caretaker Mobile 0725 640691 	2014-08-02 12:31:50.816+03
109	MPESA	FL27TD453 Confirmed. Ksh3,100.00 sent to JOHN KAMARU 0712228470 on 2/8/14 at 2:46 PM New M-PESA balance is Ksh2,452.00.PIN YAKO SIRI YAKO	2014-08-02 14:46:22.289+03
110	MPESA	FL28OM237 Confirmed. Ksh375.00 sent to KPLC for account 2834369-01 on 2/8/14 at 3:44 PM New M-PESA balance is Ksh2,060.00.	2014-08-02 15:46:44.673+03
111	MPESA	FL28OX180 Confirmed. Ksh1,000.00 sent to JORAM SHAPAYA 0719156101 on 2/8/14 at 3:45 PM New M-PESA balance is Ksh1,027.00.PIN YAKO SIRI YAKO	2014-08-02 15:46:45.533+03
112	KenyaPower	Your account: 2834369-01 has been credited by Ksh 375.00. MPESA Ref: FL28OM237. Thank you	2014-08-02 15:48:35.298+03
113	Safaricom	You have transferred 30.000 MB from your account to 705598913.	2014-08-02 16:41:44.375+03
114	Safaricom	You have transferred 30.000 MB from your account to 713043865.	2014-08-02 16:43:12.839+03
115	254710122550	Gud evng~Hw r u doing gentle man??	2014-08-02 19:35:16.265+03
116	254720920293	Morning Abel, is the app still running on your phone?	2014-08-03 09:11:21.546+03
117	254720920293	Hi Abel. Please disable the sms app on your phone.	2014-08-03 09:18:35.2+03
118	254720920293	Test	2014-08-03 09:22:01.207+03
119	Safaricom	Recharge was successful.Balance:100.05 KSH,expiry date:28-11-2014.Tariff:Uwezo.<ad>Tetemesha!Top up & win,Be a millionaire today.	2014-08-03 11:44:30.216+03
120	Safaricom	Congratulations!You have been awarded 10 Tetemesha Entries.New Balance:382 Tetemesha Entries.Expiry Date:17-09-2014 .	2014-08-03 11:44:32.88+03
121	MPESA	FL37JW320 confirmed. You bought Ksh100.00 of airtime on 3/8/14 at 11:44 AM New M-PESA balance is Ksh927.00.Save your MPESA contacts in your SIM card	2014-08-03 11:44:36.996+03
122	MPESA	FN11PS158 Confirmed. on 16/8/14 at 5:58 PM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh40.00	2014-08-16 17:58:22.08+03
123	MPESA	FO07RB723 Confirmed. on 24/8/14 at 4:38 PM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh50.00	2014-08-24 16:38:24.239+03
124	MPESA	FU89YW420 Confirmed. on 15/10/14 at 6:25 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh60.00	2014-10-15 06:25:13.959+03
125	MPESA	FU89YZ974 Confirmed. on 15/10/14 at 6:26 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh70.00	2014-10-15 06:26:39.051+03
126	Safaricom	You have received 10.00 KSH from 720920293. Your account balance is 32.03 KSH, expiry date is 18-06-2033.	2015-01-10 08:23:11.273+03
127	Safaricom	You have received 10.000 MB from 720920293.New balance is 10.000 MB.SMS 29555 play&win 	2015-01-10 08:24:02.752+03
128	MPESA	GH10PW216 Confirmed. on 10/1/15 at 8:26 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh80.00	2016-05-27 16:15:57.254463+03
\.


--
-- Name: inmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('inmessage_id_seq', 128, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: work
--

COPY jobs (id, companyid, userid, referenceno, title, summary, jobdescription, qualifications, experience, instructions, startdate, enddate, email, maxapplications, datemodified, attachment, formid, positionsid, salaryid, categoryid, accountid) FROM stdin;
662	12	3	\N	Job Title - 662	Job Summary - 662	Job Description - 662	\N	Job Experience - 662	Job instructions - 662	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	7	3
660	10	3	\N	Job Title - 660	Job Summary - 660	Job Description - 660	\N	Job Experience - 660	Job instructions - 660	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	18	3
661	11	3	\N	Job Title - 661	Job Summary - 661	Job Description - 661	\N	Job Experience - 661	Job instructions - 661	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	9	3
663	13	3	\N	Job Title - 663	Job Summary - 663	Job Description - 663	\N	Job Experience - 663	Job instructions - 663	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	7	3
664	14	3	\N	Job Title - 664	Job Summary - 664	Job Description - 664	\N	Job Experience - 664	Job instructions - 664	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	4	3
665	15	3	\N	Job Title - 665	Job Summary - 665	Job Description - 665	\N	Job Experience - 665	Job instructions - 665	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	19	3
666	16	3	\N	Job Title - 666	Job Summary - 666	Job Description - 666	\N	Job Experience - 666	Job instructions - 666	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	4	3
667	17	3	\N	Job Title - 667	Job Summary - 667	Job Description - 667	\N	Job Experience - 667	Job instructions - 667	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	20	3
597	47	3	\N	Job Title - 597	Job Summary - 597	Job Description - 597	\N	Job Experience - 597	Job instructions - 597	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	19	3
598	48	3	\N	Job Title - 598	Job Summary - 598	Job Description - 598	\N	Job Experience - 598	Job instructions - 598	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	13	3
599	49	3	\N	Job Title - 599	Job Summary - 599	Job Description - 599	\N	Job Experience - 599	Job instructions - 599	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	14	3
601	1	3	\N	Job Title - 601	Job Summary - 601	Job Description - 601	\N	Job Experience - 601	Job instructions - 601	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	18	3
602	2	3	\N	Job Title - 602	Job Summary - 602	Job Description - 602	\N	Job Experience - 602	Job instructions - 602	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	8	3
321	21	3	\N	Job Title - 321	Job Summary - 321	Job Description - 321	Job qualifications - 321	Job Experience - 321	Job instructions - 321	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	1	3
364	14	3	\N	Job Title - 364	Job Summary - 364	Job Description - 364	Job qualifications - 364	Job Experience - 364	Job instructions - 364	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	9	3
365	15	3	\N	Job Title - 365	Job Summary - 365	Job Description - 365	Job qualifications - 365	Job Experience - 365	Job instructions - 365	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	16	3
366	16	3	\N	Job Title - 366	Job Summary - 366	Job Description - 366	Job qualifications - 366	Job Experience - 366	Job instructions - 366	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	12	3
367	17	3	\N	Job Title - 367	Job Summary - 367	Job Description - 367	Job qualifications - 367	Job Experience - 367	Job instructions - 367	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	13	3
313	13	3	\N	Job Title - 313	Job Summary - 313	Job Description - 313	Job qualifications - 313	Job Experience - 313	Job instructions - 313	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	14	3
618	18	3	\N	Job Title - 618	Job Summary - 618	Job Description - 618	\N	Job Experience - 618	Job instructions - 618	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	16	3
619	19	3	\N	Job Title - 619	Job Summary - 619	Job Description - 619	\N	Job Experience - 619	Job instructions - 619	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	3	3
294	44	3	\N	Job Title - 294	Job Summary - 294	Job Description - 294	Job qualifications - 294	Job Experience - 294	Job instructions - 294	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	12	3
620	20	3	\N	Job Title - 620	Job Summary - 620	Job Description - 620	\N	Job Experience - 620	Job instructions - 620	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	17	3
621	21	3	\N	Job Title - 621	Job Summary - 621	Job Description - 621	\N	Job Experience - 621	Job instructions - 621	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	14	3
374	24	3	\N	Job Title - 374	Job Summary - 374	Job Description - 374	Job qualifications - 374	Job Experience - 374	Job instructions - 374	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	13	3
628	28	3	\N	Job Title - 628	Job Summary - 628	Job Description - 628	\N	Job Experience - 628	Job instructions - 628	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	17	3
368	18	3	\N	Job Title - 368	Job Summary - 368	Job Description - 368	Job qualifications - 368	Job Experience - 368	Job instructions - 368	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	3	3
369	19	3	\N	Job Title - 369	Job Summary - 369	Job Description - 369	Job qualifications - 369	Job Experience - 369	Job instructions - 369	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	18	3
259	9	3	\N	Job Title - 259	Job Summary - 259	Job Description - 259	Job qualifications - 259	Job Experience - 259	Job instructions - 259	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	13	3
260	10	3	\N	Job Title - 260	Job Summary - 260	Job Description - 260	Job qualifications - 260	Job Experience - 260	Job instructions - 260	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	12	3
261	11	3	\N	Job Title - 261	Job Summary - 261	Job Description - 261	Job qualifications - 261	Job Experience - 261	Job instructions - 261	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	1	3
262	12	3	\N	Job Title - 262	Job Summary - 262	Job Description - 262	Job qualifications - 262	Job Experience - 262	Job instructions - 262	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	6	3
263	13	3	\N	Job Title - 263	Job Summary - 263	Job Description - 263	Job qualifications - 263	Job Experience - 263	Job instructions - 263	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	21	3
264	14	3	\N	Job Title - 264	Job Summary - 264	Job Description - 264	Job qualifications - 264	Job Experience - 264	Job instructions - 264	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	19	3
409	9	3	\N	Job Title - 409	Job Summary - 409	Job Description - 409	Job qualifications - 409	Job Experience - 409	Job instructions - 409	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	4	3
415	15	3	\N	Job Title - 415	Job Summary - 415	Job Description - 415	Job qualifications - 415	Job Experience - 415	Job instructions - 415	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	20	3
544	44	3	\N	Job Title - 544	Job Summary - 544	Job Description - 544	\N	Job Experience - 544	Job instructions - 544	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	19	3
231	31	3	\N	Job Title - 231	Job Summary - 231	Job Description - 231	Job qualifications - 231	Job Experience - 231	Job instructions - 231	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	12	3
439	39	3	\N	Job Title - 439	Job Summary - 439	Job Description - 439	\N	Job Experience - 439	Job instructions - 439	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	14	3
238	38	3	\N	Job Title - 238	Job Summary - 238	Job Description - 238	Job qualifications - 238	Job Experience - 238	Job instructions - 238	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	5	3
285	35	3	\N	Job Title - 285	Job Summary - 285	Job Description - 285	Job qualifications - 285	Job Experience - 285	Job instructions - 285	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	10	3
323	23	3	\N	Job Title - 323	Job Summary - 323	Job Description - 323	Job qualifications - 323	Job Experience - 323	Job instructions - 323	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	20	3
324	24	3	\N	Job Title - 324	Job Summary - 324	Job Description - 324	Job qualifications - 324	Job Experience - 324	Job instructions - 324	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	15	3
399	49	3	\N	Job Title - 399	Job Summary - 399	Job Description - 399	Job qualifications - 399	Job Experience - 399	Job instructions - 399	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	14	3
237	37	3	\N	Job Title - 237	Job Summary - 237	Job Description - 237	Job qualifications - 237	Job Experience - 237	Job instructions - 237	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	5	3
283	33	3	\N	Job Title - 283	Job Summary - 283	Job Description - 283	Job qualifications - 283	Job Experience - 283	Job instructions - 283	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	21	3
284	34	3	\N	Job Title - 284	Job Summary - 284	Job Description - 284	Job qualifications - 284	Job Experience - 284	Job instructions - 284	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	1	3
630	30	3	\N	Job Title - 630	Job Summary - 630	Job Description - 630	\N	Job Experience - 630	Job instructions - 630	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	13	3
631	31	3	\N	Job Title - 631	Job Summary - 631	Job Description - 631	\N	Job Experience - 631	Job instructions - 631	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	7	3
632	32	3	\N	Job Title - 632	Job Summary - 632	Job Description - 632	\N	Job Experience - 632	Job instructions - 632	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	11	3
633	33	3	\N	Job Title - 633	Job Summary - 633	Job Description - 633	\N	Job Experience - 633	Job instructions - 633	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	9	3
634	34	3	\N	Job Title - 634	Job Summary - 634	Job Description - 634	\N	Job Experience - 634	Job instructions - 634	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	3	3
635	35	3	\N	Job Title - 635	Job Summary - 635	Job Description - 635	\N	Job Experience - 635	Job instructions - 635	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	1	3
636	36	3	\N	Job Title - 636	Job Summary - 636	Job Description - 636	\N	Job Experience - 636	Job instructions - 636	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	8	3
637	37	3	\N	Job Title - 637	Job Summary - 637	Job Description - 637	\N	Job Experience - 637	Job instructions - 637	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	8	3
645	45	3	\N	Job Title - 645	Job Summary - 645	Job Description - 645	\N	Job Experience - 645	Job instructions - 645	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	22	3
638	38	3	\N	Job Title - 638	Job Summary - 638	Job Description - 638	\N	Job Experience - 638	Job instructions - 638	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	13	3
639	39	3	\N	Job Title - 639	Job Summary - 639	Job Description - 639	\N	Job Experience - 639	Job instructions - 639	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	3	3
640	40	3	\N	Job Title - 640	Job Summary - 640	Job Description - 640	\N	Job Experience - 640	Job instructions - 640	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	12	3
641	41	3	\N	Job Title - 641	Job Summary - 641	Job Description - 641	\N	Job Experience - 641	Job instructions - 641	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	21	3
642	42	3	\N	Job Title - 642	Job Summary - 642	Job Description - 642	\N	Job Experience - 642	Job instructions - 642	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	1	3
643	43	3	\N	Job Title - 643	Job Summary - 643	Job Description - 643	\N	Job Experience - 643	Job instructions - 643	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	8	3
644	44	3	\N	Job Title - 644	Job Summary - 644	Job Description - 644	\N	Job Experience - 644	Job instructions - 644	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	11	3
375	25	3	\N	Job Title - 375	Job Summary - 375	Job Description - 375	Job qualifications - 375	Job Experience - 375	Job instructions - 375	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	3	3
433	33	3	\N	Job Title - 433	Job Summary - 433	Job Description - 433	\N	Job Experience - 433	Job instructions - 433	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	13	3
376	26	3	\N	Job Title - 376	Job Summary - 376	Job Description - 376	Job qualifications - 376	Job Experience - 376	Job instructions - 376	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	2	3
377	27	3	\N	Job Title - 377	Job Summary - 377	Job Description - 377	Job qualifications - 377	Job Experience - 377	Job instructions - 377	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	5	3
378	28	3	\N	Job Title - 378	Job Summary - 378	Job Description - 378	Job qualifications - 378	Job Experience - 378	Job instructions - 378	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	21	3
616	16	3	\N	Job Title - 616	Job Summary - 616	Job Description - 616	\N	Job Experience - 616	Job instructions - 616	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	11	3
658	8	3	\N	Job Title - 658	Job Summary - 658	Job Description - 658	\N	Job Experience - 658	Job instructions - 658	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	1	3
379	29	3	\N	Job Title - 379	Job Summary - 379	Job Description - 379	Job qualifications - 379	Job Experience - 379	Job instructions - 379	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	9	3
314	14	3	\N	Job Title - 314	Job Summary - 314	Job Description - 314	Job qualifications - 314	Job Experience - 314	Job instructions - 314	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	4	3
404	4	3	\N	Job Title - 404	Job Summary - 404	Job Description - 404	Job qualifications - 404	Job Experience - 404	Job instructions - 404	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	9	3
676	26	3	\N	Job Title - 676	Job Summary - 676	Job Description - 676	\N	Job Experience - 676	Job instructions - 676	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	5	3
677	27	3	\N	Job Title - 677	Job Summary - 677	Job Description - 677	\N	Job Experience - 677	Job instructions - 677	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	18	3
678	28	3	\N	Job Title - 678	Job Summary - 678	Job Description - 678	\N	Job Experience - 678	Job instructions - 678	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	9	3
679	29	3	\N	Job Title - 679	Job Summary - 679	Job Description - 679	\N	Job Experience - 679	Job instructions - 679	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	15	3
680	30	3	\N	Job Title - 680	Job Summary - 680	Job Description - 680	\N	Job Experience - 680	Job instructions - 680	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	11	3
681	31	3	\N	Job Title - 681	Job Summary - 681	Job Description - 681	\N	Job Experience - 681	Job instructions - 681	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	7	3
534	34	3	\N	Job Title - 534	Job Summary - 534	Job Description - 534	\N	Job Experience - 534	Job instructions - 534	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	22	3
535	35	3	\N	Job Title - 535	Job Summary - 535	Job Description - 535	\N	Job Experience - 535	Job instructions - 535	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	4	3
511	11	3	\N	Job Title - 511	Job Summary - 511	Job Description - 511	\N	Job Experience - 511	Job instructions - 511	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	3	3
537	37	3	\N	Job Title - 537	Job Summary - 537	Job Description - 537	\N	Job Experience - 537	Job instructions - 537	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	1	3
538	38	3	\N	Job Title - 538	Job Summary - 538	Job Description - 538	\N	Job Experience - 538	Job instructions - 538	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	16	3
539	39	3	\N	Job Title - 539	Job Summary - 539	Job Description - 539	\N	Job Experience - 539	Job instructions - 539	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	6	3
269	19	3	\N	Job Title - 269	Job Summary - 269	Job Description - 269	Job qualifications - 269	Job Experience - 269	Job instructions - 269	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	5	3
270	20	3	\N	Job Title - 270	Job Summary - 270	Job Description - 270	Job qualifications - 270	Job Experience - 270	Job instructions - 270	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	7	3
271	21	3	\N	Job Title - 271	Job Summary - 271	Job Description - 271	Job qualifications - 271	Job Experience - 271	Job instructions - 271	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	5	3
272	22	3	\N	Job Title - 272	Job Summary - 272	Job Description - 272	Job qualifications - 272	Job Experience - 272	Job instructions - 272	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	16	3
536	36	3	\N	Job Title - 536	Job Summary - 536	Job Description - 536	\N	Job Experience - 536	Job instructions - 536	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	19	3
408	8	3	\N	Job Title - 408	Job Summary - 408	Job Description - 408	Job qualifications - 408	Job Experience - 408	Job instructions - 408	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	6	3
405	5	3	\N	Job Title - 405	Job Summary - 405	Job Description - 405	Job qualifications - 405	Job Experience - 405	Job instructions - 405	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	17	3
406	6	3	\N	Job Title - 406	Job Summary - 406	Job Description - 406	Job qualifications - 406	Job Experience - 406	Job instructions - 406	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	11	3
407	7	3	\N	Job Title - 407	Job Summary - 407	Job Description - 407	Job qualifications - 407	Job Experience - 407	Job instructions - 407	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	19	3
512	12	3	\N	Job Title - 512	Job Summary - 512	Job Description - 512	\N	Job Experience - 512	Job instructions - 512	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	7	3
659	9	3	\N	Job Title - 659	Job Summary - 659	Job Description - 659	\N	Job Experience - 659	Job instructions - 659	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	14	3
320	20	3	\N	Job Title - 320	Job Summary - 320	Job Description - 320	Job qualifications - 320	Job Experience - 320	Job instructions - 320	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	10	3
418	18	3	\N	Job Title - 418	Job Summary - 418	Job Description - 418	\N	Job Experience - 418	Job instructions - 418	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	14	3
417	17	3	\N	Job Title - 417	Job Summary - 417	Job Description - 417	Job qualifications - 417	Job Experience - 417	Job instructions - 417	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	11	3
220	20	3	\N	Job Title - 220	Job Summary - 220	Job Description - 220	Job qualifications - 220	Job Experience - 220	Job instructions - 220	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	9	3
228	28	3	\N	Job Title - 228	Job Summary - 228	Job Description - 228	Job qualifications - 228	Job Experience - 228	Job instructions - 228	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	17	3
229	29	3	\N	Job Title - 229	Job Summary - 229	Job Description - 229	Job qualifications - 229	Job Experience - 229	Job instructions - 229	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	7	3
230	30	3	\N	Job Title - 230	Job Summary - 230	Job Description - 230	Job qualifications - 230	Job Experience - 230	Job instructions - 230	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	18	3
255	5	3	\N	Job Title - 255	Job Summary - 255	Job Description - 255	Job qualifications - 255	Job Experience - 255	Job instructions - 255	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	2	3
333	33	3	\N	Job Title - 333	Job Summary - 333	Job Description - 333	Job qualifications - 333	Job Experience - 333	Job instructions - 333	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	13	3
400	4	3	\N	Job Title - 400	Job Summary - 400	Job Description - 400	Job qualifications - 400	Job Experience - 400	Job instructions - 400	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	22	3
668	18	3	\N	Job Title - 668	Job Summary - 668	Job Description - 668	\N	Job Experience - 668	Job instructions - 668	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	20	3
336	36	3	\N	Job Title - 336	Job Summary - 336	Job Description - 336	Job qualifications - 336	Job Experience - 336	Job instructions - 336	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	17	3
337	37	3	\N	Job Title - 337	Job Summary - 337	Job Description - 337	Job qualifications - 337	Job Experience - 337	Job instructions - 337	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	19	3
338	38	3	\N	Job Title - 338	Job Summary - 338	Job Description - 338	Job qualifications - 338	Job Experience - 338	Job instructions - 338	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	3	3
352	2	3	\N	Job Title - 352	Job Summary - 352	Job Description - 352	Job qualifications - 352	Job Experience - 352	Job instructions - 352	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	12	3
273	23	3	\N	Job Title - 273	Job Summary - 273	Job Description - 273	Job qualifications - 273	Job Experience - 273	Job instructions - 273	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	5	3
274	24	3	\N	Job Title - 274	Job Summary - 274	Job Description - 274	Job qualifications - 274	Job Experience - 274	Job instructions - 274	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	17	3
353	3	3	\N	Job Title - 353	Job Summary - 353	Job Description - 353	Job qualifications - 353	Job Experience - 353	Job instructions - 353	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	1	3
354	4	3	\N	Job Title - 354	Job Summary - 354	Job Description - 354	Job qualifications - 354	Job Experience - 354	Job instructions - 354	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	12	3
355	5	3	\N	Job Title - 355	Job Summary - 355	Job Description - 355	Job qualifications - 355	Job Experience - 355	Job instructions - 355	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	17	3
297	47	3	\N	Job Title - 297	Job Summary - 297	Job Description - 297	Job qualifications - 297	Job Experience - 297	Job instructions - 297	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	4	3
497	47	3	\N	Job Title - 497	Job Summary - 497	Job Description - 497	\N	Job Experience - 497	Job instructions - 497	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	19	3
498	48	3	\N	Job Title - 498	Job Summary - 498	Job Description - 498	\N	Job Experience - 498	Job instructions - 498	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	19	3
499	49	3	\N	Job Title - 499	Job Summary - 499	Job Description - 499	\N	Job Experience - 499	Job instructions - 499	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	21	3
501	1	3	\N	Job Title - 501	Job Summary - 501	Job Description - 501	\N	Job Experience - 501	Job instructions - 501	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	4	3
502	2	3	\N	Job Title - 502	Job Summary - 502	Job Description - 502	\N	Job Experience - 502	Job instructions - 502	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	1	3
389	39	3	\N	Job Title - 389	Job Summary - 389	Job Description - 389	Job qualifications - 389	Job Experience - 389	Job instructions - 389	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	15	3
569	19	3	\N	Job Title - 569	Job Summary - 569	Job Description - 569	\N	Job Experience - 569	Job instructions - 569	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	1	3
556	6	3	\N	Job Title - 556	Job Summary - 556	Job Description - 556	\N	Job Experience - 556	Job instructions - 556	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	7	3
557	7	3	\N	Job Title - 557	Job Summary - 557	Job Description - 557	\N	Job Experience - 557	Job instructions - 557	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	19	3
466	16	3	\N	Job Title - 466	Job Summary - 466	Job Description - 466	\N	Job Experience - 466	Job instructions - 466	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	20	3
545	45	3	\N	Job Title - 545	Job Summary - 545	Job Description - 545	\N	Job Experience - 545	Job instructions - 545	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	20	3
291	41	3	\N	Job Title - 291	Job Summary - 291	Job Description - 291	Job qualifications - 291	Job Experience - 291	Job instructions - 291	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	1	3
292	42	3	\N	Job Title - 292	Job Summary - 292	Job Description - 292	Job qualifications - 292	Job Experience - 292	Job instructions - 292	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	22	3
293	43	3	\N	Job Title - 293	Job Summary - 293	Job Description - 293	Job qualifications - 293	Job Experience - 293	Job instructions - 293	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	13	3
295	45	3	\N	Job Title - 295	Job Summary - 295	Job Description - 295	Job qualifications - 295	Job Experience - 295	Job instructions - 295	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	1	3
576	26	3	\N	Job Title - 576	Job Summary - 576	Job Description - 576	\N	Job Experience - 576	Job instructions - 576	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	7	3
577	27	3	\N	Job Title - 577	Job Summary - 577	Job Description - 577	\N	Job Experience - 577	Job instructions - 577	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	9	3
578	28	3	\N	Job Title - 578	Job Summary - 578	Job Description - 578	\N	Job Experience - 578	Job instructions - 578	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	21	3
579	29	3	\N	Job Title - 579	Job Summary - 579	Job Description - 579	\N	Job Experience - 579	Job instructions - 579	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	1	3
580	30	3	\N	Job Title - 580	Job Summary - 580	Job Description - 580	\N	Job Experience - 580	Job instructions - 580	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	14	3
581	31	3	\N	Job Title - 581	Job Summary - 581	Job Description - 581	\N	Job Experience - 581	Job instructions - 581	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	13	3
582	32	3	\N	Job Title - 582	Job Summary - 582	Job Description - 582	\N	Job Experience - 582	Job instructions - 582	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	3	3
296	46	3	\N	Job Title - 296	Job Summary - 296	Job Description - 296	Job qualifications - 296	Job Experience - 296	Job instructions - 296	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	14	3
481	31	3	\N	Job Title - 481	Job Summary - 481	Job Description - 481	\N	Job Experience - 481	Job instructions - 481	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	6	3
438	38	3	\N	Job Title - 438	Job Summary - 438	Job Description - 438	\N	Job Experience - 438	Job instructions - 438	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	17	3
465	15	3	\N	Job Title - 465	Job Summary - 465	Job Description - 465	\N	Job Experience - 465	Job instructions - 465	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	13	3
350	4	3	\N	Job Title - 350	Job Summary - 350	Job Description - 350	Job qualifications - 350	Job Experience - 350	Job instructions - 350	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	19	3
349	49	3	\N	Job Title - 349	Job Summary - 349	Job Description - 349	Job qualifications - 349	Job Experience - 349	Job instructions - 349	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	3	3
351	1	3	\N	Job Title - 351	Job Summary - 351	Job Description - 351	Job qualifications - 351	Job Experience - 351	Job instructions - 351	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	9	3
383	33	3	\N	Job Title - 383	Job Summary - 383	Job Description - 383	Job qualifications - 383	Job Experience - 383	Job instructions - 383	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	20	3
384	34	3	\N	Job Title - 384	Job Summary - 384	Job Description - 384	Job qualifications - 384	Job Experience - 384	Job instructions - 384	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	20	3
385	35	3	\N	Job Title - 385	Job Summary - 385	Job Description - 385	Job qualifications - 385	Job Experience - 385	Job instructions - 385	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	4	3
386	36	3	\N	Job Title - 386	Job Summary - 386	Job Description - 386	Job qualifications - 386	Job Experience - 386	Job instructions - 386	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	21	3
416	16	3	\N	Job Title - 416	Job Summary - 416	Job Description - 416	Job qualifications - 416	Job Experience - 416	Job instructions - 416	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	1	3
256	6	3	\N	Job Title - 256	Job Summary - 256	Job Description - 256	Job qualifications - 256	Job Experience - 256	Job instructions - 256	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	3	3
257	7	3	\N	Job Title - 257	Job Summary - 257	Job Description - 257	Job qualifications - 257	Job Experience - 257	Job instructions - 257	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	19	3
258	8	3	\N	Job Title - 258	Job Summary - 258	Job Description - 258	Job qualifications - 258	Job Experience - 258	Job instructions - 258	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	22	3
245	45	3	\N	Job Title - 245	Job Summary - 245	Job Description - 245	Job qualifications - 245	Job Experience - 245	Job instructions - 245	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	1	3
246	46	3	\N	Job Title - 246	Job Summary - 246	Job Description - 246	Job qualifications - 246	Job Experience - 246	Job instructions - 246	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	19	3
462	12	3	\N	Job Title - 462	Job Summary - 462	Job Description - 462	\N	Job Experience - 462	Job instructions - 462	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	21	3
392	42	3	\N	Job Title - 392	Job Summary - 392	Job Description - 392	Job qualifications - 392	Job Experience - 392	Job instructions - 392	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	14	3
250	4	3	\N	Job Title - 250	Job Summary - 250	Job Description - 250	Job qualifications - 250	Job Experience - 250	Job instructions - 250	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	20	3
500	4	3	\N	Job Title - 500	Job Summary - 500	Job Description - 500	\N	Job Experience - 500	Job instructions - 500	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	5	3
463	13	3	\N	Job Title - 463	Job Summary - 463	Job Description - 463	\N	Job Experience - 463	Job instructions - 463	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	22	3
464	14	3	\N	Job Title - 464	Job Summary - 464	Job Description - 464	\N	Job Experience - 464	Job instructions - 464	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	18	3
575	25	3	\N	Job Title - 575	Job Summary - 575	Job Description - 575	\N	Job Experience - 575	Job instructions - 575	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	6	3
247	47	3	\N	Job Title - 247	Job Summary - 247	Job Description - 247	Job qualifications - 247	Job Experience - 247	Job instructions - 247	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	13	3
248	48	3	\N	Job Title - 248	Job Summary - 248	Job Description - 248	Job qualifications - 248	Job Experience - 248	Job instructions - 248	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	8	3
289	39	3	\N	Job Title - 289	Job Summary - 289	Job Description - 289	Job qualifications - 289	Job Experience - 289	Job instructions - 289	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	13	3
290	40	3	\N	Job Title - 290	Job Summary - 290	Job Description - 290	Job qualifications - 290	Job Experience - 290	Job instructions - 290	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	2	3
356	6	3	\N	Job Title - 356	Job Summary - 356	Job Description - 356	Job qualifications - 356	Job Experience - 356	Job instructions - 356	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	18	3
359	9	3	\N	Job Title - 359	Job Summary - 359	Job Description - 359	Job qualifications - 359	Job Experience - 359	Job instructions - 359	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	10	3
360	10	3	\N	Job Title - 360	Job Summary - 360	Job Description - 360	Job qualifications - 360	Job Experience - 360	Job instructions - 360	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	5	3
361	11	3	\N	Job Title - 361	Job Summary - 361	Job Description - 361	Job qualifications - 361	Job Experience - 361	Job instructions - 361	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	4	3
583	33	3	\N	Job Title - 583	Job Summary - 583	Job Description - 583	\N	Job Experience - 583	Job instructions - 583	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	21	3
584	34	3	\N	Job Title - 584	Job Summary - 584	Job Description - 584	\N	Job Experience - 584	Job instructions - 584	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	4	3
585	35	3	\N	Job Title - 585	Job Summary - 585	Job Description - 585	\N	Job Experience - 585	Job instructions - 585	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	13	3
586	36	3	\N	Job Title - 586	Job Summary - 586	Job Description - 586	\N	Job Experience - 586	Job instructions - 586	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	20	3
587	37	3	\N	Job Title - 587	Job Summary - 587	Job Description - 587	\N	Job Experience - 587	Job instructions - 587	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	2	3
588	38	3	\N	Job Title - 588	Job Summary - 588	Job Description - 588	\N	Job Experience - 588	Job instructions - 588	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	11	3
589	39	3	\N	Job Title - 589	Job Summary - 589	Job Description - 589	\N	Job Experience - 589	Job instructions - 589	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	2	3
590	40	3	\N	Job Title - 590	Job Summary - 590	Job Description - 590	\N	Job Experience - 590	Job instructions - 590	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	1	3
591	41	3	\N	Job Title - 591	Job Summary - 591	Job Description - 591	\N	Job Experience - 591	Job instructions - 591	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	11	3
592	42	3	\N	Job Title - 592	Job Summary - 592	Job Description - 592	\N	Job Experience - 592	Job instructions - 592	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	5	3
593	43	3	\N	Job Title - 593	Job Summary - 593	Job Description - 593	\N	Job Experience - 593	Job instructions - 593	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	19	3
594	44	3	\N	Job Title - 594	Job Summary - 594	Job Description - 594	\N	Job Experience - 594	Job instructions - 594	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	10	3
603	3	3	\N	Job Title - 603	Job Summary - 603	Job Description - 603	\N	Job Experience - 603	Job instructions - 603	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	20	3
604	4	3	\N	Job Title - 604	Job Summary - 604	Job Description - 604	\N	Job Experience - 604	Job instructions - 604	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	9	3
622	22	3	\N	Job Title - 622	Job Summary - 622	Job Description - 622	\N	Job Experience - 622	Job instructions - 622	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	16	3
623	23	3	\N	Job Title - 623	Job Summary - 623	Job Description - 623	\N	Job Experience - 623	Job instructions - 623	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	5	3
624	24	3	\N	Job Title - 624	Job Summary - 624	Job Description - 624	\N	Job Experience - 624	Job instructions - 624	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	14	3
625	25	3	\N	Job Title - 625	Job Summary - 625	Job Description - 625	\N	Job Experience - 625	Job instructions - 625	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	7	3
626	26	3	\N	Job Title - 626	Job Summary - 626	Job Description - 626	\N	Job Experience - 626	Job instructions - 626	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	7	3
227	27	3	\N	Job Title - 227	Job Summary - 227	Job Description - 227	Job qualifications - 227	Job Experience - 227	Job instructions - 227	\N	2016-04-25	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	16	3
298	48	3	\N	Job Title - 298	Job Summary - 298	Job Description - 298	Job qualifications - 298	Job Experience - 298	Job instructions - 298	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	14	3
299	49	3	\N	Job Title - 299	Job Summary - 299	Job Description - 299	Job qualifications - 299	Job Experience - 299	Job instructions - 299	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	17	3
467	17	3	\N	Job Title - 467	Job Summary - 467	Job Description - 467	\N	Job Experience - 467	Job instructions - 467	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	17	3
558	8	3	\N	Job Title - 558	Job Summary - 558	Job Description - 558	\N	Job Experience - 558	Job instructions - 558	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	5	3
559	9	3	\N	Job Title - 559	Job Summary - 559	Job Description - 559	\N	Job Experience - 559	Job instructions - 559	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	14	3
225	25	3	\N	Job Title - 225	Job Summary - 225	Job Description - 225	Job qualifications - 225	Job Experience - 225	Job instructions - 225	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	2	3
226	26	3	\N	Job Title - 226	Job Summary - 226	Job Description - 226	Job qualifications - 226	Job Experience - 226	Job instructions - 226	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	1	3
434	34	3	\N	Job Title - 434	Job Summary - 434	Job Description - 434	\N	Job Experience - 434	Job instructions - 434	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	14	3
435	35	3	\N	Job Title - 435	Job Summary - 435	Job Description - 435	\N	Job Experience - 435	Job instructions - 435	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	22	3
436	36	3	\N	Job Title - 436	Job Summary - 436	Job Description - 436	\N	Job Experience - 436	Job instructions - 436	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	13	3
437	37	3	\N	Job Title - 437	Job Summary - 437	Job Description - 437	\N	Job Experience - 437	Job instructions - 437	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	9	3
560	10	3	\N	Job Title - 560	Job Summary - 560	Job Description - 560	\N	Job Experience - 560	Job instructions - 560	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	18	3
561	11	3	\N	Job Title - 561	Job Summary - 561	Job Description - 561	\N	Job Experience - 561	Job instructions - 561	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	16	3
381	31	3	\N	Job Title - 381	Job Summary - 381	Job Description - 381	Job qualifications - 381	Job Experience - 381	Job instructions - 381	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	20	3
340	40	3	\N	Job Title - 340	Job Summary - 340	Job Description - 340	Job qualifications - 340	Job Experience - 340	Job instructions - 340	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	1	3
341	41	3	\N	Job Title - 341	Job Summary - 341	Job Description - 341	Job qualifications - 341	Job Experience - 341	Job instructions - 341	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	10	3
300	4	3	\N	Job Title - 300	Job Summary - 300	Job Description - 300	Job qualifications - 300	Job Experience - 300	Job instructions - 300	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	20	3
344	44	3	\N	Job Title - 344	Job Summary - 344	Job Description - 344	Job qualifications - 344	Job Experience - 344	Job instructions - 344	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	12	3
345	45	3	\N	Job Title - 345	Job Summary - 345	Job Description - 345	Job qualifications - 345	Job Experience - 345	Job instructions - 345	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	5	3
346	46	3	\N	Job Title - 346	Job Summary - 346	Job Description - 346	Job qualifications - 346	Job Experience - 346	Job instructions - 346	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	2	3
347	47	3	\N	Job Title - 347	Job Summary - 347	Job Description - 347	Job qualifications - 347	Job Experience - 347	Job instructions - 347	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	3	3
348	48	3	\N	Job Title - 348	Job Summary - 348	Job Description - 348	Job qualifications - 348	Job Experience - 348	Job instructions - 348	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	22	3
342	42	3	\N	Job Title - 342	Job Summary - 342	Job Description - 342	Job qualifications - 342	Job Experience - 342	Job instructions - 342	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	20	3
343	43	3	\N	Job Title - 343	Job Summary - 343	Job Description - 343	Job qualifications - 343	Job Experience - 343	Job instructions - 343	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	21	3
362	12	3	\N	Job Title - 362	Job Summary - 362	Job Description - 362	Job qualifications - 362	Job Experience - 362	Job instructions - 362	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	12	3
318	18	3	\N	Job Title - 318	Job Summary - 318	Job Description - 318	Job qualifications - 318	Job Experience - 318	Job instructions - 318	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	22	3
319	19	3	\N	Job Title - 319	Job Summary - 319	Job Description - 319	Job qualifications - 319	Job Experience - 319	Job instructions - 319	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	9	3
382	32	3	\N	Job Title - 382	Job Summary - 382	Job Description - 382	Job qualifications - 382	Job Experience - 382	Job instructions - 382	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	22	3
249	49	3	\N	Job Title - 249	Job Summary - 249	Job Description - 249	Job qualifications - 249	Job Experience - 249	Job instructions - 249	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	8	3
235	35	3	\N	Job Title - 235	Job Summary - 235	Job Description - 235	Job qualifications - 235	Job Experience - 235	Job instructions - 235	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	5	3
595	45	3	\N	Job Title - 595	Job Summary - 595	Job Description - 595	\N	Job Experience - 595	Job instructions - 595	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	6	3
596	46	3	\N	Job Title - 596	Job Summary - 596	Job Description - 596	\N	Job Experience - 596	Job instructions - 596	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	15	3
600	4	3	\N	Job Title - 600	Job Summary - 600	Job Description - 600	\N	Job Experience - 600	Job instructions - 600	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	9	3
432	32	3	\N	Job Title - 432	Job Summary - 432	Job Description - 432	\N	Job Experience - 432	Job instructions - 432	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	2	3
339	39	3	\N	Job Title - 339	Job Summary - 339	Job Description - 339	Job qualifications - 339	Job Experience - 339	Job instructions - 339	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	18	3
401	1	3	\N	Job Title - 401	Job Summary - 401	Job Description - 401	Job qualifications - 401	Job Experience - 401	Job instructions - 401	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	16	3
402	2	3	\N	Job Title - 402	Job Summary - 402	Job Description - 402	Job qualifications - 402	Job Experience - 402	Job instructions - 402	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	2	3
403	3	3	\N	Job Title - 403	Job Summary - 403	Job Description - 403	Job qualifications - 403	Job Experience - 403	Job instructions - 403	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	4	3
673	23	3	\N	Job Title - 673	Job Summary - 673	Job Description - 673	\N	Job Experience - 673	Job instructions - 673	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	2	3
410	10	3	\N	Job Title - 410	Job Summary - 410	Job Description - 410	Job qualifications - 410	Job Experience - 410	Job instructions - 410	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	20	3
411	11	3	\N	Job Title - 411	Job Summary - 411	Job Description - 411	Job qualifications - 411	Job Experience - 411	Job instructions - 411	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	10	3
412	12	3	\N	Job Title - 412	Job Summary - 412	Job Description - 412	Job qualifications - 412	Job Experience - 412	Job instructions - 412	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	13	3
413	13	3	\N	Job Title - 413	Job Summary - 413	Job Description - 413	Job qualifications - 413	Job Experience - 413	Job instructions - 413	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	12	3
414	14	3	\N	Job Title - 414	Job Summary - 414	Job Description - 414	Job qualifications - 414	Job Experience - 414	Job instructions - 414	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	3	3
475	25	3	\N	Job Title - 475	Job Summary - 475	Job Description - 475	\N	Job Experience - 475	Job instructions - 475	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	16	3
674	24	3	\N	Job Title - 674	Job Summary - 674	Job Description - 674	\N	Job Experience - 674	Job instructions - 674	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	1	3
675	25	3	\N	Job Title - 675	Job Summary - 675	Job Description - 675	\N	Job Experience - 675	Job instructions - 675	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	16	3
236	36	3	\N	Job Title - 236	Job Summary - 236	Job Description - 236	Job qualifications - 236	Job Experience - 236	Job instructions - 236	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	1	3
396	46	3	\N	Job Title - 396	Job Summary - 396	Job Description - 396	Job qualifications - 396	Job Experience - 396	Job instructions - 396	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	20	3
397	47	3	\N	Job Title - 397	Job Summary - 397	Job Description - 397	Job qualifications - 397	Job Experience - 397	Job instructions - 397	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	8	3
275	25	3	\N	Job Title - 275	Job Summary - 275	Job Description - 275	Job qualifications - 275	Job Experience - 275	Job instructions - 275	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	14	3
276	26	3	\N	Job Title - 276	Job Summary - 276	Job Description - 276	Job qualifications - 276	Job Experience - 276	Job instructions - 276	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	15	3
398	48	3	\N	Job Title - 398	Job Summary - 398	Job Description - 398	Job qualifications - 398	Job Experience - 398	Job instructions - 398	\N	2016-04-22	\N	\N	2015-06-07 07:45:31.257933	\N	\N	\N	\N	10	3
393	43	3	\N	Job Title - 393	Job Summary - 393	Job Description - 393	Job qualifications - 393	Job Experience - 393	Job instructions - 393	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	9	3
394	44	3	\N	Job Title - 394	Job Summary - 394	Job Description - 394	Job qualifications - 394	Job Experience - 394	Job instructions - 394	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	6	3
395	45	3	\N	Job Title - 395	Job Summary - 395	Job Description - 395	Job qualifications - 395	Job Experience - 395	Job instructions - 395	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	22	3
251	1	3	\N	Job Title - 251	Job Summary - 251	Job Description - 251	Job qualifications - 251	Job Experience - 251	Job instructions - 251	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	9	3
252	2	3	\N	Job Title - 252	Job Summary - 252	Job Description - 252	Job qualifications - 252	Job Experience - 252	Job instructions - 252	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	11	3
253	3	3	\N	Job Title - 253	Job Summary - 253	Job Description - 253	Job qualifications - 253	Job Experience - 253	Job instructions - 253	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	20	3
468	18	3	\N	Job Title - 468	Job Summary - 468	Job Description - 468	\N	Job Experience - 468	Job instructions - 468	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	5	3
543	43	3	\N	Job Title - 543	Job Summary - 543	Job Description - 543	\N	Job Experience - 543	Job instructions - 543	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	8	3
669	19	3	\N	Job Title - 669	Job Summary - 669	Job Description - 669	\N	Job Experience - 669	Job instructions - 669	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	10	3
670	20	3	\N	Job Title - 670	Job Summary - 670	Job Description - 670	\N	Job Experience - 670	Job instructions - 670	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	19	3
304	4	3	\N	Job Title - 304	Job Summary - 304	Job Description - 304	Job qualifications - 304	Job Experience - 304	Job instructions - 304	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	12	3
614	14	3	\N	Job Title - 614	Job Summary - 614	Job Description - 614	\N	Job Experience - 614	Job instructions - 614	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	19	3
615	15	3	\N	Job Title - 615	Job Summary - 615	Job Description - 615	\N	Job Experience - 615	Job instructions - 615	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	20	3
267	17	3	\N	Job Title - 267	Job Summary - 267	Job Description - 267	Job qualifications - 267	Job Experience - 267	Job instructions - 267	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	9	3
325	25	3	\N	Job Title - 325	Job Summary - 325	Job Description - 325	Job qualifications - 325	Job Experience - 325	Job instructions - 325	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	11	3
315	15	3	\N	Job Title - 315	Job Summary - 315	Job Description - 315	Job qualifications - 315	Job Experience - 315	Job instructions - 315	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	12	3
316	16	3	\N	Job Title - 316	Job Summary - 316	Job Description - 316	Job qualifications - 316	Job Experience - 316	Job instructions - 316	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	13	3
428	28	3	\N	Job Title - 428	Job Summary - 428	Job Description - 428	\N	Job Experience - 428	Job instructions - 428	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	10	3
429	29	3	\N	Job Title - 429	Job Summary - 429	Job Description - 429	\N	Job Experience - 429	Job instructions - 429	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	12	3
519	19	3	\N	Job Title - 519	Job Summary - 519	Job Description - 519	\N	Job Experience - 519	Job instructions - 519	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	11	3
520	20	3	\N	Job Title - 520	Job Summary - 520	Job Description - 520	\N	Job Experience - 520	Job instructions - 520	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	20	3
282	32	3	\N	Job Title - 282	Job Summary - 282	Job Description - 282	Job qualifications - 282	Job Experience - 282	Job instructions - 282	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	3	3
380	30	3	\N	Job Title - 380	Job Summary - 380	Job Description - 380	Job qualifications - 380	Job Experience - 380	Job instructions - 380	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	22	3
566	16	3	\N	Job Title - 566	Job Summary - 566	Job Description - 566	\N	Job Experience - 566	Job instructions - 566	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	1	3
567	17	3	\N	Job Title - 567	Job Summary - 567	Job Description - 567	\N	Job Experience - 567	Job instructions - 567	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	19	3
568	18	3	\N	Job Title - 568	Job Summary - 568	Job Description - 568	\N	Job Experience - 568	Job instructions - 568	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	1	3
317	17	3	\N	Job Title - 317	Job Summary - 317	Job Description - 317	Job qualifications - 317	Job Experience - 317	Job instructions - 317	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	21	3
646	46	3	\N	Job Title - 646	Job Summary - 646	Job Description - 646	\N	Job Experience - 646	Job instructions - 646	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	4	3
647	47	3	\N	Job Title - 647	Job Summary - 647	Job Description - 647	\N	Job Experience - 647	Job instructions - 647	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	14	3
268	18	3	\N	Job Title - 268	Job Summary - 268	Job Description - 268	Job qualifications - 268	Job Experience - 268	Job instructions - 268	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	13	3
419	19	3	\N	Job Title - 419	Job Summary - 419	Job Description - 419	\N	Job Experience - 419	Job instructions - 419	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	13	3
326	26	3	\N	Job Title - 326	Job Summary - 326	Job Description - 326	Job qualifications - 326	Job Experience - 326	Job instructions - 326	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	1	3
327	27	3	\N	Job Title - 327	Job Summary - 327	Job Description - 327	Job qualifications - 327	Job Experience - 327	Job instructions - 327	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	18	3
328	28	3	\N	Job Title - 328	Job Summary - 328	Job Description - 328	Job qualifications - 328	Job Experience - 328	Job instructions - 328	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	12	3
288	38	3	\N	Job Title - 288	Job Summary - 288	Job Description - 288	Job qualifications - 288	Job Experience - 288	Job instructions - 288	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	9	3
617	17	3	\N	Job Title - 617	Job Summary - 617	Job Description - 617	\N	Job Experience - 617	Job instructions - 617	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	7	3
3	3	3	suecompany0002	veternary doc	vet required	\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">job description here<br></p>\r\n\r\n	\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">Samuel  Gachanja</p>\r\n\r\n	\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">experience here<br></p>\r\n\r\n	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br>apply online here<br>	2014-06-09	2016-04-22		400	2015-05-30 14:21:53.248	\N	2	2	7	10	3
607	7	3	\N	Job Title - 607	Job Summary - 607	Job Description - 607	\N	Job Experience - 607	Job instructions - 607	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	14	3
265	15	3	\N	Job Title - 265	Job Summary - 265	Job Description - 265	Job qualifications - 265	Job Experience - 265	Job instructions - 265	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	14	3
266	16	3	\N	Job Title - 266	Job Summary - 266	Job Description - 266	Job qualifications - 266	Job Experience - 266	Job instructions - 266	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	20	3
387	37	3	\N	Job Title - 387	Job Summary - 387	Job Description - 387	Job qualifications - 387	Job Experience - 387	Job instructions - 387	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	10	3
388	38	3	\N	Job Title - 388	Job Summary - 388	Job Description - 388	Job qualifications - 388	Job Experience - 388	Job instructions - 388	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	3	3
505	5	3	\N	Job Title - 505	Job Summary - 505	Job Description - 505	\N	Job Experience - 505	Job instructions - 505	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	16	3
506	6	3	\N	Job Title - 506	Job Summary - 506	Job Description - 506	\N	Job Experience - 506	Job instructions - 506	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	8	3
507	7	3	\N	Job Title - 507	Job Summary - 507	Job Description - 507	\N	Job Experience - 507	Job instructions - 507	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	12	3
329	29	3	\N	Job Title - 329	Job Summary - 329	Job Description - 329	Job qualifications - 329	Job Experience - 329	Job instructions - 329	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	5	3
330	30	3	\N	Job Title - 330	Job Summary - 330	Job Description - 330	Job qualifications - 330	Job Experience - 330	Job instructions - 330	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	19	3
331	31	3	\N	Job Title - 331	Job Summary - 331	Job Description - 331	Job qualifications - 331	Job Experience - 331	Job instructions - 331	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	3	3
332	32	3	\N	Job Title - 332	Job Summary - 332	Job Description - 332	Job qualifications - 332	Job Experience - 332	Job instructions - 332	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	15	3
239	39	3	\N	Job Title - 239	Job Summary - 239	Job Description - 239	Job qualifications - 239	Job Experience - 239	Job instructions - 239	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	8	3
240	40	3	\N	Job Title - 240	Job Summary - 240	Job Description - 240	Job qualifications - 240	Job Experience - 240	Job instructions - 240	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	13	3
241	41	3	\N	Job Title - 241	Job Summary - 241	Job Description - 241	Job qualifications - 241	Job Experience - 241	Job instructions - 241	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	13	3
242	42	3	\N	Job Title - 242	Job Summary - 242	Job Description - 242	Job qualifications - 242	Job Experience - 242	Job instructions - 242	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	11	3
286	36	3	\N	Job Title - 286	Job Summary - 286	Job Description - 286	Job qualifications - 286	Job Experience - 286	Job instructions - 286	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	13	3
287	37	3	\N	Job Title - 287	Job Summary - 287	Job Description - 287	Job qualifications - 287	Job Experience - 287	Job instructions - 287	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	13	3
488	38	3	\N	Job Title - 488	Job Summary - 488	Job Description - 488	\N	Job Experience - 488	Job instructions - 488	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	7	3
254	4	3	\N	Job Title - 254	Job Summary - 254	Job Description - 254	Job qualifications - 254	Job Experience - 254	Job instructions - 254	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	13	3
503	3	3	\N	Job Title - 503	Job Summary - 503	Job Description - 503	\N	Job Experience - 503	Job instructions - 503	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	12	3
504	4	3	\N	Job Title - 504	Job Summary - 504	Job Description - 504	\N	Job Experience - 504	Job instructions - 504	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	11	3
277	27	3	\N	Job Title - 277	Job Summary - 277	Job Description - 277	Job qualifications - 277	Job Experience - 277	Job instructions - 277	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	5	3
495	45	3	\N	Job Title - 495	Job Summary - 495	Job Description - 495	\N	Job Experience - 495	Job instructions - 495	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	2	3
358	8	3	\N	Job Title - 358	Job Summary - 358	Job Description - 358	Job qualifications - 358	Job Experience - 358	Job instructions - 358	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	2	3
609	9	3	\N	Job Title - 609	Job Summary - 609	Job Description - 609	\N	Job Experience - 609	Job instructions - 609	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	5	3
610	10	3	\N	Job Title - 610	Job Summary - 610	Job Description - 610	\N	Job Experience - 610	Job instructions - 610	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	19	3
611	11	3	\N	Job Title - 611	Job Summary - 611	Job Description - 611	\N	Job Experience - 611	Job instructions - 611	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	14	3
612	12	3	\N	Job Title - 612	Job Summary - 612	Job Description - 612	\N	Job Experience - 612	Job instructions - 612	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	14	3
613	13	3	\N	Job Title - 613	Job Summary - 613	Job Description - 613	\N	Job Experience - 613	Job instructions - 613	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	4	3
363	13	3	\N	Job Title - 363	Job Summary - 363	Job Description - 363	Job qualifications - 363	Job Experience - 363	Job instructions - 363	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	1	3
521	21	3	\N	Job Title - 521	Job Summary - 521	Job Description - 521	\N	Job Experience - 521	Job instructions - 521	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	5	3
522	22	3	\N	Job Title - 522	Job Summary - 522	Job Description - 522	\N	Job Experience - 522	Job instructions - 522	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	17	3
523	23	3	\N	Job Title - 523	Job Summary - 523	Job Description - 523	\N	Job Experience - 523	Job instructions - 523	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	20	3
524	24	3	\N	Job Title - 524	Job Summary - 524	Job Description - 524	\N	Job Experience - 524	Job instructions - 524	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	15	3
525	25	3	\N	Job Title - 525	Job Summary - 525	Job Description - 525	\N	Job Experience - 525	Job instructions - 525	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	19	3
526	26	3	\N	Job Title - 526	Job Summary - 526	Job Description - 526	\N	Job Experience - 526	Job instructions - 526	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	14	3
527	27	3	\N	Job Title - 527	Job Summary - 527	Job Description - 527	\N	Job Experience - 527	Job instructions - 527	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	22	3
528	28	3	\N	Job Title - 528	Job Summary - 528	Job Description - 528	\N	Job Experience - 528	Job instructions - 528	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	9	3
529	29	3	\N	Job Title - 529	Job Summary - 529	Job Description - 529	\N	Job Experience - 529	Job instructions - 529	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	19	3
530	30	3	\N	Job Title - 530	Job Summary - 530	Job Description - 530	\N	Job Experience - 530	Job instructions - 530	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	19	3
531	31	3	\N	Job Title - 531	Job Summary - 531	Job Description - 531	\N	Job Experience - 531	Job instructions - 531	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	11	3
430	30	3	\N	Job Title - 430	Job Summary - 430	Job Description - 430	\N	Job Experience - 430	Job instructions - 430	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	12	3
508	8	3	\N	Job Title - 508	Job Summary - 508	Job Description - 508	\N	Job Experience - 508	Job instructions - 508	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	5	3
509	9	3	\N	Job Title - 509	Job Summary - 509	Job Description - 509	\N	Job Experience - 509	Job instructions - 509	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	2	3
510	10	3	\N	Job Title - 510	Job Summary - 510	Job Description - 510	\N	Job Experience - 510	Job instructions - 510	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	2	3
278	28	3	\N	Job Title - 278	Job Summary - 278	Job Description - 278	Job qualifications - 278	Job Experience - 278	Job instructions - 278	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	15	3
279	29	3	\N	Job Title - 279	Job Summary - 279	Job Description - 279	Job qualifications - 279	Job Experience - 279	Job instructions - 279	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	14	3
280	30	3	\N	Job Title - 280	Job Summary - 280	Job Description - 280	Job qualifications - 280	Job Experience - 280	Job instructions - 280	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	15	3
608	8	3	\N	Job Title - 608	Job Summary - 608	Job Description - 608	\N	Job Experience - 608	Job instructions - 608	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	22	3
281	31	3	\N	Job Title - 281	Job Summary - 281	Job Description - 281	Job qualifications - 281	Job Experience - 281	Job instructions - 281	\N	2016-04-22	\N	\N	2015-06-07 07:45:26.601872	\N	\N	\N	\N	5	3
305	5	3	\N	Job Title - 305	Job Summary - 305	Job Description - 305	Job qualifications - 305	Job Experience - 305	Job instructions - 305	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	4	3
306	6	3	\N	Job Title - 306	Job Summary - 306	Job Description - 306	Job qualifications - 306	Job Experience - 306	Job instructions - 306	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	11	3
307	7	3	\N	Job Title - 307	Job Summary - 307	Job Description - 307	Job qualifications - 307	Job Experience - 307	Job instructions - 307	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	9	3
308	8	3	\N	Job Title - 308	Job Summary - 308	Job Description - 308	Job qualifications - 308	Job Experience - 308	Job instructions - 308	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	6	3
309	9	3	\N	Job Title - 309	Job Summary - 309	Job Description - 309	Job qualifications - 309	Job Experience - 309	Job instructions - 309	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	12	3
310	10	3	\N	Job Title - 310	Job Summary - 310	Job Description - 310	Job qualifications - 310	Job Experience - 310	Job instructions - 310	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	14	3
311	11	3	\N	Job Title - 311	Job Summary - 311	Job Description - 311	Job qualifications - 311	Job Experience - 311	Job instructions - 311	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	3	3
312	12	3	\N	Job Title - 312	Job Summary - 312	Job Description - 312	Job qualifications - 312	Job Experience - 312	Job instructions - 312	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	3	3
476	26	3	\N	Job Title - 476	Job Summary - 476	Job Description - 476	\N	Job Experience - 476	Job instructions - 476	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	5	3
477	27	3	\N	Job Title - 477	Job Summary - 477	Job Description - 477	\N	Job Experience - 477	Job instructions - 477	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	6	3
478	28	3	\N	Job Title - 478	Job Summary - 478	Job Description - 478	\N	Job Experience - 478	Job instructions - 478	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	4	3
479	29	3	\N	Job Title - 479	Job Summary - 479	Job Description - 479	\N	Job Experience - 479	Job instructions - 479	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	10	3
480	30	3	\N	Job Title - 480	Job Summary - 480	Job Description - 480	\N	Job Experience - 480	Job instructions - 480	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	22	3
431	31	3	\N	Job Title - 431	Job Summary - 431	Job Description - 431	\N	Job Experience - 431	Job instructions - 431	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	2	3
492	42	3	\N	Job Title - 492	Job Summary - 492	Job Description - 492	\N	Job Experience - 492	Job instructions - 492	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	3	3
493	43	3	\N	Job Title - 493	Job Summary - 493	Job Description - 493	\N	Job Experience - 493	Job instructions - 493	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	19	3
550	4	3	\N	Job Title - 550	Job Summary - 550	Job Description - 550	\N	Job Experience - 550	Job instructions - 550	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	16	3
370	20	3	\N	Job Title - 370	Job Summary - 370	Job Description - 370	Job qualifications - 370	Job Experience - 370	Job instructions - 370	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	3	3
371	21	3	\N	Job Title - 371	Job Summary - 371	Job Description - 371	Job qualifications - 371	Job Experience - 371	Job instructions - 371	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	5	3
372	22	3	\N	Job Title - 372	Job Summary - 372	Job Description - 372	Job qualifications - 372	Job Experience - 372	Job instructions - 372	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	13	3
373	23	3	\N	Job Title - 373	Job Summary - 373	Job Description - 373	Job qualifications - 373	Job Experience - 373	Job instructions - 373	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	21	3
627	27	3	\N	Job Title - 627	Job Summary - 627	Job Description - 627	\N	Job Experience - 627	Job instructions - 627	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	16	3
546	46	3	\N	Job Title - 546	Job Summary - 546	Job Description - 546	\N	Job Experience - 546	Job instructions - 546	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	2	3
547	47	3	\N	Job Title - 547	Job Summary - 547	Job Description - 547	\N	Job Experience - 547	Job instructions - 547	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	3	3
548	48	3	\N	Job Title - 548	Job Summary - 548	Job Description - 548	\N	Job Experience - 548	Job instructions - 548	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	17	3
549	49	3	\N	Job Title - 549	Job Summary - 549	Job Description - 549	\N	Job Experience - 549	Job instructions - 549	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	4	3
551	1	3	\N	Job Title - 551	Job Summary - 551	Job Description - 551	\N	Job Experience - 551	Job instructions - 551	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	18	3
552	2	3	\N	Job Title - 552	Job Summary - 552	Job Description - 552	\N	Job Experience - 552	Job instructions - 552	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	8	3
553	3	3	\N	Job Title - 553	Job Summary - 553	Job Description - 553	\N	Job Experience - 553	Job instructions - 553	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	18	3
554	4	3	\N	Job Title - 554	Job Summary - 554	Job Description - 554	\N	Job Experience - 554	Job instructions - 554	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	18	3
555	5	3	\N	Job Title - 555	Job Summary - 555	Job Description - 555	\N	Job Experience - 555	Job instructions - 555	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	13	3
470	20	3	\N	Job Title - 470	Job Summary - 470	Job Description - 470	\N	Job Experience - 470	Job instructions - 470	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	22	3
471	21	3	\N	Job Title - 471	Job Summary - 471	Job Description - 471	\N	Job Experience - 471	Job instructions - 471	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	6	3
472	22	3	\N	Job Title - 472	Job Summary - 472	Job Description - 472	\N	Job Experience - 472	Job instructions - 472	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	22	3
473	23	3	\N	Job Title - 473	Job Summary - 473	Job Description - 473	\N	Job Experience - 473	Job instructions - 473	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	5	3
474	24	3	\N	Job Title - 474	Job Summary - 474	Job Description - 474	\N	Job Experience - 474	Job instructions - 474	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	18	3
334	34	3	\N	Job Title - 334	Job Summary - 334	Job Description - 334	Job qualifications - 334	Job Experience - 334	Job instructions - 334	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	13	3
335	35	3	\N	Job Title - 335	Job Summary - 335	Job Description - 335	Job qualifications - 335	Job Experience - 335	Job instructions - 335	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.650057	\N	\N	\N	\N	8	3
322	22	3	\N	Job Title - 322	Job Summary - 322	Job Description - 322	Job qualifications - 322	Job Experience - 322	Job instructions - 322	\N	2016-04-22	\N	\N	2015-06-07 07:45:28.001883	\N	\N	\N	\N	20	3
301	1	3	\N	Job Title - 301	Job Summary - 301	Job Description - 301	Job qualifications - 301	Job Experience - 301	Job instructions - 301	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	18	3
390	40	3	\N	Job Title - 390	Job Summary - 390	Job Description - 390	Job qualifications - 390	Job Experience - 390	Job instructions - 390	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	13	3
391	41	3	\N	Job Title - 391	Job Summary - 391	Job Description - 391	Job qualifications - 391	Job Experience - 391	Job instructions - 391	\N	2016-04-22	\N	\N	2015-06-07 07:45:30.458001	\N	\N	\N	\N	2	3
232	32	3	\N	Job Title - 232	Job Summary - 232	Job Description - 232	Job qualifications - 232	Job Experience - 232	Job instructions - 232	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	6	3
233	33	3	\N	Job Title - 233	Job Summary - 233	Job Description - 233	Job qualifications - 233	Job Experience - 233	Job instructions - 233	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	13	3
234	34	3	\N	Job Title - 234	Job Summary - 234	Job Description - 234	Job qualifications - 234	Job Experience - 234	Job instructions - 234	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	3	3
496	46	3	\N	Job Title - 496	Job Summary - 496	Job Description - 496	\N	Job Experience - 496	Job instructions - 496	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	8	3
532	32	3	\N	Job Title - 532	Job Summary - 532	Job Description - 532	\N	Job Experience - 532	Job instructions - 532	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	10	3
533	33	3	\N	Job Title - 533	Job Summary - 533	Job Description - 533	\N	Job Experience - 533	Job instructions - 533	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	19	3
572	22	3	\N	Job Title - 572	Job Summary - 572	Job Description - 572	\N	Job Experience - 572	Job instructions - 572	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	10	3
573	23	3	\N	Job Title - 573	Job Summary - 573	Job Description - 573	\N	Job Experience - 573	Job instructions - 573	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	15	3
574	24	3	\N	Job Title - 574	Job Summary - 574	Job Description - 574	\N	Job Experience - 574	Job instructions - 574	\N	2016-04-22	\N	\N	2015-06-07 07:53:35.492506	\N	\N	\N	\N	9	3
243	43	3	\N	Job Title - 243	Job Summary - 243	Job Description - 243	Job qualifications - 243	Job Experience - 243	Job instructions - 243	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	9	3
244	44	3	\N	Job Title - 244	Job Summary - 244	Job Description - 244	Job qualifications - 244	Job Experience - 244	Job instructions - 244	\N	2016-04-22	\N	\N	2015-06-07 07:45:25.761938	\N	\N	\N	\N	8	3
420	20	3	\N	Job Title - 420	Job Summary - 420	Job Description - 420	\N	Job Experience - 420	Job instructions - 420	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	10	3
562	12	3	\N	Job Title - 562	Job Summary - 562	Job Description - 562	\N	Job Experience - 562	Job instructions - 562	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	12	3
629	29	3	\N	Job Title - 629	Job Summary - 629	Job Description - 629	\N	Job Experience - 629	Job instructions - 629	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.316499	\N	\N	\N	\N	3	3
440	40	3	\N	Job Title - 440	Job Summary - 440	Job Description - 440	\N	Job Experience - 440	Job instructions - 440	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	5	3
441	41	3	\N	Job Title - 441	Job Summary - 441	Job Description - 441	\N	Job Experience - 441	Job instructions - 441	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	13	3
442	42	3	\N	Job Title - 442	Job Summary - 442	Job Description - 442	\N	Job Experience - 442	Job instructions - 442	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	15	3
443	43	3	\N	Job Title - 443	Job Summary - 443	Job Description - 443	\N	Job Experience - 443	Job instructions - 443	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	5	3
444	44	3	\N	Job Title - 444	Job Summary - 444	Job Description - 444	\N	Job Experience - 444	Job instructions - 444	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	21	3
445	45	3	\N	Job Title - 445	Job Summary - 445	Job Description - 445	\N	Job Experience - 445	Job instructions - 445	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	3	3
446	46	3	\N	Job Title - 446	Job Summary - 446	Job Description - 446	\N	Job Experience - 446	Job instructions - 446	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	7	3
447	47	3	\N	Job Title - 447	Job Summary - 447	Job Description - 447	\N	Job Experience - 447	Job instructions - 447	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	11	3
448	48	3	\N	Job Title - 448	Job Summary - 448	Job Description - 448	\N	Job Experience - 448	Job instructions - 448	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	5	3
449	49	3	\N	Job Title - 449	Job Summary - 449	Job Description - 449	\N	Job Experience - 449	Job instructions - 449	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	12	3
451	1	3	\N	Job Title - 451	Job Summary - 451	Job Description - 451	\N	Job Experience - 451	Job instructions - 451	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	10	3
452	2	3	\N	Job Title - 452	Job Summary - 452	Job Description - 452	\N	Job Experience - 452	Job instructions - 452	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	16	3
453	3	3	\N	Job Title - 453	Job Summary - 453	Job Description - 453	\N	Job Experience - 453	Job instructions - 453	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	13	3
454	4	3	\N	Job Title - 454	Job Summary - 454	Job Description - 454	\N	Job Experience - 454	Job instructions - 454	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	18	3
455	5	3	\N	Job Title - 455	Job Summary - 455	Job Description - 455	\N	Job Experience - 455	Job instructions - 455	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	19	3
456	6	3	\N	Job Title - 456	Job Summary - 456	Job Description - 456	\N	Job Experience - 456	Job instructions - 456	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	22	3
457	7	3	\N	Job Title - 457	Job Summary - 457	Job Description - 457	\N	Job Experience - 457	Job instructions - 457	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	13	3
458	8	3	\N	Job Title - 458	Job Summary - 458	Job Description - 458	\N	Job Experience - 458	Job instructions - 458	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	8	3
459	9	3	\N	Job Title - 459	Job Summary - 459	Job Description - 459	\N	Job Experience - 459	Job instructions - 459	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	19	3
460	10	3	\N	Job Title - 460	Job Summary - 460	Job Description - 460	\N	Job Experience - 460	Job instructions - 460	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	19	3
461	11	3	\N	Job Title - 461	Job Summary - 461	Job Description - 461	\N	Job Experience - 461	Job instructions - 461	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	21	3
450	4	3	\N	Job Title - 450	Job Summary - 450	Job Description - 450	\N	Job Experience - 450	Job instructions - 450	\N	2016-04-22	\N	\N	2015-06-07 07:53:31.436584	\N	\N	\N	\N	6	3
427	27	3	\N	Job Title - 427	Job Summary - 427	Job Description - 427	\N	Job Experience - 427	Job instructions - 427	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	10	3
421	21	3	\N	Job Title - 421	Job Summary - 421	Job Description - 421	\N	Job Experience - 421	Job instructions - 421	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	22	3
469	19	3	\N	Job Title - 469	Job Summary - 469	Job Description - 469	\N	Job Experience - 469	Job instructions - 469	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	1	3
422	22	3	\N	Job Title - 422	Job Summary - 422	Job Description - 422	\N	Job Experience - 422	Job instructions - 422	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	4	3
423	23	3	\N	Job Title - 423	Job Summary - 423	Job Description - 423	\N	Job Experience - 423	Job instructions - 423	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	2	3
424	24	3	\N	Job Title - 424	Job Summary - 424	Job Description - 424	\N	Job Experience - 424	Job instructions - 424	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	4	3
425	25	3	\N	Job Title - 425	Job Summary - 425	Job Description - 425	\N	Job Experience - 425	Job instructions - 425	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	5	3
426	26	3	\N	Job Title - 426	Job Summary - 426	Job Description - 426	\N	Job Experience - 426	Job instructions - 426	\N	2016-04-22	\N	\N	2015-06-07 07:53:30.261369	\N	\N	\N	\N	3	3
482	32	3	\N	Job Title - 482	Job Summary - 482	Job Description - 482	\N	Job Experience - 482	Job instructions - 482	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	20	3
483	33	3	\N	Job Title - 483	Job Summary - 483	Job Description - 483	\N	Job Experience - 483	Job instructions - 483	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.180399	\N	\N	\N	\N	9	3
484	34	3	\N	Job Title - 484	Job Summary - 484	Job Description - 484	\N	Job Experience - 484	Job instructions - 484	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	15	3
485	35	3	\N	Job Title - 485	Job Summary - 485	Job Description - 485	\N	Job Experience - 485	Job instructions - 485	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	12	3
486	36	3	\N	Job Title - 486	Job Summary - 486	Job Description - 486	\N	Job Experience - 486	Job instructions - 486	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	14	3
487	37	3	\N	Job Title - 487	Job Summary - 487	Job Description - 487	\N	Job Experience - 487	Job instructions - 487	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	14	3
489	39	3	\N	Job Title - 489	Job Summary - 489	Job Description - 489	\N	Job Experience - 489	Job instructions - 489	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	15	3
490	40	3	\N	Job Title - 490	Job Summary - 490	Job Description - 490	\N	Job Experience - 490	Job instructions - 490	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	21	3
491	41	3	\N	Job Title - 491	Job Summary - 491	Job Description - 491	\N	Job Experience - 491	Job instructions - 491	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	2	3
513	13	3	\N	Job Title - 513	Job Summary - 513	Job Description - 513	\N	Job Experience - 513	Job instructions - 513	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	20	3
514	14	3	\N	Job Title - 514	Job Summary - 514	Job Description - 514	\N	Job Experience - 514	Job instructions - 514	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	10	3
515	15	3	\N	Job Title - 515	Job Summary - 515	Job Description - 515	\N	Job Experience - 515	Job instructions - 515	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	12	3
516	16	3	\N	Job Title - 516	Job Summary - 516	Job Description - 516	\N	Job Experience - 516	Job instructions - 516	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	13	3
517	17	3	\N	Job Title - 517	Job Summary - 517	Job Description - 517	\N	Job Experience - 517	Job instructions - 517	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	1	3
518	18	3	\N	Job Title - 518	Job Summary - 518	Job Description - 518	\N	Job Experience - 518	Job instructions - 518	\N	2016-04-22	\N	\N	2015-06-07 07:53:33.548389	\N	\N	\N	\N	7	3
648	48	3	\N	Job Title - 648	Job Summary - 648	Job Description - 648	\N	Job Experience - 648	Job instructions - 648	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	10	3
649	49	3	\N	Job Title - 649	Job Summary - 649	Job Description - 649	\N	Job Experience - 649	Job instructions - 649	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	1	3
651	1	3	\N	Job Title - 651	Job Summary - 651	Job Description - 651	\N	Job Experience - 651	Job instructions - 651	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	20	3
652	2	3	\N	Job Title - 652	Job Summary - 652	Job Description - 652	\N	Job Experience - 652	Job instructions - 652	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	18	3
653	3	3	\N	Job Title - 653	Job Summary - 653	Job Description - 653	\N	Job Experience - 653	Job instructions - 653	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	19	3
654	4	3	\N	Job Title - 654	Job Summary - 654	Job Description - 654	\N	Job Experience - 654	Job instructions - 654	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	17	3
655	5	3	\N	Job Title - 655	Job Summary - 655	Job Description - 655	\N	Job Experience - 655	Job instructions - 655	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	16	3
656	6	3	\N	Job Title - 656	Job Summary - 656	Job Description - 656	\N	Job Experience - 656	Job instructions - 656	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	2	3
540	40	3	\N	Job Title - 540	Job Summary - 540	Job Description - 540	\N	Job Experience - 540	Job instructions - 540	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	16	3
541	41	3	\N	Job Title - 541	Job Summary - 541	Job Description - 541	\N	Job Experience - 541	Job instructions - 541	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	2	3
542	42	3	\N	Job Title - 542	Job Summary - 542	Job Description - 542	\N	Job Experience - 542	Job instructions - 542	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.188649	\N	\N	\N	\N	7	3
605	5	3	\N	Job Title - 605	Job Summary - 605	Job Description - 605	\N	Job Experience - 605	Job instructions - 605	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	17	3
570	20	3	\N	Job Title - 570	Job Summary - 570	Job Description - 570	\N	Job Experience - 570	Job instructions - 570	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	6	3
571	21	3	\N	Job Title - 571	Job Summary - 571	Job Description - 571	\N	Job Experience - 571	Job instructions - 571	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	12	3
494	44	3	\N	Job Title - 494	Job Summary - 494	Job Description - 494	\N	Job Experience - 494	Job instructions - 494	\N	2016-04-22	\N	\N	2015-06-07 07:53:32.892422	\N	\N	\N	\N	20	3
357	7	3	\N	Job Title - 357	Job Summary - 357	Job Description - 357	Job qualifications - 357	Job Experience - 357	Job instructions - 357	\N	2016-04-22	\N	\N	2015-06-07 07:45:29.514043	\N	\N	\N	\N	3	3
606	6	3	\N	Job Title - 606	Job Summary - 606	Job Description - 606	\N	Job Experience - 606	Job instructions - 606	\N	2016-04-22	\N	\N	2015-06-07 07:53:36.58847	\N	\N	\N	\N	20	3
563	13	3	\N	Job Title - 563	Job Summary - 563	Job Description - 563	\N	Job Experience - 563	Job instructions - 563	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	12	3
564	14	3	\N	Job Title - 564	Job Summary - 564	Job Description - 564	\N	Job Experience - 564	Job instructions - 564	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	15	3
565	15	3	\N	Job Title - 565	Job Summary - 565	Job Description - 565	\N	Job Experience - 565	Job instructions - 565	\N	2016-04-22	\N	\N	2015-06-07 07:53:34.82049	\N	\N	\N	\N	11	3
657	7	3	\N	Job Title - 657	Job Summary - 657	Job Description - 657	\N	Job Experience - 657	Job instructions - 657	\N	2016-04-24	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	4	3
650	4	3	\N	Job Title - 650	Job Summary - 650	Job Description - 650	\N	Job Experience - 650	Job instructions - 650	\N	2016-04-22	\N	\N	2015-06-07 07:53:37.996429	\N	\N	\N	\N	3	3
671	21	3	\N	Job Title - 671	Job Summary - 671	Job Description - 671	\N	Job Experience - 671	Job instructions - 671	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	8	3
672	22	3	\N	Job Title - 672	Job Summary - 672	Job Description - 672	\N	Job Experience - 672	Job instructions - 672	\N	2016-04-22	\N	\N	2015-06-07 08:10:40.257915	\N	\N	\N	\N	9	3
302	2	3	\N	Job Title - 302	Job Summary - 302	Job Description - 302	Job qualifications - 302	Job Experience - 302	Job instructions - 302	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	5	3
303	3	3	\N	Job Title - 303	Job Summary - 303	Job Description - 303	Job qualifications - 303	Job Experience - 303	Job instructions - 303	\N	2016-04-22	\N	\N	2015-06-07 07:45:27.338048	\N	\N	\N	\N	5	3
221	21	3	\N	Job Title - 221	Job Summary - 221	Job Description - 221	Job qualifications - 221	Job Experience - 221	Job instructions - 221	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	19	3
222	22	3	\N	Job Title - 222	Job Summary - 222	Job Description - 222	Job qualifications - 222	Job Experience - 222	Job instructions - 222	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	17	3
223	23	3	\N	Job Title - 223	Job Summary - 223	Job Description - 223	Job qualifications - 223	Job Experience - 223	Job instructions - 223	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	17	3
224	24	3	\N	Job Title - 224	Job Summary - 224	Job Description - 224	Job qualifications - 224	Job Experience - 224	Job instructions - 224	\N	2016-04-22	\N	\N	2015-06-07 07:45:24.249911	\N	\N	\N	\N	20	3
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('jobs_id_seq', 681, true);


--
-- Data for Name: lostpassword; Type: TABLE DATA; Schema: public; Owner: work
--

COPY lostpassword (id, code, username, datemodified) FROM stdin;
8	9f73c5	gksamuel1	2012-12-31 08:13:33.948+03
9	a20538	gksamuel1	2012-12-31 08:14:56.526+03
\.


--
-- Name: lostpassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('lostpassword_id_seq', 16, true);


--
-- Data for Name: mpesa; Type: TABLE DATA; Schema: public; Owner: work
--

COPY mpesa (id, inmessageid, source, name, code, amount, paytime, receivetime, processed, processtime, fromtime, totime, seekerid, companyid) FROM stdin;
4	37	254720920293	SAMUEL GACHANJA	FJ66WX071	10.00	2014-07-20 15:54:00+03	2014-07-20 08:54:54.868+03	t	2016-05-01 00:37:09.639+03	2015-04-30 22:31:26.622596+03	2016-05-06 00:37:09.639+03	38	\N
5	50	254720920293	SAMUEL GACHANJA	FK72WO915	10.00	2014-07-29 15:51:00+03	2014-07-29 08:51:23.96+03	t	2016-05-01 01:14:50.031+03	2015-05-01 01:01:15.213301+03	2016-05-06 01:14:50.031+03	38	\N
7	122	254720920293	SAMUEL GACHANJA	FN11PS158	10.00	2014-08-17 00:58:00+03	2014-08-16 17:58:22.085+03	t	2016-05-01 01:29:07.087+03	2015-05-01 01:20:31.764996+03	2016-05-06 01:29:07.087+03	38	\N
8	123	254720920293	SAMUEL GACHANJA	FO07RB723	10.00	2014-08-24 23:38:00+03	2014-08-24 16:38:24.244+03	t	2016-05-01 01:32:39.054+03	2015-05-01 01:29:17.12823+03	2016-05-06 01:32:39.054+03	38	\N
1	7	254720920293	SAMUEL GACHANJA	FC88AU196	10.00	2014-05-27 15:04:00+03	2014-05-27 08:04:22.662+03	t	2016-05-01 01:36:46.583+03	2015-05-01 01:36:28.628567+03	2016-05-06 01:36:46.583+03	38	\N
2	8	254720920293	SAMUEL GACHANJA	FC88EY682	10.00	2014-05-27 15:20:00+03	2014-05-27 08:20:48.96+03	t	2016-05-01 01:37:19.207+03	2016-05-06 01:36:46.583+03	2016-05-11 01:36:46.583+03	38	\N
3	9	254720920293	SAMUEL GACHANJA	FC92RC861	10.00	2014-05-27 21:17:00+03	2014-05-27 14:17:45.192+03	t	2016-05-01 02:23:24.957+03	2016-05-11 01:36:46.583+03	2016-05-16 01:36:46.583+03	38	\N
6	51	254724541318	ANN WANGARI	FK73BX419	10.00	2014-07-29 16:09:00+03	2014-07-29 09:09:51.854+03	f	\N	\N	\N	\N	\N
9	124	254720920293	SAMUEL GACHANJA	FU89YW420	10.00	2014-10-15 13:25:00+03	2014-10-15 06:25:13.963+03	t	2016-05-13 23:08:07.789+03	2016-12-23 22:48:31.98208+03	2016-12-28 22:48:31.982+03	2	\N
10	125	254720920293	SAMUEL GACHANJA	FU89YZ974	10.00	2014-10-15 13:26:00+03	2014-10-15 06:26:39.054+03	t	2016-05-27 17:22:15.822+03	2016-05-16 01:36:46.583+03	2016-06-01 17:22:15.822+03	38	\N
11	128	254720920293	SAMUEL GACHANJA	GH10PW216	10.00	2015-01-10 16:26:00+03	2015-01-10 08:27:03.476+03	t	2016-05-27 18:48:11.674+03	2016-12-28 22:48:31.982+03	2017-01-02 22:48:31.982+03	2	\N
\.


--
-- Name: mpesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('mpesa_id_seq', 11, true);


--
-- Data for Name: mpesatarrifs; Type: TABLE DATA; Schema: public; Owner: work
--

COPY mpesatarrifs (id, tarrif, description, days, membership, sending, withdrawal) FROM stdin;
1	5day	5 Days	5	10	3	0
2	month	30 Days	30	50	5	10
3	quarter	90 Days	90	150	25	25
4	half year	180 Days	180	300	25	25
5	annual	360 Days	360	600	30	25
\.


--
-- Name: mpesatarrifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('mpesatarrifs_id_seq', 5, true);


--
-- Data for Name: outmessage; Type: TABLE DATA; Schema: public; Owner: work
--

COPY outmessage (id, htmlmessage, textmessage) FROM stdin;
1	﻿<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">\n<head>\n<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />\t\n<title>Newsletter template</title>\n<!--general stylesheet-->\n<style type="text/css">\np { padding: 0; margin: 0; }\nh1, h2, h3, p, li { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; }\ntd { vertical-align:top;}\nul, ol { margin: 0; padding: 0;}\na {\ncolor: #455670; text-decoration: underline;\n}\n.title, .date {\n\ttext-shadow: #8aa3c6 0px 1px 0px;\n}\n.title span { \n\tfont-weight: bold;\n}\n.textshadow {\n\ttext-shadow: #ffffff 0px 1px 0px;\n}\n.trxtshadow-2 {\n\ttext-shadow: #768296 0px -1px 0px;\n}\n.content-item p{\n\tfont-size: 12px; line-height: 20px; font-weight: normal; color: #56667d; margin: 0; margin-bottom: 5px;\n}\n.content-item ul{\n\tfont-size: 12px; line-height: 20px; font-weight: normal; color: #56667d; margin: 0; margin-bottom: 5px;\n}\n.content-item h3{\nmargin:0; margin-left: 17px; padding:0; font-size: 18px; font-weight: normal; color:#324258 !important;\n}\n.footer p{\nmargin:0; font-size: 10px; font-weight: bold; color: #96a2b3; font-family: Arial; line-height: 18px;\n}\na.button {\n    background: #7CD54B; border: 1px solid #5C9C36; color: #FFF; display: inline-block; font: bold 14px/1.1em sans-serif; outline: none; padding: 8px 16px; text-decoration: none;\n}\na.button:hover {\n    background: #589534; color: #FFC;\n}\n</style>\n</head>\n<body marginheight="0" topmargin="0" marginwidth="0" leftmargin="0" background="" style="margin: 0px; background-color: #eee;" bgcolor="">\n<table cellspacing="0" border="0" cellpadding="0" width="100%">\n<tbody>\n<tr valign="top">\n<td valign="top"><!--container-->\n<table cellspacing="0" cellpadding="0" border="0" align="center" width="626">\n<tbody>\n<tr>\n<td valign="middle" bgcolor="#546781" height="97" style="vertical-align: middle;">\n<table cellspacing="0" cellpadding="0" border="0" align="center" width="555" height="97">\n<tbody>\n<tr>\n<td valign="middle" width="36" style="vertical-align:middle; text-align: left;">\n</td>\n<td valign="middle" style="vertical-align: middle; text-align: left;">\n<h1 class="title" style="margin:0; padding:0; font-size:30px; font-weight: normal; color: #192c45 !important;">\n<span>MyJob.co.ke</span>\n</h1>\n\n</td>\n<td width="55" valign="middle" style="vertical-align:middle; text-align: center;">\n<h2 class="date" style="margin:0; padding:0; font-size:13px; font-weight: normal; color: #192c45 !important; text-transform: uppercase; font-weight: bold; line-height:1;">\nMay\n</h2>\n<h2 class="date" style="margin:0; padding:0; font-size:23px; font-weight: normal; color: #192c45 !important; font-weight: bold;">\n2013\n</h2>\n</td>\n\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n<tr>\n<td valign="top">\n<table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" bgcolor="#ffffff" style="border-width: 3px; border-color: #ffffff; border-style: solid;">\n<tbody>\n<tr>\n<td width="100%" valign="top" bgcolor="#eef0f3" style="border-bottom-width: 3px; border-bottom-color: #ffffff; border-bottom-style: solid;"><!--content-->\n<!--article--><table cellspacing="0" cellpadding="0" border="0" align="center" width="100%">\n<tbody>\n\n<repeater>\n<tr>\n<td valign="top">\n<table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="content-item">\n<tbody>\n\n<tr>\n<td valign="top" bgcolor="#edeff2" style="padding-top: 10px; padding-bottom: 15px; padding-left: 18px; padding-right: 21px; border-left-width: 1px; border-left-color: #bac2cc; border-left-style: solid; border-right-width: 1px; border-right-color: #bac2cc; border-right-style: solid; border-top-width: 1px; border-top-color: #ffffff; border-top-style: solid; border-bottom-width: 1px; border-bottom-color: #bac2cc; border-bottom-style: solid;">\n<p>\nHi NNNNN,<br/>\nAfter two years of research and development the first phase of <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> - Africa's most advanced vacancy management service - is now ready for use.\nLogin to <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> now to experience it yourself. We eagerly await your feedback.\n</p>\n</td>\n</tr>\n\n\n<tr>\n<td height="49" width="100%" valign="middle" bgcolor="#c8cfd8" style="vertical-align:middle; border-left-width: 1px; border-left-color: #BAC2CC; border-left-style: solid; border-right-width: 1px; border-right-color: #BAC2CC; border-right-style: solid; border-bottom-width: 1px; border-bottom-color: #98a3b4; border-bottom-style: solid; border-top-width: 1px; border-top-color: #BAC2CC; border-top-style: solid;">\n<h3 class="textshadow"> Benefits</h3>\n</td>\n</tr>\n<tr>\n<td valign="top" bgcolor="#edeff2" style="padding-top: 10px; padding-bottom: 15px; padding-left: 18px; padding-right: 21px; border-left-width: 1px; border-left-color: #bac2cc; border-left-style: solid; border-right-width: 1px; border-right-color: #bac2cc; border-right-style: solid; border-top-width: 1px; border-top-color: #ffffff; border-top-style: solid; border-bottom-width: 1px; border-bottom-color: #bac2cc; border-bottom-style: solid;">\n\n<p>\n<ul>\n<li><span style="font-weight:bold; color:#336633;">Virus Scanning</span> - Our virus scanner is updated daily to protect you from viruses from files sent by job seekers thereby protecting your computer from corrupt files.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Shared accounts</span> - Share a single account with multiple users in your organisation as well as your clients. Each user will have their own username and password.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Full Profiles</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> allows job seekers to enter every detail they feel will be necessary to help them secure a job. Saving you time requesting additional information.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Dynamic Profiles</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> job seekers have 24 hour access to their profile, allowing them to update their details as required.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">File Attachments</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> allows you to attach forms that may need to be filled by potential job applicants. They in turn submit them via the same system reducing clutter in your email.<br/><br/> </li>\n<li><span style="font-weight:bold; color:#336633;">Note Taking</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> allows you to write notes for internal use.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Feedback</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> allows you to give feedback to job seekers.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Instant results</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> will give you instant recommendations for each vacancy you add to the system.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Shortlisting</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> caters for shortlisting of candidates.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Recommendations</span> - <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> will grade all applications for a vacancy and let you know the most suitable, saving you lots of time.<br/><br/></li>\n<li><span style="font-weight:bold; color:#336633;">Much More..</span>. - Login to <a href="https://myjob.co.ke/?code=CCCC"><span  style="font-weight:bold">MyJob.co.ke</span></a> and experience Africa's most advanced vacancy management system.<br/><br/></li>\n</ul>\n</p>\n</td>\n\n</tr>\n\n<tr>\n<td height="49" width="100%" valign="middle" bgcolor="#c8cfd8" style="vertical-align:middle; border-left-width: 1px; border-left-color: #BAC2CC; border-left-style: solid; border-right-width: 1px; border-right-color: #BAC2CC; border-right-style: solid; border-bottom-width: 1px; border-bottom-color: #98a3b4; border-bottom-style: solid; border-top-width: 1px; border-top-color: #BAC2CC; border-top-style: solid;">\n<h3 class="textshadow"> Share</h3>\n</td>\n</tr>\n<tr>\n<td valign="top" bgcolor="#edeff2" style="padding-top: 20px; padding-bottom: 15px; padding-left: 18px; padding-right: 21px; border-left-width: 1px; border-left-color: #bac2cc; border-left-style: solid; border-right-width: 1px; border-right-color: #bac2cc; border-right-style: solid; border-top-width: 1px; border-top-color: #ffffff; border-top-style: solid; border-bottom-width: 1px; border-bottom-color: #bac2cc; border-bottom-style: solid;">\n\n<p>\nLet others know about this great service<br>\n<a  class="button" href="http://twitter.com/share?text=Africa's most advanced vacancy management service is here&url=https://myjob.co.ke">Twitter</a>\n<a  class="button" href="http://www.facebook.com/sharer.php?u=https://myjob.co.ke&amp;t=Africa's most advanced vacancy management service is here with us" class="btn btn-primary">Facebook</a>\n</p>\n</td>\n\n</tr>\n\n\n<tr>\n<td height="49" width="100%" valign="middle" bgcolor="#c8cfd8" style="vertical-align:middle; border-left-width: 1px; border-left-color: #BAC2CC; border-left-style: solid; border-right-width: 1px; border-right-color: #BAC2CC; border-right-style: solid; border-bottom-width: 1px; border-bottom-color: #98a3b4; border-bottom-style: solid; border-top-width: 1px; border-top-color: #BAC2CC; border-top-style: solid;">\n<h3 class="textshadow"> Unsubscribe</h3>\n</td>\n</tr>\n<tr>\n<td valign="top" bgcolor="#edeff2" style="padding-top: 20px; padding-bottom: 15px; padding-left: 18px; padding-right: 21px; border-left-width: 1px; border-left-color: #bac2cc; border-left-style: solid; border-right-width: 1px; border-right-color: #bac2cc; border-right-style: solid; border-top-width: 1px; border-top-color: #ffffff; border-top-style: solid; border-bottom-width: 1px; border-bottom-color: #bac2cc; border-bottom-style: solid;">\n\n<p>\nYou have received this email because someone added your details to our database. To stop receiving any future emails <a href="https://myjob.co.ke/faces/public/unsub.xhtml?code=CCCC">click here</a>.\n</p>\n</td>\n\n</tr>\n\n\n\n\n\n\n<tr>\n<td colspan="2" style="height: 2px; background:  #fff; padding: 0; margin: 0; font-size: 1px; line-height: 1px;">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</repeater>\n</tbody>\n<!-- /article--></table>\n</td><!--/content-->\n</tr>\n<tr>\n<td colspan="2" valign="middle" height="50" bgcolor="#e7eaee" style="vertical-align:middle; border-width: 1px; border-style: solid; border-color: #b6bec9; text-align: center; padding: 8px 0; height: 34px;" class="footer">\n<p><a href="https://myjob.co.ke/?code=CCCC">MyJob.co.ke</a>  </p>\n</td>\n</tr>\n</tbody>\n</table>\n</td>\n</tr>\n</tbody>\n</table><!--/container-->\n</td>\n</tr>\n</tbody>\n</table>\n</body>\n</html>	Hi NNNNN,\nAfter two years of research and development the first phase of MyJob.co.ke - Africa's most advanced vacancy management service - is now ready for use. Go to the following link now to experience it yourself.\n\nhttps://myjob.co.ke/?code=CCCC\n\nWe eagerly await your feedback.\n\nBenefits\n\n    Virus Scanning - Our virus scanner is updated daily to protect you from viruses from files sent by job seekers thereby protecting your computer from corrupt files.\n\n    Shared accounts - Share a single account with multiple users in your organisation as well as your clients. Each user will have their own username and password.\n\n    Full Profiles - MyJob.co.ke allows job seekers to enter every detail they feel will be necessary to help them secure a job. Saving you time requesting additional information.\n\n    Dynamic Profiles - MyJob.co.ke job seekers have 24 hour access to their profile, allowing them to update their details as required.\n\n    File Attachments - MyJob.co.ke allows you to attach forms that may need to be filled by potential job applicants. They in turn submit them via the same system reducing clutter in your email.\n\n    Note Taking - MyJob.co.ke allows you to write notes for internal use.\n\n    Feedback - MyJob.co.ke allows you to give feedback to job seekers.\n\n    Instant results - MyJob.co.ke will give you instant recommendations for each vacancy you add to the system.\n\n    Shortlisting - MyJob.co.ke caters for shortlisting of candidates.\n\n    Recommendations - MyJob.co.ke will grade all applications for a vacancy and let you know the most suitable, saving you lots of time.\n\n    Much More... - Login to MyJob.co.ke and experience Africa's most advanced vacancy management system.\n\n\nUnsubscribe\n\nYou have received this email because someone added your details to our database. To stop receiving any future emails go to the following link.\nhttps://myjob.co.ke/faces/public/unsub.xhtml?code=CCCC\n\n \nKind regards,\nMyJob.co.ke 
\.


--
-- Name: outmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('outmessage_id_seq', 1, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: work
--

COPY pages (id, seekerid, title, content, datemodified) FROM stdin;
5	27	My Page No - 5	\N	2016-03-05 02:36:56.258596
6	27	My Page No - 6	\N	2016-03-05 02:36:56.258596
7	27	My Page No - 7	\N	2016-03-05 02:36:56.258596
8	27	My Page No - 8	\N	2016-03-05 02:36:56.258596
9	2	test	test	2016-05-13 22:58:21.882
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('pages_id_seq', 9, true);


--
-- Data for Name: paypal; Type: TABLE DATA; Schema: public; Owner: work
--

COPY paypal (id, txn_id, mc_gross, protection_eligibility, payer_id, first_name, last_name, payer_email, residence_country, payer_status, tax, payment_date, option_selection1, payment_status, charset, mc_fee, custom, receiver_email, business, quantity, option_name1, payment_type, btn_id, payment_fee, shipping_discount, insurance_amount, receiver_id, pending_reason, txn_type, item_name, discount, mc_currency, item_number, shipping_method, handling_amount, transaction_subject, payment_gross, shipping, processtime, fromtime, totime, seekerid, companyid) FROM stdin;
\.


--
-- Name: paypal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('paypal_id_seq', 1, false);


--
-- Data for Name: paypaltarrifs; Type: TABLE DATA; Schema: public; Owner: work
--

COPY paypaltarrifs (id, tarrif, description, days, membership) FROM stdin;
1	1 Month	1 Month	30	1
3	6 Months	6 Months	180	5
4	1 Year	1 Year	360	10
2	3 Months	3 Months	90	3
\.


--
-- Name: paypaltarrifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('paypaltarrifs_id_seq', 4, true);


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: work
--

COPY positions (id, noofpositions) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	More than 10
\.


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('positions_id_seq', 11, true);


--
-- Data for Name: questiontypes; Type: TABLE DATA; Schema: public; Owner: work
--

COPY questiontypes (id, questiontype) FROM stdin;
1	Text
\.


--
-- Name: questiontypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('questiontypes_id_seq', 1, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: work
--

COPY registration (id, email, username, password, createdate, code, groupid) FROM stdin;
30	x	x	97bb101f9ecf31ffd3788d77c1a02c431c1607e8168aaa53e38a89d445324428	2016-05-02 09:26:47.164	66bd7a	1
31	gksamuel@hotmail.com	testuser	ae5deb822e0d71992900471a7199d0d95b8e7c9d05c40a8245a281fd2c1d6684	2016-05-02 09:50:22.439	6a4a39	1
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('registration_id_seq', 32, true);


--
-- Data for Name: salary; Type: TABLE DATA; Schema: public; Owner: work
--

COPY salary (id, salaryrange) FROM stdin;
1	-
2	Ksh 0 - Ksh 10000
3	Ksh 10000 - Ksh 20000
4	Ksh 20000 - Ksh 30000
5	Ksh 30000 - Ksh 40000
6	Ksh 40000 - Ksh 50000
7	Ksh 50000 - Ksh 60000
8	Ksh 60000 - Ksh 70000
9	Ksh 70000 - Ksh 80000
10	Ksh 80000 - Ksh 90000
11	Ksh 90000 - Ksh 100000
12	Ksh 100000 - Ksh 120000
13	Ksh 120000 - Ksh 140000
14	Ksh 140000 - Ksh 160000
15	Ksh 160000 - Ksh 180000
16	Ksh 200000 - Ksh 250000
17	Ksh 250000 - Ksh 300000
18	Ksh 300000 - Ksh 400000
19	Ksh 400000 - Ksh 500000
20	Above Ksh 500000
\.


--
-- Name: salary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('salary_id_seq', 20, true);


--
-- Data for Name: secondshortlist; Type: TABLE DATA; Schema: public; Owner: work
--

COPY secondshortlist (id, jobid, userid, seekerid, internalcomment, seekercomment, publiccomment, datemodified, hired) FROM stdin;
2	3	1	2	\N	\N	\N	2015-06-01 08:38:11.212608	\N
3	3	1	3	\N	\N	\N	2015-06-01 08:38:11.212608	\N
4	3	1	4	\N	\N	\N	2015-06-01 08:38:11.212608	\N
5	3	1	5	\N	\N	\N	2015-06-01 08:38:11.212608	\N
6	3	1	6	\N	\N	\N	2015-06-01 08:38:11.212608	\N
7	3	1	7	\N	\N	\N	2015-06-01 08:38:11.212608	\N
8	3	1	12	\N	\N	\N	2015-06-01 08:38:11.212608	\N
9	3	1	2	\N	\N	\N	2015-06-01 08:38:11.212608	\N
10	3	1	17	\N	\N	\N	2015-06-01 08:38:11.212608	\N
11	3	1	11	\N	\N	\N	2015-06-01 08:38:11.212608	\N
12	3	1	8	\N	\N	\N	2015-06-01 08:38:11.212608	\N
13	3	1	9	\N	\N	\N	2015-06-01 08:38:11.212608	\N
14	3	1	10	\N	\N	\N	2015-06-01 08:38:11.212608	\N
15	3	1	13	\N	\N	\N	2015-06-01 08:38:11.212608	\N
16	3	1	1	\N	\N	\N	2015-06-01 08:38:11.212608	\N
17	3	1	3	\N	\N	\N	2015-06-01 08:38:11.212608	\N
18	3	1	4	\N	\N	\N	2015-06-01 08:38:11.212608	\N
19	3	1	5	\N	\N	\N	2015-06-01 08:38:11.212608	\N
20	3	1	6	\N	\N	\N	2015-06-01 08:38:11.212608	\N
21	3	1	7	\N	\N	\N	2015-06-01 08:38:11.212608	\N
22	3	1	8	\N	\N	\N	2015-06-01 08:38:11.212608	\N
23	3	1	9	\N	\N	\N	2015-06-01 08:38:11.212608	\N
24	3	1	10	\N	\N	\N	2015-06-01 08:38:11.212608	\N
25	3	1	11	\N	\N	\N	2015-06-01 08:38:11.212608	\N
26	3	1	12	\N	\N	\N	2015-06-01 08:38:11.212608	\N
27	3	1	13	\N	\N	\N	2015-06-01 08:38:11.212608	\N
28	3	1	1	\N	\N	\N	2015-06-01 08:38:11.212608	\N
29	3	1	17	\N	\N	\N	2015-06-01 08:38:11.212608	\N
30	3	1	1	\N	\N	\N	2015-06-01 08:38:11.212608	\N
31	3	1	2	\N	\N	\N	2015-06-01 08:38:11.212608	\N
32	3	1	3	\N	\N	\N	2015-06-01 08:38:11.212608	\N
33	3	1	4	\N	\N	\N	2015-06-01 08:38:11.212608	\N
34	3	1	5	\N	\N	\N	2015-06-01 08:38:11.212608	\N
35	3	1	6	\N	\N	\N	2015-06-01 08:38:11.212608	\N
36	3	1	7	\N	\N	\N	2015-06-01 08:38:11.212608	\N
37	3	1	8	\N	\N	\N	2015-06-01 08:38:11.212608	\N
38	3	1	9	\N	\N	\N	2015-06-01 08:38:11.212608	\N
39	3	1	10	\N	\N	\N	2015-06-01 08:38:11.212608	\N
40	3	1	11	\N	\N	\N	2015-06-01 08:38:11.212608	\N
41	3	1	12	\N	\N	\N	2015-06-01 08:38:11.212608	\N
42	3	1	13	\N	\N	\N	2015-06-01 08:38:11.212608	\N
43	3	1	17	\N	\N	\N	2015-06-01 08:38:11.212608	\N
44	3	1	1	\N	\N	\N	2015-06-01 08:38:11.212608	\N
45	3	1	2	\N	\N	\N	2015-06-01 08:38:11.212608	\N
46	3	1	3	\N	\N	\N	2015-06-01 08:38:11.212608	\N
47	3	1	4	\N	\N	\N	2015-06-01 08:38:11.212608	\N
48	3	1	5	\N	\N	\N	2015-06-01 08:38:11.212608	\N
49	3	1	6	\N	\N	\N	2015-06-01 08:38:11.212608	\N
50	3	1	7	\N	\N	\N	2015-06-01 08:38:11.212608	\N
51	3	1	8	\N	\N	\N	2015-06-01 08:38:11.212608	\N
52	3	1	9	\N	\N	\N	2015-06-01 08:38:11.212608	\N
53	3	1	10	\N	\N	\N	2015-06-01 08:38:11.212608	\N
54	3	1	11	\N	\N	\N	2015-06-01 08:38:11.212608	\N
55	3	1	12	\N	\N	\N	2015-06-01 08:38:11.212608	\N
56	3	1	13	\N	\N	\N	2015-06-01 08:38:11.212608	\N
57	3	1	17	\N	\N	\N	2015-06-01 08:38:11.212608	\N
\.


--
-- Name: secondshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('secondshortlist_id_seq', 57, true);


--
-- Data for Name: seekers; Type: TABLE DATA; Schema: public; Owner: work
--

COPY seekers (id, groupid, statusid, username, password, expiry, email, mobile, othernumber, photo, firstname, lastname, middlename, address, dateofbirth, gender, website, maritalstatus, idnumber, pinnumber, passport, driverslicence, points, salaryid, datemodified) FROM stdin;
3	1	1	cchesang	e7b5fc605fdf97a9c2dd5f910e445f1455027221aa62229023ecb966612e08c7	2014-09-09 09:31:22.737+03	chalosang67@gmail.com	\N	\N	\N	3 - firstname	3 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-08-08 09:31:22.74+03
4	1	1	JohnKMwangi	bb153e6b939ae3423b0e58f33d439bb4089945bd0aa3ffd5a76ac1fdd90b3a32	2015-02-07 14:55:17.079+03	jkyobe@gmail.com	\N	\N	\N	4 - firstname	4 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-06 14:55:17.081+03
5	1	1	dianakarambu	ae1c93e675b09e7719dc0547f49818ae2e5cdb1bb03197b9c36664972af38cd0	2015-02-23 14:28:50.333+03	karambu.diana@gmail.com	\N	\N	\N	5 - firstname	5 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-22 14:28:50.336+03
6	1	1	silimoma	b60b904030bb2885b25a85e1b17df9bde902c4367157cd2bc6fc5be22604db2f	2015-02-23 16:10:25.319+03	silimoma1@gmail.com	0721993979		\N	6 - firstname	6 - lastname	Machuki	P.O. Box 12302	1980-05-03	t		Married	22353487				\N	4	2015-01-22 16:24:25.893+03
7	1	1	gadan	487f570361f83e94f060ba056e12d0dee23d7ab7b9c29630dbc1c495f06879f5	2015-02-23 21:29:36.091+03	gadan812@gmail.com	\N	\N	\N	7 - firstname	7 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-22 21:29:36.094+03
8	1	1	Gonjobe	264a404d814268294574a838c39602d331acd99df28400d8f9643d731d5660a4	2015-02-22 06:39:07.845+03	ibrahimgonjobe@gmail.com	447951165412		profileimage.jpg	8 - firstname	8 - lastname	Abdi		\N	t							\N	1	2015-01-23 07:45:42.824+03
9	1	1	Churchil	5a84a9e426e1efb1eff2e54ad4d7d75871ba20e0f36df0480d5411be9622a20c	2015-02-22 09:34:53.416+03	churchilo67@gmail.com	\N	\N	\N	9 - firstname	9 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 09:34:53.42+03
10	1	1	lenawasae	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2015-02-22 10:45:58.47+03	patricklenawasae@yahoo.com	\N	\N	\N	10 - firstname	10 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 10:45:58.472+03
12	1	1	muriukidavid	ddee49aaf4598765debfdc4897fe1b239187c74d1d67c50671d455b343b0230d	2015-02-22 14:40:11.851+03	muriukidavid74@yahoo.com	\N	\N	\N	12 - firstname	12 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 14:40:11.853+03
11	1	1	jshobiero	be5d233f7451400b918c024b620e8b3d92c0decc574cb5a6b8370157e15dfb04	2015-02-22 13:55:44.764+03	joshmaiso@yahoo.com	\N	\N	Joshua.jpg	11 - firstname	11 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 13:55:44.766+03
13	1	1	ibrahim	0a9cd153d6269c8180a018343dedff7f7f2b6d44fd1a2eddddd640c8186010da	2015-02-22 21:06:03.423+03	ibrah.sallah@gmail.com	\N	\N	\N	13 - firstname	13 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 21:06:03.425+03
17	1	1	cnn	602a8fddd207a98e892e9d316f77b6e7d5b3281113f2668f7150c8b227e21c58	2015-05-25 09:07:48.611+03	Charles.n.nganga@Gmail.com	\N	\N	\N	17 - firstname	17 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-04-25 09:07:48.633+03
26	1	1	26@gmail.com	e066efd78fc65b9ab70186fa0a12f7c0eee727c7f481f79b2ee726ff4316d47d	2016-02-09 02:41:52.182+03	26@gmail.com	\N	\N	\N	Samuel	Gachanja	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-09 02:41:52.23+03
1	1	1	punuka	c2dc291d2c6086e49f88eecdb4a52d4057723adbba5f6abfe0f335272d728c6a	2014-06-23 17:16:20.203+03	esunyen@gmail.com	\N	\N	\N	1 - firstname	1 - lastname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-05-22 17:16:20.215+03
27	1	1	gksamuel11@gmail.com	e066efd78fc65b9ab70186fa0a12f7c0eee727c7f481f79b2ee726ff4316d47d	2017-03-13 00:00:00+03	gksamuel11@gmail.com			\N	Samuel	Gachanja			1966-01-01	f							\N	1	2016-03-05 23:31:34.595+03
39	1	1	test	97bb101f9ecf31ffd3788d77c1a02c431c1607e8168aaa53e38a89d445324428	2016-05-03 10:16:15.066+03	gachanja@localhost.localdomain	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-05-02 10:16:15.073+03
38	1	1	gksamuel1@gmail.com	e066efd78fc65b9ab70186fa0a12f7c0eee727c7f481f79b2ee726ff4316d47d	2016-06-01 17:22:15.822+03	gksamuel1@gmail.com			\N	Samuel	Gachanja			1966-01-01	f							\N	1	2016-04-24 04:20:14.353+03
2	1	2	seeker	d7afa135a6c4f59914bf29c0a8d8d8384218aa832f46443d49d600f06945992e	2017-01-02 22:48:31.982+03	x	0720920293		Dts_news_bill_gates_wikipedia.JPG	2 - firstname	2 - lastname			1966-01-01	f							\N	1	2016-05-13 23:02:27.755+03
\.


--
-- Name: seekers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('seekers_id_seq', 39, true);


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: work
--

COPY status (id, description) FROM stdin;
1	-
2	Email Validated Seeker
\.


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('status_id_seq', 2, true);


--
-- Data for Name: tellafriend; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tellafriend (id, seekerid, jobid, friend, datecreated, name) FROM stdin;
\.


--
-- Name: tellafriend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tellafriend_id_seq', 1, true);


--
-- Data for Name: thirdshortlist; Type: TABLE DATA; Schema: public; Owner: work
--

COPY thirdshortlist (id, jobid, userid, seekerid, internalcomment, seekercomment, publiccomment, datemodified, hired) FROM stdin;
\.


--
-- Name: thirdshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('thirdshortlist_id_seq', 1, false);


--
-- Data for Name: tip; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tip (id, submittedby, tip, rate, datesubmited) FROM stdin;
4	\N	Do not add too much color to your c.v	0	\N
1	gachanja	tip 1	5	2012-11-05 11:32:17.412489+03
3	\N	Make sure there are no gaps in your C.Vs	5	\N
2	gachanja	tip 2	3	2012-11-05 11:32:17.412489+03
\.


--
-- Name: tip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tip_id_seq', 4, true);


--
-- Data for Name: tiprate; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tiprate (id, tipid, rate, userid, seekerid) FROM stdin;
1	2	5	1	\N
2	1	5	\N	2
3	3	5	\N	2
4	2	1	\N	11
\.


--
-- Name: tiprate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tiprate_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: work
--

COPY users (id, companyid, accountid, groupid, username, name, email, description, admin, active, password, datemodified) FROM stdin;
2	2	2	2	suzzynjogu	\N	velvetconcepts@gmail.com	\N	t	t	388b5e4c8c954caa9a9070ac2663816d0bce162ca3aaba6be613faa127c9cc25	2016-05-30 14:00:41.263232
3	1	3	2	suenjogu	sue	suenjogu@email.com	boss sue company	f	t	5efdfe	2016-05-30 14:00:41.263232
4	3	4	2	des	\N	desshila@yahoo.com	\N	t	t	49c2ce276b9ebab29cf5433edbbbaaaeb2dfc60cab65fa0086453f1e982ee0a9	2016-05-30 14:00:41.263232
1	1	1	2	employer	samuel gachanja	customerservice@myjob.co.ke		t	t	8efdf55724c97710333b1e6e7ad03e1b61c9c4206a35ca33898058c6e15c9c42	2016-05-30 14:00:41.263232
5	4	5	2	isiolocounty	\N	gksamuel1@gmail.com	\N	t	t	8efdf55724c97710333b1e6e7ad03e1b61c9c4206a35ca33898058c6e15c9c42	2016-05-30 14:00:41.263232
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('users_id_seq', 5, true);


--
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: work
--

COPY work (id, seekerid, startdate, enddate, company, website, address, companyphone, location, "position", jobdescription, refereename, refereeemail, refereemobile, datemodified) FROM stdin;
3	26	2009-02-02	2014-12-31	Kenya Women Finance Trust					ICT OFFICER					2015-01-23 06:08:48.688
4	26	2008-01-28	2009-12-31	Airland Mails Logistics					ICT OFFICER					2015-01-23 06:10:28.493
5	26	2005-09-01	2007-12-03	Westview Travels					IT Support Assistant					2015-01-23 06:13:45.28
6	26	2001-11-01	2004-01-31	Uchumi Supermarkets LTD					Customer Care Officer					2015-01-23 06:15:41.088
7	26	2014-07-21	2015-02-28	Adecco, Uk	http://www.adecco.co.uk/	Siskin Parkway West	+442476514081	Coventry, UK	General Operative	•\tStarting up, shutting down operation equipment, troubleshooting shooting & software update	HR 	N/A	N/A	2015-01-23 16:01:15.364
1	26	2000-06-01	2020-06-01	companyname	cellulant.com	2345234	2452341	nairobi	team lead	software engieers	refereename	refereeemail	04394584	2015-05-30 14:18:18.33
16	27	1966-01-01	1966-01-01	Cellulant Corporation					Senior Software Engineer					2016-03-05 03:21:44.826
15	27	1967-05-01	2021-12-01	Cellulant Corporation					Technology Solutions Manager					2016-03-05 03:22:41.31
19	2	1966-01-01	1966-01-01	test					test					2016-05-13 22:55:02.606
20	2	1966-01-01	1966-01-01	test2					test2					2016-05-27 16:50:34.811
\.


--
-- Name: work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('work_id_seq', 20, true);


--
-- Name: abuse_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY abuse
    ADD CONSTRAINT abuse_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: agent_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (id);


--
-- Name: applications_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: category_name_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: company_email_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_email_key UNIQUE (email);


--
-- Name: company_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: content_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: coverletters_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY coverletters
    ADD CONSTRAINT coverletters_pkey PRIMARY KEY (id);


--
-- Name: education_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- Name: filecategory_name_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY filecategory
    ADD CONSTRAINT filecategory_name_key UNIQUE (name);


--
-- Name: filecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY filecategory
    ADD CONSTRAINT filecategory_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: filetypes_filetype_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY filetypes
    ADD CONSTRAINT filetypes_filetype_key UNIQUE (filetype);


--
-- Name: filetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY filetypes
    ADD CONSTRAINT filetypes_pkey PRIMARY KEY (id);


--
-- Name: firstshortlist_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY firstshortlist
    ADD CONSTRAINT firstshortlist_pkey PRIMARY KEY (id);


--
-- Name: formanswers_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY formanswers
    ADD CONSTRAINT formanswers_pkey PRIMARY KEY (id);


--
-- Name: formquestions_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY formquestions
    ADD CONSTRAINT formquestions_pkey PRIMARY KEY (id);


--
-- Name: forms_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: inmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY inmessage
    ADD CONSTRAINT inmessage_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: lostpassword_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY lostpassword
    ADD CONSTRAINT lostpassword_pkey PRIMARY KEY (id);


--
-- Name: mpesa_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY mpesa
    ADD CONSTRAINT mpesa_pkey PRIMARY KEY (id);


--
-- Name: mpesatarrifs_description_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY mpesatarrifs
    ADD CONSTRAINT mpesatarrifs_description_key UNIQUE (description);


--
-- Name: mpesatarrifs_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY mpesatarrifs
    ADD CONSTRAINT mpesatarrifs_pkey PRIMARY KEY (id);


--
-- Name: mpesatarrifs_tarrif_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY mpesatarrifs
    ADD CONSTRAINT mpesatarrifs_tarrif_key UNIQUE (tarrif);


--
-- Name: outmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY outmessage
    ADD CONSTRAINT outmessage_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: paypal_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY paypal
    ADD CONSTRAINT paypal_pkey PRIMARY KEY (id);


--
-- Name: paypal_txn_id_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY paypal
    ADD CONSTRAINT paypal_txn_id_key UNIQUE (txn_id);


--
-- Name: paypaltarrifs_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY paypaltarrifs
    ADD CONSTRAINT paypaltarrifs_pkey PRIMARY KEY (id);


--
-- Name: positions_noofpositions_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_noofpositions_key UNIQUE (noofpositions);


--
-- Name: positions_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: questiontypes_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY questiontypes
    ADD CONSTRAINT questiontypes_pkey PRIMARY KEY (id);


--
-- Name: registration_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (id);


--
-- Name: salary_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY salary
    ADD CONSTRAINT salary_pkey PRIMARY KEY (id);


--
-- Name: secondshortlist_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY secondshortlist
    ADD CONSTRAINT secondshortlist_pkey PRIMARY KEY (id);


--
-- Name: seekers_email_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_email_key UNIQUE (email);


--
-- Name: seekers_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_pkey PRIMARY KEY (id);


--
-- Name: seekers_username_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_username_key UNIQUE (username);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: tellafriend_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY tellafriend
    ADD CONSTRAINT tellafriend_pkey PRIMARY KEY (id);


--
-- Name: thirdshortlist_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT thirdshortlist_pkey PRIMARY KEY (id);


--
-- Name: tip_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY tip
    ADD CONSTRAINT tip_pkey PRIMARY KEY (id);


--
-- Name: tiprate_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY tiprate
    ADD CONSTRAINT tiprate_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_pkey; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY work
    ADD CONSTRAINT work_pkey PRIMARY KEY (id);


--
-- Name: abuse_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY abuse
    ADD CONSTRAINT abuse_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: abuse_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY abuse
    ADD CONSTRAINT abuse_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: accounts_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: agent_messageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY agent
    ADD CONSTRAINT agent_messageid_fkey FOREIGN KEY (messageid) REFERENCES outmessage(id);


--
-- Name: applications_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: applications_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: applications_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: company_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY company
    ADD CONSTRAINT company_statusid_fkey FOREIGN KEY (statusid) REFERENCES status(id);


--
-- Name: contact_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: contact_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: contact_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: coverletters_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY coverletters
    ADD CONSTRAINT coverletters_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: education_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: files_filecategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_filecategoryid_fkey FOREIGN KEY (filecategoryid) REFERENCES filecategory(id);


--
-- Name: files_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


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
-- Name: fk_applications_jobid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT fk_applications_jobid FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: fk_applications_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT fk_applications_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_applications_userid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT fk_applications_userid FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: fk_company_statusid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY company
    ADD CONSTRAINT fk_company_statusid FOREIGN KEY (statusid) REFERENCES status(id);


--
-- Name: fk_coverletters_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY coverletters
    ADD CONSTRAINT fk_coverletters_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_education_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY education
    ADD CONSTRAINT fk_education_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_files_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_files_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


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
-- Name: fk_jobs_accountid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_jobs_accountid FOREIGN KEY (accountid) REFERENCES accounts(id);


--
-- Name: fk_jobs_companyid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_jobs_companyid FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: fk_jobs_positionsid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_jobs_positionsid FOREIGN KEY (positionsid) REFERENCES positions(id);


--
-- Name: fk_jobs_userid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_jobs_userid FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: fk_pages_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT fk_pages_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_registration_groupid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY registration
    ADD CONSTRAINT fk_registration_groupid FOREIGN KEY (groupid) REFERENCES groups(id);


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
-- Name: fk_seekers_groupid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT fk_seekers_groupid FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk_seekers_salaryid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT fk_seekers_salaryid FOREIGN KEY (salaryid) REFERENCES salary(id);


--
-- Name: fk_seekers_statusid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT fk_seekers_statusid FOREIGN KEY (statusid) REFERENCES status(id);


--
-- Name: fk_thirdshortlist_jobid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT fk_thirdshortlist_jobid FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: fk_thirdshortlist_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT fk_thirdshortlist_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: fk_thirdshortlist_userid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT fk_thirdshortlist_userid FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: fk_users_accountid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_accountid FOREIGN KEY (accountid) REFERENCES accounts(id);


--
-- Name: fk_users_companyid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_companyid FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: fk_users_groupid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_groupid FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: fk_work_seekerid; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY work
    ADD CONSTRAINT fk_work_seekerid FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: formanswers_formid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY formanswers
    ADD CONSTRAINT formanswers_formid_fkey FOREIGN KEY (formid) REFERENCES forms(id);


--
-- Name: formanswers_formquestionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY formanswers
    ADD CONSTRAINT formanswers_formquestionid_fkey FOREIGN KEY (formquestionid) REFERENCES formquestions(id);


--
-- Name: formquestions_formid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY formquestions
    ADD CONSTRAINT formquestions_formid_fkey FOREIGN KEY (formid) REFERENCES forms(id);


--
-- Name: formquestions_questiontypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY formquestions
    ADD CONSTRAINT formquestions_questiontypeid_fkey FOREIGN KEY (questiontypeid) REFERENCES questiontypes(id);


--
-- Name: jobs_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES category(id);


--
-- Name: jobs_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: jobs_formid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_formid_fkey FOREIGN KEY (formid) REFERENCES forms(id);


--
-- Name: jobs_positionsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_positionsid_fkey FOREIGN KEY (positionsid) REFERENCES positions(id);


--
-- Name: jobs_salaryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_salaryid_fkey FOREIGN KEY (salaryid) REFERENCES salary(id);


--
-- Name: jobs_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: mpesa_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY mpesa
    ADD CONSTRAINT mpesa_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: mpesa_inmessageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY mpesa
    ADD CONSTRAINT mpesa_inmessageid_fkey FOREIGN KEY (inmessageid) REFERENCES inmessage(id);


--
-- Name: mpesa_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY mpesa
    ADD CONSTRAINT mpesa_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: pages_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: paypal_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY paypal
    ADD CONSTRAINT paypal_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: paypal_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY paypal
    ADD CONSTRAINT paypal_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: registration_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY registration
    ADD CONSTRAINT registration_groupid_fkey FOREIGN KEY (groupid) REFERENCES groups(id);


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
-- Name: seekers_groupid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_groupid_fkey FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: seekers_salaryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_salaryid_fkey FOREIGN KEY (salaryid) REFERENCES salary(id);


--
-- Name: seekers_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY seekers
    ADD CONSTRAINT seekers_statusid_fkey FOREIGN KEY (statusid) REFERENCES status(id);


--
-- Name: tellafriend_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY tellafriend
    ADD CONSTRAINT tellafriend_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: tellafriend_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY tellafriend
    ADD CONSTRAINT tellafriend_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: thirdshortlist_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT thirdshortlist_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(id);


--
-- Name: thirdshortlist_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT thirdshortlist_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: thirdshortlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY thirdshortlist
    ADD CONSTRAINT thirdshortlist_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: tiprate_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY tiprate
    ADD CONSTRAINT tiprate_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: tiprate_tipid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY tiprate
    ADD CONSTRAINT tiprate_tipid_fkey FOREIGN KEY (tipid) REFERENCES tip(id);


--
-- Name: tiprate_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY tiprate
    ADD CONSTRAINT tiprate_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: users_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: users_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_jobid_fkey FOREIGN KEY (groupid) REFERENCES groups(id);


--
-- Name: work_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY work
    ADD CONSTRAINT work_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: abuse; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE abuse FROM PUBLIC;
REVOKE ALL ON TABLE abuse FROM work;
GRANT ALL ON TABLE abuse TO work;
GRANT SELECT ON TABLE abuse TO workrealm;


--
-- Name: abuse_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE abuse_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE abuse_id_seq FROM work;
GRANT ALL ON SEQUENCE abuse_id_seq TO work;


--
-- Name: applications; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE applications FROM PUBLIC;
REVOKE ALL ON TABLE applications FROM work;
GRANT ALL ON TABLE applications TO work;
GRANT SELECT ON TABLE applications TO workrealm;


--
-- Name: applications_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE applications_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE applications_id_seq FROM work;
GRANT ALL ON SEQUENCE applications_id_seq TO work;


--
-- Name: category; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE category FROM PUBLIC;
REVOKE ALL ON TABLE category FROM work;
GRANT ALL ON TABLE category TO work;
GRANT SELECT ON TABLE category TO workrealm;


--
-- Name: category_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE category_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE category_id_seq FROM work;
GRANT ALL ON SEQUENCE category_id_seq TO work;


--
-- Name: company; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE company FROM PUBLIC;
REVOKE ALL ON TABLE company FROM work;
GRANT ALL ON TABLE company TO work;
GRANT SELECT ON TABLE company TO workrealm;


--
-- Name: company_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE company_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE company_id_seq FROM work;
GRANT ALL ON SEQUENCE company_id_seq TO work;


--
-- Name: contact; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE contact FROM PUBLIC;
REVOKE ALL ON TABLE contact FROM work;
GRANT ALL ON TABLE contact TO work;
GRANT SELECT ON TABLE contact TO workrealm;


--
-- Name: contact_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE contact_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE contact_id_seq FROM work;
GRANT ALL ON SEQUENCE contact_id_seq TO work;


--
-- Name: coverletters; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE coverletters FROM PUBLIC;
REVOKE ALL ON TABLE coverletters FROM work;
GRANT ALL ON TABLE coverletters TO work;
GRANT SELECT ON TABLE coverletters TO workrealm;


--
-- Name: coverletters_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE coverletters_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE coverletters_id_seq FROM work;
GRANT ALL ON SEQUENCE coverletters_id_seq TO work;


--
-- Name: education; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE education FROM PUBLIC;
REVOKE ALL ON TABLE education FROM work;
GRANT ALL ON TABLE education TO work;
GRANT SELECT ON TABLE education TO workrealm;


--
-- Name: education_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE education_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE education_id_seq FROM work;
GRANT ALL ON SEQUENCE education_id_seq TO work;


--
-- Name: filecategory; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE filecategory FROM PUBLIC;
REVOKE ALL ON TABLE filecategory FROM work;
GRANT ALL ON TABLE filecategory TO work;
GRANT SELECT ON TABLE filecategory TO workrealm;


--
-- Name: filecategory_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE filecategory_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE filecategory_id_seq FROM work;
GRANT ALL ON SEQUENCE filecategory_id_seq TO work;


--
-- Name: files; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE files FROM PUBLIC;
REVOKE ALL ON TABLE files FROM work;
GRANT ALL ON TABLE files TO work;
GRANT SELECT ON TABLE files TO workrealm;


--
-- Name: files_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE files_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE files_id_seq FROM work;
GRANT ALL ON SEQUENCE files_id_seq TO work;


--
-- Name: filetypes; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE filetypes FROM PUBLIC;
REVOKE ALL ON TABLE filetypes FROM work;
GRANT ALL ON TABLE filetypes TO work;
GRANT SELECT ON TABLE filetypes TO workrealm;


--
-- Name: filetypes_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE filetypes_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE filetypes_id_seq FROM work;
GRANT ALL ON SEQUENCE filetypes_id_seq TO work;


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
-- Name: groups; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE groups FROM PUBLIC;
REVOKE ALL ON TABLE groups FROM work;
GRANT ALL ON TABLE groups TO work;
GRANT SELECT ON TABLE groups TO workrealm;


--
-- Name: groups_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE groups_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE groups_id_seq FROM work;
GRANT ALL ON SEQUENCE groups_id_seq TO work;


--
-- Name: inmessage; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE inmessage FROM PUBLIC;
REVOKE ALL ON TABLE inmessage FROM work;
GRANT ALL ON TABLE inmessage TO work;
GRANT SELECT ON TABLE inmessage TO workrealm;


--
-- Name: inmessage_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE inmessage_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE inmessage_id_seq FROM work;
GRANT ALL ON SEQUENCE inmessage_id_seq TO work;


--
-- Name: jobs; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE jobs FROM PUBLIC;
REVOKE ALL ON TABLE jobs FROM work;
GRANT ALL ON TABLE jobs TO work;
GRANT SELECT ON TABLE jobs TO workrealm;


--
-- Name: jobs_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE jobs_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE jobs_id_seq FROM work;
GRANT ALL ON SEQUENCE jobs_id_seq TO work;


--
-- Name: lostpassword; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE lostpassword FROM PUBLIC;
REVOKE ALL ON TABLE lostpassword FROM work;
GRANT ALL ON TABLE lostpassword TO work;
GRANT SELECT ON TABLE lostpassword TO workrealm;


--
-- Name: lostpassword_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE lostpassword_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE lostpassword_id_seq FROM work;
GRANT ALL ON SEQUENCE lostpassword_id_seq TO work;


--
-- Name: mpesa; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE mpesa FROM PUBLIC;
REVOKE ALL ON TABLE mpesa FROM work;
GRANT ALL ON TABLE mpesa TO work;
GRANT SELECT ON TABLE mpesa TO workrealm;


--
-- Name: mpesa_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE mpesa_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mpesa_id_seq FROM work;
GRANT ALL ON SEQUENCE mpesa_id_seq TO work;


--
-- Name: mpesatarrifs; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE mpesatarrifs FROM PUBLIC;
REVOKE ALL ON TABLE mpesatarrifs FROM work;
GRANT ALL ON TABLE mpesatarrifs TO work;
GRANT SELECT ON TABLE mpesatarrifs TO workrealm;


--
-- Name: mpesatarrifs_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE mpesatarrifs_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE mpesatarrifs_id_seq FROM work;
GRANT ALL ON SEQUENCE mpesatarrifs_id_seq TO work;


--
-- Name: pages; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE pages FROM PUBLIC;
REVOKE ALL ON TABLE pages FROM work;
GRANT ALL ON TABLE pages TO work;
GRANT SELECT ON TABLE pages TO workrealm;


--
-- Name: pages_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE pages_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE pages_id_seq FROM work;
GRANT ALL ON SEQUENCE pages_id_seq TO work;


--
-- Name: positions; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE positions FROM PUBLIC;
REVOKE ALL ON TABLE positions FROM work;
GRANT ALL ON TABLE positions TO work;
GRANT SELECT ON TABLE positions TO workrealm;


--
-- Name: positions_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE positions_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE positions_id_seq FROM work;
GRANT ALL ON SEQUENCE positions_id_seq TO work;


--
-- Name: registration; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE registration FROM PUBLIC;
REVOKE ALL ON TABLE registration FROM work;
GRANT ALL ON TABLE registration TO work;
GRANT SELECT ON TABLE registration TO workrealm;


--
-- Name: registration_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE registration_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE registration_id_seq FROM work;
GRANT ALL ON SEQUENCE registration_id_seq TO work;


--
-- Name: salary; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE salary FROM PUBLIC;
REVOKE ALL ON TABLE salary FROM work;
GRANT ALL ON TABLE salary TO work;
GRANT SELECT ON TABLE salary TO workrealm;


--
-- Name: salary_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE salary_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE salary_id_seq FROM work;
GRANT ALL ON SEQUENCE salary_id_seq TO work;


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
-- Name: seekers; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE seekers FROM PUBLIC;
REVOKE ALL ON TABLE seekers FROM work;
GRANT ALL ON TABLE seekers TO work;
GRANT SELECT ON TABLE seekers TO workrealm;


--
-- Name: seekers_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE seekers_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE seekers_id_seq FROM work;
GRANT ALL ON SEQUENCE seekers_id_seq TO work;


--
-- Name: status; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE status FROM PUBLIC;
REVOKE ALL ON TABLE status FROM work;
GRANT ALL ON TABLE status TO work;
GRANT SELECT ON TABLE status TO workrealm;


--
-- Name: status_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE status_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE status_id_seq FROM work;
GRANT ALL ON SEQUENCE status_id_seq TO work;


--
-- Name: tellafriend; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE tellafriend FROM PUBLIC;
REVOKE ALL ON TABLE tellafriend FROM work;
GRANT ALL ON TABLE tellafriend TO work;
GRANT SELECT ON TABLE tellafriend TO workrealm;


--
-- Name: tellafriend_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE tellafriend_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tellafriend_id_seq FROM work;
GRANT ALL ON SEQUENCE tellafriend_id_seq TO work;


--
-- Name: thirdshortlist; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE thirdshortlist FROM PUBLIC;
REVOKE ALL ON TABLE thirdshortlist FROM work;
GRANT ALL ON TABLE thirdshortlist TO work;
GRANT SELECT ON TABLE thirdshortlist TO workrealm;


--
-- Name: thirdshortlist_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE thirdshortlist_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE thirdshortlist_id_seq FROM work;
GRANT ALL ON SEQUENCE thirdshortlist_id_seq TO work;


--
-- Name: tip; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE tip FROM PUBLIC;
REVOKE ALL ON TABLE tip FROM work;
GRANT ALL ON TABLE tip TO work;
GRANT SELECT ON TABLE tip TO workrealm;


--
-- Name: tip_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE tip_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tip_id_seq FROM work;
GRANT ALL ON SEQUENCE tip_id_seq TO work;


--
-- Name: tiprate; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE tiprate FROM PUBLIC;
REVOKE ALL ON TABLE tiprate FROM work;
GRANT ALL ON TABLE tiprate TO work;
GRANT SELECT ON TABLE tiprate TO workrealm;


--
-- Name: tiprate_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE tiprate_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tiprate_id_seq FROM work;
GRANT ALL ON SEQUENCE tiprate_id_seq TO work;


--
-- Name: users; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM work;
GRANT ALL ON TABLE users TO work;
GRANT SELECT ON TABLE users TO workrealm;


--
-- Name: users_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE users_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE users_id_seq FROM work;
GRANT ALL ON SEQUENCE users_id_seq TO work;


--
-- Name: work; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON TABLE work FROM PUBLIC;
REVOKE ALL ON TABLE work FROM work;
GRANT ALL ON TABLE work TO work;
GRANT SELECT ON TABLE work TO workrealm;


--
-- Name: work_id_seq; Type: ACL; Schema: public; Owner: work
--

REVOKE ALL ON SEQUENCE work_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE work_id_seq FROM work;
GRANT ALL ON SEQUENCE work_id_seq TO work;


--
-- PostgreSQL database dump complete
--

