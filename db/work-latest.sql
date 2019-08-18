--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
    datemodified timestamp with time zone DEFAULT now() NOT NULL,
    datecreated timestamp with time zone NOT NULL
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
1	2	2	This job is a hoax they asked me to send 10k first b4 the interview	2014-06-10 14:27:59.517+03
\.


--
-- Name: abuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('abuse_id_seq', 1, true);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: work
--

COPY accounts (id, mainaccount, companyid, name, description, datecreated) FROM stdin;
1	t	1	MAIN ACCOUNT	\N	2014-05-26 07:40:39.982+03
2	t	2	MAIN ACCOUNT	\N	2014-06-04 11:36:41.019+03
3	f	1	suecompany	my client	2014-06-10 11:02:53.609+03
4	t	3	MAIN ACCOUNT	\N	2014-07-14 18:29:59.937+03
5	t	4	MAIN ACCOUNT	\N	2015-01-11 18:02:19.581+03
6	t	52	MAIN ACCOUNT	\N	2016-03-14 17:03:55.441+03
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('accounts_id_seq', 6, true);


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
5	18	2	2015-01-13 21:04:32.918+03	my application letter	\N	t	\N	2015-01-13 13:04:32.918	\N
8	15	11	2015-01-23 15:36:08.562+03	<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JOSHUA\r\nMAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>NAIROBI.</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">COHESION OFFICER </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I have\r\nmore than eight years experience gained in my various engagements and therefore\r\nI hold a strong conviction that given this opportunity, I will tirelessly put\r\nthis experience into good use to enhance the institution’s productivity and\r\ngrowth as well as my career development.</span><span style="font-size:12.0pt;\r\nline-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\n</span></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Joshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:11.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-ascii-font-family:Calibri;\r\n\tmso-ascii-theme-font:minor-latin;\r\n\tmso-fareast-font-family:"Times New Roman";\r\n\tmso-fareast-theme-font:minor-fareast;\r\n\tmso-hansi-font-family:Calibri;\r\n\tmso-hansi-theme-font:minor-latin;\r\n\tmso-bidi-font-family:"Times New Roman";\r\n\tmso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->	\N	f	\N	2015-01-23 07:36:08.562	Joshua CV.doc
7	11	11	2015-01-23 15:24:15.804+03	<!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Author>Aloise</o:Author>\r\n  <o:Version>12.00</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b style="mso-bidi-font-weight:\r\nnormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;</span></b></span><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span>JOSHUA MAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAIROBI.</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;</span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">DIRECTOR, INFORMATION COMMUNICATION\r\nTECHNOLOGY </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b><u><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="text-decoration:none"></span></span></u></b><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I\r\nhave more than eight years experience gained in my various engagements and\r\ntherefore I hold a strong conviction that given this opportunity, I will\r\ntirelessly put this experience into good use to enhance the institution’s\r\nproductivity and growth as well as my career development.</span><span style="font-size:12.0pt;line-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\nJoshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:10.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-bidi-font-family:"Times New Roman";}\r\n</style>\r\n<![endif]-->	\N	t	\N	2015-01-23 07:24:15.804	Joshua CV.doc
9	10	2	2015-03-06 06:53:22.445+03	1	\N	f	\N	\N	\N
10	6	2	2015-03-28 11:44:10.338+03	2	\N	f	\N	\N	\N
11	3	2	2015-03-29 14:52:46.855+03	this is my in ternship appliction letter	Please apply for internship	t	\N	2015-05-29 09:18:44.756	\N
17	3	6	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
18	3	7	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
19	3	25	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
20	3	8	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
21	3	9	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
22	3	10	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
23	3	12	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
24	3	11	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
25	3	13	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
26	3	14	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
27	3	15	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
28	3	16	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
29	3	17	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
30	3	18	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
31	3	19	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
32	3	20	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
33	3	21	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
34	3	22	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
35	3	23	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
36	3	24	2015-06-02 11:11:36.477847+03	\N	\N	f	\N	2015-06-02 11:11:36.477847	\N
12	3	3	2015-06-02 11:11:36.477847+03	\N	\N	t	\N	2015-06-02 11:11:36.477847	\N
13	3	1	2015-06-02 11:11:36.477847+03	\N	\N	t	\N	2015-06-02 11:11:36.477847	\N
14	3	4	2015-06-02 11:11:36.477847+03	\N	\N	t	\N	2015-06-02 11:11:36.477847	\N
15	3	2	2015-06-02 11:11:36.477847+03	\N	\N	t	\N	2015-06-02 11:11:36.477847	\N
16	3	5	2015-06-02 11:11:36.477847+03	\N	\N	t	\N	2015-06-02 11:11:36.477847	\N
37	16	2	2015-07-01 08:27:02.714+03	this is my in ternship appliction letter	\N	f	\N	2015-07-01 01:27:02.714	\N
38	1	51	2016-01-15 11:09:00.451+03	6	\N	f	\N	\N	\N
39	2	120	2016-02-23 10:18:35.355+03	<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">TO<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">THE <o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="688" style="width:516.0pt;background:white;border-collapse:collapse;mso-yfti-tbllook:\r\n 1184;mso-padding-alt:0in 0in 0in 0in">\r\n <tbody><tr>\r\n  <td width="312" style="width:233.7pt;padding:0in 0in 0in 0in">\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="855" style="width:641.4pt;border-collapse:collapse;mso-yfti-tbllook:1184;\r\n   mso-padding-alt:0in 0in 0in 0in">\r\n   <tbody><tr>\r\n    <td width="336" style="width:3.5in;padding:0in 0in 0in 0in"></td>\r\n    <td style="padding:0in 0in 0in 0in">\r\n    <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:12.0pt;font-family:"Arial","sans-serif";\r\n    mso-fareast-font-family:"Times New Roman""> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n    "Times New Roman""><o:p></o:p></span></p>\r\n    </td>\r\n   </tr>\r\n  </tbody></table>\r\n  </td>\r\n  <td width="376" style="width:282.3pt;padding:0in 0in 0in 0in">\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 12pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">DEAR SIR / MADAM<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n</span></b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">RE:<b> <u>APPLICATION\r\nFOR INTERNAL AUDIT ASSISTANT POSITION<o:p></o:p></u></b></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><b><u><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n<br>\r\n</span></u></b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">I hereby wish to apply\r\nfor the above mentioned post in your organization. I am Kenya citizen aged 26\r\nyears and Certified Public Accountant Graduate from Kenya collage of\r\naccountancy university (KCAU) which I attained in December 2012.</span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Currently I am working\r\nwith Villa surgical and equipments limited as an Accountant from January 2013\r\nto date. I have learnt a lot through this opportunity as I interact with the\r\ncustomers that we deal with plus the sales representative whose deals with our\r\nclients directly. My salary expectation is a range of ksh.28,000 and above.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Am seeking a\r\nchallenging role that will allow me to grow in building\r\noutstanding service in your organization. </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 12pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\nGiven a chance, I will devote myself to work hard and smart, making sure that\r\nmy tasks are well completed and duly and I will serve your organization\r\nwith utmost faith and diligence toward achieving the company goals and meeting\r\nyour clients demands in this dynamic market.</span><span style="font-size:9.5pt;\r\nfont-family:"Arial","sans-serif";mso-fareast-font-family:"Times New Roman";\r\ncolor:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">I am looking forward\r\nto a favorable considerable consideration.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Attached please find\r\nmy CV, Copies of certificates, National identification copy, for your perusal\r\nand record and further evidence of the contribution<br>\r\n<!--[if !supportLineBreakNewLine]--><br>\r\n<!--[endif]--><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n<br>\r\nYours faithfully,<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Paul Magaiwa Wankuru.</span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n4.5pt;background:#F1F1F1"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222;mso-no-proof:yes"><v:shapetype id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">\r\n <v:stroke joinstyle="miter">\r\n <v:formulas>\r\n  <v:f eqn="if lineDrawn pixelLineWidth 0">\r\n  <v:f eqn="sum @0 1 0">\r\n  <v:f eqn="sum 0 0 @1">\r\n  <v:f eqn="prod @2 1 2">\r\n  <v:f eqn="prod @3 21600 pixelWidth">\r\n  <v:f eqn="prod @3 21600 pixelHeight">\r\n  <v:f eqn="sum @0 0 1">\r\n  <v:f eqn="prod @6 1 2">\r\n  <v:f eqn="prod @7 21600 pixelWidth">\r\n  <v:f eqn="sum @8 21600 0">\r\n  <v:f eqn="prod @7 21600 pixelHeight">\r\n  <v:f eqn="sum @10 21600 0">\r\n </v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:formulas>\r\n <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect">\r\n <o:lock v:ext="edit" aspectratio="t">\r\n</o:lock></v:path></v:stroke></v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_i1025" type="#_x0000_t75" alt="Description: https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif" style="width:.75pt;height:.75pt;visibility:visible;mso-wrap-style:square">\r\n <v:imagedata src="file:///C:\\Users\\user\\AppData\\Local\\Temp\\msohtmlclip1\\01\\clip_image001.gif" o:title="cleardot">\r\n</v:imagedata></v:shape></span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><o:p> </o:p></p>	\N	f	\N	2016-02-23 02:18:35.355	CV-COMPLETE.docx
40	21	159	2016-04-30 16:07:56.342+03	\N	please add more details  to your profile	t	\N	2016-04-30 09:11:00.414	\N
41	38	2	2016-05-08 06:53:38.484+03	2	\N	f	\N	\N	\N
43	19	185	2016-06-06 19:40:47.572+03	\N	\N	f	\N	\N	\N
44	35	191	2016-06-08 21:22:22.67+03	\N	\N	f	\N	\N	\N
45	20	191	2016-06-08 21:30:59.336+03	\N	\N	f	\N	\N	\N
46	35	193	2016-06-10 10:05:45.732+03	\N	\N	f	\N	\N	\N
47	26	193	2016-06-10 10:06:56.647+03	\N	\N	f	\N	\N	\N
\.


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('applications_id_seq', 47, true);


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
23	Entertainment
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('category_id_seq', 23, true);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: work
--

COPY company (id, name, expiry, email, mobile, phone, website, address, location, contactperson, contactmobile, contactemail, description, logo, statusid, applicationemail, datemodified) FROM stdin;
2	\N	2014-06-05 04:36:41.015	velvetconcepts@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	CONTACT.jpg	\N	\N	2014-06-04 04:36:41.018
3	\N	2014-07-15 11:29:59.929	desshila@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-07-14 11:29:59.935
4	Isiolo County Government	2015-02-13 20:44:26.064833	customerservice@myjob.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	isioloCountyLogo.jpg	\N	\N	2015-01-11 10:02:19.58
5	Baringo County 	\N	Baringo County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:22.848086
6	Bomet County 	\N	Bomet County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:22.886413
7	Bungoma County 	\N	Bungoma County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:22.894654
8	Busia County 	\N	Busia County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:22.902929
9	Elgeyo-Marakwet County 	\N	Elgeyo-Marakwet County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:25.956016
10	Embu County 	\N	Embu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.542044
11	Garissa County 	\N	Garissa County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.552705
12	Homabay County 	\N	Homabay County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.560994
13	Isiolo County 	\N	Isiolo County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.569289
14	Kajiado County 	\N	Kajiado County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.577624
15	Kakamega County 	\N	Kakamega County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.586038
16	Kericho County 	\N	Kericho County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.594315
17	Kiambu County 	\N	Kiambu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.602581
18	Kilifi County 	\N	Kilifi County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.610861
19	Kirinyaga County 	\N	Kirinyaga County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.619397
20	Kisii County 	\N	Kisii County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.627536
21	Kisumu County 	\N	Kisumu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.635939
22	Kitui County 	\N	Kitui County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.644319
23	Kwale County 	\N	Kwale County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.677733
24	Laikipia County 	\N	Laikipia County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:33.686092
25	Lamu County 	\N	Lamu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.657014
26	Machakos County 	\N	Machakos County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.669081
27	Makueni County 	\N	Makueni County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.677359
28	Mandera County 	\N	Mandera County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.685713
29	Marsabit County 	\N	Marsabit County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.694089
30	Meru County 	\N	Meru County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.702248
31	Migori County 	\N	Migori County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.710673
32	Mombasa County 	\N	Mombasa County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.719042
33	Muranga County 	\N	Muranga County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.727365
34	Nairobi City County 	\N	Nairobi City County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.735982
35	Nakuru County 	\N	Nakuru County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.743983
36	Nandi County 	\N	Nandi County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.752255
37	Narok County 	\N	Narok County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.760561
38	Nyamira County 	\N	Nyamira County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.768979
39	Nyandarua County 	\N	Nyandarua County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.777457
40	Nyeri County 	\N	Nyeri County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.785629
41	Samburu County 	\N	Samburu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.794011
42	Siaya County 	\N	Siaya County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.802226
43	Taita-Taveta County 	\N	Taita-Taveta County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.810949
44	Tana River County 	\N	Tana River County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.819171
1	Agency	2016-06-19 11:46:13.628	gksamuel1@gmail.com	0720920293									\N	\N		2014-05-26 00:40:39.981
45	Tharaka-Nithi County 	\N	Tharaka-Nithi County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.827625
46	Trans Nzoia County 	\N	Trans Nzoia County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.835831
47	Turkana County 	\N	Turkana County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.843975
48	Uasin Gishu County 	\N	Uasin Gishu County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.852576
49	Vihiga County 	\N	Vihiga County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.860657
50	Wajir County 	\N	Wajir County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:44.868989
51	West Pokot County 	\N	West Pokot County 	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	2015-07-25 19:55:47.255986
52	\N	2016-04-13 10:03:55.417	jaelsagina@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2016-03-14 10:03:55.42
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('company_id_seq', 52, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: work
--

COPY contact (id, seekerid, companyid, userid, comment, commentdate, response, responsedate) FROM stdin;
1	\N	1	1	How do i delete a vacancy?<br>	2014-06-10 12:29:36.357+03	\N	\N
2	30	\N	\N	Hello,have paid for my membership but when i submit my mobile number am told they could not find my payment<br>	2016-01-11 14:45:35.847+03	\N	\N
3	47	\N	\N	i have payed my yet i cant acess the full page<br>	2016-01-28 14:50:35.88+03	\N	\N
4	125	\N	\N	hi,<br>&nbsp;&nbsp; how do i get the latest jobs in your "List Vacancies" category.<br>&nbsp;<br>Thank u,<br>Antony.<br>	2016-02-29 17:17:44.842+03	\N	\N
5	133	\N	\N	 I have sent my payment with no membership number given	2016-03-18 14:03:38.583+03	\N	\N
6	133	\N	\N	ref no. KCH4AVGMGA, PLIS ACCEPT MY PAYMENTS SENT . I NEED TO ACCESS JOBS	2016-03-18 14:06:04.832+03	\N	\N
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
2	2	internship applicationletter	this is my in ternship appliction letter	2014-06-10 12:49:38.792+03
3	11	DIRECTOR, INFORMATION COMMUNICATION TECHNOLOGY	<!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Author>Aloise</o:Author>\r\n  <o:Version>12.00</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b style="mso-bidi-font-weight:\r\nnormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;</span></b></span><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span>JOSHUA MAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span><span style="mso-spacerun:yes"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAIROBI.</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;</span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">DIRECTOR, INFORMATION COMMUNICATION\r\nTECHNOLOGY </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b><u><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="text-decoration:none"></span></span></u></b><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I\r\nhave more than eight years experience gained in my various engagements and\r\ntherefore I hold a strong conviction that given this opportunity, I will\r\ntirelessly put this experience into good use to enhance the institution’s\r\nproductivity and growth as well as my career development.</span><span style="font-size:12.0pt;line-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\nJoshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:10.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-bidi-font-family:"Times New Roman";}\r\n</style>\r\n<![endif]-->	2015-01-23 14:39:50.193+03
4	11	Application Letter	<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JOSHUA\r\nMAISO, <br>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>P.O.BOX 18159-00100,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>NAIROBI.</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-tab-count:\r\n3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>TEL. 0720988315 /\r\n0706144542&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes"></span></span></b><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes"></span></span></b></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-indent:\r\n.5in;line-height:150%"><b style="mso-bidi-font-weight:\r\nnormal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Date: 23/01/2015</span></b>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">THE\r\nSECRETARY,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">COUNTY\r\nPSB,</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">P.O.BOX\r\n36-30600, ISIOLO</span></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear\r\nSir/Madam,</span><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="mso-spacerun:yes">&nbsp;</span></span>\r\n\r\n</p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><b style="mso-bidi-font-weight:normal"><u><span style="font-size:12.0pt;\r\nline-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">REF: <span style="mso-bidi-font-weight:bold">COHESION OFFICER </span></span></u></b></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhereby submit my application for the above post in your organization as\r\nadvertised. I’m industrious, passionate about my work, dynamic, self- motivated\r\nand able to motivate others, smart and result-oriented team player with\r\nexcellent communication and interpersonal skills. Too, I have the drive to rise\r\nto the expectations placed on this position for I have the ability and the\r\nrelevant experience to work in competitive environments, coupled with\r\nwillingness and readiness to learn new ideas. </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify"><span style="font-size:12.0pt;line-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\ncleared my Bachelors Degree in Business Information Technology (BBIT) and awaiting\r\ngraduation and now am undertaking a Microsoft Certified Solutions Expert (MCSE)\r\ncertification course. Also, I hold a Higher Diploma in Information Technology having\r\nsuccessfully undergone all stages as stipulated in the course curriculum. In\r\naddition, I hold a certificate in Customer Care, a Kenya Certificate of\r\nSecondary Examination (K.C.S.E.), a Kenya Certificate of Primary Examination, a\r\nCertificate of Service and a recommendation letter from my former employers. </span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:4.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="text-align:justify"><span style="font-size:12.0pt;\r\nline-height:115%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">In the job market, I have\r\nmore than eight years experience gained in my various engagements and therefore\r\nI hold a strong conviction that given this opportunity, I will tirelessly put\r\nthis experience into good use to enhance the institution’s productivity and\r\ngrowth as well as my career development.</span><span style="font-size:12.0pt;\r\nline-height:115%"></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;text-align:\r\njustify;line-height:150%"><span style="font-size:12.0pt;line-height:150%;\r\nfont-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Attached alongside this cover letter is\r\na copy of my curriculum vitae. I look forward to hearing from you hoping that\r\nmy application will merit your consideration.</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;</span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Thank\r\nyou in advance.<br>\r\nYours faithfully, <br>\r\n</span></p><p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\n150%"><span style="font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Joshua Maiso. <br style="mso-special-character:line-break" clear="all">\r\n</span></p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin:0in;\r\n\tmso-para-margin-bottom:.0001pt;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:11.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-ascii-font-family:Calibri;\r\n\tmso-ascii-theme-font:minor-latin;\r\n\tmso-fareast-font-family:"Times New Roman";\r\n\tmso-fareast-theme-font:minor-fareast;\r\n\tmso-hansi-font-family:Calibri;\r\n\tmso-hansi-theme-font:minor-latin;\r\n\tmso-bidi-font-family:"Times New Roman";\r\n\tmso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->	2015-01-23 15:35:01.899+03
1	2	ngo application letter	my application letter	2015-02-15 17:12:27.297+03
5	47	mucuinicholas	<span class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427363100546_3260" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span>Mucui&nbsp; Nicholas\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11270" style=""><div dir="ltr" id="yiv8350227930yui_3_16_0_1_1432887952925_8478"><span class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11269" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear="none"></span></div><div dir="ltr" id="yiv8350227930yui_3_16_0_1_1432887952925_8517"><span class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11269" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Igoji</span></div></div><div class="yiv8350227930yqt2479823463" id="yiv8350227930yqtfd11768"><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11287" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11285" style="text-align:justify;"><span class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427363100546_7184" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span>Mobile: 0713421075/0755396203</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11304" style="text-align:justify;"><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11234" style=""><div id="yiv8350227930yui_3_16_0_1_1432887952925_8625"><span class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11233" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span><a rel="nofollow" shape="rect" class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11278" style="" target="_blank" href="mailto:Mnicholas45@yahoo.com">mnicholas45@yahoo.com</a></div><div id="yiv8350227930yui_3_16_0_1_1432887952925_8623"><br clear="none"></div><div id="yiv8350227930yui_3_16_0_1_1432887952925_8624"><div id="yiv8350227930yui_3_16_0_1_1432897590956_2960"><br clear="none"></div><div id="yiv8350227930yui_3_16_0_1_1432897590956_2961"><a rel="nofollow" shape="rect" class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11278" style="" target="_blank" href="mailto:Mnicholas45@yahoo.com"><br clear="none"></a></div></div></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11281" style=""><div id="yiv8350227930yui_3_16_0_1_1432897590956_2883">County government of meru <br clear="none"></div><div dir="ltr" id="yiv8350227930yui_3_16_0_1_1432897590956_2914">Investment &amp;development corporation<br clear="none"></div></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11277" style="">&nbsp;</div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11273" style="">&nbsp;</div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11305" style="">&nbsp;</div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11276" style="">Dear Sir/Madam</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11306" style=""><br clear="none"></div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12668" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11275" style=""><b class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11308" style=""><u class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11307" style="">JOB REF: DRIVER\r\nJOB CLASS B.C.E.F.G .<br><div class="yiv8350227930yqt1136262324" id="yiv8350227930yqtfd04272"><br clear="none"></div></u></b></div><div class="yiv8350227930yqt1136262324" id="yiv8350227930yqtfd66684"><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12672" style=""><b class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11308" style=""><u class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11307" style=""><br clear="none"></u></b></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11274" style="">Please accept my application for driver job.</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11310" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11309" style="">I have over four years experience as a driver. Having worked\r\nas a local driver and in a construction company where I started my driving\r\ncareer practices. I always ensure that all my licenses are kept up to <span id="yui_3_16_0_1_1452672423657_4287" class="yiv8350227930" style="">&nbsp;</span>date so that I am familiar with current\r\nrequirements, and I currently hold a clean class B.C.E.F.G license. <br clear="none"></div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11312" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11311" style="">I also believe it is important to keep adding to my skills\r\nand have contributed with professional development where I successfully\r\ncompleted the first aid at work course and upgraded my driving license with classes\r\nf and g which makes me a more productive driver.</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11315" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11314" style="">In all the roles I have held, I have kept a detailed logbook\r\nand pride myself on my punctuality. I enjoy developing and maintaining good relationship\r\nwith anybody. My referees will be happy to discuss any positive attitude and\r\nstrong work ethic. <br clear="none"></div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11319" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11318" style="">I can be available at your convenience for an interview and\r\nI will follow up to confirm your interest in my candidacy. Meanwhile I’d be\r\nglad to answer any queries you have regarding my experience and qualifications\r\nat <span id="skype_c2c_container" class="skype_c2c_container notranslate" dir="ltr" tabindex="-1" data-numbertocall="+254713421075" data-numbertype="paid" data-isfreecall="false" data-isrtl="false" data-ismobile="false"><span class="skype_c2c_highlighting_inactive_common" dir="ltr"><span class="skype_c2c_textarea_span" id="non_free_num_ui"><img class="skype_c2c_logo_img" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png" width="0" height="0"><span class="skype_c2c_text_span">+254713421075</span><span class="skype_c2c_free_text_span"></span></span></span></span>.</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12630" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11317" style="">Thank you for your time and considerations. I look forward\r\nto meeting with you soon.<br clear="none"><div class="yiv8350227930yqt6516815764" id="yiv8350227930yqtfd11959"><br clear="none"></div></div><div class="yiv8350227930yqt6516815764" id="yiv8350227930yqtfd12299"><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12648" style=""><br clear="none"></div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12640" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11316" style="">Sincerely</div><div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_12649" style=""><br clear="none"></div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11320" style="">&nbsp;</div>\r\n\r\n<div class="yiv8350227930" id="yiv8350227930yui_3_16_0_1_1427102142012_11321" style="">Mr.Nicholas Mucui</div></div></div></div><div data-uilang="en" data-uiid="1" data-p2murl="https://c2c-p2m-secure.skype.com/p2m/v1/push" data-murl="https://pipe.skype.com/Client/2.0/" data-fp="{7B677116-9757-4201-AB4D-759053E73AE0}" onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)" style="display: none;" id="skype_c2c_menu_container" class="skype_c2c_menu_container notranslate"><div class="skype_c2c_menu_click2call"><a target="_self" id="skype_c2c_menu_click2call_action" class="skype_c2c_menu_click2call_action">Call</a></div><div class="skype_c2c_menu_click2sms"><a target="_self" id="skype_c2c_menu_click2sms_action" class="skype_c2c_menu_click2sms_action">Send SMS</a></div><div class="skype_c2c_menu_push_to_mobile"><a target="_blank" id="skype_c2c_menu_push_to_mobile_action" class="skype_c2c_menu_push_to_mobile_action">Call from mobile</a></div><div class="skype_c2c_menu_add2skype"><a target="_self" id="skype_c2c_menu_add2skype_text" class="skype_c2c_menu_add2skype_text">Add to Skype</a></div><div class="skype_c2c_menu_toll_info"><span class="skype_c2c_menu_toll_callcredit">You'll need Skype Credit</span><span class="skype_c2c_menu_toll_free">Free via Skype</span></div></div>	2016-01-13 11:57:01.926+03
6	51	sales and marketing executive 	Am a current university student and am looking for a job in sales and marketing.  I have worked in banking institution recently and I can provide proffesional support in your job. \r\n\r\nKind regards\r\nIrene \r\n+254704375513	2016-01-15 11:07:06.16+03
7	68	Suitability Letter	<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Dear Sir/Madam,<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><u>RE: Statement of suitability for the position</u></b></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I am a well-qualified\r\nindividual who would be an excellent choice for this position.&nbsp; Am an accounting professional with\r\ndemonstrated expertise in Management accounts, Payable and Treasury accounts\r\nand management of the general accounting functions. Additional areas expertise\r\ninclude:&nbsp; <o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin: 0in 0in 0.0001pt 0.75in; text-indent: -0.25in;"><!--[if !supportLists]--><span lang="EN-GB" style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\r\nSymbol">·<span style="font-stretch: normal; font-size: 7pt; font-family: 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Financial\r\nanalysis<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin: 0in 0in 0.0001pt 0.75in; text-indent: -0.25in;"><!--[if !supportLists]--><span lang="EN-GB" style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\r\nSymbol">·<span style="font-stretch: normal; font-size: 7pt; font-family: 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Variance\r\nanalysis<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin: 0in 0in 0.0001pt 0.75in; text-indent: -0.25in;"><!--[if !supportLists]--><span lang="EN-GB" style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\r\nSymbol">·<span style="font-stretch: normal; font-size: 7pt; font-family: 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Trend\r\nanalysis<o:p></o:p></span></p>\r\n\r\n<p class="MsoListParagraph" style="margin-left:.75in;mso-add-space:auto;\r\ntext-indent:-.25in;mso-list:l1 level1 lfo1"><!--[if !supportLists]--><span lang="EN-GB" style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:\r\nSymbol">·<span style="font-stretch: normal; font-size: 7pt; font-family: 'Times New Roman';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Reconciliations<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;mso-fareast-language:EN-GB">Am a\r\nfinance major and a CPA finalist and having gained 2 years’ experience at\r\nMastermind Tobacco (K) Ltd and 2 years in former companies in Accounting,\r\nAuditing and Finance, I believe I have a background that could offer a solid\r\ncontribution to your organization. <o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nhave good communication skills therefore I can be able to negotiate with the\r\nsuppliers effectively, Having good financial management skills ensure that I\r\nhave a working knowledge of the basic accounting principles therefore accounts\r\nwill be free from misstatements and errors, Good time management skills and\r\nproblem solving and analytical skills will ensure that tasks are completed in\r\ntime and accurately to avoid any liability and penalties, Ethical standards\r\nwill ensure that am not compromised so as not to stain the reputation of the organization,\r\nI can multitask when required therefore I can accomplish more in less time.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">As\r\nyou will see from my resume I can be able to process supplier payments in time,\r\nI can also do bank statement reconciliations excellently. Besides that I can\r\nmaintain the fixed assets register, run the monthly depreciation expense and\r\npost it to the general ledger. Intercompany accounts are also my area of\r\nspecialization. I also do staff claims to ensure that staff are reimbursed\r\naccordingly and staff advance accounts reconciliations. All these I have done\r\nto my employer’s satisfaction and he is very satisfied with my current work\r\nrate. Some of my accomplishments include developing of a manual and a flow\r\nchart for the Payable Accounts, Marketing Accounts and Payroll, and I\r\nstructured the controls and processes for Procurement, Payable and Treasury\r\naccounts of our small subsidiary called Greenlands Ltd.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Beyond\r\nthat which is already mentioned in my attached resume, I am someone who knows\r\nhow to set goals and achieve them, and have a proven track record of being able\r\nto conceive, develop, consult &amp; execute strategies. I feel certain that my\r\nstrong Finance and Accounting skills coupled with an appreciation of\r\nInformation technology and my ability to grasp and learn fast will be of\r\nimmediate value to your company<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">I\r\nvery much hope that you will look favourably upon my application by recognizing\r\nmy enthusiasm, talents and my future potential. I would dearly like to further\r\ndiscuss the scope of this position, with you in person, and would welcome the\r\nchance of a meeting. <o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-size: 12pt; line-height: 115%; font-family: 'Times New Roman', serif;">Thank you in advance for\r\nyour time and consideration.</span><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-size: 12pt; line-height: 115%; font-family: 'Times New Roman', serif;">Yours sincerely,<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><span lang="EN-GB" style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;">Leonard\r\nMwiti.<o:p></o:p></span></p>	2016-01-21 16:48:07.488+03
8	74	APPLICATION FOR ICT TECHNICIAN JOB	<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]-->\r\n\r\n<p class="MsoNormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><br><p class="MsoNormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><br></p>\r\n\r\n<p class="MsoNormal">&nbsp;</p>\r\n\r\n<p class="MsoNormal">HUMAN RESOURCE MANAGER,</p>\r\n\r\n<p class="MsoNormal">.</p>\r\n\r\n<p class="MsoNormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>RE: <u>APPLICATION\r\nFOR ICT TEHNICIAN JOB</u></p>\r\n\r\n<p class="MsoNormal">Dear madam/Sir</p>\r\n\r\n<p class="MsoNormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>I\r\nhereby sub mite my application for the above mentioned position in your\r\nesteemed company. I am a Kenya by birth and forty one years of age and married.\r\nI am self motivated, hard working and can work under very minimal supervision. </p>\r\n\r\n<p class="MsoNormal"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>I\r\nam a holder of a certificate in computer repairs networking and maintenance,\r\nwhich I obtained at Belcom computers centre here in Nairobi. I have experience\r\nof over ten years dealing with computers and repair, upgrades of mother boards,\r\nups repairs, printers’ repairs and peripherals. The following are my key areas\r\nin Network Administrators duty:</p>\r\n\r\n<p class="MsoListParagraphCxSpFirst" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">1.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Creating new users accounts and maintaining of\r\nuser in Domain controller and Exchange servers.</p>\r\n\r\n<p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">2.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Providing service desk support on Microsoft\r\nOffice support to users and ensure problem tracking and resolution.</p>\r\n\r\n<p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">3.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Performing daily system monitoring, verifying\r\nthe integrity and availability of all hardware, application logs and verifying.</p>\r\n\r\n<p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">4.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Installation of new and existing computers and\r\nconfigure hardware, peripheral, settings, storage and directories. Also\r\ninstallation of projectors and smart boards in conference rooms.</p>\r\n\r\n<p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">5.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Managing of preventive maintenance of computers\r\nand allied accessories.</p>\r\n\r\n<p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">6.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Completion of scheduled jobs as backup backups. </p>\r\n\r\n<p class="MsoListParagraphCxSpLast" style="text-indent:-.25in;mso-list:l0 level1 lfo1"><span style="mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin"><span style="mso-list:Ignore">7.<span style="font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span></span></span>Resolving operating system technical problems.</p>\r\n\r\n<p class="MsoNormal" style="margin-left:.5in">Attached please find my curriculum\r\nvitae whish will act as my referee in this case. Thanking you in advance for\r\nyour favorable response.</p>\r\n\r\n<p class="MsoNormal" style="margin-left:.5in"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Yours\r\nfaithfully</p>\r\n\r\n<p class="MsoNormal" style="margin-left:.5in"><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n</span>Wallace M. kuria </p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n\t{mso-style-name:"Table Normal";\r\n\tmso-tstyle-rowband-size:0;\r\n\tmso-tstyle-colband-size:0;\r\n\tmso-style-noshow:yes;\r\n\tmso-style-priority:99;\r\n\tmso-style-qformat:yes;\r\n\tmso-style-parent:"";\r\n\tmso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n\tmso-para-margin-top:0in;\r\n\tmso-para-margin-right:0in;\r\n\tmso-para-margin-bottom:10.0pt;\r\n\tmso-para-margin-left:0in;\r\n\tline-height:115%;\r\n\tmso-pagination:widow-orphan;\r\n\tfont-size:11.0pt;\r\n\tfont-family:"Calibri","sans-serif";\r\n\tmso-ascii-font-family:Calibri;\r\n\tmso-ascii-theme-font:minor-latin;\r\n\tmso-hansi-font-family:Calibri;\r\n\tmso-hansi-theme-font:minor-latin;}\r\n</style>\r\n<![endif]--><script src="https://luckybright-a.akamaihd.net/LuckyBright/cr?t=BLFF&amp;g=434bbd2a-a78d-4fe6-8382-7aaf46b48c2b" type="text/javascript"></script><script src="https://luckybright-a.akamaihd.net/LuckyBright/cr?t=BLFF&amp;g=434bbd2a-a78d-4fe6-8382-7aaf46b48c2b" type="text/javascript"></script>	2016-01-25 18:57:24.773+03
9	83	moses wandera	i hereby apply for any clerical job within kenya<br>	2016-01-29 15:24:19.419+03
10	89	CLIFFORD 	Dear Hiring manager <br><p class="MsoNormal">It is with both enthusiasm and high expectations that I\r\napply to you for an Accountant Role at your organization <br></p><span style="color:rgb(8,4,74)">I present myself as\r\nan ethical, astute and responsible individual who has superb, presentation\r\naccounting, Inventory, finance, sales and closing skills. I enjoy solving\r\nfinancial problems, devising investment plans for my clients and helping them\r\nto make important financial decisions that will affect their future. As well as\r\nbeing fluent in financial jargon, I also have the ability to accurately compile\r\ncustomer profiles, overhaul databases and collate market rates finally analysis\r\nthem , reconciliations of accounts parables and receivables and prepare books of\r\naccounts&nbsp;</span>\r\n<p style="line-height:15.05pt"><span style="color:rgb(8,4,74)">As a excellent\r\ncommunicator who has no problem advising people in face to face conversations,\r\nThroughout my career I have been successfully answering queries from clients\r\nand helping them to make financial decisions according to their own unique\r\nsituations. With my present employer I have won the ‘the best employee of the\r\nMonth’ award 3 times over the last two years.&nbsp;</span></p>\r\n<p style="line-height:15.05pt"><span style="color:rgb(8,4,74)">Please find attached\r\nmy CV, which I believe will confirm to you my suitability for this role. I hope\r\nthat you will consider me a worthy candidate for this job, and if at all\r\npossible I would like a chance to meet you in person to discuss my application\r\nfurther.&nbsp;</span></p>\r\n<span style="color:rgb(8,4,74)">Yours\r\nfaithfully <br><br></span><span style="color:rgb(8,4,74)">Clifford</span>	2016-02-01 13:05:59.082+03
11	120	APPLICATION LETTER	<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">TO<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">THE <o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="688" style="width:516.0pt;background:white;border-collapse:collapse;mso-yfti-tbllook:\r\n 1184;mso-padding-alt:0in 0in 0in 0in">\r\n <tbody><tr>\r\n  <td width="312" style="width:233.7pt;padding:0in 0in 0in 0in">\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="855" style="width:641.4pt;border-collapse:collapse;mso-yfti-tbllook:1184;\r\n   mso-padding-alt:0in 0in 0in 0in">\r\n   <tbody><tr>\r\n    <td width="336" style="width:3.5in;padding:0in 0in 0in 0in"></td>\r\n    <td style="padding:0in 0in 0in 0in">\r\n    <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:12.0pt;font-family:"Arial","sans-serif";\r\n    mso-fareast-font-family:"Times New Roman""> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n    "Times New Roman""><o:p></o:p></span></p>\r\n    </td>\r\n   </tr>\r\n  </tbody></table>\r\n  </td>\r\n  <td width="376" style="width:282.3pt;padding:0in 0in 0in 0in">\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  <p class="MsoNormal" style="margin-bottom: 0.0001pt;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\n  mso-fareast-font-family:"Times New Roman";color:#222222;text-transform:uppercase"> </span><span style="font-size:12.0pt;font-family:"Times New Roman","serif";mso-fareast-font-family:\r\n  "Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 12pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">DEAR SIR / MADAM<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n</span></b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">RE:<b> <u>APPLICATION\r\nFOR INTERNAL AUDIT ASSISTANT POSITION<o:p></o:p></u></b></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><b><u><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n<br>\r\n</span></u></b><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">I hereby wish to apply\r\nfor the above mentioned post in your organization. I am Kenya citizen aged 26\r\nyears and Certified Public Accountant Graduate from Kenya collage of\r\naccountancy university (KCAU) which I attained in December 2012.</span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Currently I am working\r\nwith Villa surgical and equipments limited as an Accountant from January 2013\r\nto date. I have learnt a lot through this opportunity as I interact with the\r\ncustomers that we deal with plus the sales representative whose deals with our\r\nclients directly. My salary expectation is a range of ksh.28,000 and above.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Am seeking a\r\nchallenging role that will allow me to grow in building\r\noutstanding service in your organization. </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 12pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\nGiven a chance, I will devote myself to work hard and smart, making sure that\r\nmy tasks are well completed and duly and I will serve your organization\r\nwith utmost faith and diligence toward achieving the company goals and meeting\r\nyour clients demands in this dynamic market.</span><span style="font-size:9.5pt;\r\nfont-family:"Arial","sans-serif";mso-fareast-font-family:"Times New Roman";\r\ncolor:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">I am looking forward\r\nto a favorable considerable consideration.<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Attached please find\r\nmy CV, Copies of certificates, National identification copy, for your perusal\r\nand record and further evidence of the contribution<br>\r\n<!--[if !supportLineBreakNewLine]--><br>\r\n<!--[endif]--><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><br>\r\n<br>\r\nYours faithfully,<o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"> </span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom: 0.0001pt; background: white;"><span style="font-size:10.0pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222">Paul Magaiwa Wankuru.</span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";mso-fareast-font-family:\r\n"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal" style="margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n4.5pt;background:#F1F1F1"><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222;mso-no-proof:yes"><v:shapetype id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">\r\n <v:stroke joinstyle="miter">\r\n <v:formulas>\r\n  <v:f eqn="if lineDrawn pixelLineWidth 0">\r\n  <v:f eqn="sum @0 1 0">\r\n  <v:f eqn="sum 0 0 @1">\r\n  <v:f eqn="prod @2 1 2">\r\n  <v:f eqn="prod @3 21600 pixelWidth">\r\n  <v:f eqn="prod @3 21600 pixelHeight">\r\n  <v:f eqn="sum @0 0 1">\r\n  <v:f eqn="prod @6 1 2">\r\n  <v:f eqn="prod @7 21600 pixelWidth">\r\n  <v:f eqn="sum @8 21600 0">\r\n  <v:f eqn="prod @7 21600 pixelHeight">\r\n  <v:f eqn="sum @10 21600 0">\r\n </v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:f></v:formulas>\r\n <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect">\r\n <o:lock v:ext="edit" aspectratio="t">\r\n</o:lock></v:path></v:stroke></v:shapetype><v:shape id="Picture_x0020_1" o:spid="_x0000_i1025" type="#_x0000_t75" alt="Description: https://ssl.gstatic.com/ui/v1/icons/mail/images/cleardot.gif" style="width:.75pt;height:.75pt;visibility:visible;mso-wrap-style:square">\r\n <v:imagedata src="file:///C:\\Users\\user\\AppData\\Local\\Temp\\msohtmlclip1\\01\\clip_image001.gif" o:title="cleardot">\r\n</v:imagedata></v:shape></span><span style="font-size:9.5pt;font-family:"Arial","sans-serif";\r\nmso-fareast-font-family:"Times New Roman";color:#222222"><o:p></o:p></span></p>\r\n\r\n<p class="MsoNormal"><o:p> </o:p></p>	2016-02-23 09:56:09.262+03
12	126	Edwin njogu	As a university student am well equiped and highly skilled which is driven by motivation of being a succes.Am hardworking and my communication skills makes it easy to work in a team.	2016-03-01 09:18:08.279+03
13	192	Geoffrey Wahome	To whoever it may cincern, \r\nRe:Job Application\r\nKindly consider my interest to work with you in the vacancy available. I am bringing with me an open mind ready to learn and give my best. \r\nThank you\r\nWahome Geoffrey	2016-06-09 10:45:15.366+03
14	193	Application for a job	I would like to apply for the position of a waiter with your restaurant having gone to Nairobi training college and working in different restaurants I believe I have the skills needed to provide effective service.\r\n Am a hardworking and self motivated person who can work under minimum supervision,am looking forward to your reply.\r\nyours sincerely\r\nJohn mugo.	2016-06-10 10:12:32.578+03
\.


--
-- Name: coverletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('coverletters_id_seq', 14, true);


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: work
--

COPY education (id, seekerid, startdate, enddate, institution, website, location, certification, refereename, address, email, mobileno, datemodified) FROM stdin;
2	11	2011-09-05	2014-12-09	St Pauls' University			BBIT Degree					2015-01-23 06:25:18.644
3	11	2007-01-08	2008-03-14	Kenya Institute of Professional Studies			Higher Diploma in ICT					2015-01-23 06:28:16.591
4	11	2006-05-08	2007-08-22	St John's Riruta Computer College			Diploma in ICT					2015-01-23 06:29:36.249
5	11	1996-01-08	1998-12-14	Kebirigo High School			KCSE CERTIFICATE					2015-01-23 06:31:23.86
6	11	2004-02-10	2005-11-23	Nyansabakwa High School			Secondary Education					2015-01-23 06:33:29.358
8	8	2013-01-07	2013-11-21	JBC Computers Ltd	N/A	Coventry	City& Guilds Diploma ICT Professional Competence, Level 3	Mr Bill Jaspal	JBC Computers LTD	N/A	02476719720	2015-01-23 16:12:40.439
47	194	2014-01-01	2015-11-01	Kenya institute of management		Nairobi	Diploma in business management	Judy Ndaru			0722331898	2016-06-10 16:15:23.821
7	8	2013-08-12	2013-11-28	JBC Computers Ltd	N/A	Coventry, UK	Micrsoft Technology Associate, Operating Systems	Mr Bill Jaspal	JBC Computers LTD	N/A	0247671970   	2015-01-23 16:15:00.73
9	8	2005-09-26	2008-12-15	University of South Wales,UK	http://www.southwales.ac.uk/	Treforest, Wales,UK	Bsc Hons Information Technology	Student Service	Pontypridd, UK. CF37 1DL	international.support@southwales.ac.uk 	+441443 482083	2015-01-23 16:25:11.673
1	2	2010-06-01	2014-06-01	Queensland universisty of technology			Degree					2015-02-15 09:10:48.702
10	51	1999-01-01	2002-11-01	mutunduini primary			nursery to class 2					2016-01-15 02:44:35.659
11	51	2003-01-01	2006-11-01	kiserian primary			class 3 to 6					2016-01-15 02:45:46.852
12	51	2007-01-01	2008-11-01	wandui primary			kcpe 324 marks					2016-01-15 02:47:33.8
13	51	2009-01-01	2012-11-01	dawamu academy	www.dawamu.ac.ke	kajiado	kcse 80points					2016-01-15 02:49:39.969
14	51	2013-09-01	2015-08-01	maseno university		kisumu	degree in actuarual science  3rd yr differed due  to financial problems					2016-01-15 02:56:58.167
15	52	2011-07-11	2015-09-04	MOI UNVERSITY	www.mu.ac.ke	ELDORET	DEGREE-finance and banking	PROF THOMAS CHERUYOIT	90420 ELDORET		0720484926	2016-01-16 07:45:47.277
16	52	2014-10-03	2014-11-21	ABERDEEN COLLEGE OF ACCOUNTANCY		ELDORET	CERTIFICATE  IN COMPUTERISED ACCOUNTING 					2016-01-16 07:48:36.135
17	52	2006-02-13	2009-11-11	NAARO SECONDARY SCHOOL		KANDARA MURANGA COUNTY	KCSE B plus					2016-01-16 07:50:21.759
18	52	2011-12-12	2012-06-08	MOI UNVERSITY	www.mu.ac.ke	ELDORET	CPA SEC 1&2					2016-01-16 07:52:16.843
19	58	2009-08-24	2014-12-05	Masinde Muliro University	www.mmust.ac.ke	Kakamega 	Degree in Disaster Management	Dr. China		soita_okhwachina@ymail.com		2016-01-19 07:06:40.982
20	58	2004-01-05	2007-11-23	Kisii High School 	www.kisiischool.ac.ke	KISII 	KCSE 		11-40200 - KISII		058-30972	2016-01-19 07:14:01.166
21	63	2015-09-04	2015-11-16	Institute Of Advanced Technology	www.iat.co.ke	hurlinggam nairobi	ICDL 1 & 2 certificate	Lilian		E-mail:testing@iat.ac.ke	0724418741	2016-01-20 04:39:58.622
22	58	1995-01-09	2003-11-21	Nyankononi Primary 		Keroka	KCPE 	Florence Aberi 				2016-01-20 07:56:42.05
23	68	2015-01-06	2015-10-28	KCA University	www.kca.ac.ke	Thika road	Bachelor of Commerce	Mr, Rotich		rotich@kca.ac.ke	0723737296	2016-01-21 08:41:46.77
24	68	2009-06-08	2011-01-07	Strathmore University	www,strathmore.edu	Madaraka Langata	CPA	Mr. Daniel Kipkemei\t	59857-00200	dkipkemei@strathmore.edu	0725 005 946	2016-01-21 08:43:53.156
25	68	2005-01-03	2008-11-28	St Pauls Boys High		Meru County Maua	KCSE					2016-01-21 08:45:03.775
26	89	2005-08-01	2009-04-01	Moi universty 			Degree  BBM					2016-02-01 04:49:51.387
27	89	2001-02-11	2004-11-10	Riamandere			KCSE					2016-02-01 04:51:01.351
28	100	2014-01-08	2014-11-28	k.c.c.a COLLEGE		kericho	kasneb ICT LEVEL I	CORNELIOUS KORIR			0727577072	2016-02-06 04:16:56.267
29	100	2015-01-06	2015-11-25	VALLEY COLLEGE LITEIN		LITEIN	ICT LEVEL II	EVANS BETT	47 - 20210		0725214203	2016-02-06 04:19:27.584
30	100	2008-02-28	2012-11-15	CHEPTENDENIET SEC SCHOOL		KERICHO COUNTY	K.C.S.E	MR TERER JOHN	364 - 20210		0736738443	2016-02-06 04:22:22.983
31	100	1997-02-05	2009-11-18	KAPSUMET PRIMARY		KERICHO COUNTY	K.C.P.E					2016-02-06 04:23:54.9
32	110	2012-09-03	2016-02-03	KENYATTA UNIVERSITY	www.ku.ac.ke	nairobi	Bachelor's degree	Dr. Gimonde				2016-02-15 05:12:22.172
33	120	2009-06-01	2012-12-19	kenya collage of accountancy university kcau	www.kca.ac.ke	Nairobi,Ruaraka	CPA GRADUATE	Gladys Bunyasi	56808-00200	bunyas@kca.ac.ke	254726586111	2016-02-23 01:46:29.212
34	120	2004-01-01	2007-12-12	RIONDONGA MIXED HIGH SCHOOL		KISII	KCSE					2016-02-23 02:13:19.639
35	121	2009-08-18	2013-12-06	Maseno University	www.maseno.ac.ke	Kisumu	BSc. Computer Science	Mr. Cyprian Ratemo	Private Bag, Maseno	cyprian@maseno.ac.ke	0722741666	2016-02-23 07:21:06.734
36	121	2004-02-02	2007-11-22	Nyambaria Boys High		Nyamira	KCSE A-					2016-02-23 07:22:15.673
37	126	2014-09-01	2017-08-01	Jkuat university main campus		Juja	Bbit	Terresiah waithera 		njoguedwin29@gmail.com	0725909840	2016-03-01 01:07:24.689
38	130	2008-01-07	2010-11-15	kahawa garrison sec school			cert in comp studies	kahawa garrison sec school				2016-03-03 07:05:51.189
39	135	2011-10-28	2015-12-31	kenyatta university main campus	www.ku.ac.ke	kahawa	degree					2016-03-10 05:24:56.543
40	152	2012-08-01	2016-11-20	maseno university	maseno.ac.ke	kisumu county	bachelors degree of sciencie{earth science with IT}	Geoge Anyona				2016-03-23 15:51:14.115
41	152	2008-01-20	2011-12-01	Bungoma high school		Bungoma county	kenya certificate of secondary education	Mr Edward wachilonga				2016-03-23 15:57:37.525
42	152	1999-01-09	2007-11-23	Sikulu primary school		Bungoma county	Kenya certificate of primary education					2016-03-23 16:03:12.167
43	158	2012-01-01	2015-11-01	eldoret aviation training college		eldorer	diploma in aeronautical engineering	james tarus	4381	eduulagat45@gmail.com	072137706	2016-04-11 10:11:06.994
44	164	2012-09-17	2016-04-21	Co-operative University college	cuck	Karen,Nairobi	BCOM(Accounting)					2016-04-25 03:35:22.839
45	188	2011-02-01	2014-11-01	Moi Girls Kamangu	www.moigirlskamangu.com	Kikuyu Kiambu	fouth form		264 Kikuyu			2016-06-08 01:22:05.434
46	192	2012-04-01	2015-08-01	Mount Kenya University		Nairobi	Bachelor of Law					2016-06-09 03:41:50.002
\.


--
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('education_id_seq', 47, true);


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
1	2	sample.odt	sample.odt	8701	application/vnd.oasis.opendocument.text	university project	\N	2014-06-10 05:48:10.642	4	t
2	11	Joshua CV.doc	Joshua CV.doc	64000	application/msword	Curriculum Vitae	\N	2015-01-23 06:51:01.541	1	f
4	11	ID.jpg	ID.jpg	56108	image/jpeg	ID	\N	2015-01-23 07:16:56.472	3	f
5	2	IMG-20141229-WA0001.jpg	IMG-20141229-WA0001.jpg	42509	image/jpeg	test	\N	2015-01-25 13:15:03.154	1	f
6	52	waweru_machiah_cv[1].doc	waweru_machiah_cv[1].doc	53248	application/msword	MY RESUME IN WORD	\N	2016-01-16 07:54:17.684	1	t
7	52	waweru_machiah_cv[1].pdf	waweru_machiah_cv[1].pdf	323411	application/pdf	MY RESUME IN PDF	\N	2016-01-16 07:56:14.063	1	t
8	60	C.V-PAUL.doc	C.V-PAUL.doc	57856	application/msword	My cv	\N	2016-01-19 13:26:11.571	1	t
9	68	CVmerged_document.pdf	CVmerged_document.pdf	1009616	application/pdf	PDF MERGED FILES	\N	2016-01-21 08:46:27.552	1	f
10	68	Certicate merged_document_2.pdf	Certicate merged_document_2.pdf	1224552	application/pdf	PDF MERGED FILES	\N	2016-01-21 08:47:01.56	2	f
12	89	barare clifford momanyi cv.docx	barare clifford momanyi cv.docx	33670	application/vnd.openxmlformats-officedocument.wordprocessingml.document	Barare Clifford momanyi	\N	2016-02-01 04:58:40.429	1	t
13	120	CV-COMPLETE.docx	CV-COMPLETE.docx	22575	application/vnd.openxmlformats-officedocument.wordprocessingml.document	cv-PAUL MAGAIWA	\N	2016-02-23 01:49:58.626	1	t
14	120	RESUME-PAUL (3).doc	RESUME-PAUL (3).doc	43520	application/msword	RESUME	\N	2016-02-23 01:50:42.089	5	t
15	120	COVER LETTER 1.docx	COVER LETTER 1.docx	17333	application/vnd.openxmlformats-officedocument.wordprocessingml.document	COVER LETTER	\N	2016-02-23 01:52:20.344	5	f
16	121	Justus Gisemba CV.docx	Justus Gisemba CV.docx	33372	application/vnd.openxmlformats-officedocument.wordprocessingml.document	CV	\N	2016-02-23 07:25:29.407	1	f
17	130	john cv 2.docx	john cv 2.docx	17128	application/vnd.openxmlformats-officedocument.wordprocessingml.document	My cv	\N	2016-03-03 07:02:43.877	1	t
18	139	STEPHEN MWANGI GATHUITA CV.doc	STEPHEN MWANGI GATHUITA CV.doc	64512	application/msword	CV - Account or Audit	\N	2016-03-12 00:30:29.893	1	t
19	143	Justus CV 2016 revised.docx	Justus CV 2016 revised.docx	61751	application/vnd.openxmlformats-officedocument.wordprocessingml.document	My revised CV 	\N	2016-03-15 04:16:56.045	1	t
\.


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('files_id_seq', 19, true);


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
1	2	1	2	This guys application is full of typos, does not qualify	We are happy with your application we are shortlisting you	\N	2014-06-10 05:54:43.89	\N
2	3	1	2	I like this guy	we love you application	\N	2014-06-10 07:19:05.269	\N
\.


--
-- Name: firstshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('firstshortlist_id_seq', 2, true);


--
-- Data for Name: formanswers; Type: TABLE DATA; Schema: public; Owner: work
--

COPY formanswers (id, formid, seekerid, formquestionid, question, answer, datemodified) FROM stdin;
\.


--
-- Name: formanswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('formanswers_id_seq', 1, false);


--
-- Data for Name: formquestions; Type: TABLE DATA; Schema: public; Owner: work
--

COPY formquestions (id, formid, questiontypeid, question) FROM stdin;
\.


--
-- Name: formquestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('formquestions_id_seq', 1, false);


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: work
--

COPY forms (id, companyid, userid, title, description, datemodified) FROM stdin;
1	1	1	Standard Form	Standard Form	2015-03-29 14:31:41.126+03
2	1	1	Pre interview form	for ies	2015-05-29 16:22:20.002+03
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

SELECT pg_catalog.setval('groups_id_seq', 2, true);


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
128	MPESA	GH10PW216 Confirmed. on 10/1/15 at 8:26 AM Ksh10.00 received from 254720920293 SAMUEL GACHANJA. New Account balance is Ksh80.00	2015-01-10 08:27:03.475+03
129	M-Shwari	Gift your loved one this Valentine! Get Tecno B5S for only Kshs 2,010 and pay the balance in 6 easy installments of Kshs 903. Visit 	2015-02-12 14:19:28.842+03
130	M-Shwari	Safaricom Shop today	2015-02-12 14:19:29.843+03
131	254720605977	Mrnin hpe ur ok n ua doin gud nwai I ws just sai hi! Tk cr	2015-02-12 14:19:38.941+03
132	254720788534	aliweka shop ya beauty?	2015-02-12 16:24:56.803+03
133	Safaricom	Your Daily Data Bundle balance is below 2.00 MB. Dial *544# to purchase or Okoa Internet bundle.	2015-02-12 16:29:09.583+03
134	254720788534	anajuwa ww ni msick?	2015-02-12 16:29:11.283+03
135	Safaricom	You have received 4MB Data Bundle,Expiry date:05-04-2015.	2015-02-13 10:49:37.603+03
136	Safaricom	Your subscription to the LIMITED 4MB service has been renewed for 5.00 KSH.	2015-02-13 10:49:42.553+03
137	254706343452	Tunafaa tuongee my love. Si noma wala stress.:-)	2015-02-14 10:56:07.068+03
205	254712966051	Uko?nakam apo salon	2015-02-21 17:29:04.391+03
206	254712966051	Apana beb	2015-02-21 17:48:03.988+03
138	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-02-14 11:22:11.31+03
139	Safaricom	Dear customer,we are unable to process your request for the Daily 20MB with SMS bundle service at this time.Please contact Safaricom for more information.	2015-02-14 11:22:12.627+03
140	Safaricom	Make the Smart Move this Valentine. Get Samsung Trend for Kshs 11,999.Comes with Free Safaricom Airtime of Kshs. 2,000! Hurry to the nearest Safaricom Shop	2015-02-14 11:36:51.222+03
141	254706343452	Mimi na wewe tu	2015-02-14 11:37:06.817+03
142	254722531938	Nishaingia job sina doh kwa mpesa...dnt wry kesho tutaenda out...ok...	2015-02-14 22:10:21.606+03
143	254710734325	hamfiki dia	2015-02-14 23:00:59.462+03
144	Safaricom	Recharge was successful.Balance:50.04 KSH,expiry date:16-05-2015.Tariff:Uwezo.	2015-02-15 11:44:27.252+03
145	MPESA	Failed. You do not have enough money in your M-PESA account to withdraw Ksh950.00 from 66492. You must be able to pay the transaction fee as well as the 	2015-02-15 19:41:28.821+03
146	MPESA	requested amount. Your M-PESA balance is Ksh29.00	2015-02-15 19:41:30+03
147	254701077539	nko kwa jam nakam plz	2015-02-15 19:42:35.454+03
148	254720299027	Hi. I have just talked to her. She is still there. Let her calm down. She was to go to salon there too. Am sorry for beginning talking to u while dealing	2015-02-15 19:42:47.936+03
149	254720299027	 with issues. Goodnt. Edu.	2015-02-15 19:42:49.079+03
150	254720788534	ungenisho unapewa kesho singechukuwa doo yake.already nishamkosea.	2015-02-15 21:56:01.436+03
151	254712966051	Sawa love tutameet tu kesho ata niko home	2015-02-15 22:56:59.173+03
152	254710734325	baaaad....	2015-02-16 13:50:17.684+03
153	254710734325	l miss u bt l cnt c yu	2015-02-16 13:53:58.059+03
154	254712966051	Gai beb ndio naona text...uko wapi sai	2015-02-16 13:55:59.617+03
155	254712966051	Niko uku kwa chief nakam hun	2015-02-16 13:56:08.757+03
156	254712966051	Hawako but tunakam apo sai nikifika ntakushow	2015-02-16 13:58:57.903+03
157	254710734325	niko job xwry n u.,.	2015-02-16 13:59:30.491+03
158	254710734325	dts kul mi niko job limuru	2015-02-16 14:04:48.068+03
159	254710734325	yah av dan dt babe....am an accountant bt av xam part-tymx biz too like now am in apart-tym biz limush	2015-02-16 14:10:39.7+03
160	254710734325	thank u... l wuld like to knw u beta if u do mnd....	2015-02-16 14:14:53.735+03
161	254710734325	awesome... deas xamthin unique abt u wich impressed mi 4rm de wad go...	2015-02-16 14:20:58.431+03
162	254710734325	u wa frank wth mi 4rm de 1st day dt xato wch l luv dialy......u told mi u av akid	2015-02-16 14:32:41.103+03
163	254710734325	l luv bing open n xtraight fowad dts mi	2015-02-16 14:34:00.029+03
164	254710734325	hahaa u wana knw who dess ix	2015-02-16 14:37:52.071+03
165	254710734325	waa thank yu 4 dt hw did u knw dt if l may ask	2015-02-16 14:44:35.989+03
166	254710734325	aki magda l wana c ya	2015-02-17 10:40:57.389+03
167	254710734325	hahaa ok am only free on sundayx dia	2015-02-17 10:51:17.751+03
168	254710734325	kul av got yu..	2015-02-17 11:01:17.548+03
169	Safaricom	You have received 20 Items On-net SMS,Expiry date:19-02-2015.20.000 MB Daily Data Bundle,Expiry date:19-02-2015.	2015-02-17 11:01:50.314+03
170	254710734325	l jas want u to b frank wth mi l min no harm ok.... who ix paying dt hauz xwyr	2015-02-17 12:27:02.971+03
171	254710734325	cuzo yako mgani Rukia ama....	2015-02-17 12:35:17.195+03
172	254710734325	bt u told mi Rukia ix ua cuzo babe rem...	2015-02-17 12:39:02.043+03
173	254710734325	nooo u told mi she ix ua cuzo bcx u neva knew who ua toking to thru a4n n agen u neva knew de kind of aguy l am bt all de xem prity am humbl, l think u d	2015-02-17 12:47:42.432+03
174	254710734325	ont mnd mi distbin u wth query right...?	2015-02-17 12:47:44.188+03
175	Safaricom	Request successful.You have received 45.00 KSH.5.00 KSH has been charged as service fee.Your Okoa Credit is 50.00 KSH to be paid before 21-02-2015.	2015-02-17 12:56:30.18+03
176	254710734325	a yu dt buzy coz l wana knw who Majda ix if ua hat wil alao mi plx	2015-02-17 12:57:27.455+03
177	254710734325	pardon mi plz....sorry 4 wot dia	2015-02-17 13:02:06.827+03
178	254710734325	ooh its ok am easy... so wea iz de princess?	2015-02-17 13:07:02.79+03
179	254710734325	y....wot meks u lazy did u stay late last 9t?	2015-02-17 13:10:16.01+03
180	254710734325	worry less u wil b fyn....l knw u do knw mi dt mch same applys to mi bt 1 thing 4sure, u cn giv mi ua trust, hw do u aford to raise de cash 4 dt hauz....	2015-02-17 13:24:10.19+03
181	254710734325	wot do u do b frank wth mi as l said b4 l min no harm am jst apoor humbl guy...	2015-02-17 13:24:11.249+03
182	254729470707	sasa aki u dnt	2015-02-17 20:18:41.439+03
183	254729470707	sasa deni yangu ulisema aje coz u dnt reply my txt nijue whr prblm is  	2015-02-17 20:20:52.287+03
184	Safaricom	29.37 KSH has been deducted to repay your Okoa Jahazi.Outstanding Okoa debt is 90.62 KSH.Please top up to continue enjoying our Services.	2015-02-18 10:51:30.643+03
185	Safaricom	You have received 30.00 KSH from 715162689. Your account balance is 0.00 KSH, expiry date is 19-05-2015.	2015-02-18 10:51:41.848+03
186	254715162689	Nitext	2015-02-18 10:53:21.338+03
187	254706343452	Our wife...	2015-02-18 11:04:48.085+03
188	254718801789	Ulikuwa unasemaje	2015-02-18 12:53:21.74+03
189	254712966051	Beb	2015-02-18 13:06:00.925+03
190	0707306596	I tried to call you at 15:04 on 18 Feb Please call back.	2015-02-18 15:40:13.503+03
191	Safaricom	Your Daily Data Bundle balance is below 2.00 MB. Dial *544# to purchase or Okoa Internet bundle.	2015-02-18 17:06:58.805+03
192	254707306596	Woi ok	2015-02-19 18:35:30.991+03
193	254712966051	Tao	2015-02-19 18:37:00.378+03
194	254718801789	Nimebuy fish na squid	2015-02-19 18:38:37.618+03
195	254712966051	Uko wapi	2015-02-19 18:59:19.345+03
196	254720299027	Sawa.	2015-02-19 19:21:30.316+03
197	Safaricom	Dear customer,we are unable to process your request for the Daily 20MB with SMS bundle service at this time.Please contact Safaricom for more information.	2015-02-20 10:30:19.479+03
198	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-02-20 10:30:29.622+03
199	Safaricom	Dear Customer.Please pay your Okoa Jahazi debt of 0.00 KSH by 21-02-2015.Thank you for staying with Safaricom.	2015-02-20 10:41:53.682+03
200	254715162689	Sasa Mdem Incse Watu Wa Afb Wakucal Washow Nauzanga Nguo	2015-02-20 11:37:46.019+03
201	254705641057	Morning dear...bado nakungoja ukamie hiyo dress.ata sijaweka display juu ulinishow utakam morning...bado nakuchill	2015-02-20 11:38:48.837+03
202	MPESA	GM98WB608 Confirmed. You have received Ksh227.00 from PATRICIA ALANDO 254706343452 on 20/2/15 at 12:11 PM New M-PESA balance is Ksh227.00.Pay Bills via M-PESA	2015-02-20 12:11:28.334+03
203	MPESA	GM99NR129 Confirmed. You have repaid loan Ksh227.00 from your M-PESA account on 20/2/15 at 12:18 PM . M-PESA balance is Ksh0.00. Your loan balance is Ksh354.75	2015-02-20 12:18:49.061+03
204	254712966051	Please call me thank you.	2015-02-21 17:24:01.368+03
207	254712966051	Kwanza nakam unibuyie tei	2015-02-21 17:48:31.008+03
208	254712966051	Hahaha....woiye	2015-02-21 17:52:06.544+03
209	254712966051	Sicheki beb nakuhurumia	2015-02-21 18:00:05.969+03
210	254710734325	nooo infct ua more xweeet	2015-02-21 18:58:16.111+03
211	254710734325	xooooory princess do u knw wot	2015-02-21 20:26:11.49+03
212	254710734325	by de way u wa lookin xweet y lie....natural waaah l luv it	2015-02-21 20:29:03.124+03
213	254710734325	yah l luv it dt way infct l luv it more y lie.....waaa u almst killed mi yawa	2015-02-21 20:42:18.407+03
214	254710734325	unaenda out wapi	2015-02-21 22:16:01.099+03
215	254717157376	Do natoka kwa nyumba	2015-02-21 23:52:03.023+03
216	254717157376	Tupatane hb	2015-02-21 23:53:38.697+03
217	254710734325	noo l do nid dem its u whom l want	2015-02-22 00:05:41.103+03
218	254710734325	hahaaa aki babe wewe umefika wapi	2015-02-22 00:15:31.348+03
219	254717157376	Hata mm nimepanda gari	2015-02-22 00:17:57.272+03
220	254710734325	gate gani mumy	2015-02-22 00:25:43.093+03
221	254710734325	xwry mi am goin hom am exosted	2015-02-22 00:32:19.421+03
222	254710734325	uko apo chini	2015-02-22 00:36:01.193+03
223	254736168084	Brenda wa juma cecile na vivian pamoja nimewaona hapo mtindwa brenda wa juma alirudi hiyo jeshi dnt b close to her pliz	2015-02-22 00:36:53.603+03
224	254710734325	wacha nikam	2015-02-22 00:37:39.813+03
225	254710734325	ukitoka luu on ua left cona kam	2015-02-22 00:42:06.265+03
226	254736168084	Ulienda out babe	2015-02-22 01:25:05.751+03
227	254736168084	Babe tumefika na iko sawa tuitishe 4 unakuja kulipa hatuko poa my luv	2015-02-22 01:55:55.782+03
228	254736168084	Mteja tena kwani wea u at unajua spendi ukiwa mteja	2015-02-22 02:02:15.934+03
229	0736168084	I tried to call you at 01:59 on 22 Feb Please call back.	2015-02-22 02:02:32.214+03
230	Safaricom	You have received 20 Items On-net SMS,Expiry date:23-02-2015.20.000 MB Daily Data Bundle,Expiry date:23-02-2015.	2015-02-22 08:39:41.747+03
231	Safaricom	You have received 20 Items On-net SMS,Expiry date:24-02-2015.20.000 MB Daily Data Bundle,Expiry date:24-02-2015.	2015-02-22 08:40:27.928+03
232	Safaricom	Your subscription to the Daily 20MB with SMS bundle service has been renewed for 20.00 KSH.	2015-02-22 08:40:39.182+03
233	Safaricom	You have received 20 Items On-net SMS,Expiry date:23-02-2015.20.000 MB Daily Data Bundle,Expiry date:23-02-2015.	2015-02-22 08:40:40.702+03
234	Safaricom	You have received 20 Items On-net SMS,Expiry date:23-02-2015.	2015-02-22 08:40:56.052+03
235	254706810631	Niko plan b	2015-02-22 08:40:59.796+03
236	0736168084	I tried to call you at 04:02 on 22 Feb Please call back.	2015-02-22 09:39:49.195+03
237	0736168084	I tried to call you at 04:02 on 22 Feb Please call back.	2015-02-22 09:39:49.31+03
238	0736168084	I tried to call you at 04:05 on 22 Feb Please call back.	2015-02-22 09:39:50.15+03
239	0736168084	I tried to call you at 04:07 on 22 Feb Please call back.	2015-02-22 09:39:50.249+03
240	0736168084	I tried to call you at 04:09 on 22 Feb Please call back.	2015-02-22 09:39:50.85+03
241	0736168084	I tried to call you at 04:11 on 22 Feb Please call back.	2015-02-22 09:39:51.53+03
242	0736168084	I tried to call you at 04:14 on 22 Feb Please call back.	2015-02-22 09:39:54.85+03
243	132	 You have 5 messages.  Please dial 132 to listen to your messages.	2015-02-22 09:39:54.989+03
244	0706810631	I tried to call you at 04:16 on 22 Feb Please call back.	2015-02-22 09:39:56.25+03
245	0736168084	I tried to call you at 04:21 on 22 Feb Please call back.	2015-02-22 09:39:56.39+03
246	0736168084	I tried to call you at 04:24 on 22 Feb Please call back.	2015-02-22 09:39:57.69+03
247	0736168084	I tried to call you at 04:37 on 22 Feb Please call back.	2015-02-22 09:39:58.73+03
248	0736168084	I tried to call you at 04:37 on 22 Feb Please call back.	2015-02-22 09:39:58.969+03
249	0736168084	I tried to call you at 04:38 on 22 Feb Please call back.	2015-02-22 09:39:59.75+03
250	0736168084	I tried to call you at 04:40 on 22 Feb Please call back.	2015-02-22 09:40:00.39+03
251	0736168084	I tried to call you at 04:42 on 22 Feb Please call back.	2015-02-22 09:40:01.47+03
252	0736168084	I tried to call you at 04:45 on 22 Feb Please call back.	2015-02-22 09:40:01.93+03
253	Safaricom	Your usage for the day is 12.80 KSH.Talk for Kshs 2.19 more today and get your KSH 15 free bonus airtime.	2015-02-22 11:17:52.03+03
254	Safaricom	Congratulations!You have reached your target for today.You have been awarded 15.00 KSH FREE bonus airtime valid until midnight today.	2015-02-22 11:50:14.25+03
255	Safaricom	You have received 15.00KSH Daily Bonus Airtime valid until midnight.	2015-02-22 11:50:14.609+03
256	254710734325	al do dt kesho bt hw mch	2015-02-22 13:29:32.092+03
257	254718801789	Please call me thank you.	2015-02-22 14:30:57.958+03
258	254729475080	Please call me thank you.	2015-02-22 20:22:19.438+03
259	254712966051	Kam b center	2015-02-22 22:22:57.64+03
260	254712966051	Si plan b	2015-02-22 22:23:02.149+03
261	254712966051	Unakam ama unanieka parking	2015-02-22 22:44:41.995+03
262	0708015435	I tried to call you at 09:38 on 23 Feb Please call back.	2015-02-23 13:04:51.564+03
263	0708015435	I tried to call you at 09:38 on 23 Feb Please call back.	2015-02-23 13:34:49.716+03
264	0789114053	I tried to call you at 11:12 on 23 Feb Please call back.	2015-02-23 13:35:00.824+03
265	0789114053	I tried to call you at 10:15 on 23 Feb Please call back.	2015-02-23 13:35:01.404+03
266	0789114053	I tried to call you at 11:41 on 23 Feb Please call back.	2015-02-23 13:35:01.863+03
267	0789114053	I tried to call you at 11:42 on 23 Feb Please call back.	2015-02-23 13:35:03.383+03
268	0724541318	I tried to call you at 12:27 on 23 Feb Please call back.	2015-02-23 13:35:04.804+03
269	0724541318	I tried to call you at 12:27 on 23 Feb Please call back.	2015-02-23 13:35:06.244+03
270	0751788342	I tried to call you at 13:01 on 23 Feb Please call back.	2015-02-23 13:35:07.924+03
271	0706343452	I tried to call you at 13:49 on 23 Feb Please call back.	2015-02-23 13:49:41.166+03
272	0706343452	I tried to call you at 15:23 on 23 Feb Please call back.	2015-02-23 15:50:29.121+03
273	254729475080	Please call me thank you.	2015-02-23 16:40:49.246+03
274	254729475080	Please call me thank you.	2015-02-23 17:06:28.058+03
275	M-Shwari	POLITE REMINDER!Pay your loan of Ksh 244.75 today to avoid cancellation of your credit limit & CRB listing.You risk paying upto Ksh 	2015-02-23 17:34:36.109+03
276	M-Shwari	2,000 CRB Clearance Fee	2015-02-23 17:34:37.243+03
277	254718593365	Sasa niaje ile story ya jana?itaweza kweli? angy	2015-02-23 18:44:55.261+03
278	Safaricom	You have received 20 Items On-net SMS,Expiry date:24-02-2015.	2015-02-23 18:56:57.539+03
279	254718593365	Sasa niaje ile story ya jana?itaweza kweli? angy	2015-02-23 19:19:15.667+03
280	254720788534	tafuta mtu moja wa pax handling akuconfirmie mm nko lounges	2015-02-24 19:25:35.007+03
281	254701077539	Please call me thank you.	2015-02-24 19:51:35.612+03
282	254710734325	yes luv niambie	2015-02-25 18:57:22.376+03
283	Safaricom	You have received 20 Items On-net SMS,Expiry date:27-02-2015.	2015-02-26 11:07:33.107+03
284	Safaricom	You have received 20 Items On-net SMS,Expiry date:28-02-2015.20.000 MB Daily Data Bundle,Expiry date:28-02-2015.	2015-02-26 11:07:33.282+03
285	254718801789	 Nikama amepotea	2015-02-26 12:00:30.6+03
286	M-Shwari	DID YOU KNOW you may PAY UPTO Kes2200 CLEARANCE FEE if listed with CRB due to your loan of Kes236.75 and other lenders can see your 	2015-02-26 12:35:48.699+03
287	M-Shwari	record for 5 years?	2015-02-26 12:35:49.305+03
288	254718801789	Kwa mum	2015-02-26 12:37:23.921+03
289	254718801789	Nikitoka ocha ntakuwa na doh so monday	2015-02-26 12:47:09.362+03
290	254718801789	 Narudi home sijaenda	2015-02-26 12:51:43.261+03
291	254715162689	Sawa Bsi	2015-02-26 13:20:24.561+03
292	254715162689	Sawa	2015-02-26 13:25:22.396+03
293	254715162689	Sawa	2015-02-26 13:27:09.112+03
294	254715162689	Hareply	2015-02-26 13:40:56.664+03
295	254715162689	Poa So Utakam Ama?	2015-02-26 13:42:46.666+03
296	254715162689	Wat Tym	2015-02-26 13:44:37.28+03
297	254715162689	Ni Matanga Ya Who Btw?	2015-02-26 13:45:44.616+03
298	254715162689	Ooh Mwambie Pole	2015-02-26 13:46:21.904+03
299	Safaricom	Your usage for the day is 9.13 KSH.Talk for Kshs 5.86 more today and get your KSH 15 free bonus airtime.	2015-02-26 15:52:57.616+03
300	M-Shwari	Pay your loan of Ksh 236.75 TODAY.You will be listed with CREDIT REFERENCE BUREAU after 30 days if your loan remains unpaid & pay up	2015-02-26 15:54:11.211+03
301	M-Shwari	to Ksh 2,000 clearance fee	2015-02-26 15:54:11.901+03
302	254715162689	Wat Abt Kesho?	2015-02-26 16:47:06.002+03
303	254715162689	Poa Thn Ukam Kesho	2015-02-26 16:48:30.868+03
304	254710734325	l luv u too mum	2015-02-26 17:29:49.266+03
305	254718801789	My love nakuja Kama nimetoka hope my stuff are ready love you	2015-02-26 17:42:18.871+03
306	254710734325	l miss u more plx kam l nid it	2015-02-26 22:32:36.367+03
307	254710734325	its ok luv u wa shy to giv mi 1st day	2015-02-26 22:39:42.309+03
308	254710734325	yah mi too l dint like it al change mumy	2015-02-26 22:47:10.031+03
309	254710734325	av no problem mumy...ok	2015-02-26 22:58:29.356+03
310	254710734325	ok.mumy go ahed plx	2015-02-26 23:22:15.499+03
311	254710734325	xijakupata poa.mumy plz kam agen	2015-02-26 23:29:55.217+03
312	Safaricom	Your usage for the day is 9.80 KSH.Talk for Kshs 5.20 more today and get your KSH 15 free bonus airtime.	2015-02-27 15:50:32.083+03
313	254713802618	Sijatoka wait	2015-02-28 08:46:26.977+03
314	254727947113	Uko	2015-02-28 08:46:27.472+03
315	254713802618	Sawa l	2015-02-28 11:14:17.49+03
316	254717157376	Niko job tao acha nimalize	2015-02-28 20:08:32.577+03
317	254702978160	Nataka kuenda shugli ya doh juu xina doh,n u?	2015-02-28 20:08:41.259+03
318	254702978160	Poa swits	2015-02-28 20:21:52.143+03
319	254702978160	Hehe u xaing u wat about me hehe cnt wait 4ksho inshallah	2015-02-28 20:27:00.227+03
320	254717157376	Sawa nihesabu	2015-02-28 20:28:50.484+03
321	254718801789	 Poa	2015-03-01 19:53:36.221+03
322	254710734325	l luv yu xooooo mch	2015-03-01 19:53:36.915+03
323	254718801789	Keja naona muvi	2015-03-01 19:53:39.354+03
324	254710734325	xawa tu utaki kuniongelesha	2015-03-01 19:56:56.03+03
325	254713802618	Niko home na family bilal amfika? 	2015-03-01 19:56:56.88+03
326	254713802618	Don't 	2015-03-01 19:56:59.231+03
327	0724541318	I tried to call you at 18:46 on 01 Mar Please call back.	2015-03-01 20:07:59.053+03
328	0724541318	I tried to call you at 18:46 on 01 Mar Please call back.	2015-03-01 20:07:59.313+03
329	0724541318	I tried to call you at 18:47 on 01 Mar Please call back.	2015-03-01 20:07:59.632+03
330	0729475080	I tried to call you at 18:53 on 01 Mar Please call back.	2015-03-01 20:08:00.013+03
331	0729475080	I tried to call you at 18:53 on 01 Mar Please call back.	2015-03-01 20:08:00.232+03
332	0718801789	I tried to call you at 19:17 on 01 Mar Please call back.	2015-03-01 20:08:00.412+03
333	254718801789	Nilishakopesha Kwa butchery flani	2015-03-01 20:32:28.007+03
334	Safaricom	Recharge was successful.Balance:15.00 KSH,expiry date:30-05-2015.Tariff:Uwezo.	2015-03-01 20:43:12.174+03
335	Safaricom	Congratulations!You have reached your target for today.You have been awarded 15.00 KSH FREE bonus airtime valid until midnight today.	2015-03-01 20:44:49.261+03
336	MPESA	GO36QW100 confirmed. You bought Ksh15.00 of airtime on 1/3/15 at 8:42 PM New M-PESA balance is Ksh0.00.	2015-03-01 20:45:04.358+03
337	MPESA	GO36QW100 confirmed. You bought Ksh15.00 of airtime on 1/3/15 at 8:42 PM New M-PESA balance is Ksh0.00.	2015-03-01 20:45:11.315+03
338	Safaricom	You have received 15.00KSH Daily Bonus Airtime valid until midnight.	2015-03-01 20:45:38.08+03
339	MPESA	GO36QW100 confirmed. You bought Ksh15.00 of airtime on 1/3/15 at 8:42 PM New M-PESA balance is Ksh0.00.	2015-03-01 21:15:14.435+03
340	254710734325	am xory 4 dt my luv bt eva xinx tujuane l avent ciin u wth heavy wedha mumy...ndio maana uko na malaria	2015-03-02 12:39:54.741+03
341	21665	Job found for you: Audit Associates Experience: Fresher Job Category: ACCOUNTING For more details search on the website using the	2015-03-03 15:18:39.27+03
342	21665	 Jobs Code 163161 Source: brightermonday.co.ke To get more such alerts, reply with JB to this message. 6000+ mobiles! Dial *665*	2015-03-03 15:18:40.616+03
343	21665	6#.	2015-03-03 15:18:41.658+03
344	254710734325	wooooiiii mum xinilikwambia uende ulize	2015-03-03 16:00:35.697+03
345	254706343452	Kukumiss tu	2015-03-04 12:51:36.82+03
346	254710734325	wot do yu min change ua hair xtyl mum	2015-03-05 10:59:35.796+03
347	254710734325	ni xawa bt ujue tangu ushukwe xijaikuona ata iyo xtyl unataka kubomoa xijaiona...	2015-03-05 11:07:23.806+03
348	254710734325	wot do yu min change ua hair xtyl mum	2015-03-05 11:14:49.964+03
349	MPESA	GO99KB894 Confirmed. You have received Ksh127.00 from John Alando 254718801789 on 5/3/15 at 6:30 PM New M-PESA balance is Ksh127.00.Pay Bills via M-PESA	2015-03-05 18:30:43.708+03
350	254714800074	Haha hows u??	2015-03-06 10:32:17.012+03
351	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-03-06 10:41:22.436+03
352	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-03-06 10:41:33.936+03
353	0712966051	I tried to call you at 16:20 on 06 Mar Please call back.	2015-03-06 19:00:03.484+03
354	132	You have a message from 0712966051 on 06/03/15 at 16:20. Please dial 132 to listen to your message. 	2015-03-06 19:00:03.703+03
355	132	 You have 2 messages.  Please dial 132 to listen to your messages.	2015-03-06 19:00:03.944+03
356	0729475080	I tried to call you at 16:25 on 06 Mar Please call back.	2015-03-06 19:00:04.143+03
357	0712966051	I tried to call you at 16:20 on 06 Mar Please call back.	2015-03-06 19:00:04.343+03
358	0724541318	I tried to call you at 16:38 on 06 Mar Please call back.	2015-03-06 19:00:07.103+03
359	0724541318	I tried to call you at 17:32 on 06 Mar Please call back.	2015-03-06 19:00:07.243+03
360	0724541318	I tried to call you at 17:33 on 06 Mar Please call back.	2015-03-06 19:00:07.363+03
361	0701077539	I tried to call you at 17:12 on 06 Mar Please call back.	2015-03-06 19:00:07.543+03
362	0723220632	I tried to call you at 18:00 on 06 Mar Please call back.	2015-03-06 19:00:08.163+03
363	254718801789	Nimetuma doh less na 7bob c upatie mum sasa ni Harriet Niko na stress yake	2015-03-06 19:05:10.068+03
364	254720788534	ata mm nimekuwa hosi since sunday sa nimefungwa kivitu kwa throat sikuweza kuongea ma sms ndo zimekuwa zangu	2015-03-07 09:10:05.715+03
365	254720788534	Sijakuwa job since monday nimekuwa hosi izo siku zote bt pengine ntatoka leo ama kesho.singepata tym ya ku sms bt wale walijuwa walikuja kunicheki	2015-03-07 09:17:06.765+03
366	254720788534	yeah iyo siku jioni ndo ilianza kufura na pain.yap monday si sunday kuchanganyikiwa nko mater acha nimeze dawa ntakuongelesha	2015-03-07 09:23:49.62+03
367	254713802618	Unanionanga nikiwa desperate sana Am none of those u have e	2015-03-07 11:45:08.191+03
368	254713802618	ver dated Don't compare me am never an option if u feel u t	2015-03-07 11:45:11.925+03
369	254713802618	ired and stressed be on your way don't waste your time	2015-03-07 11:45:14.09+03
370	254720788534	sema umekimya sana	2015-03-07 21:06:15.941+03
371	254720788534	doo ya nn	2015-03-07 21:10:11.019+03
372	254715162689	Unaeza Kam Westy	2015-03-07 21:12:04.46+03
373	254720788534	ni vile nko hosi ningekuhlp	2015-03-07 21:18:13.434+03
374	254720788534	no i dnt feel comfy wen u cnt go hme bkoz of tha money u usd 4 ua treatment	2015-03-07 22:30:51.393+03
375	254715162689	Ouk	2015-03-07 22:30:53.67+03
376	254715162689	Poa Btw Tuko Ata Na Kina Mum	2015-03-07 22:32:57.524+03
377	254720788534	jst b sincere n tel i wat ur going thrt i nid to knw	2015-03-07 22:35:22.204+03
378	254720788534	ni lazima? Deni anakudai ama ni ya nn	2015-03-07 22:35:25.443+03
379	0727947113	I tried to call you at 22:54 on 07 Mar Please call back.	2015-03-07 23:09:59.528+03
380	0702978160	I tried to call you at 23:04 on 07 Mar Please call back.	2015-03-07 23:10:00.148+03
381	safaricom	Message could not be sent	2015-03-08 00:03:40.273+03
382	MPESA	GP36XV405 confirmed. You bought Ksh5.00 of airtime on 8/3/15 at 12:05 AM New M-PESA balance is Ksh8.00.	2015-03-08 00:07:44.109+03
383	Safaricom	You have received 20 Items On-net SMS,Expiry date:09-03-2015.	2015-03-08 11:26:30.279+03
384	254710734325	wea	2015-03-08 11:50:46.357+03
385	254710734325	hmmmm	2015-03-08 12:25:23.496+03
386	254710734325	jana ulitoka out xaa ngapi	2015-03-08 12:38:54.633+03
387	254710734325	xo if l dont go out yu too unalala	2015-03-08 12:43:17.963+03
388	254720788534	pole sikuiona bt ww pia jana ucku ulinizimia 4ne	2015-03-09 18:11:15.512+03
389	254720788534	sai nimebaki na 100 nimeishiwa kesho ndo ntaku2mia doo nikienda bank	2015-03-09 18:20:11.272+03
390	254717157376	Nazile doo niaje ujapata	2015-03-09 20:30:04.491+03
391	254717157376	Sawa	2015-03-09 21:23:44.454+03
392	254715162689	sa me cna pic	2015-03-10 12:20:17.438+03
393	254715162689	yea c unajua ma phne labda uingie fb na phne yako thn upick ma prof pic	2015-03-10 12:21:37.251+03
394	254710734325	umechoshwa na nini	2015-03-10 12:53:27.288+03
395	254713516406	mambo,niambie chenye ntapaka on my face imeharibika tangu nigonjeke	2015-03-10 13:20:29.719+03
396	254720788534	Zii sijatoka leo,niliamko mwili imechoka na kuboeka alafu lazima niende tao ama buru,acha nione kama ntachangamka.	2015-03-10 13:27:22.525+03
397	254713516406	naskia imeshikana siko yaani comfortable	2015-03-10 13:27:25.944+03
398	254706343452	Nkt...nilikutxt 4hrs ago. Niko excited kesho ntakuona hihihi	2015-03-10 20:32:31.225+03
399	254706343452	haina mambi. Ka ni hard ntakam tu	2015-03-10 20:34:05.269+03
400	254715162689	uko	2015-03-10 20:36:18.761+03
401	254718801789	Ebu kuja hapa visa	2015-03-10 20:37:18.737+03
402	254715162689	0702070364	2015-03-10 20:40:55.749+03
403	254718801789	Kuja Kwa shisha ndani pliz	2015-03-10 20:54:33.883+03
404	254718801789	Ingia tu ndani kuna sababu	2015-03-10 20:55:52.505+03
405	254718801789	Niko Kwa shisha	2015-03-10 20:58:38.523+03
406	254718801789	Niko Kwa shisha	2015-03-10 21:13:59.32+03
407	254702070364	Ok dia hopefully kesho it will work.Gudnyt and see u tomorrow then.	2015-03-10 21:29:39.848+03
408	254718801789	Nakam love	2015-03-10 23:01:24.017+03
409	254706343452	Woi my goodness...	2015-03-11 12:09:45.063+03
410	254706343452	niki imatient utadhani nangoja results	2015-03-11 12:12:53.526+03
411	254706343452	Mapera tamu huku wah	2015-03-11 12:16:37.213+03
412	254717081048	hello pretty	2015-03-11 12:19:09.832+03
413	254720788534	naendelea poa,mambo lakini	2015-03-11 16:15:01.829+03
414	254718801789	Trevor homework na viatu zake za shule rangi pliz	2015-03-11 16:21:07.144+03
415	MPESA	GP93DL038 Confirmed. You have received Ksh327.00 from John Alando 254718801789 on 11/3/15 at 5:02 PM New M-PESA balance is Ksh340.00.Pay Bills via M-PESA	2015-03-11 17:02:49.698+03
416	254710734325	hmmm ok...	2015-03-12 00:01:30.243+03
417	21665	Job found for you: Sales Executive (ref: Se 2015) Experience: Fresher Location: Nairobi Salary: 15 Job Category: SALES For more	2015-03-12 12:16:48.987+03
418	21665	 details search on the website using the Jobs Code 232174 Source: brightermonday.co.ke To get more such alerts, reply with JB to 	2015-03-12 12:16:50.791+03
419	21665	this message. Best deals on your dream car! Dial *665*2#.	2015-03-12 12:16:52.44+03
420	254720788534	Kama unajuwa haitaweza heri uniambie badala ya kunifurahisha ju staki kurudia mstke kama ya last tym,	2015-03-12 17:48:05.354+03
421	254720788534	so tumedcide itl b on tue	2015-03-12 17:51:12.06+03
422	254702070364	Sawa we cn meet nw wea are u	2015-03-12 17:54:30.313+03
423	254702070364	Home,cn I pik from benrose it is more convenient	2015-03-12 18:04:26.965+03
424	254702070364	Around wat tym hivi	2015-03-12 18:07:58.243+03
425	254702070364	Usijali ,you hv a big heart tho,thats wat matters	2015-03-12 18:11:59.154+03
426	254702070364	Am quite eager	2015-03-12 18:13:56.485+03
427	MPESA	GQ11JI053 Confirmed. You have received Ksh177.00 from EDWIN LUNYIRO 254720299027 on 12/3/15 at 7:38 PM New M-PESA balance is Ksh177.00.Pay Bills via M-PESA	2015-03-12 19:38:36.835+03
428	254720299027	Kidogo tuu	2015-03-12 19:40:24.41+03
429	254702070364	Hawajatoka bado	2015-03-12 19:56:21.105+03
430	254720788534	vipi uko aje	2015-03-12 21:35:53.01+03
431	254720788534	Poa,mapuwa zilifunguka?	2015-03-12 21:38:52.491+03
432	254720788534	vipi uko aje	2015-03-12 21:38:54.28+03
433	254711512069	Leo mum?	2015-03-13 09:31:02.395+03
434	254711512069	Ok thanks so much	2015-03-13 09:34:03.82+03
435	254711512069	Nitakutumia kitu sawa	2015-03-13 09:34:05.602+03
436	254705827895	2000	2015-03-13 09:34:34.946+03
437	254720788534	goin off jst lke that	2015-03-13 09:36:23.663+03
438	254715162689	yea	2015-03-13 09:36:56.288+03
439	254705827895	ok dia,no prblm n hw much tyme do u want us to spend	2015-03-13 09:37:05.208+03
440	254705827895	my place	2015-03-13 09:47:39.104+03
441	254715162689	mumeongea aje	2015-03-13 09:48:03.297+03
442	0705827895	I tried to call you at 08:25 on 13 Mar Please call back.	2015-03-13 09:48:41.337+03
443	0705827895	I tried to call you at 08:33 on 13 Mar Please call back.	2015-03-13 09:48:42.257+03
444	0705827895	I tried to call you at 09:05 on 13 Mar Please call back.	2015-03-13 09:48:42.757+03
445	0718801789	I tried to call you at 09:11 on 13 Mar Please call back.	2015-03-13 09:48:43.977+03
446	0718801789	I tried to call you at 09:12 on 13 Mar Please call back.	2015-03-13 09:48:48.857+03
447	0705827895	I tried to call you at 09:17 on 13 Mar Please call back.	2015-03-13 09:48:50.477+03
448	0705827895	I tried to call you at 09:17 on 13 Mar Please call back.	2015-03-13 09:48:52.757+03
449	254715162689	ok hapo ni karibu na kwangu	2015-03-13 09:50:18.798+03
450	254705827895	hw many shots do we have to go baby	2015-03-13 09:55:38.489+03
451	M-Shwari	DID YOU KNOW you may PAY UPTO Ksh.2200 CLEARANCE FEE if listed with CRB due to your loan of Ksh.236.75 and other lenders can see you	2015-03-13 10:07:28.151+03
452	M-Shwari	r record for 5 years?	2015-03-13 10:07:29.181+03
453	254720788534	so tues. tutapatana ama?	2015-03-13 10:34:53.694+03
454	254718801789	Alifika bei ama	2015-03-13 10:40:31.217+03
455	254718801789	Bt ako poa ama kuna kitu inaweza fanywa	2015-03-13 10:43:42.02+03
456	254718801789	Na stima ni Kama inaisha ama	2015-03-13 10:46:38.028+03
457	254720788534	bado si ni mapema ama	2015-03-13 10:49:40.001+03
458	254718801789	Kina Pato wako na Deni yetu 2k sai	2015-03-13 10:49:41.302+03
459	254718801789	Atatupee end month akilipwa	2015-03-13 10:49:58.462+03
460	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-03-13 10:50:39.335+03
461	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-03-13 10:50:52.716+03
462	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-03-13 11:21:19.748+03
463	254720788534	Kimya!!	2015-03-13 11:23:41.949+03
464	254715162689	poa	2015-03-13 11:26:02.737+03
465	254720788534	unajuwa cku hizi zko mob lakini sikuwa nataka ulewe ju itakuwa kama ile day ingine	2015-03-13 12:18:51.654+03
466	254720788534	alafu ntakumit sangapi	2015-03-13 12:25:14.687+03
467	254720788534	Benrose?	2015-03-13 12:29:36.351+03
468	254720788534	so benrose ni b4 ama afta	2015-03-13 12:33:03.541+03
469	254705827895	am eager to see u beb	2015-03-13 12:33:05.158+03
470	21665	Job found for you: Human Resource Assistant-ref: Hra/01/2015 Experience: Fresher Location: Nairobi Salary: 15 Job Category: HUMA	2015-03-13 12:33:31.904+03
471	21665	N RESOURCES For more details search on the website using the Jobs Code 232591 Source: brightermonday.co.ke To get more such alerts	2015-03-13 12:33:32.624+03
472	21665	, reply with JA to this message. 6000+ mobiles! Dial *665*6#.	2015-03-13 12:33:33.145+03
473	254720788534	ok i thot afta the occation ndo nikubuyie drnks tukiniceup tha nyt	2015-03-13 12:38:33.652+03
474	254705827895	so uko kcb ama	2015-03-13 12:40:28.342+03
475	254720788534	iyo guarana ni hw much?	2015-03-13 13:07:01.941+03
476	254705827895	i called u bt ur phone was off,,	2015-03-13 13:11:05.202+03
477	254720788534	iyo guarana ni hw much?	2015-03-13 13:11:06.762+03
478	254705827895	wea ar u nw	2015-03-13 13:11:31.549+03
479	254705827895	go to malia house kidgo,nimekam laiser hill academy	2015-03-13 13:12:55.069+03
480	254705827895	ok baby i wont,aki it seem u ar beautiful wid nyce hip	2015-03-13 13:15:45.746+03
481	254705827895	wea swt	2015-03-13 13:19:41.371+03
482	254705827895	ok swt u wll be hapi	2015-03-13 13:21:33.598+03
483	Safaricom	You have received 15.00KSH Daily Bonus Airtime valid until midnight.	2015-03-13 13:22:59.643+03
484	Safaricom	Congratulations!You have reached your target for today.You have been awarded 15.00 KSH FREE bonus airtime valid until midnight today.	2015-03-13 13:23:11.478+03
485	0731258330	I tried to call you at 22:11 on 13 Mar Please call back.	2015-03-13 22:13:01.112+03
486	254710734325	lala poa bibi	2015-03-13 23:50:40.6+03
487	Safaricom	Recharge was successful.Balance:98.61 KSH,expiry date:12-06-2015.Tariff:Uwezo.	2015-03-14 15:27:25.155+03
488	Safaricom	Your usage for the day is 9.53 KSH.Talk for Kshs 5.46 more today and get your KSH 15 free bonus airtime.	2015-03-14 15:30:32.451+03
489	Safaricom	You have received 15.00KSH Daily Bonus Airtime valid until midnight.	2015-03-14 15:33:55.011+03
490	Safaricom	Congratulations!You have reached your target for today.You have been awarded 15.00 KSH FREE bonus airtime valid until midnight today.	2015-03-14 15:34:00.188+03
491	254720788534	nikikugei budget yetu itaspoil	2015-03-14 18:00:40.226+03
492	254720788534	Btw iyo shughli nataka nispend 3k sa itakuwaje	2015-03-14 18:06:00.603+03
493	254720788534	Kwaivyo kuna mtu atakosa steam	2015-03-14 18:10:47.317+03
494	254716115259	0705481813 / 0705481812...They do delivery	2015-03-14 18:17:52.645+03
495	254716115259	Ur welcome	2015-03-14 18:20:58.183+03
496	254720788534	Bt to mi that tuesdeh is goin to determin alot. Anythin might happen...special deh to u n mi...u neva knw!	2015-03-14 19:57:16.559+03
497	254720788534	utaifanya bac sawa	2015-03-14 21:45:15.702+03
498	254718801789	Siku za Harriet ziko karibu staki flat Kama last tym	2015-03-15 21:45:38.893+03
499	254720788534	nimekuja kwa salon yako alafu unashinda ukinionyesha ngotha umebuy ukinuliza iko aje	2015-03-15 21:45:48.439+03
500	254718801789	Yap doh take iko nampe tarehe 1 usijali	2015-03-15 21:59:33.272+03
501	254718801789	Poa ni poa unasave	2015-03-15 22:07:10.484+03
502	254710734325	kwetu akuna maji nachota uku kwa siz...	2015-03-15 22:09:34.425+03
503	254710734325	am xory den mum	2015-03-15 22:11:02.91+03
504	254718801789	Naskia baridi wacha nikujie jacko	2015-03-15 22:13:12.85+03
505	254710734325	kwa siz kam on dia kwani u dont trust wot am tellin u	2015-03-15 22:24:10.896+03
506	254710734325	thank u xo mch babe	2015-03-15 22:30:52.935+03
507	254711512069	Zile kubwa?	2015-03-16 12:22:05.161+03
508	254711512069	 Ok	2015-03-16 12:23:08.151+03
509	0789114053	I tried to call you at 09:21 on 16 Mar Please call back.	2015-03-16 12:50:27.886+03
510	0789114053	I tried to call you at 09:30 on 16 Mar Please call back.	2015-03-16 12:50:28.54+03
511	0789114053	I tried to call you at 11:45 on 16 Mar Please call back.	2015-03-16 12:50:29.324+03
512	254711512069	Mum sasa, zile sani zako ulikuwa unabayi how much?	2015-03-16 13:49:58.541+03
513	MPESA	GQ69CP480 Confirmed. You have received Ksh227.00 from SAMUEL GACHANJA 254720920293 on 16/3/15 at 6:09 PM New M-PESA balance is Ksh227.00.Pay Bills via M-PESA	2015-03-16 18:18:07.708+03
514	254729475080	Sawa ntakuwa mtaa	2015-03-17 10:10:10.956+03
515	254720788534	nafaa kuwa airport by 3pm nimepigiwa niende briefing ya job so kama haiwezi ni sawa tu pia	2015-03-17 10:11:35.183+03
516	254705827895	OK AM CUMING	2015-03-17 10:26:11.625+03
517	254720788534	sa nido nn na ni stori ya job siwezi hata na ndo mana nlikuwa nakupigia nikusho ukaknikatia cmu.	2015-03-17 10:32:04.417+03
881	0703228138	I tried to call you at 16:25 on 04 Apr Please call back.	2015-04-04 17:29:07.83+03
518	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-03-17 10:45:03.238+03
519	Safaricom	You have received 20 Items On-net SMS,Expiry date:18-03-2015.	2015-03-17 10:45:11.442+03
520	254705827895	cume straight toward kcb	2015-03-17 10:53:18.82+03
521	MPESA	GQ78ER854 Confirmed. You have received Ksh3,500.00 from DENG NYOK 254705827895 on 17/3/15 at 11:54 AM New M-PESA balance is Ksh3,523.00.Pay Bills via M-PESA	2015-03-17 11:54:52.429+03
522	M-Shwari	Dear customer, you may PAY UPTO Kes2200 CLEARANCE FEE if listed with CRB due to your loan of Kes9.75.Other lenders can access your r	2015-03-17 12:09:34.75+03
523	254720788534	i dont want to spoil ua special day n its mi who's hurt if u dont knw.	2015-03-17 12:30:00.155+03
524	254720788534	ni nn nili cancel?	2015-03-17 12:43:58.962+03
525	254711512069	Anasema kama niko na no ya bilali nimpe imagen	2015-03-17 13:39:39.858+03
526	254711512069	Nikamusho sina	2015-03-17 13:39:50.642+03
527	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-03-17 13:39:56.425+03
528	Safaricom	Your usage for the day is 8.13 KSH.Talk for Kshs 6.86 more today and get your KSH 15 free bonus airtime.	2015-03-17 13:41:15.378+03
529	Safaricom	Congratulations!You have reached your target for today.You have been awarded 15.00 KSH FREE bonus airtime valid until midnight today.	2015-03-17 13:49:28.094+03
530	Safaricom	You have received 15.00KSH Daily Bonus Airtime valid until midnight.	2015-03-17 13:49:42.861+03
531	254720788534	uve repeated the same mistakes u did b4 n ths tym around thea must b payday...nothing come so easy	2015-03-17 13:56:07.48+03
532	Safaricom	You have received 25 Items On-net SMS,Expiry date:19-03-2015.25.000 MB Daily Internet Bundle,Expiry date:19-03-2015.25.000 MB Night Data Bundle,Expiry date	2015-03-17 14:10:13.094+03
533	Safaricom	:18-03-2015.	2015-03-17 14:10:13.774+03
534	254722618211	Nitakupigia after 45min	2015-03-17 15:03:46.766+03
535	254720788534	sasa umeanza kuongea mbaya tena	2015-03-17 16:06:05.293+03
536	MPESA	GQ82KR497 Confirmed. on 17/3/15 at 4:07 PM Withdraw Ksh3,100.00 from 356407 - Trapon Comms Kobil-Rongai New M-PESA balance is Ksh11.00.Dial *234*6# for M-Shwari	2015-03-17 16:07:55.5+03
537	254711512069	Unabiwa ukam tao	2015-03-17 16:15:47.508+03
538	254720514353	hey, sasa? bado sijacome ronga, niko ngong rd. what time are u leaving?	2015-03-17 16:19:10.731+03
539	254720788534	a u ready to spend the nyt with mi?	2015-03-17 16:24:50.094+03
540	254720514353	then leo too bad hatuwezi meet. unless we meet in tao.	2015-03-17 16:29:10.156+03
541	254720788534	mm nataka leo najuwa itakuwa poa	2015-03-17 16:42:46.815+03
542	254711512069	Uko?	2015-03-17 16:43:00.888+03
543	254720514353	ooo i see......i like it that way....at least i can have u alone.....:)	2015-03-17 17:02:55.355+03
544	254711512069	Uko wapi mum?	2015-03-17 17:04:12.81+03
545	254720788534	iz ok il hve to put ablaze ua special present no matter hw worthy itz bt i feel pain about it.	2015-03-17 17:05:07.282+03
546	254711512069	Uko?	2015-03-17 17:56:55.488+03
547	254720788534	nimesema ivo ju kama unaclaim niko weak sai,kuna vile ntakusaidia in future kweli beb?	2015-03-19 10:40:31.206+03
548	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-03-19 11:03:06.435+03
549	254720788534	Pengine nxt sat ju hi sato sitakuwa n i nid u to b with u	2015-03-19 11:03:06.578+03
550	Safaricom	You have received 20 Items On-net SMS,Expiry date:20-03-2015.	2015-03-19 11:03:07.021+03
551	254720788534	Sex may die but not love is that tru?	2015-03-19 11:14:58.331+03
552	254720788534	c umenisho niwache	2015-03-19 11:40:04.715+03
553	254720514353	aki pole. i got held up kwa meeting with my boss.....will call u in like 20 mins. usiende kwanza.	2015-03-19 15:54:31.865+03
554	254720514353	how long do u think u can wait ndio nijue if i can just release u instead of keeping u waiting.	2015-03-19 16:05:47.356+03
555	254720788534	so goodwill is100k then u ar so high why?	2015-03-19 16:45:54.716+03
556	SAFARICOM	Dear Customer, this is to inform you that the Bonus airtime promotion ends today March 19th 2015. Thank You for choosing Safaricom.	2015-03-19 16:50:59.95+03
557	254715162689	bdo cjui napelkwa wapi	2015-03-19 21:26:15.051+03
558	254705827895	POA baby	2015-03-20 11:57:56.326+03
559	MPESA	GR28WH176 Confirmed. on 20/3/15 at 6:28 PM Withdraw Ksh300.00 from 019608 - Shaaba Ventures Demamwa Enter Wajemussiy And Daughters Properties St New M-PE	2015-03-20 18:29:08.445+03
560	MPESA	SA balance is Ksh734.00.Dial *234*6# for M-Shwari	2015-03-20 18:29:10.705+03
561	0724541318	I tried to call you at 20:47 on 20 Mar Please call back.	2015-03-20 20:58:54.639+03
562	Safaricom	10.00 KSH has been deducted to repay your Okoa Jahazi.Outstanding Okoa debt is 18.00 KSH.Please top up to continue enjoying our Services.	2015-03-20 20:59:30.256+03
563	MPESA	GR31US278 confirmed. You bought Ksh10.00 of airtime on 20/3/15 at 8:59 PM New M-PESA balance is Ksh197.00.	2015-03-20 20:59:33.436+03
564	Safaricom	Recharge was successful.Balance:2.00 KSH,expiry date:18-06-2015.Tariff:Uwezo.	2015-03-20 21:00:31.073+03
565	Safaricom	18.00 KSH has been deducted to repay your Okoa Jahazi.Your debt account is now fully settled.Thank you for staying with Safaricom.	2015-03-20 21:00:35.034+03
566	MPESA	GR31LW839 confirmed. You bought Ksh20.00 of airtime on 20/3/15 at 9:00 PM New M-PESA balance is Ksh177.00.	2015-03-20 21:00:47.2+03
567	Safaricom	Recharge was successful.Balance:12.00 KSH,expiry date:18-06-2015.Tariff:Uwezo.	2015-03-20 21:01:39.26+03
568	MPESA	GR31MS477 confirmed. You bought Ksh10.00 of airtime on 20/3/15 at 9:01 PM New M-PESA balance is Ksh167.00.	2015-03-20 21:01:42.435+03
569	132	You have a message from 0705641057 on 21/03/15 at 07:50. Please dial 132 to listen to your message. 	2015-03-21 10:45:08.122+03
570	254718607225	Just to say im thinkimg of you. Have a blessed weekend. Patricia	2015-03-21 12:32:45.361+03
571	254718607225	Nkt wewe unakreki	2015-03-21 12:35:56.994+03
572	254720514353	almost there. ushafika?	2015-03-21 13:50:15.472+03
573	0710734325	You attempted to call me but I was not available. Please call me. Thank you.	2015-03-21 19:50:47.48+03
574	254701077539	Please call me thank you.	2015-03-21 20:00:53+03
575	MPESA	GR44RM429 Confirmed. Ksh200.00 sent to PROFESSIONAL DIGITAL SYSTEMS LTD for account 14106980338 on 21/3/15 at 8:02 PM New M-PESA balance is Ksh513.00.Dia	2015-03-21 20:03:01.282+03
576	MPESA	l *234*6# for M-Shwari 	2015-03-21 20:03:04.149+03
577	VendIT	token:5033 1223 3480 2013 4261 Ksh:200.00 (elec:136.8 charges:63.2) units:10 http://gug.mobi/r/I3YJFKED ref:508020037129 mtr:..0338	2015-03-21 20:03:39.215+03
578	254705641057	Woii:-(:-(:-( am sorry swtheart...i really am.ata mimi nimekumiss leo...tulikuwa tunasort nguo...	2015-03-22 16:44:05.687+03
579	254705641057	Kam kesho morning,we talk things out...in the meantime,just relax,okay?	2015-03-22 16:49:15.748+03
882	0715162689	I tried to call you at 14:08 on 04 Apr Please call back.	2015-04-04 17:29:07.846+03
580	MPESA	GR54ID304 Confirmed. You have received Ksh350.00 from ELIUD MAINA 254720514353 on 22/3/15 at 5:20 PM New M-PESA balance is Ksh356.00.Pay Bills via M-PESA	2015-03-22 17:20:21.942+03
581	MPESA	GR56BO624 Confirmed. on 22/3/15 at 6:53 PM Withdraw Ksh300.00 from 019608 - Shaaba Ventures Demamwa Enter Wajemussiy And Daughters Properties St New M-PE	2015-03-22 18:53:59.28+03
582	MPESA	SA balance is Ksh29.00.Dial *234*6# for M-Shwari	2015-03-22 18:54:00.606+03
583	0722531938	I tried to call you at 19:27 on 22 Mar Please call back.	2015-03-22 19:28:27.619+03
584	254705641057	Nipigie plz	2015-03-22 19:52:27.529+03
585	254720788534	wapi	2015-03-22 19:56:28.376+03
586	MPESA	GR57FG262 Confirmed. You do not qualify for a loan. Keep using M-PESA and M-Shwari products to qualify.	2015-03-22 20:06:30.848+03
587	MPESA	Failed. You do not have enough money in your account to complete this transaction.	2015-03-22 20:07:53.689+03
588	MPESA	GR57BR887 <1.Loan Overpayment;1.25;17/03/15 > <2.Interest Paid;0.23;16/02/15 > <3.Loan - Repayment;906;02/02/15 > <4.Deposit;906.00;30/01/15 > 	2015-03-22 20:08:40.01+03
589	MPESA	 Repayment;1.25;28/12/14 >.	2015-03-22 20:08:41.795+03
590	MPESA	Failed. Loan account mini statement request cannot be completed. You do not have a loan.	2015-03-22 20:09:01.264+03
591	254708838955	Semaz ni odawa	2015-03-22 21:18:01.645+03
592	254706876608	Popoa	2015-03-22 21:25:59.845+03
593	254706876608	Ati odawa me cmjui	2015-03-22 21:28:48.091+03
594	254706876608	Ni nini iyo hehe	2015-03-22 21:41:43.821+03
595	254706876608	Ni nini iyo hehe	2015-03-22 21:57:01.447+03
596	254720788534	4hr drive tuko na personal by 4 ntakuwa tao	2015-03-23 13:11:27.096+03
597	254720788534	nlikuwa na job nyingi eldy ndo mana nimedelay kurudi	2015-03-23 13:12:51.815+03
598	254720788534	heri nikose job nikupeleke hosi lakini najuwa nko fiti	2015-03-23 13:21:09.687+03
599	254720788534	Sawa	2015-03-23 13:27:00.372+03
600	254711512069	Haky joe niko chini haky	2015-03-23 13:39:00.03+03
601	254719598112	ndio naamka nakuwekea	2015-03-23 17:43:20.114+03
602	254719598112	nawait rotich afike sawa ntakulipia unaweza kuwa na 27bob kwa simu	2015-03-23 17:45:28.796+03
603	254719598112	wacha nikudepositie 200 hio ndio nko nayo	2015-03-23 17:50:46.464+03
604	Safaricom	Request successful.You have received 45.00 KSH.5.00 KSH has been charged as service fee.Your Okoa Credit is 50.00 KSH to be paid before 30-03-2015.	2015-03-25 11:26:34.067+03
605	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-03-25 11:26:45.916+03
606	Safaricom	You have received 20 Items On-net SMS,Expiry date:26-03-2015.	2015-03-25 11:30:18.153+03
607	Safaricom	:26-03-2015.	2015-03-25 11:30:20.851+03
608	Safaricom	You have received 25 Items On-net SMS,Expiry date:27-03-2015.25.000 MB Daily Internet Bundle,Expiry date:27-03-2015.25.000 MB Night Data Bundle,Expiry date	2015-03-25 11:30:37.3+03
609	254705641057	Kam kwa kibanda	2015-03-25 12:00:37.289+03
610	254720788534	Nimebakisha test moja ya liver function	2015-03-25 12:16:52.8+03
611	254720788534	ulingolewa meno?	2015-03-25 12:19:08.475+03
612	254719598112	nililetewa cid na ap kuniinterrogate kuhusu bag ya sam ati imepotea	2015-03-25 12:31:26.913+03
613	254719598112	haongei wala hashiki simu ya mtu	2015-03-25 12:42:37.233+03
614	254719598112	mum unaweza kam rongai	2015-03-25 12:50:51.396+03
615	254719598112	ok al do dat nilitaka tusumbue seline ju anakam kwangu	2015-03-25 13:01:33.563+03
616	254720788534	nimeuliza ju ulinisho utatafta doo uende	2015-03-25 13:08:02.226+03
617	254720788534	whatz in ua mind?	2015-03-25 13:11:51.117+03
618	254720788534	mm nikuchekelee,ss izo ndo mambo zinafanya ninyamaze.nilikubuyia shop eldy ulikata untaka nikuplease aje. Unataka nikufundishe kufish ama nikupatiage tu 	2015-03-25 13:33:38.197+03
619	254720788534	iyo fish ukule?	2015-03-25 13:33:39.085+03
620	254705641057	0728054098	2015-03-25 15:58:47.803+03
621	254710734325	u made mi change	2015-03-25 15:59:52.405+03
622	254719598112	thanx bilal amesema hamko pamoja	2015-03-25 16:02:14.215+03
623	254705641057	Sawa tu:-(:-(:-(	2015-03-25 16:05:33.301+03
624	254719598112	haina shda wat abt raqim	2015-03-25 16:05:38.959+03
625	254710734325	xo dtx y u bhave badly last xato	2015-03-25 16:06:36.405+03
626	254719598112	poa	2015-03-25 16:07:39.99+03
627	254720788534	Jst tel mi ua final word that u want frm mi so that i work on it n if i dont act then count mi out.	2015-03-25 17:26:38.085+03
628	254720788534	hao za rental uko zinalipishwaje	2015-03-25 18:13:43.92+03
629	254719598112	nakutumia	2015-03-25 18:13:52.409+03
630	254720788534	btwn 3 n 4k	2015-03-25 18:15:54.628+03
631	254719598112	yea u cn	2015-03-25 18:17:30.519+03
632	254719598112	ok	2015-03-25 18:18:22.807+03
633	MPESA	GR97WH594 Confirmed. You have received Ksh227.00 from ROSEMARY NAMWAYA 254719598112 on 25/3/15 at 6:19 PM New M-PESA balance is Ksh227.00.Pay Bills via M-PESA	2015-03-25 18:19:47.569+03
634	254720788534	ifanye may ndo naanza leav bt hao nalipa nxt mnth na chuo pia	2015-03-25 18:19:48.848+03
635	254720788534	tafuta hao na chuo pamoja nilipe april alafu tuhame end of april ama unaonaje	2015-03-25 18:28:18.183+03
636	MPESA	GR98FM545 Confirmed. on 25/3/15 at 6:31 PM Withdraw Ksh200.00 from 003056 - Phoneart Sheriff Centre Bungoma EXT New M-PESA balance is Ksh0.00.Dial *234*6	2015-03-25 18:31:51.924+03
637	MPESA	# for M-Shwari	2015-03-25 18:31:54.325+03
638	254720788534	c unajuwa lazima 2buy vitu za hao ama kuna zile ukonazo	2015-03-25 18:32:21.84+03
639	254720788534	ama uneza weka dwn mattres 4 tha tym being	2015-03-25 18:35:43.288+03
640	254720788534	is ok naget pay around 4th so itabidi uanze kutafta immediatly alafu ukipata ya 3k itakuwa fyn	2015-03-25 18:39:29.806+03
641	254719598112	kwetu hakuna vacant sai bt kuna ingne nxt plot	2015-03-25 18:41:38.685+03
642	254715162689	kua serious ma dia si raqim atateseka ntakuangalilia kesho	2015-03-25 18:45:20.953+03
643	254719598112	woiye its ok ucjali ma dia bt namwonea huruma	2015-03-25 18:47:45.208+03
644	254720788534	sawa beb,ulichnge status?	2015-03-25 18:49:54.869+03
645	254701077539	Akuna kitu anasema,	2015-03-25 20:04:50.204+03
646	254720788534	Nakumiss ntakuona wen?	2015-03-25 20:21:03.803+03
647	254720788534	ukinyesha hauwezi ntembelea	2015-03-25 20:22:59.318+03
648	254720788534	lakini pia mvua ikiisha ndo poa sana	2015-03-25 20:25:46.177+03
649	254720788534	kukua poa aje beb	2015-03-25 20:28:39.635+03
650	254720788534	lakini ata nikikuona tu mi usikia poa.nyt lav	2015-03-25 21:07:18.249+03
651	254701077539	K,nampea food but he is fine despite kulialia tu ju anakumis,	2015-03-25 21:25:25.055+03
652	254720788534	lakini ata nikikuona tu mi usikia poa.nyt lav	2015-03-25 21:25:26.054+03
653	254707306596	I know jst cry u will feel alil better ucjali u will be ok	2015-03-25 22:09:44.801+03
654	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-03-26 10:39:13.739+03
883	254718801789	Kume kuwa na ngori hapo sango #billabong!!!!	2015-04-04 17:29:08.451+03
655	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-03-26 10:39:23.951+03
656	Safaricom	Request successful.You have received 45.00 KSH.5.00 KSH has been charged as service fee.Your Okoa Credit is 50.00 KSH to be paid before 31-03-2015.	2015-03-26 12:28:35.899+03
657	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-03-26 12:28:36.659+03
658	254720788534	Sawa line ni doo ngapi	2015-03-26 16:41:44.087+03
659	MPESA	GS11EX472 Confirmed. You have received Ksh700.00 from FREDRICK BUKACHI 254720788534 on 26/3/15 at 4:55 PM New M-PESA balance is Ksh700.00.Pay Bills via M-PESA	2015-03-26 16:55:45.107+03
660	254720788534	13039043	2015-03-26 16:56:02.97+03
661	254715162689	aki nimesota acha nitafte 100 nikutumie	2015-03-26 17:40:38.659+03
662	MPESA	GS12DC435 Confirmed. You have received Ksh130.00 from CHRISTINE NAMWAYA 254715162689 on 26/3/15 at 5:43 PM New M-PESA balance is Ksh830.00.Pay Bills via M-PESA	2015-03-26 17:43:36.992+03
663	254715162689	poa	2015-03-26 17:47:09.493+03
664	254731258330	Hae nilikam ckupata,mtoi ulimwendea ama?	2015-03-26 19:23:51.046+03
665	254720788534	umedungwa?	2015-03-26 21:27:34.673+03
666	254720788534	Pain ya kudungwa ama ni ya nn?	2015-03-26 21:29:06.997+03
667	254701077539	U 2,nlikua napea mtoi fud.ako tu poa.	2015-03-26 21:30:11.639+03
668	254720788534	umedungwa wapi	2015-03-26 21:32:24.271+03
669	254720788534	ukupewa ma painkiller	2015-03-26 21:36:26.998+03
670	254720788534	bt iyo pain ni ya short tym,dnt wori ul feel beta	2015-03-26 21:41:13.059+03
671	254720788534	10 si ni sawa?	2015-03-26 21:44:18.27+03
672	254720788534	umebuy line?	2015-03-26 21:46:39.864+03
673	Safaricom	50.00 KSH has been deducted to repay your Okoa Jahazi.Outstanding Okoa debt is 5.00 KSH.Please top up to continue enjoying our Services.	2015-03-26 21:48:33.06+03
674	254705641057	Woiiiii!!ata leo sikufungua swty...we fought wth pat in the morning,was so moody nikadecide nisiopen,,,nimekumiss leo atleast ungenimake ni smile	2015-03-26 22:26:40.014+03
675	254705641057	Kesho kam kwa stall ata kama ni fr ten minutes...tuongee	2015-03-26 22:34:00.97+03
676	254705641057	After talking to me about it,you'll feel better,i promise	2015-03-26 22:42:30.357+03
677	254705641057	After talking to me about it,you'll feel better,i promise	2015-03-26 22:57:53.844+03
678	254710734325	9t too...	2015-03-26 23:09:50.623+03
679	254705641057	After talking to me about it,you'll feel better,i promise	2015-03-26 23:09:53.091+03
680	254705641057	Please call me thank you.	2015-03-27 11:09:29.425+03
681	254718801789	Unajua parents wangu ni wazee Sana na wanasema Kama ni kuongea parents wako waende juu ulisema unataka wazazi wakae chino ni wewe ulikuja na hiyo idea na	2015-03-27 11:13:10.193+03
682	254718801789	 wamekubaliana nap lakini si ati hao wakuje nyinyi mukam poa tek cea na salimia treva	2015-03-27 11:13:11.232+03
683	254718801789	Uko na ile 500 ya gas	2015-03-27 19:04:18.568+03
684	254718801789	Ngoja kitu thirty minutes nijaze doh	2015-03-27 19:09:08.469+03
685	254718801789	Nani anatumiwa chama	2015-03-27 19:36:22.488+03
686	254710734325	ata sijaijua jina za watoto wangu hmmm..	2015-03-27 19:37:26.885+03
687	254718801789	Nani anatumiwa chama	2015-03-27 19:38:47.325+03
688	254718801789	Hiyo sijui bt Mimi sijawai mpelekea makosa yako akakosa kujustify actions zako	2015-03-27 20:21:15.333+03
689	254718801789	Postpaid yangu iliisha siwezi call imagine ulikuwa unadai kuniuliza	2015-03-27 20:28:06.161+03
690	Safaricom	Recharge was successful.Balance:4.00 KSH,expiry date:25-06-2015.Tariff:Uwezo.	2015-03-27 20:35:10.055+03
691	MPESA	GS30HN696 confirmed. You bought Ksh59.00 of airtime on 27/3/15 at 8:34 PM New M-PESA balance is Ksh1,450.00.	2015-03-27 20:35:12.794+03
692	Safaricom	55.00 KSH has been deducted to repay your Okoa Jahazi.Your debt account is now fully settled.Thank you for staying with Safaricom.	2015-03-27 20:35:14.427+03
693	254710734325	eeeh izo apana	2015-03-27 20:38:07.66+03
694	254718801789	Ushapeana doh	2015-03-27 20:42:11.977+03
695	254718801789	Nakupenda lakini kuna bumps Kwa rlshp yetu	2015-03-27 20:48:12.787+03
696	Safaricom	Request successful.You have received 45.00 KSH.5.00 KSH has been charged as service fee.Your Okoa Credit is 50.00 KSH to be paid before 01-04-2015.	2015-03-27 20:57:17.55+03
697	254718801789	C nimekusho	2015-03-27 20:58:23.943+03
698	20604	TK_Baby_Drummer http://myscoobi.com/dl/5514e8ac3b0aa79	2015-03-27 20:59:34.454+03
699	254720788534	iyo sasa ni ya nn	2015-03-28 12:07:06.523+03
700	254720788534	Kila kitu aje	2015-03-28 12:25:47.728+03
701	254718801789	??!!!	2015-03-28 12:50:15.567+03
702	254715162689	wyf ananithreaten tu imagyn hakuna job cjui ntatoa wapi 2k niwekewe ju	2015-03-28 16:42:02.588+03
703	254715162689	ma dia me nko na 100 mbele na nyuma cjui ntatoa wapi clients	2015-03-28 16:47:12.715+03
704	254715162689	y ma dia	2015-03-28 16:49:52.187+03
705	254715162689	sawa	2015-03-28 16:56:19.391+03
706	MPESA	GS43EF830 Confirmed. You have received Ksh110.00 from John Alando 254718801789 on 28/3/15 at 6:38 PM New M-PESA balance is Ksh233.00.Pay Bills via M-PESA	2015-03-28 18:38:45.27+03
707	0711512069	I tried to call you at 21:33 on 28 Mar Please call back.	2015-03-28 21:38:18.665+03
708	254720788534	ndo unaona iyo msg sai?	2015-03-28 21:41:50.239+03
709	254710734325	umedoz mum	2015-03-28 21:55:51.99+03
710	Safaricom	Request successful.You have received 4.50 KSH.0.50 KSH has been charged as service fee.Your Okoa Credit is 5.00 KSH to be paid before 02-04-2015.	2015-03-28 22:04:36.25+03
711	254706343452	Kuja tu aki.	2015-03-29 14:27:35.067+03
712	254715162689	aki c nimesota ata cna doh ya chama kesho c unikopeshe 1000	2015-03-29 15:59:24.207+03
713	MPESA	GS56QF825 Confirmed. You have received Ksh120.00 from ROSEMARY NAMWAYA 254719598112 on 29/3/15 at 6:44 PM New M-PESA balance is Ksh120.00.Pay Bills via M-PESA	2015-03-29 18:44:32.316+03
714	254718801789	Uko	2015-03-29 20:01:13.388+03
715	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-03-29 20:01:32.736+03
716	Safaricom	Recharge was successful.Balance:15.43 KSH,expiry date:27-06-2015.Tariff:Uwezo.	2015-03-29 20:01:34.911+03
717	Safaricom	55.00 KSH has been deducted to repay your Okoa Jahazi.Your debt account is now fully settled.Thank you for staying with Safaricom.	2015-03-29 20:01:42.442+03
718	Safaricom	You have received 20 Items On-net SMS,Expiry date:30-03-2015.	2015-03-29 20:02:39.74+03
719	Safaricom	:30-03-2015.	2015-03-29 20:02:42.708+03
720	Safaricom	You have received 25 Items On-net SMS,Expiry date:31-03-2015.25.000 MB Daily Internet Bundle,Expiry date:31-03-2015.25.000 MB Night Data Bundle,Expiry date	2015-03-29 20:02:43.841+03
721	254718801789	Naenda mtaa sai	2015-03-29 21:23:52.578+03
722	254720788534	mtu ufungua roho unasema tu jo siwezani na ww am vry expensive n wi cnt ryme,sitajam ntaelewa na ni move on instead of beating about the bush.	2015-03-29 21:25:52.02+03
723	254718801789	Kwa mat	2015-03-29 21:27:09.534+03
724	254720788534	ww ndo nataka uniambie	2015-03-29 21:29:38.58+03
725	MPESA	GS59CA909 <1.Loan Overpayment;1.25;17/03/15 > <2.Interest Paid;0.23;16/02/15 > <3.Loan - Repayment;906;02/02/15 > <4.Deposit;906.00;30/01/15 > 	2015-03-29 21:40:53.457+03
726	MPESA	 Repayment;1.25;28/12/14 >.	2015-03-29 21:40:54.055+03
727	MPESA	Failed. Loan account mini statement request cannot be completed. You do not have a loan.	2015-03-29 21:41:04.854+03
728	254707306596	Aki me sina doh si nilikushw natoka Chama	2015-03-29 21:44:34.099+03
729	254718801789	Niko Kwa chief n yap kuna rain mbaya	2015-03-29 21:54:53.84+03
730	254720788534	since u ar ungrateful n too much conditional lemmie call it a night n thak u 4 evrything u did to mi...gud or bad n lemmie also relieve u frm my heavy lo	2015-03-29 21:55:28.972+03
731	254720788534	ad uv bin carrying am very sori to say this! Jah bless u. 	2015-03-29 21:55:30.769+03
732	254707306596	Am sorry i thot i did	2015-03-29 21:55:38.889+03
733	254718801789	Unasema sai sina hiyo doh ungesema mapema	2015-03-29 21:58:34.803+03
734	254718801789	Kejani buy mosquito coil	2015-03-29 22:28:49.747+03
735	254718801789	Ok	2015-03-29 23:25:31.538+03
736	MPESA	GS69WA765 Confirmed. You have received Ksh110.00 from ROSEMARY NAMWAYA 254719598112 on 30/3/15 at 5:29 PM New M-PESA balance is Ksh119.00.Pay Bills via M-PESA	2015-03-30 17:29:57.073+03
737	254718801789	Chama c ni friday	2015-03-30 17:32:58.178+03
738	254718801789	Ama ni Chama gani	2015-03-30 17:33:19.783+03
739	254718801789	Siku 2	2015-03-30 17:34:38.557+03
740	0704253145	I tried to call you at 17:40 on 30 Mar Please call back.	2015-03-30 17:40:39.213+03
741	254718801789	Kasee itakuwa hard wacha nione lakini	2015-03-30 17:41:39.731+03
742	MPESA	GS71QP602 Confirmed. You have received Ksh110.00 from John Alando 254718801789 on 30/3/15 at 6:45 PM New M-PESA balance is Ksh229.00.Pay Bills via M-PESA	2015-03-30 18:45:14.868+03
743	254718801789	C notume doh upike	2015-03-30 20:00:19.705+03
744	254718801789	Ati uko lonely c nakam	2015-03-30 20:00:33.798+03
745	254718801789	Nyama skuma na ka sembe hivi	2015-03-30 20:02:27.962+03
746	254718801789	Uweke pilipili nitume how much	2015-03-30 20:02:49.522+03
747	254718801789	?????	2015-03-30 20:19:17.375+03
748	254718801789	Unga	2015-03-30 20:20:56.322+03
749	254718801789	C nimekutumia	2015-03-30 20:20:57.035+03
750	254718801789	Token: 20276220212232137205, Units: 13.5kWh.	2015-03-30 21:18:32.492+03
751	254718801789	Niko Kwa mat	2015-03-30 21:18:57.041+03
752	254718801789	Stima imeingia	2015-03-30 21:21:46.61+03
753	254718801789	Mbona hureply txt zangu tena	2015-03-30 21:22:07.278+03
754	254720788534	i ws from wrk,i miss u	2015-03-31 10:02:21.046+03
755	254718801789	Hehe baby bio msge yako ni funny good mrnn Kama usharuka gud day nway ilikuwa poa bt ulinihepa usiku	2015-03-31 10:09:49.227+03
756	254718801789	Hehe baby hio msge yako ni funny good mrnn Kama usharuka gud day nway ilikuwa poa bt ulinihepa usiku	2015-03-31 10:10:13.509+03
757	254718801789	Nimekubore tena siku hizi uko na filings kibao	2015-03-31 10:17:08.802+03
758	254720788534	is ok al do that aat am jst longing to see u	2015-03-31 10:54:33.178+03
759	254720788534	right nw i hve 700 only in mpesa na bado nko kwa hao	2015-03-31 11:13:37.959+03
760	254728910034	Dats nt gud cm bak plz	2015-03-31 18:49:56.587+03
761	254720788534	mambo,ulilemewa kukuja?	2015-03-31 21:24:14.39+03
762	254720788534	usichnkeshe mtoto beb	2015-04-01 10:36:43.091+03
763	254715162689	kuja tu	2015-04-01 10:40:54.957+03
764	254718801789	Form #billabong!!!!	2015-04-01 11:18:28.891+03
765	254718801789	Ushatoka #billabong!!!!	2015-04-01 12:15:24.575+03
766	254718801789	So utaduh #billabong!!!!	2015-04-01 12:35:51.288+03
767	254718801789	Kesho wacha nitafte doh #billabong!!!!	2015-04-01 12:37:54.979+03
768	254718801789	Unasemaje bby #billabong!!!!	2015-04-01 14:05:22.708+03
769	254718801789	Simu Yangu haiwezi piga #billabong!!!!	2015-04-01 14:08:43.772+03
770	254718801789	?????? Hureply tena #billabong!!!!	2015-04-01 14:08:58.034+03
771	254718801789	Fridge #billabong!!!!	2015-04-01 14:09:45.001+03
772	254718801789	Lol #billabong!!!!	2015-04-01 14:09:56.786+03
773	254718801789	Unaweza mek mi day bbz #billabong!!!!	2015-04-01 14:10:02.254+03
774	254718801789	Ama nipe clue #billabong!!!!	2015-04-01 14:10:28.116+03
775	254718801789	????? #billabong!!!!	2015-04-01 14:15:32.785+03
776	254718801789	Set ama #billabong!!!!	2015-04-01 14:16:37.807+03
777	254718801789	Ehh hiyo ni poa vyombo kibao za nyumba #billabong!!!!	2015-04-01 14:17:00.148+03
778	254718801789	 Uko wap #billabong!!!!	2015-04-01 14:17:11.194+03
779	254718801789	Uko wapi sai #billabong!!!!	2015-04-01 14:17:28.551+03
780	254718801789	Hiyo ni poa me nimeboeka nadai doz kidogo Kama 1hr hivi #billabong!!!!	2015-04-01 14:18:35.872+03
781	254718801789	 Aye #billabong!!!!	2015-04-01 14:23:16.932+03
782	254718801789	Buy Makaa ntakuja na sugar #billabong!!!!	2015-04-01 15:39:27.9+03
783	MPESA	GS99ZB689 Confirmed. on 1/4/15 at 3:52 PM Withdraw Ksh500.00 from 019608 - Shaaba Ventures Demamwa Enter Wajemussiy And Daughters Properties St New M-PES	2015-04-01 15:53:11.512+03
784	MPESA	A balance is Ksh18.00.Dial *844# for KCB MPESA Account	2015-04-01 15:53:12.354+03
785	MPESA	You have entered the wrong PIN. Please try again.	2015-04-02 08:04:06.985+03
786	MPESA	GT08NI928 Confirmed. Your M-PESA balance was Ksh50.00 on 2/4/15 at 8:04 AM.Safaricom only calls you from 0722000000 	2015-04-02 08:04:20.014+03
787	254720788534	GT04TQ480 Imethibitishwa Ksh530.00 imetumwa kwa JOAN WANGARI 0704458721 Tarehe 1/4/15 saa 7:52 PM Baki yako ya M-PESA ni Ksh602.00.Piga *885#kupata Okoa Stima!	2015-04-02 08:08:20.883+03
788	254718801789	Mimi ndio nimefika wera #billabong!!!!	2015-04-02 09:52:43.92+03
789	254720788534	anadai aje	2015-04-02 09:56:31.6+03
790	254720788534	Program itaharibika,ngoja tu hadi tues.	2015-04-02 11:18:16.85+03
791	Safaricom	You have received 20 Items On-net SMS,Expiry date:03-04-2015.	2015-04-02 11:20:26.136+03
792	254715162689	wah ok me naye nko broke cjui natoa wapi doh ningekutumia	2015-04-02 11:23:26.046+03
793	254715162689	tulikosana na yye ata cnanga number yake	2015-04-02 11:30:02.026+03
794	254715162689	nimeomba rotich doh na harespond	2015-04-02 11:37:11.808+03
795	254715162689	ma dia cna mtu mwengne aki	2015-04-02 11:40:08.508+03
796	254715162689	acha rotich anitumie nikutumie	2015-04-02 11:54:55.339+03
797	254718801789	Baby uko #billabong!!!!	2015-04-02 13:54:51.249+03
798	254718801789	Love wekoh  #billabong!!!!	2015-04-02 13:55:31.602+03
799	254718801789	Ati Ronga kuna nini huko #billabong!!!!	2015-04-02 13:56:34.826+03
800	254718801789	Anyway birth ya Raqim radah nafai kuwafungulia Acc na nataka kuzifanya the same tym #billabong!!!!	2015-04-02 13:57:23.294+03
801	Safaricom	33.00 KSH has been deducted to repay your Okoa Jahazi.Outstanding Okoa debt is 37.64 KSH.Please top up to continue enjoying our Services.	2015-04-02 13:58:15.014+03
802	MPESA	GT14HR910 confirmed. You bought Ksh33.00 of airtime on 2/4/15 at 1:57 PM New M-PESA balance is Ksh0.00.Dial *234# for Lipa Na MPESA charges	2015-04-02 13:59:08.431+03
884	254718801789	Please call me thank you.	2015-04-04 17:33:01.453+03
803	Safaricom	Request successful.You have received 18.00 KSH.2.00 KSH has been charged as service fee.Your Okoa Credit is 20.00 KSH to be paid before 04-04-2015.	2015-04-02 13:59:08.775+03
804	254718801789	C umesema uko mtindwa unaenda ronga #billabong!!!!	2015-04-02 14:02:13.197+03
805	254718801789	 Tafadhali #billabong!!!!	2015-04-02 14:04:38.604+03
806	254718801789	Ahh hiyo ni kitu kidogo thao #billabong!!!!	2015-04-02 14:05:34.521+03
807	254715162689	uko wea	2015-04-02 14:05:58.643+03
808	254718801789	10th #billabong!!!!	2015-04-02 14:06:20.098+03
809	254718801789	Ntaweka pesa yake ready #billabong!!!!	2015-04-02 14:06:37.838+03
810	254718801789	Hehe aanze kujitayarisha c atanuna alilia ukitoka #billabong!!!!	2015-04-02 14:08:48.533+03
811	254718801789	Na ako na fud #billabong!!!!	2015-04-02 14:09:13.618+03
812	254715162689	sasa utado aje mutameet tao ama	2015-04-02 14:10:26.223+03
813	254718801789	Sawa #billabong!!!!	2015-04-02 14:10:46.059+03
814	254715162689	ok ju nilitaka ukimaliza twende kuona rotich	2015-04-02 14:13:08.16+03
815	254715162689	poa	2015-04-02 14:16:05.052+03
816	254715162689	poa uko	2015-04-02 14:44:35.471+03
817	254723490724	Hey am comin now..in 10 mins..	2015-04-02 14:54:31.172+03
818	254715162689	ok	2015-04-02 14:54:42.041+03
819	254723490724	Ok..niko galleria..so be there..in time.	2015-04-02 14:57:36.162+03
820	254723490724	Nishafika banda school..niko kwa mat	2015-04-02 15:02:22.824+03
821	254723490724	Tupatane kobil. I will wait there..for u...if u r not very far. Umefika wapi exactly?	2015-04-02 15:04:59.763+03
822	254723490724	Uko mbele yangu...	2015-04-02 15:05:39.416+03
823	254723490724	Tupatane kobil	2015-04-02 15:05:49.735+03
824	0717157376	You attempted to call me but I was not available. Please call me. Thank you.	2015-04-02 15:09:22.948+03
825	254715162689	uko	2015-04-02 15:11:01.037+03
826	254723490724	Niko kobil..	2015-04-02 15:11:55.755+03
827	254723490724	Umefika wapi kwani??	2015-04-02 15:15:02.946+03
828	254718801789	Gift yourself or a loved one this Easter with a Samsung Ace 4 for only Kshs.3,150 and pay in 6 easy instalments of Kshs .1,416. Visit Safaricom Shop today.	2015-04-02 15:37:14.892+03
829	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-04-02 16:10:58.856+03
830	Safaricom	Recharge was successful.Balance:22.94 KSH,expiry date:01-07-2015.Tariff:Uwezo.	2015-04-02 16:11:05.777+03
831	Safaricom	57.64 KSH has been deducted to repay your Okoa Jahazi.Your debt account is now fully settled.Thank you for staying with Safaricom.	2015-04-02 16:11:13.776+03
832	Safaricom	You have received 25 Items On-net SMS,Expiry date:04-04-2015.25.000 MB Daily Internet Bundle,Expiry date:04-04-2015.25.000 MB Night Data Bundle,Expiry date	2015-04-02 16:12:38.992+03
833	Safaricom	:03-04-2015.	2015-04-02 16:12:39.216+03
834	254720788534	Breasts zilitulia kabisa?	2015-04-02 16:53:43.631+03
835	254720788534	wacha,sasa haziwezi shikwa nikitaka kucheza nazo	2015-04-02 17:18:56.789+03
836	254715162689	tld u	2015-04-02 17:22:21.912+03
837	254715162689	poa thanx	2015-04-02 17:23:07.63+03
838	254720788534	lakini beb unanienjoyi,ebu ingia inbox nijionee	2015-04-02 17:58:03.737+03
839	254715162689	nyc umefika wea imagyn huku kunanyesha na ndio nafika	2015-04-02 18:17:43.547+03
840	254718801789	Uko na how much #billabong!!!!	2015-04-02 18:26:57.19+03
841	254720788534	acha kucheka fanya ivo	2015-04-02 18:29:54.836+03
842	254720788534	beb!!!	2015-04-02 21:40:20.872+03
843	MPESA	GT22RL935 Confirmed. You do not qualify for a loan. Keep using M-PESA and M-Shwari products to qualify.	2015-04-02 21:41:58.81+03
844	254720788534	Tel mi smetin	2015-04-02 21:43:49.931+03
845	254720788534	lav u too i wish i ws in that bed	2015-04-02 21:49:06.392+03
846	254705641057	Mambo swty...nimekumiss:->si ukam leo aky	2015-04-03 09:37:03.695+03
847	Safaricom	Dear customer,we are unable to process your request for the Masaa Ya SMS service at this time.Please contact Safaricom for more information.	2015-04-03 10:46:00.254+03
848	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-04-03 10:46:08.11+03
849	Safaricom	Your subscription to the Daily 25MB service has been renewed for 20.00 KSH.	2015-04-03 11:24:55.721+03
850	Safaricom	Request successful.You have received 45.00 KSH.5.00 KSH has been charged as service fee.Your Okoa Credit is 50.00 KSH to be paid before 08-04-2015.	2015-04-03 11:24:56.321+03
851	254719598112	nko poa imagyn by 8pm nilikuwa hme	2015-04-03 11:34:21.363+03
852	254719598112	kam ufanye job ju me nanyesha	2015-04-03 11:36:48.99+03
853	Safaricom	You have received 25 Items On-net SMS,Expiry date:05-04-2015.25.000 MB Daily Internet Bundle,Expiry date:05-04-2015.25.000 MB Night Data Bundle,Expiry date	2015-04-03 11:38:15.941+03
854	Safaricom	You have received 20 Items On-net SMS,Expiry date:04-04-2015.	2015-04-03 11:38:15.942+03
855	Safaricom	:04-04-2015.	2015-04-03 11:38:15.941+03
856	254719598112	kuna job bt me cwezi fanya	2015-04-03 11:44:01.481+03
857	254719598112	kuja utapata job ya doh poa	2015-04-03 11:45:34.803+03
858	254719598112	poa	2015-04-03 11:46:27.546+03
859	254719598112	kuja tu utapata doh	2015-04-03 11:47:09.401+03
860	254719598112	kam na lashes uniwekee pls	2015-04-03 12:07:59.743+03
861	254719598112	umefika ju naenda kwa mum kiasi bt nimewacha key kwa dirisha ya jikoni	2015-04-03 13:43:09.614+03
862	254719598112	utapata key kwa hao ama ukam kwa mum	2015-04-03 13:46:17.375+03
863	254719598112	siendi kukaa kwa mum kuna client anakam nataka akupate kwa nyumba naenda for prayers narudi umefika wapi ju nko hapa tumaini	2015-04-03 13:52:04.245+03
864	254719598112	ok uko almst ama	2015-04-03 13:54:42.039+03
865	MPESA	GT30JF544 Confirmed. You have received Ksh1,527.00 from John Alando 254718801789 on 3/4/15 at 1:54 PM New M-PESA balance is Ksh1,529.00.Pay Bills via M-PESA	2015-04-03 13:55:11.644+03
866	254719598112	uko kwa mat inakaaje	2015-04-03 13:56:45.939+03
867	254719598112	ju nataka kuku wachia phne umefika	2015-04-03 13:59:28.716+03
868	254719598112	mum ndio ananiharakisha ju anataka kutoka me nko stage	2015-04-03 14:01:06.239+03
869	254719598112	ok	2015-04-03 14:04:03.028+03
870	254719598112	stage ya kobil	2015-04-03 14:10:02.85+03
871	254719598112	client anafika in 5mins uko	2015-04-03 14:12:58.123+03
872	254720788534	ndo namalizia,ntakusho nikikaribia mtaani.	2015-04-03 14:34:54.125+03
873	254705611869	Ok so haupiti	2015-04-03 16:13:42.173+03
874	254720788534	ndo nimefika,nashower tupatane kwa shop	2015-04-03 16:28:01.718+03
875	254718801789	Nakam #billabong!!!!	2015-04-03 20:23:02.684+03
876	254712764544	poa sana	2015-04-03 20:34:57.333+03
877	254712764544	nothing big dia just missed u	2015-04-03 20:38:17.172+03
878	0727835787	I tried to call you at 15:04 on 04 Apr Please call back.	2015-04-04 17:29:07.653+03
879	0733770077	I tried to call you at 11:50 on 04 Apr Please call back.	2015-04-04 17:29:07.75+03
880	0727947113	I tried to call you at 15:32 on 04 Apr Please call back.	2015-04-04 17:29:07.771+03
885	254718801789	Hehe naona wewe na bwanaako mumesota #billabong!!!!	2015-04-04 17:46:57.153+03
886	254718801789	Treva Tuesday anafaa 2500 pliz I want him to go to school #billabong!!!!	2015-04-04 17:47:54.046+03
887	254718801789	So days our priority #billabong!!!!	2015-04-04 17:50:46.171+03
888	254718801789	My love talk.to me #billabong!!!!	2015-04-04 21:47:34.226+03
889	254718801789	 Kiambu rd and Ina rain stupid bt nimekufkiria tu Leo tumepitia mob Sana you my wyf u know dat #billabong!!!!	2015-04-04 21:51:53.199+03
890	254715162689	yea aki mpaka nashndwa kutoka	2015-04-04 22:32:25.291+03
891	254718801789	Nataka tufanye shopn ya keja #billabong!!!!	2015-04-04 22:36:57.764+03
892	254718801789	Aye mpenzi #billabong!!!!	2015-04-04 22:46:37.17+03
893	254710734325	poa mumy 9t	2015-04-04 23:17:35.632+03
894	254718801789	Hiyo #billabong!!!!	2015-04-04 23:27:41.941+03
895	254718801789	 Huwezi c ntakuja nikusho na utry basi #billabong!!!!	2015-04-04 23:30:07.741+03
896	254718801789	Ati hakuna Jana hiyo ni #billabong!!!!	2015-04-04 23:33:44.655+03
897	254718801789	Aii tena inataka jam kitu Kama hiyo #billabong!!!!	2015-04-04 23:34:44.776+03
898	254705641057	Niko kwa hao tu...wacha nimuulize	2015-04-05 11:06:57.766+03
899	254705641057	Hajatoa bado...atakushw akiwa ready	2015-04-05 11:12:38.125+03
900	MPESA	Failed. You are currently not allowed access to this service. For more information call customer care on 234	2015-04-05 13:12:38.057+03
901	254715162689	ok	2015-04-05 13:21:43.353+03
902	MPESA	GT60TM455 Confirmed. You have received Ksh230.00 from ROSEMARY NAMWAYA 254719598112 on 5/4/15 at 2:27 PM New M-PESA balance is Ksh255.00.Pay Bills via M-PESA	2015-04-05 14:27:51.24+03
903	254720788534	ok ukipitia tao nikol nikusamilie...nn unakosana na mathako?	2015-04-06 16:14:51.094+03
904	254720788534	ok untaka ngapi	2015-04-06 19:39:29.274+03
905	MPESA	GT80WB863 Confirmed. on 6/4/15 at 7:43 PM Withdraw Ksh200.00 from 003056 - Phoneart Sheriff Centre Bungoma EXT New M-PESA balance is Ksh273.00.Dial *844#	2015-04-06 19:43:44.359+03
906	MPESA	 for KCB MPESA Account	2015-04-06 19:43:45.481+03
907	254720788534	ingekuwa plce ingine ni sawa bt umo zii mm sina shida nko free	2015-04-06 19:44:01.319+03
908	254720788534	yeah nimekuwa kwa ofisi na HR ni cheque tu imebakisha bt soon watatujenga.ni chwa poa.ntakusho kesho tukiingia.	2015-04-06 21:42:45.346+03
909	0712366045	I tried to call you at 21:23 on 06 Apr Please call back.	2015-04-06 21:43:13.607+03
910	254789262233	Ambia stella ata akizima 4n nairobi ni small tutapatana tu	2015-04-06 22:06:15.912+03
911	254710734325	yu too mumy al c u kesho	2015-04-06 22:25:22.325+03
912	254715162689	unakam kweli	2015-04-07 12:52:54.473+03
913	254715162689	omoh ameenda nko tu na mtoi	2015-04-07 12:56:10.979+03
914	254715162689	unakam	2015-04-07 13:41:58.099+03
915	254715162689	ouk ju nilikuwa nimeshw client tuko wawili	2015-04-07 13:51:33.813+03
916	254720788534	Zote za 3k ni chafu ama?	2015-04-07 13:57:30.556+03
917	254715162689	bt yeye ni wa arnd 3pm	2015-04-07 13:58:27.493+03
918	254720788534	sa tufanyeje ju najua izo area kuget hao poa si rahisi bt sai nlikuwa nataka ya 3 kwanza then,july apo 1 bdrm	2015-04-07 14:03:58.798+03
919	Safaricom	Request successful.You have received 18.00 KSH.2.00 KSH has been charged as service fee.Your Okoa Credit is 20.00 KSH to be paid before 12-04-2015.	2015-04-07 14:20:16.033+03
920	254723302767	Niajezz	2015-04-07 16:27:42.3+03
921	254726084222	Wacha nikukal	2015-04-08 08:38:43.372+03
922	254726084222	Wait kiasi 2	2015-04-08 08:43:13.252+03
923	254720788534	wacha ntacheki	2015-04-08 08:45:43.023+03
924	Safaricom	You have received 20 Items On-net SMS,Expiry date:09-04-2015.	2015-04-08 08:47:06.706+03
925	Safaricom	Dear customer,we are unable to process your request for the Daily 25MB service at this time.Please contact Safaricom for more information.	2015-04-08 08:47:15.366+03
926	MPESA	GU02FS514 Confirmed. You have received Ksh627.00 from Stellah Andaje 254726084222 on 8/4/15 at 9:19 AM New M-PESA balance is Ksh783.00.Pay Bills via M-PESA	2015-04-08 09:19:42.889+03
927	254726084222	Umepata?	2015-04-08 09:22:18.007+03
928	254705611869	Mdame niko hosi nakam by 12	2015-04-08 10:25:09.116+03
929	MPESA	M-PESA has received your request but is experiencing some delays. Please wait at least 10 minutes for a response before retrying your transaction.	2015-04-10 12:14:14.82+03
930	254705641057	Please call me thank you.	2015-04-10 12:15:10.017+03
931	MPESA	Failed. You do not have enough money in your M-PESA account to withdraw Ksh300.00 from 06853. You must be able to pay the transaction fee as well as the 	2015-04-10 12:18:33.475+03
932	MPESA	requested amount. Your M-PESA balance is Ksh16.00	2015-04-10 12:18:34.123+03
933	MPESA	M-PESA has received your request but is experiencing some delays. Please wait at least 10 minutes for a response before retrying your transaction.	2015-04-10 12:21:36.494+03
934	MPESA	Failed. You do not have enough money in your M-PESA account to withdraw Ksh300.00 from 06853. You must be able to pay the transaction fee as well as the 	2015-04-10 12:33:31.078+03
935	MPESA	requested amount. Your M-PESA balance is Ksh16.00	2015-04-10 12:33:32.04+03
936	254705611869	Woi nachoka	2015-04-10 17:37:11.716+03
937	254705611869	Nimefika	2015-04-10 17:49:41.326+03
938	254705611869	Nimeingia ata	2015-04-10 17:51:21.665+03
939	MPESA	GU45IG607 Confirmed. You have received Ksh110.00 from John Alando 254718801789 on 10/4/15 at 5:55 PM New M-PESA balance is Ksh116.00.Pay Bills via M-PESA	2015-04-10 17:55:21.047+03
940	254720788534	ok sawa	2015-04-10 17:59:05.046+03
941	254719598112	nilipie nakutumia by 8pm	2015-04-10 18:00:43.204+03
942	254719598112	wah ju sai sna kwa mpesa na nko na 50bob kwa nyumba	2015-04-10 18:02:53.623+03
943	0720514353	I tried to call you at 18:33 on 10 Apr Please call back.	2015-04-10 18:35:28.028+03
944	254720788534	mattress?	2015-04-10 18:36:50.202+03
945	MPESA	JG18N5HK1M Confirmed.on 1/7/15 at 8:40 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh20.00	2015-07-01 08:40:21.435+03
946	MPESA	JGK6QVM9J4 Confirmed.on 20/7/15 at 7:25 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh30.00	2015-07-20 07:25:49.82+03
949	MPESA	JGK8QVWC2A Confirmed.on 20/7/15 at 8:27 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh60.00	2015-07-20 08:27:28.986+03
950	MPESA	JGK9QVX07H Confirmed.on 20/7/15 at 8:30 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh70.00	2015-07-20 08:30:53.996+03
951	MPESA	JGN4RHAHWQ Confirmed.on 23/7/15 at 9:56 AMKsh10.00 received from 254720920293 SAMUEL GACHANJA.New Account balance is Ksh80.00	2015-07-23 09:56:55.181+03
952	MPESA	JGN6RK54PU Confirmed.on 23/7/15 at 4:33 PMKsh10.00 received from 254722943835 DANIEL THANG'WA.New Account balance is Ksh90.00	2015-07-23 16:33:15.735+03
953	SAFARICOM	Dear Customer, this weekend purchase airtime via MPESA easily and conveniently at the comfort of your home or office.	2015-07-25 10:35:01.061+03
954	254720920293	this is a test	2016-04-24 09:46:19.649+03
955	wassiata	+254720920293	2016-04-24 15:56:04.571+03
956	wassiata	+254720920293	2016-04-24 15:58:20.12+03
957	254720920293	wassiata	2016-04-24 15:59:51.029+03
958	254720920293	http call	2016-04-24 16:15:12.109+03
959	MPESA	KDO0L8KAQU Confirmed.on 24/4/16 at 4:21 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh250.00	2016-04-24 16:22:03.711+03
960	MPESA	KDP0LDD3IC Confirmed.on 25/4/16 at 7:42 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh260.00	2016-04-25 07:42:38.664+03
961	MPESA	KDP9LHWR6L Confirmed.on 25/4/16 at 3:46 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh280.00	2016-04-25 15:46:09.576+03
962	MPESA	KDP9LI6SNN Confirmed.on 25/4/16 at 4:12 PMKsh10.00 received from 254720246622 ANASTASIA KIMUYU.New Account balance is Ksh300.00	2016-04-25 16:12:52.036+03
963	MPESA	KE16N1JFLW Confirmed.on 1/5/16 at 2:29 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh330.00	2016-05-01 02:30:05.849+03
964	MPESA	KE12N1JKS6 Confirmed.on 1/5/16 at 2:35 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh350.00	2016-05-01 02:35:41.268+03
965	MPESA	KE18N1JTYW Confirmed.on 1/5/16 at 2:48 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh370.00	2016-05-01 02:48:27.035+03
966	MPESA	KE10N1JUZC Confirmed.on 1/5/16 at 2:50 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh390.00	2016-05-01 02:50:09.469+03
967	MPESA	KE15N1JUIJ Confirmed.on 1/5/16 at 2:52 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh410.00	2016-05-01 02:52:25.135+03
968	MPESA	KE18N1JVYU Confirmed.on 1/5/16 at 2:53 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh430.00	2016-05-01 02:53:57.228+03
969	MPESA	KE11N1LA33 Confirmed.on 1/5/16 at 4:17 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh440.00	2016-05-01 04:17:42.307+03
970	MPESA	KE14N1LDO2 Confirmed.on 1/5/16 at 4:22 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh460.00	2016-05-01 04:22:21.098+03
971	MPESA	KE15N9YSVF Confirmed.on 1/5/16 at 8:36 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh470.00	2016-05-01 20:36:13.133+03
972	MPESA	KE18N9Z1RI Confirmed.on 1/5/16 at 8:36 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh480.00	2016-05-01 20:37:01.233+03
973	MPESA	KE17N9ZEVF Confirmed.on 1/5/16 at 8:37 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh490.00	2016-05-01 20:37:46.291+03
974	MPESA	KE19N9ZW3R Confirmed.on 1/5/16 at 8:38 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh500.00	2016-05-01 20:38:40.557+03
975	MPESA	KE13NA05DR Confirmed.on 1/5/16 at 8:39 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh510.00	2016-05-01 20:39:20.454+03
976	MPESA	KE17NA0DVP Confirmed.on 1/5/16 at 8:39 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh520.00	2016-05-01 20:39:53.943+03
977	MPESA	KE14NA0ITY Confirmed.on 1/5/16 at 8:40 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh530.00	2016-05-01 20:40:19.113+03
978	MPESA	KE19NA154B Confirmed.on 1/5/16 at 8:41 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh540.00	2016-05-01 20:41:55.576+03
979	MPESA	KE10NA2IAM Confirmed.on 1/5/16 at 8:45 PMKsh10.00 received from 254724541318 ANN WANGARI.New Account balance is Ksh550.00	2016-05-01 20:45:29.084+03
980	MPESA	KE16NA2FK6 Confirmed.on 1/5/16 at 8:45 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh560.00	2016-05-01 20:45:30.643+03
981	Safaricom	Dear customer,your Data Bundle is almost finished.Dial *544# to check your data bundle balance.	2016-05-01 20:59:31.998+03
982	MPESA	KE19NA7S8N Confirmed.on 1/5/16 at 8:59 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh581.00	2016-05-01 20:59:52.078+03
983	MPESA	KE12NA8GG4 Confirmed.on 1/5/16 at 9:01 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh591.00	2016-05-01 21:01:54.182+03
984	MPESA	KE11NA94YB Confirmed.on 1/5/16 at 9:03 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh601.00	2016-05-01 21:04:23.445+03
985	MPESA	KE13NA9PR9 Confirmed.on 1/5/16 at 9:05 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh611.00	2016-05-01 21:05:29.506+03
986	MPESA	KE18NB41XG Confirmed.on 1/5/16 at 11:20 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh621.00	2016-05-01 23:20:35.49+03
987	MPESA	KE25NBWQE9 Confirmed.on 2/5/16 at 6:47 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh631.00	2016-05-02 06:47:32.547+03
988	MPESA	KE25NBWRGL Confirmed.on 2/5/16 at 6:47 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh641.00	2016-05-02 06:48:02.395+03
989	MPESA	KE26NCC31U Confirmed.on 2/5/16 at 8:08 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh651.00	2016-05-02 08:08:48.271+03
990	MPESA	KE23NCCFY7 Confirmed.on 2/5/16 at 8:09 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh661.00	2016-05-02 08:10:08.604+03
991	MPESA	KE25NCCTR7 Confirmed.on 2/5/16 at 8:11 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh671.00	2016-05-02 08:11:26.69+03
992	MPESA	KE21NGDO7D Confirmed.on 2/5/16 at 2:46 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh681.00	2016-05-02 14:46:43.099+03
993	MPESA	KE24NH6FGW Confirmed.on 2/5/16 at 3:59 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh691.00	2016-05-02 15:59:56.714+03
994	MPESA	KE29NIS67R Confirmed.on 2/5/16 at 6:17 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh701.00	2016-05-02 18:17:22.633+03
995	MPESA	KE23NJOWJL Confirmed.on 2/5/16 at 7:24 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh711.00	2016-05-02 19:25:10.015+03
996	MPESA	KE21NJQ46N Confirmed.on 2/5/16 at 7:27 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh721.00	2016-05-02 19:27:09.177+03
997	MPESA	KE37NMDJD7 Confirmed.on 3/5/16 at 4:53 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh731.00	2016-05-03 04:53:39.469+03
998	MPESA	KE33NPHUZN Confirmed.on 3/5/16 at 11:50 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh741.00	2016-05-03 11:50:34.721+03
999	MPESA	KE32NX27XY Confirmed.on 3/5/16 at 11:16 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh751.00	2016-05-03 23:16:33.449+03
1000	MPESA	KE42NYZPBY Confirmed.on 4/5/16 at 9:13 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh761.00	2016-05-04 09:13:12.056+03
1001	MPESA	KE45O5X21F Confirmed.on 4/5/16 at 7:25 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh771.00	2016-05-04 19:25:29.341+03
1002	MPESA	KE55OAZ2JZ Confirmed.on 5/5/16 at 10:48 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh781.00	2016-05-05 10:48:30.459+03
1003	MPESA	KE53OC5CXH Confirmed.on 5/5/16 at 12:41 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh791.00	2016-05-05 12:41:24.177+03
1004	MPESA	KE67OJZUPJ Confirmed.on 6/5/16 at 7:52 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh801.00	2016-05-06 07:52:37.629+03
1005	SAFARICOM	Have a question and want a REAL teacher to answer your question? Dial *291# and ask any academic question for only 10bob/week. Call 0707908308 to learn more.	2016-05-06 11:51:07.989+03
1006	MPESA	KE72OTS6C8 Confirmed.on 7/5/16 at 12:43 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh811.00	2016-05-07 00:43:53.694+03
1007	MPESA	KE84PCJWRY Confirmed.on 8/5/16 at 5:39 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh821.00	2016-05-08 17:39:59.937+03
1008	MPESA	KE99PK5HY3 Confirmed.on 9/5/16 at 2:17 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh831.00	2016-05-09 14:17:54.127+03
1009	MPESA	KE95PKPJLF Confirmed.on 9/5/16 at 3:11 PMKsh150.00 received from 254722476121 JANE MARGARET.New Account balance is Ksh981.00	2016-05-09 15:11:19.323+03
1010	MPESA	KEA6PQMTI6 Confirmed.on 10/5/16 at 8:21 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh881.19	2016-05-10 08:21:42.872+03
1011	SAFARICOM	Enjoy sending SMS for less than 1 shilling per message. Simply dial *188# and select 20SMS at Ksh5 daily. Thank you, from Safaricom.   	2016-05-10 13:07:24.011+03
1012	MPESA	KEB2PZZKES Confirmed.on 11/5/16 at 6:59 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh891.19	2016-05-11 06:59:31.355+03
1013	SAFARICOM	Enjoy the FASTEST internet in Kenya, get 150MBs and 150 SMSs! Dial *544*1# to buy The bundle at only 50 shillings	2016-05-11 11:57:58.708+03
1014	SAFARICOM	Dial *544*1# and enjoy 150MBs and 150SMSs this holiday! Visit games.safaricom.com and get the coolest games on your phone  	2016-05-12 13:15:42.371+03
1015	MPESA	KEC8QIP9SW Confirmed.on 12/5/16 at 8:14 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh901.19	2016-05-12 20:14:11.872+03
1016	MPESA	KEC8QJ9888 Confirmed.on 12/5/16 at 9:06 PMKsh10.00 received from 254720246622 ANASTASIA KIMUYU.New Account balance is Ksh911.19	2016-05-12 21:06:10.583+03
1017	Shupavu291	Complete KCPE, KCSE, Teacher Refresher Course or Business Course and receive a Shupavu291 certificate by dialing *291# for only KES10/Week. Call 0707908308	2016-05-13 14:11:58.668+03
1018	REDCROSS	Kampeni ya chanjo ya ukambi-rubella inaanza kesho! Leta watoto walio miezi 9 hadi miaka 14 katika kituo cha afya karibu nawe, 16 May-24 May. Idadi dharura 1199	2016-05-15 11:44:23.772+03
1019	MPESA	KEH3RPBA3H Confirmed.on 17/5/16 at 8:25 AMKsh10.00 received from 254725061433 FLEVIAN NAOMI LIJOODI.New Account balance is Ksh20.79	2016-05-17 08:25:50.488+03
1020	SAFARICOM	Get 100% BONUS every time you reach your target, check your target and bonus balance by dialing *460#. Than you. Safaricom	2016-05-17 11:52:15.172+03
1021	SAFARICOM	No need to call customer care anymore, download the Safaricom App from Google Playstore and have all the information you need in your phone.	2016-05-18 13:19:39.932+03
1022	SAFARICOM	Safaricom is rewarding you with bonus airtime on all M-PESA top ups. To enjoy this limited offer, go to M-PESA menu and select buy airtime.	2016-05-19 16:13:01.644+03
1023	Shupavu291	Grow your small business by taking a business course & also let your child access 8-4-4 lessons & questions for only 10bob/week. Call 0707908308 to learn more	2016-05-20 16:44:05.794+03
1024	MPESA	KEM0T3Q27S Confirmed.on 22/5/16 at 11:16 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh30.79	2016-05-22 11:16:44.459+03
1025	MPESA	KEM0T3Q27S Confirmed.on 22/5/16 at 11:16 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh30.79	2016-05-22 11:16:57.964+03
1026	SAFARICOM	Dial *544*1# and enjoy 150MBs and 150SMSs. Visit games.safaricom.com and get the coolest games on your phone	2016-05-24 15:27:25.952+03
1027	SAFARICOM	Dial *544*1# and enjoy 150MBs and 150SMSs. Visit games.safaricom.com and get the coolest games on your phone	2016-05-24 15:27:26+03
1028	MPESA	KEP8TSF6AU Confirmed.on 25/5/16 at 7:30 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh50.79	2016-05-25 07:30:34.334+03
1029	Shupavu291	Pass your exams by taking ALL 8-4-4 examinable subjects with lessons and questions for only10bob/week by dialing *291#. Call 0707908308 for more information	2016-05-27 13:18:34.979+03
1030	MPESA	KER6UFVGC2 Confirmed.on 27/5/16 at 5:09 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh60.79	2016-05-27 17:09:06.301+03
1031	Safaricom	Dear Customer,your data bundle will expire on 31/05/2016 21:17:49.To extend validity dial *544# to buy another bundle.	2016-05-29 11:54:16.946+03
1032	Safaricom	Dear Customer,your data bundle will expire on 31/05/2016 21:17:49.To extend validity dial *544# to buy another bundle.	2016-05-29 11:54:17.004+03
1033	MPESA	KEU1V2NYLZ Confirmed.on 30/5/16 at 7:23 AMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh70.79	2016-05-30 07:23:21.802+03
1034	BLAZE	BLAZE is a platform that wants to connect you with products, mentors and services that can help you plan for success. Dial *555# and join BLAZE today.  	2016-05-30 15:47:47.262+03
1035	MPESA	KEV6VJC05E Confirmed.on 31/5/16 at 7:22 PMKsh10.00 received from 254720920293 SAMUEL ELIJAH GACHANJA.New Account balance is Ksh80.79	2016-05-31 19:22:06.823+03
1036	Safaricom	Recharge was successful.Balance:250.00 KSH,expiry date:2035-08-01.Tariff:Mpesa_Agent.	2016-06-01 06:28:57.149+03
1037	Safaricom	You have received 25.00 KSH Mpesa Bonus Airtime.Expiry Date:2016-06-02 .	2016-06-01 06:28:58.08+03
1038	Safaricom	Recharge was successful.Balance:250.00 KSH,expiry date:2035-08-01.Tariff:Mpesa_Agent.	2016-06-01 06:28:58.996+03
1039	Safaricom	You have received 25.00 KSH Mpesa Bonus Airtime.Expiry Date:2016-06-02 .	2016-06-01 06:28:59.386+03
1040	Safaricom	You have received 10.00 KSH Mpesa Bonus Airtime.Expiry Date:2016-06-02 .	2016-06-01 06:30:01.617+03
1041	Safaricom	Recharge was successful.Balance:411.13 KSH,expiry date:2035-08-01.Tariff:Mpesa_Agent.	2016-06-01 06:31:18.255+03
1042	Safaricom	You have received 20.00 KSH Mpesa Bonus Airtime.Expiry Date:2016-06-02 .	2016-06-01 06:31:18.633+03
1043	Safaricom	Recharge was successful.Balance:411.13 KSH,expiry date:2035-08-01.Tariff:Mpesa_Agent.	2016-06-01 06:31:18.739+03
1044	Safaricom	You have received 20.00 KSH Mpesa Bonus Airtime.Expiry Date:2016-06-02 .	2016-06-01 06:31:19.226+03
1045	Safaricom	You have received 350.0 MB Data Bundle,Expiry date:2016-07-01.	2016-06-01 06:33:46.332+03
1046	SAFARICOM	Congratulations!! Your daily target is NOW easy to achieve. Enjoy100% Bonus on reaching your target. To check your target and bonus balance, dial *460#  	2016-06-02 11:49:27.02+03
1047	SAFARICOM	Congratulations!! Your daily target is NOW easy to achieve. Enjoy100% Bonus on reaching your target. To check your target and bonus balance, dial *460#  	2016-06-02 11:49:27.063+03
1048	BLAZE	BLAZE by Safaricom is a network for the Young. Be Mentored, Shop with BLAZE Bonga, Create your own more affordable bundles. Dial *555# to join the BLAZE world.	2016-06-06 16:36:10.396+03
1049	SAFARICOM	Safaricom will be rewarding you with BONUS airtime every time you recharge with M-PESA. Go to M-PESA menu, select buy airtime	2016-06-08 12:59:55.884+03
1050	SAFARICOM	Safaricom will be rewarding you with BONUS airtime every time you recharge with M-PESA. Go to M-PESA menu, select buy airtime	2016-06-08 12:59:56.075+03
1051	SAFARICOM	Check bills, airtime balance, data usage and much more on the new mySafaricom app. Download it from https://goo.gl/LWyCuQ	2016-06-09 13:27:35.482+03
\.


--
-- Name: inmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('inmessage_id_seq', 1051, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: work
--

COPY jobs (id, companyid, userid, referenceno, title, summary, jobdescription, qualifications, experience, instructions, startdate, enddate, email, maxapplications, datemodified, attachment, formid, positionsid, salaryid, categoryid, accountid) FROM stdin;
39	1	1	000028	Masseuse	New Palor Along Thika Road	We are seeking motivated massage therapists to join the team. experience preferred but not essential.<br><ul><li>Flexible Hours  </li><li>Non Sexual Massages </li><li>Male Grooming </li><li>Female Owner </li><li>Immediate Start </li><li>Weekends and Weekdays </li><li>Safe & Clean Environment</li><li>Must be able to travel.</li></ul><br>	-<br>	Experience not essential<br>	Apply on this web site<br>	2016-06-05	2016-07-31		\N	2016-06-05 01:43:30.804	\N	\N	\N	6	23	1
1	2	2	SQ1	Sales Executives	Required to push day to day marketing of the company to recruitment agencies and other potential recruiters.	An I.T solutions company requires energetic and driven staff to assist in pushing their business into the market.	Diploma or Certificate in Marketing.	No experience required. School leavers can apply.	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br>Must be ready to take initiative for their own work, and drive results unsupervised.	2014-06-05	2015-05-26	velvetconcepts@gmail.com	100	2014-06-05 02:29:42.95	\N	\N	3	3	19	2
40	1	1	000029	Bar Attendant	Bar Attendant Wanted	Located in Lavington.<br>Salary 10,000 per month, lots of tips, accomodation and food provided,<br>	Lady under 28 years preffered<br>	Previous experience is a plus<br>	Apply here!<br>	2016-06-09	2016-06-30		\N	2016-06-09 01:34:19.893	\N	\N	1	3	23	1
15	13	5	ICPSB/HR/1/2015/26	Cohesion Officer Job Group "L"	Lead the development, implementation and evaluation of the County policies, strategies and activities, and form effective partnerships with external bodies, in relation to Promotion of community cohesion across Isiolo County.	<ul><li>Manage, in collaboration with services across the country the county, the co-ordination and delivery of the community cohesion strategy and action plan, and plan for and respond to initiatives coming from central government and other bodies in relation to this area, and monitor activity within the County to identify the impact on community cohesion of County services. Advise and assist officers in understanding these implications and in developing policy and strategy that promotes community cohesion.</li><li>Lead and manage the planning, administering and supporting of the work programme of the County Equality, Inclusion and Cohesion Strategic Group in relation to community cohesion matters and report regularly on progress, including the reporting of performance measurement, and proposing remedial action where required</li><li>Establish effective working partnerships with statutory external agencies, Voluntary, community and focus group to develop a co-ordinated approach to monitoring, measuring and evaluating community cohesion activity within Isiolo County, and to contingency planning in relation to community cohesion issues. Work with the County Communications Department to publicize and promote community cohesion.</li><li>Proactively, and in collaboration where necessary with others including external partners such as the police, to identify, investigate and monitor  potential or consulting local residents and community groups, and to formulate strategies and recommendations for actions to address these problems.</li><li>Plan for and manage the commissioning of, and oversee the delivery of, projects and initiatives, and any other funding coming from national government or other bodies in relation to community cohesion and associated matters.</li><li>Prepare and present reports and regular briefings to Members, senior officers and wider partners as required, attend, participate and network at meetings with community cohesion interest and deliver Presentation, Seminars and Training events.</li><li>Undertake research projects, programmes and initiates with community Cohesion implications, deploying a range of research techniques to evaluate and disseminate information and good practice.</li></ul>\r\n\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	 	 	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:17:22.648	\N	\N	\N	\N	8	5
2	1	1	suecompany0001	Senior Accountant	Senior accountant required	Job description goes here<br>	Qualifications go here<br>	experience goes here<br>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br>apply on http://myjob.co.ke<br>	2014-06-10	2015-05-26	gachanja@myjob.co.ke	50	2014-06-10 04:19:50.699	q.odt	\N	1	7	1	3
6	13	5	ICPSB/HR/1/2015/28	Human resource officers (2 positions), Job Group "K"	Reporting to the Assistant Director HR and Administration; the Officer will be responsible for managing the Human Resources in the County public service Board.	<ul><li>Establish and operationalize the Human Resource Management function of the Board.</li><li>Carry out staff audits.</li><li>Identify gaps and develop optimal staffing levels at the Board.</li><li>Administration of payroll adjustments, on-boarding of new staff, preparing and distributing staff handbooks and other HR materials.</li><li>Prepare the budget for the HR function.</li><li>Assist in all administrative activities relating to medical aid, insurance, health, & safety, staff retirement benefits and staff leave administration.</li><li>Ensure correct interpretation of human resource policies, rules, regulations, labour laws and other relevant statutes.</li><li>Establish performance management systems.</li><li>Ensure compliance with public service values and principles in the Board.</li><li>Establish records management systems and organizing for transfer of all Human Resource records from both national and former local governments.</li><li>Draft job descriptions in consultation with heads of department.</li><li>Preparation of human resource transition reports.</li><li>Promote equality, diversity and inclusiveness as part of the culture of the County.</li><li>Perform any other duties as may be assigned from time to time.</li></ul><span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>Be a Kenyan citizen</li><li>A bachelor"s degree in HR or Social Sciences</li><li>Higher National Diploma in HRM or a post graduate Diploma in HR from a reputable institution.</li><li>Must have attended a course in strategic leadership skills</li><li>Strong interpersonal and leadership skills</li><li>Rounded experience and knowledge of labour laws, procedures and policies</li><li>Must be a member of IHRM.</li><li>Knowledge of IPPD system will be an added advantage</li><li>Satisfy the requirements of Chapter six of the Kenyan Constitution</li><li>An MBA will be an added advantage</li></ul>	Minimum of three (3) years working experience in a HR position at a senior level	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:22:52.377	\N	\N	\N	\N	8	5
3	1	1	suecompany0002	veternary doc	vet required	\r\n\r\n\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">samuelgachanjasam</p>\r\n\r\n	\r\n\r\n\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">samuelgachanjasam</p>\r\n\r\n	\r\n\r\n\t\r\n\t\r\n\t\r\n\t<style type="text/css">P { margin-bottom: 0.08in; }</style>\r\n\r\n\r\n<p style="margin-bottom: 0in">samuelgachanjasam</p>\r\n\r\n	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br>apply online here<br>	2014-06-09	2015-05-26		400	2014-06-10 06:00:36.655	\N	\N	2	7	2	3
14	13	5	ICPSB/HR/1/2015/30	Civil Engineer (1 Post) Job Group "K"	Head of the structural department and responsible for its organization, management and administration.	<div style="text-align: left;"><ul><li>Direction, Control and coordination of all the county activities relating to planning & design.</li><li>Construction and Maintenance of civil works.</li><li>Ensure efficiency of design and tract drawings, implementation of specification and quality control and quality control formulation of design standards and procedures.</li><li>Development of research and materials in building technology.</li><li>Formulation of policy and development of standards.</li></ul></div>	<ul><li>Be a Kenyan citizen</li><li>Have a Bachelor Degree in Civil Engineering or its equivalent from a recognized University </li><li>Have been registered by the Engineers Registration Board of Kenya</li><li>Have membership with Institute of Engineers of Kenya</li><li>Attended the project managerial course lasting not less than four (4) weeks from a recognized institution</li><li>Demonstrated general administrative ability required for direction, control and implementation of civil engineering services</li><li>Satisfy the requirement of Chapter Six of the Constitution of Kenya</li></ul>	<ul><li>Must have served in the grade of Job Group J for at least three (3) years</li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:17:59.454	\N	\N	\N	\N	8	5
5	13	5	ICPSB/HR/1/2015/29	Accountant Job Group "K"	The Officer will be responsible to the Assistant director, finance and planning for the efficient management and accounting services at the Board.	Specific duties will include:<br>Book keeping and filing of financial records.<br>Advising Board on accounting matters.<br>Implementing approved government accounting standards and reporting formats.<br>Oversee the implementation of the approved accounting standards, policies bases and concepts to ensure compliance.<br>Direct and control operations of the Board account.	Be a Kenyan citizen.<br>Bachelor degree in either Finance, Accounting, Business Administration, Commerce or in a relevant equivalent.<br>Be a holder of CPA (K) or its recognized equivalent.<br>Be registered with the Institute of Certified Public Accountants of Kenya (ICPAK).<br>Familiarity with policies, laws regulations and operating of Public Finance Management.<br>Satisfy the requirements of Chapter six of the Constitution.	Relevant working experience of not less than three years.	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:27:58.954	\N	\N	\N	\N	8	5
8	13	5	ICPSB/HR/1/2015/25	Assistant director (Governance, Ethics and Compliance), Job Group "P"	This person will be responsible for developing and operationalizing governance, ethics and compliance in the County public service.	<ul><li>Exercise disciplinary control over and removing persons holding or acting in offices.</li><li>Prepares briefs on discipline cases, appeals and applications for review to be considered by the board. </li><li>Where decisions in the disciplinary cases are contested in court, the officers appear as witnesses. </li><li>Promote values and principles referred to in Articles 10 & 232 of the Constitution. </li><li>Prepare regular reports for submission to the County Assembly and its relevant committees.</li><li>Preparing briefs on disciplinary cases received in the county for decision making by the board. </li><li>Preparing briefs on appeals and applications for review to be considered by the board. </li><li>Ensuring conformity and compliance to HR policies, procedures, guidelines and regulations and articles 232 (1) on values and principles of Public Service. </li><li>Performing any other duties as may be assigned from time to time. </li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>Demonstrate high degree of professional competence, administrative capabilities and initiative in the general organization and management of ethics, compliance and governance. </li><li>Have bachelor’s degree in any of the following disciplines:- Ethics and Leadership/Governance, Bachelor of Commerce, (Audit / Finance options), Law, or Public Administration from a recognized university;.</li><li>A Master Degree in Law, Finance, Governance, ethics, Public Administration or any other relevant field from a recognized university will be an added advantage. </li><li>Relevant professional qualifications where applicable. </li><li>A certificate/ approved qualification in investigations from a recognized institution. </li><li>Certificate in computer application skills. </li><li>Have demonstrated integrity and professional competence as reflected in work performance and results.</li><li>Satisfy the requirements of chapter six of the Constitution of Kenya.</li></ul>	<ul><li>Minimum relevant experience of 5 years. </li><li>Served in the grade of ethics/governance officer I or in a comparable position for a minimum period of 2 years with proven experience in Law enforcement on anti-corruption, ethics and governance matters. </li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:21:34.097	\N	\N	\N	\N	8	5
10	13	5	ICPSB/HR/1/2015/22	Director Human Resource Management, Job Group "R"	Responsible to Chief Officer – Public Service Management and ICT	<ul><li>Maintain the work structure by updating job requirements and job descriptions for all positions.</li><li>Carry out staff audits, identifying gaps and proposing optimal staffing level in the county.</li><li>Preparing the budget for the HRM function.</li><li>Ensuring correct interpretation of human resource policies, rules, regulations, labour laws and other relevant statutes.</li><li>Establishing performance management systems and organizing for transfer of all human resource records from both national and county agencies.</li><li>Preparation of human resource transition reports and</li><li>Performing any other duties as assigned.</li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>Have a Bachelors degree in any of the following: Commerce (Human Resource Management Option), Social Sciences or any other relevant and equivalent qualification from a recognized university</li></ul>	 	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:27:33.195	\N	\N	\N	\N	8	5
17	13	5	ICPSB/HR/1/2015/34	Clerical Officer - Job Group "F"(1 Post)	Performs clerical duties.	<ul><li>Performs clerical duties.</li><li>Manages day to day transactions and management of book of Accounts.</li><li>Recording and managing of files and security of information materials.</li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>KCSE Certificate. </li><li>Good Communication skills.</li><li>Computer Certificate from recognized institution.</li><li>Any other professional Certificate is an added advantage.</li></ul>	 	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:26:23.138	\N	\N	\N	\N	8	5
16	13	5	ICPSB/HR/1/2015/27	Intergovermental Relations Officer Job Group "L"	Reports to Chief Officer-County Cohesion	<ul><li>Accepts responsibility for all intergovernmental relations activities and services, including planning and supervising a comprehensive city wide information system.</li><li>Participates, as assigned, in the development and implementation of goals, objectives, policies and priorities for county wide legislative and policy actions.</li><li>Serves as a liaison; develops and enhances positive, effective relationships with other agencies and elected representatives, with particular emphasis on local agencies, county organizations, and state representatives including elected officials, regulatory bodies.</li><li>Maintains awareness of legislative activities affecting county operations and the potential impact on County operation; tracks State and National Government legislation; anticipates legislative issues and identifies opportunities to develop and influence policy to best meet the needs of the County and the Citizens.</li><li>Interprets complex and technical legislative reports and summarizes data for County Executive and staff.</li><li>Conducts studies, surveys, and collects information on difficult intergovernmental and administrative problems; analyzes findings and prepares reports of practical solutions for review County Executive and other relevant officers.</li><li>Provides technical support and legislative updates to County Executive and staff.</li><li>May be assigned to coordinate assigned programs of the Chief Officer Office with County departments and divisions and with outside agencies</li><li>Represents the County in Government meetings, special commission and boards, the community at large, at professional meetings as required, and with legislators, elected and appointed officials, and other political jurisdictions. </li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>A Bachelors degree in Public Administration related field</li><li>Masters Degree is highly desirable</li><li>Any combination of education and  experience that has provided knowledge and skills and abilities necessary for an inter governmental relations Officer</li><li>Has modern principles and practices of Public administration and ability to provide effective leadership and coordinate a variety of assigned intergovernmental relations programmes.</li><li>Computer Literate and software applications.</li></ul>	<ul><li>Five years experience </li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:16:49.382	\N	\N	\N	\N	8	5
27	1	1	000019	Hairdressers	Hairdressers and Beauticians needed.	Ladies preffered<br>	-	-	Apply here<br>	2016-05-02	2016-07-25		\N	2016-05-02 11:32:39.057	\N	\N	\N	3	22	1
33	1	1	000023	Sales Interior Designer	Sales Interior Designer	This is an opening for a full-time Sales/​Interior Designer at our Nairobi Design Centers.​ You would have the opportunity to work with customers on all their interior design needs.​ The position includes working with clients on selecting all variety of flooring choices, cabinets, window coverings, furniture and a variety of household accessories.​ Our training will teach you business basics and fundamental sales strategies.	<ul><li>A sound work ethic and respect for detail.  </li><li>University degree.</li><li>A valid driver’s license</li></ul>	Two plus years in consumer sales.<br><br>	apply here<br>	2016-05-02	2016-07-30		\N	2016-05-02 11:21:25.708	\N	\N	2	13	19	1
34	1	1	000024	Delivery Riders	Motobike riders wanted	Our client - a fast food chain - is hiring in all their 12 locations in Nairobi<br><br>Delivery riders provide outstanding customer service and create our superior products.​ In addition to performing many of the same duties as our in-restaurant team members, delivery riders are our ambassadors of quality and service right to the customer's door! As a delivery rider, you will enjoy cash for every delivery you make, the opportunity to earn great tips and health insurance availability.	<ul><li>​Our riders must be at least 18 years of age </li><li>Have a valid driver's license</li></ul>	At least one year motobike riding experience<br>	apply on this web site<br>	2016-05-02	2016-07-30		\N	2016-05-02 11:23:50.507	\N	\N	11	4	22	1
35	1	1	000024	Servers, Waiters, Waitresses	 We are seeking professional Servers, Waiters and Waitresses	&nbsp;We are seeking professional Servers, Waiters, Waitresses who can share the love of our brands in order to consistently provide genuine hospitality with a smile to all of our restaurant guests!<br>Must have a warm and outgoing personality with a smile and a passion for food and hospitality!<br>Great attitude with a focus on guest satisfaction.<br>Commitment to deliver a unique and memorable guest experience, while providing attentive service and delivering food and beverages in a timely fashion.<br>Must be a team player and willing to go the extra mile<br>Ensure positive guest experience in all areas, responding to complaints, taking any and all appropriate actions to turn dissatisfied guests into returning guests.<br>Punctual, patient, and mindful with ability to work in a high-volume restaurant environment<br>Performs shift change and/or opening or closing duties<br>Strong integrity and cash handling standards required	Ability to work days, evenings, weekends and holidays<br>Must be at least 18 years of age<br>Fluent in English <br>	Prior restaurant server experience required	apply on this web site<br>	2016-05-02	2016-07-30		\N	2016-05-02 11:29:47.252	\N	\N	11	5	22	1
7	13	5	ICPSB/HR/1/2015/24	Assistant director (Human Resource and  Administration ), Job Group "P"	The person will be responsible for provision of Human resource and administrative support services and will be reporting to the Secretary of the Public Service Board. 	<ul><li>Sending notices, preparation of agenda for board meetings and implementing decisions of the Board.</li><li>Implementing Human Resource Management policies, rules and regulations of the County Public Service Board.</li><li>Supporting the establishment and operationalization of human resource management function.</li><li>Ensuring correct interpretation of human resource policies, rules, regulations, labour laws and other relevant statutes.</li><li>Supporting the establishment of performance management systems.</li><li>Establishing records, management systems in the County Public Service Board.</li><li>Preparation of human resources reports. </li><li>Developing & installing proper HR Audit systems, Job evaluation tools, Schemes of service and HR manuals. </li><li>Offering advice on Public Service regulation and guidelines as well as Human Resource Management policies. </li><li>Performing any other duties that may be assigned by the Board. </li></ul>\r\n\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>\r\n	<ul><li>Have a Bachelor degree in Business Administration (Human Resource option) or social sciences with Higher HR diploma from a recognized institution. </li><li>A master’s degree in Human Resources Management will be added advantage. </li><li>A thorough understanding of Human Resource Management policies, regulations and employee relations. </li><li>Demonstrate high degree of professional competence, administrative capabilities and initiative in the general organization and management of human resource. </li><li>Understanding of labor laws and other statutes that impact on human resource management. </li><li>Satisfy the requirements of chapter six of the Constitution of Kenya</li></ul><br>\r\n	Served for at least five (5) years as a Senior Human Resource and Administration officer in either private or public sector.	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:22:06.915	\N	\N	\N	\N	8	5
13	13	5	ICPSB/HR/1/2015/33	Inspector Roads&Bridges Job Group "H"	Reports to Civil Engineer.	<ol><li>Supervision and Controlling all works within the area of jurisdiction.</li><li>Assisting in preparation of monthly physical progress reports of individual Projects.</li><li>Ensuring Specification and standards are adhered to during Construction of Roads.</li><li>Preparation of work programmes.</li><li>Be able to interpret  the Engineering drawings.</li><li>Assisting in the selection and location of suitable materials for road works.</li><li>Ensuring all ledgers log sheets, returns muster rolls daily activity cards are completed on time and submitted as required.</li><li>Control of Usage of Materials on site.</li></ol>\r\n\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	For appointment to this position one must have the following<ul><li>Be a Kenyan Citizen</li><li>Have a Diploma in Civil Engineering from a recognized institution</li><li>Must have a Basic Knowledge in making Construction of Roads Drainage and Bridges</li><li>Practical Knowledge in Roads Construction(Earth Road gravel and Bitumen roads</li><li>Must be a Computer Literate.</li></ul>	 	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:18:35.265	\N	\N	\N	\N	8	5
18	13	5	ICPSB/HR/1/2015/32	Polytechnic Instructors 2 Posts Job Group "H"	Preparing and maintaining scheme of lessons.	<ul><li>Preparing and maintaining scheme of lessons.</li><li>Lesson plan.</li><li>Carry out trainee assessments.</li><li>Prepare trainee progress report.</li><li>Coordinating storage and proper usage of teaching and learning  materials.</li><li>Maintain trainee discipline providing guidance  and leadership  to newly deployed instructors.</li><li>Liasing with relevant industries  for trainee attachment.</li><li>Supervising trainee on industries attachments and guidance and Counseling trainees.</li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>\r\n	<ul><li>Training of trainers (TOT)Certificate lasting not less than two weeks from recognized institution</li><li>Diploma in Automotive Engineering, electrical/electronic, building technology and welding in fabrication</li><li>Computer application from recognized institution</li><li>Shown merit and ability as reflected in work performance and results</li></ul>	<ul><li>Certificate served in the grade of youth polytechnic instructor III for a minimum period of three years</li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:25:44.716	\N	\N	\N	\N	8	5
12	13	5	ICPSB/HR/1/2015/31	Office Administrative Assistant Job Group "H" (2) Posts	Administrative Assistant	<ul><li>Taking oral dictation word and data processing from manuscript.</li><li>Operating office equipment.</li><li>Ensuring security of office equipment document and record.</li><li>Attending to visitors (clients, handling telephone calls and appointments.</li><li>Keeping an up to date filling system in the office.</li><li>Supervision of office cleanliness.</li><li>Undertaking any other office administrative services duties that may be assigned.</li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ol><li>BES&GC Cert from KNEC in the following </li><ol><li>Typewriting II Min 40w.p.m OR Craft Cert in secretarial studies from KNEC</li><li>Business English /Communication 1</li><li>Office Practice II</li><li>secretarial Duties Ii</li><li>Commerce II</li></ol><li>Certificate in computer application from recognized institution</li><li>Shown merit and ability as reflected in work performance</li></ol>	Served in the  Grade of office administrative Asst III for a minimum period of Three Years.	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:27:10.414	\N	\N	\N	\N	8	5
11	13	5	ICPSB/HR/1/2015/21	Director, Information Communication Technology, Job Group "R"	An officer at this level will be responsible to the Chief Officer, information Communication Technology for the formulation, implementation and coordination of ICT policies, strategies and programmes in the Public Service. 	<ul><li>Coordinating research and development on emerging technological issues</li><li>Monitoring and evaluating ICT programmes and Policies, </li><li>Preparing ICT status reports and </li><li>Ensuring professional standards and guidelines are adhered to.</li></ul>\r\n<span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br>	<ul><li>Attended a Senior Management Course lasting not less than four (4) weeks from a recognized institution.</li><li>Demonstrated a high level of competence and outstanding management qualities in computerized information systems; and </li><li>A thorough understanding of the national goals and objectives and the ability to interpret and apply them to the computing management concepts.</li></ul>	<ul><li>Served as Information Communication Technology Officer or in an equivalent and relevant position in the Public Service at job group P and above for a minimum period of three (3) years.</li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:19:43.351	\N	\N	\N	\N	8	5
9	13	5	ICPSB/HR/1/2015/23	Assistant director (Finance and Planning ), Job Group "P"	Facilitates the board in financial management and budgeting for funds allocated	<ul></ul><ul><li>\r\nAnalyze and rationalize the budget proposals.</li><li>Participating in County Policy Committees.</li><li>Consolidating and prioritizing areas for allocation of public resources for the County public service Board.</li><li>Preparing and submitting the Board’s budget in line with the national and County objectives.</li><li>Preparing and submitting relevant financial reports.</li><li>Coordinating allocation of resources among departments.</li><li>Advising the Board secretary on financial management; and assessing the risks involved in new and existing budget policies.</li></ul><span style="font-weight: bold;"><br>Terms of Service</span><br>Permanent & pensionable<br><br><br>	<ul><li>Have a Bachelor of Commerce (Finance or Accounting Option).</li><li>Degree or an equivalent relevant degree, CPA (K) or ACCA qualifications. </li><li>Be registered with ICPAK or equivalent; and show exemplary leadership qualities; and satisfy the requirements of Chapter Six of the Constitution.</li><li>A Master’s degree in a relevant field is an added advantage.</li></ul>\r\n\r\n	<ul><li>Have served in the grade of Finance Officer in the Civil Service or in a comparable and relevant position in the Public Service or Private Sector for a minimum of not less than three (3) years.</li></ul>	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:20:55.982	\N	\N	\N	\N	8	5
4	13	5	ICPSB/HR/1/2015/35	Driver III (1 position), Job Group "F"	Driver III (1 position), JG "F"	<ul><li>Driving assigned motor vehicle as authorized.</li><li>Routine checks and maintenance of the vehicle.</li><li>Maintenance of work tickets.</li><li>Detecting and reporting malfunctioning of the vehicles defects.</li><li>Carrying authorized passengers or goods.</li><li>Ensuring safety of passengers/goods.</li><li>Carrying out first Aid.</li><li>Ensuring cleanness and overall maintenance and management of vehicle.</li></ul><p><span style="font-weight: bold;">Terms of Service</span><br>Permanent & pensionable<br></p>	<ul><li>A valid driving license.</li><li>A valid certificate of good conduct from the Kenya Police.</li><li>Defensive Driving Certificate from the Automobile Association (AA) of Kenya or its equivalent qualification from a recognized institution is an added advantage.</li><li>First – Aid Certificate course lasting not less than one (1) week from St. John Ambulance or Kenya Institute of Highways and Building Technology (KIHBT) or any other recognized Institution is an added advantage.</li></ul><br>	 	Fill in your profile, ensure that your profile contains the following then apply online on this web site.<br><br><ul>\r\n<li>Curriculum Vitae.</li>\r\n<li>Three referees.</li>\r\n<li>Copies of academic and professional Certificate.</li>\r\n<li>A copy of National Identity Card.</li> \r\n</ul>\r\n<br><br><span style="font-weight: bold;">Note: only shortlisted and successful candidates will be contacted. Canvassing will lead to automatic disqualification</span><br><br><br><span style="font-weight: bold;">For more details Visit Isiolo County Public Service Board Website (<a href="http://isiolo.go.ke" target="blank">http://isiolo.go.ke</a>/ County Public service board)</span><br>	2015-01-12	2015-05-26		\N	2015-01-13 22:28:28.002	\N	\N	\N	\N	8	5
19	1	1	000011	New Models Wanted	New Models Wanted - All Ages, All Sizes, All Heights	We specialize in the scouting, management and placement of models with the most legitimate and prestigious model agencies worldwide. We represent new and experienced models of all ages, all sizes and all heights.<br>Whether you are new to the industry or an experienced model who needs assistance with career management, contract negotiations, building your portfolio and other professional modeling services we can help.<br><br>	18+<br>	No experience necessary<br>	Complete your profile at on this web site, include a couple of photos of your self and apply.	2016-04-25	2016-05-31		1000	2016-04-25 00:29:35.287	\N	\N	11	1	22	1
36	1	1	000025	Cabin Crew - UAE	Our client expects the highest standards from their cabin crew who are required to be fast thinking and intuitive whilst delivering exceptional Customer Service on-board product to customers.	<ul><li>Minimum High School certification or any higher education.</li><li>Fluent English verbal and written comprehension; another language is an additional benefit.</li><li>Must be at least 21 years old on the date of joining.</li><li>Confident in water and be able to swim with the aid of a flotation device.</li><li>Able to reach 210cms without shoes.</li><li>No tattoos nor body piercing (exception for one earring in the lower lobe of each ear for females only) that would be visible whilst wearing uniform (bandages and cosmetic coverings are not permitted).</li><li>No criminal record.</li><li>Excellent personal presentation, style and image.</li><li>Willing to comply with UAE visa, medical and health screening requirements.</li></ul><br>	<ul><li>Communication skills - Advanced</li><li>Customer Orientation - Advanced</li><li>English Language skills - Excellent</li></ul><br>	Previous experience an added advantage<br>	Apply on this web site<br>Upload your C.V as well as your headshot<br>	2016-05-06	2016-07-30		\N	2016-05-07 13:55:52.088	\N	\N	10	10	22	1
37	1	1	000026	Airline Food and Beverage Manager	As a Food and Beverage Manager working onboard our aircraft, you will be part of our Cabin Crew, who are an award winning team.	<span itemprop="description">Ensuring the safety of our guests as well as providing great service at all times.</span>	<ul><li>Extensive knowledge of food safety regulations and standards.</li><li>Minimum High School certification or any higher education (diploma, degree, master).</li><li>Fluent English, verbal, written and comprehension; another language is an additional benefit.</li><li>Must be minimum 21 years old within 3 months of date of interview.</li><li>Confident in water and be able to swim with the aid of a flotation device or at least 25 meters unaided in open water.</li><li>Able to reach 210 cms without shoes.</li><li>No tattoos that would be visible whilst wearing the Etihad uniform (bandages and cosmetic coverings are not permitted).</li><li>No facial piercings (except for one earring in the lower lobe for females only).</li><li>No criminal record.</li><li>Excellent personal presentation, style and image.</li><li>Willing to comply with UAE visa, medical and health screening requirements.</li></ul>	<span itemprop="description"><ul><li>Educated to a minimum level of accredited secondary education or equivalent.</li><li>At least 12 months' experience working in a leading role in 4/5 \r\nstar hotel dining establishments, fine dining restaurants, cruise liners\r\n and/or banqueting</li></ul></span>	Apply on this web site.<br>Include C.V and head shot.<br>Applications will be handled discreetly.<br>	2016-05-06	2016-07-30		\N	2016-05-07 14:03:53.132	\N	\N	10	13	22	1
28	1	1	000020	Hairdressers/Beauticians	Hairdressers/Beauticians	3 Angels Executive Salon located in hurlingham is looking for qualified Beautician and Hairdresser.<br>Must know how to do Manicure, Pedicure, and full body Massage.<br>Dreadlocks, Braiding and weaving experience will be an added advantage<br>Salary based on commission.<br>They must also be willing to work long hours, be very disciplined and ready to grow professionally.<br>	Certificate of good conduct.	2 to 3 years experience in a similar position.	apply here<br>	2016-05-09	2016-07-21		\N	2016-05-02 11:01:25.24	\N	\N	2	4	22	1
20	1	1	000012	Male and Female models 	Male and Female models wanted for busy Agency.	We are opening our books for new face models who are dreaming about entering the world of High Fashion and Commercial Modeling! Whether you are high fashion model or plus size model you have a chance to work within this industry.<br>Please apply if you a confident self-motivated and have great personality.<br>Type of work you can apply for: High Fashion, Editorial Print, Commercial Print, Catalogue Modeling, Plus Size Modeling, Glamour Modeling, TV Commercials, Music Videos, Real Life Models (People Models, age: 1-60 years old) and TV/Film Extras, Hostess work, Promotion work, Billboards and others... <br>	Confident, self-motivated and have a great personality<br>	No experience required<br>	Fill in your profile on this web site and apply<br>	2016-04-25	2016-06-30		\N	2016-04-25 00:38:17.013	\N	\N	11	\N	22	1
21	1	1	000013	Software Developer 	Software Developer (Full-stack, Java essential)	Software developer to join our extreme programming team. Someone who want to do more than just code, we want a dreamer, a creator, someone who likes to discuss ideas and enjoys working with others to design and create great features and products. Someone who understands that "what you build" is just as important as "how you build it". <br><br><span style="font-weight: bold;">Reports To:</span> <br>Team Lead, Product Development<br>	Knowledge of:<br><ul><li>Java, Object Oriented Design</li><li>Test Driven Development</li><li>Domain Driven Design.</li><li>HTML and CSS</li><li>SQL or HQL</li><li>Linux</li></ul>	<span style="font-style: italic;">Minimum 3 years experience<br></span>	Fill in your profile on this web site and apply here.<br>ensure you include contactable referees<br>	2016-04-25	2016-06-30		1000	2016-04-25 00:52:52.974	\N	\N	2	3	10	1
22	1	1	000014	Personal Finance Blogger Wanted 	Personal Finance Blogger Wanted 	We are looking to establish a long term relationship with a writer who is passionate about, and knowledgeable in, all things Personal Finance. Would like to write weekly articles that are at least 1500 words in length, and that are highly targeted to a set of keywords that I will provide.<br>All topics will be focusing around personal finance, savings, smart investing, and financial freedom.<br>Qualified candidates will have a good personal understanding of personal finance, sound monetary qualities, and a working knowledge of savings and investments.	<br>	At least 1 year experience in similar role<br>	Fill in you profile at myjob.co.ke, include a sample article and apply here<br>	2016-04-25	2016-06-30		\N	2016-04-25 01:04:11.688	\N	\N	1	2	13	1
23	1	1	000015	Beauty Bloggers	Beauty Bloggers Wanted	We are looking for bloggers who love writing reviews about perfumes, makeup, skincare, bath &amp; body, and all other sorts of beauty products. This includes video reviews as well. Fashion bloggers are also welcome. Depending on our agreement, we will send you all sorts of beauty products for you to test, review and keep. We are in need of bloggers who are enthusiastic, high in energy, curious and have a large follower base. You must be a fluent English speaker who can read and write without any grammar assistance. <br>	<span><span> Knowledge of all major social media platforms inside &amp; out.</span></span><br>Perfect grammar and spelling. We are looking for a writer who will not need any editing at all.	No previous experience necessary<br>	Fill in you profile on this web site (myjob.co.ke) include a sample blog and apply.<br>Successfull candidates will be contacted within 30 days<br>	2016-04-24	2016-06-30		\N	2016-04-25 01:12:32.814	\N	\N	1	4	10	1
24	1	1	000016	Online Writers	Online Writers	We are looking for 2-3 writers to contribute to our blog with a new article every week.<br><br>To apply, please attach a sample of any previous work, motor vehicle articles preferred.<br><br>If you are selected, you will be required to submit one new article every week.<br><br>You will be paid per article. <br>	Fluent in english<br>Competent with text editing tools<br>	University students have added advantage<br>	apply here<br>	2016-05-02	2016-07-30		\N	2016-05-02 10:49:20.866	\N	\N	10	3	10	1
25	1	1	000017	Security Guards	Maintains responsibility for security	<ul><li>Prevents disturbances and altercations (maintains order and control).</li><li>Maintains security throughout the building.</li><li>Creates orderly waiting line; have patients stand in single file while they are waiting to receive medication.</li><li>Performs crowd control (makes sure that after dosing, patients leave the clinic immediately, unless they have an appointment to see a staff person).</li><li>Performs security check of facility at regular intervals throughout the day.</li><li>Reports and documents incidents whenever trouble or problems occur to the Operations Director and/or Clinic Director.</li><li>May perform janitorial and facilities work as needed.</li><li>Performs other duties as assigned.</li></ul>	Training from a law enforcement school or other security training is strongly preferred	At least two years of experience in a security position, preferably in a healthcare setting.​	Apply here<br>	2016-05-02	2016-07-30		\N	2016-05-02 10:53:05.429	\N	\N	10	3	16	1
26	1	1	000018	Room Attendants	Responsible for the cleaning and maintaining of guest rooms	A reputable hotel is seeking 4 room attendants<br><ul><li>Regular and punctual attendance as scheduled</li><li>Ability to bend, squat, kneel, climb and reach continuously on a daily basis to clean guestrooms</li><li>Ability to work with chemicals (for example: cleaners, disinfectants, etc.)</li><li>Ability to perform tasks requiring sustained repetitive motion (for example: cleaning windows, vacuuming, etc.)</li><li>Ability to clean to standard 16 guest rooms per eight-hour shift</li><li>Ability to clean and fully stock Housekeeping carts to completely supply and clean assigned rooms</li><li>Ability to communicate with guests and be able to direct / escort them to the various facilities and functions within the hotel</li></ul>	Must be Kenyan citizen<br>	Relevant training an added advantage<br>	apply on this web site<br>	2016-05-01	2016-07-15		\N	2016-05-02 10:56:55.192	\N	\N	10	4	22	1
29	1	1	000021	Personal Assistant	Personal Assistant	The ideal candidate will have at least three years of experience working in a similar position as well as possess good judgment and strong ethics, solid IT skills.<br>Duties and responsibilities include but may not be limited to the following:<br><ul><li>External Communication – answering calls, recording/​relaying messages, answering emails, communicating with customers, partners and associates</li><li>Supply Management – coordinating scheduled supply deliveries, helping to keep track of supplies, miscellaneous shopping (grocery, personal, other)</li><li>Vendor Management – coordinating appointments, repairs, maintenance, and overseeing work done, payment and paperwork processing</li><li>Miscellaneous assessments and repairs – repair or coordination of professional service for&nbsp; appliances, electronics etc.​</li><li>Fielding staff requests and liaising – questions and requests from staff</li></ul><br>	University degree necessary<br>	At least 3 years experience<br>	Apply on this web site<br>	2016-05-02	2016-07-30		\N	2016-05-02 11:04:49.974	\N	\N	2	5	16	1
30	1	1	000022	Receptionist	Receptionist wanted	Welcomes on-site visitors, determines nature of business, and announces visitors to appropriate personnel<br>Answers incoming telephone calls, determines purpose of calls, and forward calls to appropriate personnel or department<br>Receives, sorts, and routes mail, maintains fax /​ copy machines, assists users, sends faxes, and retrieves and routes incoming faxes<br><br><ul><li>Interaction with customer for daily inquiries</li><li>Work with sales, purchasing and warehouse departments to ensure each customer's business rules are applied</li><li>Outbound calls to customers on a daily basis for follow-ups</li><li>Create / maintain reports on Microsoft EXCEL (required skill - all candidates will be tested)</li><li>Responsible for the day-to-day maintenance of assigned accounts</li><li>Perform research for customer needs</li></ul>	At least C+ in KCSC<br>Relevant traning an added advantage<br>	<ul><li>Applies common sense understanding to carry out detailed written or oral instructions</li><li>Strong computer skills</li><li>Must be able to speak English clearly and have good grammar</li><li>Minimum 3 years of Receptionist / Customer Service experience</li><li>Strong communication and grammar skills</li><li>Able to multi-task and detail oriented</li></ul>	Apply on this web site<br>	2016-05-02	2016-07-27		\N	2016-05-02 11:09:20.513	\N	\N	3	3	16	1
31	1	1	000022	Proffessional Dancers	For Music Videos	Music video background dancers.<br>Must be Ready To Start Immediately.<br><br>	<ul><li>Must Be A Kenyan Citizen</li><li>18-30 Years Old.</li></ul>	Previous experience a plus<br>	Apply here	2016-05-02	2016-08-30		\N	2016-05-02 11:13:13.219	\N	\N	\N	4	23	1
32	1	1	000022	Data Entry Clerks	Data Entry Clerks	10 Data entry clerks wanted.<br>Remuneration: KShs. 550 per day<br><br><ul><li>Maintains data entry requirements by following laid down procedures.</li><li>Skilled with microsoft office Word and Excel applications.</li><li>Good in Mathematics and English</li><li>Pays attention to detail</li><li>May lead to permanent role.</li></ul>	Must be Kenyan citizen<br>Good typing skills necessary<br>	-	apply on this web site<br>	2016-05-02	2016-07-30		\N	2016-05-02 11:16:05.992	\N	\N	10	\N	16	1
38	1	1	000027	Inflight Chef - UAE	You will oversee and be accountable for the catering loading and food quality.	<ul><li><span itemprop="description">You must exceed our guests' expectations onboard and deliver great service 100% of the time.</span></li><li><span itemprop="description"><li>As requested, you may also need to \r\nparticipate in duties at the catering centre, in lounges and at \r\ncorporate, PR and VIP functions.</li></span></li></ul><br>	<ul><li>Extensive knowledge of food safety regulations and standards.</li><li>Minimum High School certification or any higher education (diploma, degree, master).</li><li>Fluent English, verbal, written and comprehension; another language is an additional benefit.</li><li>Must be minimum 21 years old within 3 months of date of interview.</li><li>Confident in water and be able to swim with the aid of a flotation device or at least 25 meters unaided in open water.</li><li>Able to reach 210 cms without shoes.</li><li>No tattoos that would be visible whilst wearing the Etihad uniform (bandages and cosmetic coverings are not permitted).</li><li>No facial piercings</li><li>No criminal record.</li><li>Excellent personal presentation, style and image.</li><li>Willing to comply with UAE visa, medical and health screening requirements.</li></ul><span itemprop="description"><ul><li>Communication skills - <b>Advanced</b></li><li>Customer Orientation - <b>Advanced</b></li><li>English Language skills - <b>Excellent</b></li></ul></span>	1 year experience in a fine dining restaurant.<br>	Apply on this web site.<br>All applications will be treated discreetly<br>	2016-05-06	2016-07-30		\N	2016-05-07 14:10:46.439	\N	\N	1	15	22	1
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('jobs_id_seq', 40, true);


--
-- Data for Name: lostpassword; Type: TABLE DATA; Schema: public; Owner: work
--

COPY lostpassword (id, code, username, datemodified) FROM stdin;
8	9f73c5	gksamuel1	2012-12-31 08:13:33.948+03
9	a20538	gksamuel1	2012-12-31 08:14:56.526+03
17	cc770a	gadan	2015-04-08 19:55:14.478+03
18	6fb603	gadan	2015-04-08 19:55:15.171+03
19	1d195b	gadan	2015-04-08 19:55:23.264+03
24	bbe182	cassini	2016-02-16 16:42:05.804+03
30	7ac7b7	gksamuel1@gmail.com	2016-05-29 20:30:09.66+03
\.


--
-- Name: lostpassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('lostpassword_id_seq', 30, true);


--
-- Data for Name: mpesa; Type: TABLE DATA; Schema: public; Owner: work
--

COPY mpesa (id, inmessageid, source, name, code, amount, paytime, receivetime, processed, processtime, fromtime, totime, seekerid, companyid) FROM stdin;
6	51	254724541318	ANN WANGARI	FK73BX419	10.00	2014-07-29 16:09:00+03	2014-07-29 09:09:51.854+03	t	2014-10-15 06:34:35.137+03	2015-06-24 12:06:12.19+03	2015-06-29 12:06:12.19+03	2	\N
28	969	254720920293	SAMUEL ELIJAH GACHANJA	KE11N1LA33	10.00	2016-05-01 11:17:00+03	2016-05-01 04:17:42.435+03	t	2016-05-02 07:20:49.879+03	2017-06-19 10:39:47.026+03	2017-06-24 10:39:47.026+03	43	\N
29	970	254720920293	SAMUEL ELIJAH GACHANJA	KE14N1LDO2	10.00	2016-05-01 11:22:00+03	2016-05-01 04:22:21.101+03	t	2016-05-02 07:22:13.162+03	2017-06-24 10:39:47.026+03	2017-06-29 10:39:47.026+03	43	\N
30	971	254720920293	SAMUEL ELIJAH GACHANJA	KE15N9YSVF	10.00	2016-05-02 03:36:00+03	2016-05-01 20:36:13.137+03	t	2016-05-02 07:28:54.753+03	2017-06-29 10:39:47.026+03	2017-07-04 10:39:47.026+03	43	\N
17	952	254722943835	DANIEL THANG'WA	JGN6RK54PU	10.00	2015-07-23 23:33:00+03	2015-07-23 16:33:15.737+03	t	2015-07-23 16:33:49.797+03	2015-09-03 12:06:12.19+03	2015-09-08 12:06:12.19+03	2	\N
31	972	254720920293	SAMUEL ELIJAH GACHANJA	KE18N9Z1RI	10.00	2016-05-02 03:36:00+03	2016-05-01 20:37:01.236+03	t	2016-05-02 07:29:31.837+03	2017-07-04 10:39:47.026+03	2017-07-09 10:39:47.026+03	43	\N
19	960	254720920293	SAMUEL ELIJAH GACHANJA	KDP0LDD3IC	10.00	2016-04-25 14:42:00+03	2016-04-25 07:42:38.665+03	t	2016-04-25 07:43:23.678+03	2016-06-14 18:46:13.628+03	2016-06-19 18:46:13.628+03	\N	1
1	7	254720920293	SAMUEL GACHANJA	FC88AU196	10.00	2014-05-27 15:04:00+03	2014-05-27 08:04:22.662+03	t	2016-04-25 16:33:11.521+03	2017-03-06 11:39:47.026961+03	2017-03-11 11:39:47.026+03	43	\N
2	8	254720920293	SAMUEL GACHANJA	FC88EY682	10.00	2014-05-27 15:20:00+03	2014-05-27 08:20:48.96+03	t	2016-04-25 16:33:55.944+03	2017-03-11 11:39:47.026+03	2017-03-16 10:39:47.026+03	43	\N
3	9	254720920293	SAMUEL GACHANJA	FC92RC861	10.00	2014-05-27 21:17:00+03	2014-05-27 14:17:45.192+03	t	2016-04-25 16:34:23.197+03	2017-03-16 10:39:47.026+03	2017-03-21 10:39:47.026+03	43	\N
4	37	254720920293	SAMUEL GACHANJA	FJ66WX071	10.00	2014-07-20 15:54:00+03	2014-07-20 08:54:54.868+03	t	2016-04-25 16:34:40.395+03	2017-03-21 10:39:47.026+03	2017-03-26 10:39:47.026+03	43	\N
5	50	254720920293	SAMUEL GACHANJA	FK72WO915	10.00	2014-07-29 15:51:00+03	2014-07-29 08:51:23.96+03	t	2016-04-25 16:34:54.916+03	2017-03-26 10:39:47.026+03	2017-03-31 10:39:47.026+03	43	\N
7	122	254720920293	SAMUEL GACHANJA	FN11PS158	10.00	2014-08-17 00:58:00+03	2014-08-16 17:58:22.085+03	t	2016-04-25 16:35:10.851+03	2017-03-31 10:39:47.026+03	2017-04-05 10:39:47.026+03	43	\N
8	123	254720920293	SAMUEL GACHANJA	FO07RB723	10.00	2014-08-24 23:38:00+03	2014-08-24 16:38:24.244+03	t	2016-04-25 16:35:29.642+03	2017-04-05 10:39:47.026+03	2017-04-10 10:39:47.026+03	43	\N
9	124	254720920293	SAMUEL GACHANJA	FU89YW420	10.00	2014-10-15 13:25:00+03	2014-10-15 06:25:13.963+03	t	2016-04-25 16:35:43.701+03	2017-04-10 10:39:47.026+03	2017-04-15 10:39:47.026+03	43	\N
10	125	254720920293	SAMUEL GACHANJA	FU89YZ974	10.00	2014-10-15 13:26:00+03	2014-10-15 06:26:39.054+03	t	2016-04-25 16:37:07.781+03	2017-04-15 10:39:47.026+03	2017-04-20 10:39:47.026+03	43	\N
11	128	254720920293	SAMUEL GACHANJA	GH10PW216	10.00	2015-01-10 16:26:00+03	2015-01-10 08:27:03.476+03	t	2016-04-25 16:37:41.645+03	2017-04-20 10:39:47.026+03	2017-04-25 10:39:47.026+03	43	\N
20	961	254720920293	SAMUEL ELIJAH GACHANJA	KDP9LHWR6L	10.00	2016-04-25 22:46:00+03	2016-04-25 15:46:09.58+03	t	2016-04-25 22:57:11.634+03	2017-04-25 10:39:47.026+03	2017-04-30 10:39:47.026+03	43	\N
21	962	254720246622	ANASTASIA KIMUYU	KDP9LI6SNN	10.00	2016-04-25 23:12:00+03	2016-04-25 16:12:52.041+03	t	2016-04-30 15:46:41.914+03	2016-05-15 22:04:16.059+03	2016-05-20 22:04:16.059+03	159	\N
14	949	254720920293	SAMUEL GACHANJA	JGK8QVWC2A	10.00	2015-07-20 15:27:00+03	2015-07-20 08:27:29.097+03	t	2016-05-01 03:33:00.871+03	2017-04-30 10:39:47.026+03	2017-05-05 10:39:47.026+03	43	\N
15	950	254720920293	SAMUEL GACHANJA	JGK9QVX07H	10.00	2015-07-20 15:30:00+03	2015-07-20 08:30:53.998+03	t	2016-05-01 03:33:40.983+03	2017-05-05 10:39:47.026+03	2017-05-10 10:39:47.026+03	43	\N
16	951	254720920293	SAMUEL GACHANJA	JGN4RHAHWQ	10.00	2015-07-23 16:56:00+03	2015-07-23 09:56:55.187+03	t	2016-05-01 03:35:11.266+03	2017-05-10 10:39:47.026+03	2017-05-15 10:39:47.026+03	43	\N
18	959	254720920293	SAMUEL ELIJAH GACHANJA	KDO0L8KAQU	10.00	2016-04-24 23:21:00+03	2016-04-24 16:22:03.716+03	t	2016-05-01 03:35:56.049+03	2017-05-15 10:39:47.026+03	2017-05-20 10:39:47.026+03	43	1
22	963	254720920293	SAMUEL ELIJAH GACHANJA	KE16N1JFLW	10.00	2016-05-01 09:29:00+03	2016-05-01 02:30:05.853+03	t	2016-05-01 03:43:15.545+03	2017-05-20 10:39:47.026+03	2017-05-25 10:39:47.026+03	43	\N
23	964	254720920293	SAMUEL ELIJAH GACHANJA	KE12N1JKS6	10.00	2016-05-01 09:35:00+03	2016-05-01 02:35:41.27+03	t	2016-05-01 03:43:35.591+03	2017-05-25 10:39:47.026+03	2017-05-30 10:39:47.026+03	43	\N
24	965	254720920293	SAMUEL ELIJAH GACHANJA	KE18N1JTYW	10.00	2016-05-01 09:48:00+03	2016-05-01 02:48:27.04+03	t	2016-05-01 03:44:06.484+03	2017-05-30 10:39:47.026+03	2017-06-04 10:39:47.026+03	43	\N
25	966	254720920293	SAMUEL ELIJAH GACHANJA	KE10N1JUZC	10.00	2016-05-01 09:50:00+03	2016-05-01 02:50:09.471+03	t	2016-05-01 03:44:36.17+03	2017-06-04 10:39:47.026+03	2017-06-09 10:39:47.026+03	43	\N
26	967	254720920293	SAMUEL ELIJAH GACHANJA	KE15N1JUIJ	10.00	2016-05-01 09:52:00+03	2016-05-01 02:52:25.136+03	t	2016-05-01 03:44:48.562+03	2017-06-09 10:39:47.026+03	2017-06-14 10:39:47.026+03	43	\N
27	968	254720920293	SAMUEL ELIJAH GACHANJA	KE18N1JVYU	10.00	2016-05-01 09:53:00+03	2016-05-01 02:53:57.229+03	t	2016-05-01 03:44:55.208+03	2017-06-14 10:39:47.026+03	2017-06-19 10:39:47.026+03	43	\N
32	973	254720920293	SAMUEL ELIJAH GACHANJA	KE17N9ZEVF	10.00	2016-05-02 03:37:00+03	2016-05-01 20:37:46.293+03	t	2016-05-02 07:30:24.367+03	2017-07-09 10:39:47.026+03	2017-07-14 10:39:47.026+03	43	\N
33	974	254720920293	SAMUEL ELIJAH GACHANJA	KE19N9ZW3R	10.00	2016-05-02 03:38:00+03	2016-05-01 20:38:40.559+03	t	2016-05-02 07:40:01.675+03	2017-07-14 10:39:47.026+03	2017-07-19 10:39:47.026+03	43	\N
34	975	254720920293	SAMUEL ELIJAH GACHANJA	KE13NA05DR	10.00	2016-05-02 03:39:00+03	2016-05-01 20:39:20.455+03	t	2016-05-02 07:40:32.858+03	2017-07-19 10:39:47.026+03	2017-07-24 10:39:47.026+03	43	\N
35	976	254720920293	SAMUEL ELIJAH GACHANJA	KE17NA0DVP	10.00	2016-05-02 03:39:00+03	2016-05-01 20:39:53.945+03	t	2016-05-02 07:40:59.047+03	2017-07-24 10:39:47.026+03	2017-07-29 10:39:47.026+03	43	\N
38	979	254724541318	ANN WANGARI	KE10NA2IAM	10.00	2016-05-02 03:45:00+03	2016-05-01 20:45:29.085+03	f	\N	\N	\N	\N	\N
43	985	254720920293	SAMUEL ELIJAH GACHANJA	KE13NA9PR9	10.00	2016-05-02 04:05:00+03	2016-05-01 21:05:29.508+03	f	\N	\N	\N	\N	\N
44	986	254720920293	SAMUEL ELIJAH GACHANJA	KE18NB41XG	10.00	2016-05-02 06:20:00+03	2016-05-01 23:20:35.494+03	f	\N	\N	\N	\N	\N
45	987	254720920293	SAMUEL ELIJAH GACHANJA	KE25NBWQE9	10.00	2016-05-02 13:47:00+03	2016-05-02 06:47:32.551+03	f	\N	\N	\N	\N	\N
46	988	254720920293	SAMUEL ELIJAH GACHANJA	KE25NBWRGL	10.00	2016-05-02 13:47:00+03	2016-05-02 06:48:02.397+03	f	\N	\N	\N	\N	\N
47	989	254720920293	SAMUEL ELIJAH GACHANJA	KE26NCC31U	10.00	2016-05-02 15:08:00+03	2016-05-02 08:08:48.276+03	f	\N	\N	\N	\N	\N
48	990	254720920293	SAMUEL ELIJAH GACHANJA	KE23NCCFY7	10.00	2016-05-02 15:09:00+03	2016-05-02 08:10:08.606+03	f	\N	\N	\N	\N	\N
49	991	254720920293	SAMUEL ELIJAH GACHANJA	KE25NCCTR7	10.00	2016-05-02 15:11:00+03	2016-05-02 08:11:26.692+03	f	\N	\N	\N	\N	\N
50	992	254720920293	SAMUEL ELIJAH GACHANJA	KE21NGDO7D	10.00	2016-05-02 21:46:00+03	2016-05-02 14:46:43.199+03	f	\N	\N	\N	\N	\N
51	993	254720920293	SAMUEL ELIJAH GACHANJA	KE24NH6FGW	10.00	2016-05-02 22:59:00+03	2016-05-02 15:59:56.815+03	f	\N	\N	\N	\N	\N
52	994	254720920293	SAMUEL ELIJAH GACHANJA	KE29NIS67R	10.00	2016-05-03 01:17:00+03	2016-05-02 18:17:22.636+03	f	\N	\N	\N	\N	\N
53	995	254720920293	SAMUEL ELIJAH GACHANJA	KE23NJOWJL	10.00	2016-05-03 02:24:00+03	2016-05-02 19:25:10.019+03	f	\N	\N	\N	\N	\N
54	996	254720920293	SAMUEL ELIJAH GACHANJA	KE21NJQ46N	10.00	2016-05-03 02:27:00+03	2016-05-02 19:27:09.179+03	f	\N	\N	\N	\N	\N
36	977	254720920293	SAMUEL ELIJAH GACHANJA	KE14NA0ITY	10.00	2016-05-02 03:40:00+03	2016-05-01 20:40:19.115+03	t	2016-05-02 19:31:21.733+03	2015-09-08 12:06:12.19+03	2016-05-07 19:31:21.733+03	2	\N
55	997	254720920293	SAMUEL ELIJAH GACHANJA	KE37NMDJD7	10.00	2016-05-03 11:53:00+03	2016-05-03 04:53:39.471+03	f	\N	\N	\N	\N	\N
56	998	254720920293	SAMUEL ELIJAH GACHANJA	KE33NPHUZN	10.00	2016-05-03 18:50:00+03	2016-05-03 11:50:34.725+03	f	\N	\N	\N	\N	\N
57	999	254720920293	SAMUEL ELIJAH GACHANJA	KE32NX27XY	10.00	2016-05-04 06:16:00+03	2016-05-03 23:16:33.453+03	f	\N	\N	\N	\N	\N
58	1000	254720920293	SAMUEL ELIJAH GACHANJA	KE42NYZPBY	10.00	2016-05-04 16:13:00+03	2016-05-04 09:13:12.06+03	f	\N	\N	\N	\N	\N
59	1001	254720920293	SAMUEL ELIJAH GACHANJA	KE45O5X21F	10.00	2016-05-05 02:25:00+03	2016-05-04 19:25:29.352+03	f	\N	\N	\N	\N	\N
60	1002	254720920293	SAMUEL ELIJAH GACHANJA	KE55OAZ2JZ	10.00	2016-05-05 17:48:00+03	2016-05-05 10:48:30.463+03	f	\N	\N	\N	\N	\N
61	1003	254720920293	SAMUEL ELIJAH GACHANJA	KE53OC5CXH	10.00	2016-05-05 19:41:00+03	2016-05-05 12:41:24.181+03	f	\N	\N	\N	\N	\N
62	1004	254720920293	SAMUEL ELIJAH GACHANJA	KE67OJZUPJ	10.00	2016-05-06 14:52:00+03	2016-05-06 07:52:37.634+03	f	\N	\N	\N	\N	\N
63	1006	254720920293	SAMUEL ELIJAH GACHANJA	KE72OTS6C8	10.00	2016-05-07 07:43:00+03	2016-05-07 00:43:53.698+03	f	\N	\N	\N	\N	\N
37	978	254720920293	SAMUEL ELIJAH GACHANJA	KE19NA154B	10.00	2016-05-02 03:41:00+03	2016-05-01 20:41:55.578+03	t	2016-05-07 21:16:50.3+03	2016-05-07 19:31:21.733+03	2016-05-12 21:16:50.3+03	2	\N
39	980	254720920293	SAMUEL ELIJAH GACHANJA	KE16NA2FK6	10.00	2016-05-02 03:45:00+03	2016-05-01 20:45:30.644+03	t	2016-05-08 06:52:34.34+03	2016-05-12 21:16:50.3+03	2016-05-17 21:16:50.3+03	2	\N
64	1007	254720920293	SAMUEL ELIJAH GACHANJA	KE84PCJWRY	10.00	2016-05-09 00:39:00+03	2016-05-08 17:40:00.036+03	f	\N	\N	\N	\N	\N
65	1008	254720920293	SAMUEL ELIJAH GACHANJA	KE99PK5HY3	10.00	2016-05-09 21:17:00+03	2016-05-09 14:17:54.129+03	f	\N	\N	\N	\N	\N
66	1009	254722476121	JANE MARGARET	KE95PKPJLF	150.00	2016-05-09 22:11:00+03	2016-05-09 15:11:19.325+03	t	2016-05-09 15:12:06.653+03	2016-04-29 12:31:45.289+03	2016-10-06 15:12:06.652+03	156	\N
67	1010	254720920293	SAMUEL ELIJAH GACHANJA	KEA6PQMTI6	10.00	2016-05-10 15:21:00+03	2016-05-10 08:21:42.877+03	f	\N	\N	\N	\N	\N
68	1012	254720920293	SAMUEL ELIJAH GACHANJA	KEB2PZZKES	10.00	2016-05-11 13:59:00+03	2016-05-11 06:59:31.357+03	f	\N	\N	\N	\N	\N
69	1015	254720920293	SAMUEL ELIJAH GACHANJA	KEC8QIP9SW	10.00	2016-05-13 03:14:00+03	2016-05-12 20:14:11.874+03	f	\N	\N	\N	\N	\N
70	1016	254720246622	ANASTASIA KIMUYU	KEC8QJ9888	10.00	2016-05-13 04:06:00+03	2016-05-12 21:06:10.586+03	t	2016-05-12 21:07:35.94+03	2016-05-30 16:35:59.198164+03	2016-06-04 16:35:59.198+03	159	\N
71	1019	254725061433	FLEVIAN NAOMI LIJOODI	KEH3RPBA3H	10.00	2016-05-17 15:25:00+03	2016-05-17 08:25:50.49+03	t	2016-05-17 08:27:10.781+03	2016-05-17 21:16:50.3+03	2016-05-22 21:16:50.3+03	2	\N
72	1024	254720920293	SAMUEL ELIJAH GACHANJA	KEM0T3Q27S	10.00	2016-05-22 18:16:00+03	2016-05-22 11:16:44.463+03	f	\N	\N	\N	\N	\N
73	1025	254720920293	SAMUEL ELIJAH GACHANJA	KEM0T3Q27S	10.00	2016-05-22 18:16:00+03	2016-05-22 11:16:57.966+03	f	\N	\N	\N	\N	\N
74	1028	254720920293	SAMUEL ELIJAH GACHANJA	KEP8TSF6AU	10.00	2016-05-25 14:30:00+03	2016-05-25 07:30:34.338+03	f	\N	\N	\N	\N	\N
40	982	254720920293	SAMUEL ELIJAH GACHANJA	KE19NA7S8N	10.00	2016-05-02 03:59:00+03	2016-05-01 20:59:52.08+03	t	2016-05-25 21:14:35.815+03	2016-05-22 21:16:50.3+03	2016-05-30 21:14:35.815+03	2	\N
75	1030	254720920293	SAMUEL ELIJAH GACHANJA	KER6UFVGC2	10.00	2016-05-28 00:09:00+03	2016-05-27 17:09:06.41+03	f	\N	\N	\N	\N	\N
76	1033	254720920293	SAMUEL ELIJAH GACHANJA	KEU1V2NYLZ	10.00	2016-05-30 14:23:00+03	2016-05-30 07:23:21.806+03	f	\N	\N	\N	\N	\N
77	1035	254720920293	SAMUEL ELIJAH GACHANJA	KEV6VJC05E	10.00	2016-06-01 02:22:00+03	2016-05-31 19:22:06.825+03	f	\N	\N	\N	\N	\N
41	983	254720920293	SAMUEL ELIJAH GACHANJA	KE12NA8GG4	10.00	2016-05-02 04:01:00+03	2016-05-01 21:01:54.184+03	t	2016-06-01 09:02:20.704+03	2016-05-30 21:14:35.815+03	2016-06-06 09:02:20.704+03	2	\N
42	984	254720920293	SAMUEL ELIJAH GACHANJA	KE11NA94YB	10.00	2016-05-02 04:03:00+03	2016-05-01 21:04:23.446+03	t	2016-06-09 08:35:41.746+03	2016-06-06 09:02:20.704+03	2016-06-19 08:35:41.746+03	2	\N
\.


--
-- Name: mpesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('mpesa_id_seq', 77, true);


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
1	2	test page	new test page	2016-05-07 23:44:22.149
2	191	myself	A humble beautiful Lady who whose in love with personal growth when it comes to jobs, she's a team builder who just gets along with everyone. She likes taking selfies and happy all times and when she's not busy working she's probably watching a movie or catching up with her friend.	2016-06-08 14:36:59.113
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('pages_id_seq', 2, true);


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
6	njeruedward04@gmail.com	njirunjeru	4883e08f7c12534e118d440e5d3453cfba063b346b7cfb69bdb7a900360d08a7	2014-07-18 04:30:37.876	0e1f79	1
8	muttahslim@gmail.com	muttah	6b88444ef81dd62e20cb62278d75417d3bb60bc5dd4f20939208684706f37e70	2014-09-22 08:18:41.971	50f243	1
9	lugaliatonny2@gmail.com	victor	42932cea7e81203bdae59a2956fbdc9c1e4bd626df9e53a3620116d106661115	2014-11-05 08:45:00.445	0e6c0e	1
10	kunyira@yahoo.com	kunyira	6642704fdf1063a06d2f1547ee35c3e1e400df9b38dbc0757eb2330f36fa23d6	2014-11-25 11:29:24.517	c948d2	1
13	kwaleaegis@gmail.com	malu	b58f1f0793a1a6d7fb6dcb29227e8738cdf11520131ad862d0388c6f2f28b137	2015-01-22 02:11:07.128	c1ef7f	1
14	akaianronoh@gmail.com	ian	b26fef04155cab4a7b05ae9b700f469fdd622b9ab42709efe4f48dd139611ade	2015-01-22 03:52:30.31	823c4e	1
429	njuguna.samuel@yahoo.com	sam72	ba2b9d89c1845f78fa06fad42430ae8cc53127107d4ab5320c4bea6b450a81a3	2016-06-04 04:09:55.662	3d9d62	1
16	nimohuri@yahoo.com	wisdom	5f99981772e601890f1a64d2435a53ccf8a35f255fe12e5980244e119cb5ca17	2015-01-22 07:20:59.751	e8c6f0	1
18	silimoma@yahoo.com	silves	b60b904030bb2885b25a85e1b17df9bde902c4367157cd2bc6fc5be22604db2f	2015-01-22 08:04:52.579	25954b	1
22	kamauj82@gmail.com	mwajo	032a5dfcce59607c17c55620bff42b2843ba843f86785713a83de94112d08212	2015-01-23 01:22:05.926	85cd86	1
29	kamothoerastus@yahoo.com	kamotho	a2bd985fa589bbcc48fd8f0d7f7861f23c916f433c264d039f7aef4069cfcdd2	2015-01-26 01:18:58.789	e4fbba	1
30	gioched@yahoo.com	dancan	5dc96acd05a586796aca8476a97a9d2256b92c8e750716ff4b8466c4cf012a1b	2015-01-26 01:43:27.608	f82d62	1
32	bonfaceodiwuor@gmail.com	BonfaceOwino	2400d63c108f6546cd810b001bf29eb3f8e107423396bd53faf770ce84d5c690	2015-01-28 02:09:59.915	160898	1
33	ibrsallah@yahoo.com	badanes256	c89360c14843137487fcce3814a48bebe6ce283d125d71a8026884039eac2185	2015-01-31 18:09:46.547	90c05e	1
34	evelynwambui.mwangi@yahoo.com	EvelynMwangi	e1ce4f036d9b65507b74436e513c8f8032043a89e99e9cb2e7a9c04b82ddac8d	2015-02-02 01:51:35.767	adc42f	1
35	yussufhassan85@yahoo.com	hassan	a2fe824545503c1d8a3c336c8083ee054fda133ac54f1f1d6d29ecabc524b366	2015-02-02 17:52:15.278	0e4ebf	1
36	erickarani12@gmail.com	erickarani12	8c30df4184002f6e569d61ded3542089e0d2e46f3604cba3f92c78efb2e3e190	2015-02-04 04:43:32.968	02cf06	1
37	legruzhalake@gmail.com	Legruz	e5e1e5c90c90bf005881a7384434700c89cdfec4aaba300e46a23854e8bb4fd9	2015-02-05 17:54:22.654	eedc5b	1
38	imuguna@gmail.com	mgush	5aaf901d22a3a284ffee7067f0af58016a7be06f4035914a7890042015cac128	2015-02-06 13:45:56.166	0a9b24	1
40	guyobatula@gmail.com	batul	8b45287cb945e8a5ee3d7441e5c0d54aeb819779d7eeec7ed75d2a434274171f	2015-02-11 01:36:35.681	e2be03	1
42	phoeb263@gmail.com	betia	ee175e3e3901af3098163af1c14547f3ea6b50a3e78f12fb498b2b7a437caf19	2015-02-11 01:39:35.659	c5a94a	1
43	mmgatwiri20@gmail.com	maureen	92b4f137b80b6f2fe5fe251e3a752d15b54a1717cc6244180fae30adff0c5eb7	2015-02-20 08:26:29.458	e80248	1
45	adan.hallo@yahoo.com	Hallo	f3ef4d448ab0f90b3cbf0df52f5af87e7f3e2b66a169d272b8b7ebf0d290cfba	2015-02-25 23:04:39.931	b4d098	1
46	jimriggah@ymail.com	Marigah	49547b5610fde2b18c3cc794207335792241438416425ac39c939b5a9be1ee17	2015-02-26 05:48:38.909	293988	1
47	tshadraq@yahoo.com	Malika	b7cd5bcc70b2d24e60555a32640cf5ce4ab7c9f0f8aa4f40d12e652cb1fa7369	2015-03-09 04:00:31.019	7f12c7	1
50	kipchogeelkanah209@gmail.com 	Kipchogeelkanah209@gmail.com 	4d7f32e5e59ec68581942accf617c962a1108dff91776abb214290059cacd98c	2015-03-14 22:55:34.957	4afec5	1
51	pmithinji@yahoo.com	PATRICKMWENDAM'ITHINJI	f5b8951b84a7d21acabf253dd7424d73f178e9305823d7eb3ca5ff24bfed8d4a	2015-03-21 05:09:11.027	d39728	1
52	jallah8558@yahoo.com	jalla	562f192796617044e15066990f62a329725f3b7d238d586285c01fba24446aeb	2015-03-25 08:05:03.913	ece887	1
53	viola.nasser@gmail.com	viola	a5c49775b0a68d9f4dbd6c5cf41ed119aaf4c3df1a2a0f6c06c2ac966ab43e04	2015-03-30 02:44:48.627	01ffa5	1
54	cassbusinesscenter@gmail.com 	cassbusinesscenter	5b1cde4aef5c241f7510507d31418c0f27dda670c76ba72a55f12cb7e2eb7b28	2015-04-08 00:25:55.097	5bf9c9	1
56	cnnganga@hotmail.com	cnganga	5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5	2015-04-22 05:28:15.586	73e92d	1
58	abukasozi@yahoo.com	akasozi	fbfb386efea67e816f2dda0a8c94a98eb203757aebb3f55f183755a192d44467	2015-04-27 02:05:36.455	ce5f91	1
59	ilaureeq@gmail.com	serem	54a4035fdf9cd964e8662d24ff844bd468a9e1c0a376eac134859e857c97b01d	2015-04-28 06:11:14.254	caf0b0	1
62	bdm@careerdirections.co.ke	Chris	d96ac554302bc971bf17ed028b5664203680176175e66c667e1983a4dbb08827	2015-05-14 04:18:35.69	d2bfdc	1
63	Dabo_Hassan@yahoo.com	Dabo Hassan	90a49bb675ddb3592e36c87df3073b3bea36a7359b8eea6ef6745d9b2b43b93a	2015-05-15 13:35:44.25	492cd4	1
64	Abdirizak_Adan@yahoo.com	Abdirizak Adan	6b77135042bf8718a54fb93537bb339322191d8e216adf227995c6f8d883f991	2015-05-15 13:38:46.841	4b0692	1
65	Abdirizak_adan@yahoo.com	Abdirizak	6b77135042bf8718a54fb93537bb339322191d8e216adf227995c6f8d883f991	2015-05-29 18:04:31.732	cef4b4	1
67	stanleychege5@gmail.com	stanley chege	edf83c3a88d82f77654a5e0b814463eb139cff8f9d976a80a312760982aa73dd	2015-06-09 16:00:36.881	e8fd18	1
68	emgeekush@yahoo.com	Kush	9d04eabb12d856a9bad67a5e90909017f28f9db88b3e2b9df0562da553d2c9a6	2015-08-13 06:59:58.306	a570f4	1
69	emmanjeru13@yahoo.com	emma kathure njeru	f3cc6f3dc24f9e51fe3adedf0db98cf4041d950a14eb321ee30caa54791f4d5f	2015-08-13 16:44:26.903	91d865	1
70	isaacngugi2010@yahoo.com	isaac	b8d52643b556bcf19f2f8178310ca460c474fba061f90a3f698bcfb863c5674f	2015-08-14 07:33:46.395	07ff8b	1
71	amos.masega@yahoo.com	Segazmasega	1ba7f415d1a37dad9bb27fddb246da0ee0236e301920179af619ad39ef1630ab	2015-09-01 04:05:09.082	ad196e	1
72	stanleykingiri@gmail.com	kingiri	fe2585ffa130f50499ed47c7cb594e0219acc7dce18d7ebe94f7b477776a4940	2015-09-02 05:38:31.48	9ec92e	1
73	njukiams@gmail.con	Brian 	6b0a0cb6e55ae08f65992b4cf3d42088e4995664009f89e2ae3779b11b3a4488	2015-09-03 11:45:00.778	2ea4b3	1
74	doriskarambu5@gmail.com	shantel	831e290fa9f3cc8574ee1993c376f442aa0eaa503e34ca2b1b2a8a5b385388fc	2015-09-04 03:09:13.361	691e44	1
76	mainaphilip4@gmail.com	philip	90d601a474b4bf1c43091b0238780a3bcbe20cb32623d88bf4e779f686d05158	2015-12-06 06:51:36.652	d91ad5	1
78	cchapiageorge@gmai.com	Chapia	0a55cdd898bbad3e7fc7be3b17becac10fc13f4e1c0dd2efc7105030b1eaa04f	2015-12-07 02:25:07.704	73bf52	1
80	briogibbs@gmail.com 	brio	bd68ec6a76aa036b160fad96d07982daa022f177654b2523f8483ac1bca1e432	2015-12-09 00:43:49.928	609451	1
82	slykaguri@gmail.com	sylviakaguri	a44e44c766b5dc8ad4feb872cb475f8d09bd9002b73838e82fd5f9fd536b9fe7	2015-12-09 05:10:19.688	f47105	1
83	linuskhaoya6@gmail.com	lynoh	4637b9f8a496bdcfe1b35e73ac81ed367b55c4648e75b370d8fdfa5dcae71a07	2015-12-09 10:24:08.393	250ffe	1
84	khaoyal@yahoo.com	linus	4637b9f8a496bdcfe1b35e73ac81ed367b55c4648e75b370d8fdfa5dcae71a07	2015-12-09 10:25:19.05	c18ab1	1
86	pfrankisky207@gmail.com	franc	f9e120dbf9cbf98a9f2b9c98f913d239c710e2edacf598ea82ff2da0f844f85f	2015-12-10 14:09:29.657	74ed72	1
88	nyakus@yahoo.com	Nyakus	d0b45b6a111ddbe432603ce2e2be9f42fa582db0467bfc2ddde8cb698b0b0592	2015-12-11 01:22:58.219	455b0b	1
89	harunkimani5@gmail.com	harun	83e1afbe73b0b990e19606885406e6934e076a5dfa73c7d1bcf4724427fcb7e4	2015-12-11 04:48:15.325	27b979	1
90	lindamuchina7@gmail.com	lindamuchina	700e8bf70cc6a1a2b279e9b40f053a77f21549d35e0fcb69c6047bbe829fd9ba	2015-12-12 03:06:48.848	ea1c25	1
91	pressieng@gmail.com	Pressie	602926a6d6511f3c52f42b1e171c59ca23eea7e897c518366c67130e1b08fbe1	2015-12-12 14:23:05.74	088d16	1
92	estonmoses@gmail.com	eston changwe	5b5e07132f7ab64db6e82bd26063c3186a0ca1954d4fa8dce8318e81756b25d3	2015-12-13 10:10:24.201	1d8c28	1
93	njurahc@gmail.com	njurahc@gmail.com	1e8f70ad02c533288c647f2924383896faf298e9eb7ee3c91f3b1c140f63182c	2015-12-15 02:34:04.714	ce8484	1
94	wilkiche@yahoo.com	kiprono	21d1f697ba8c54f12f54f3ddc1daca633d69a5b60eca00c287086ccf169dbe81	2015-12-15 23:44:41.967	51dc7e	1
95	cheruiyot7@gmail.com	Capitol2015	21d1f697ba8c54f12f54f3ddc1daca633d69a5b60eca00c287086ccf169dbe81	2015-12-15 23:48:24.38	23b919	1
96	zacaroni78@gmail	Moriasi Zachary	32696cdbb80568ba3bfae5189d2e70dcbc90cc574b7d5af46afb66539b9acabb	2015-12-16 00:04:29.664	264b5a	1
97	shiyongaeliud@yahoo.com	Eliuds 	1aad721242455e46a2020041525fb2c97cf78beb6658837c869aa5ccb72c7027	2015-12-16 09:06:54.494	10b9c5	1
98	maingabig@gmail.co	willie	061da5b35df19b2ced6264647c7e1a44704541a835656700ae6c85fbc3ccf82e	2015-12-16 14:12:47.17	7d78ad	1
99	roycarpy@facebook.com	roycarpy	42784ce13ea7a33d694b8e7dac5e62eccbbdda65018c6d5bec4fd47b999a786a	2015-12-17 02:49:59.884	c80383	1
100	0714361628	Tom wallz	b73b593910f534c1eeb2cafbf8c97769bee8372c23b7a45032d5b55ab2634b6b	2015-12-17 03:55:54.953	049c15	1
101	domachhoth@gmail.com	Tomwallz	0271d6576a258e3af6e67906e86de632460f82e7441b6429f6e00bc9aaa9197b	2015-12-17 03:58:35.723	4a73cb	1
102	domachhoth96@gmail.com	tomwalz	414e0fb0b563435e668fb12de4679e5182f6e7b341825c7ca714e1c2745da72e	2015-12-17 04:17:47.325	d63aba	1
104	oshmo64@gmail.com	omondi otieno	8e79eded1341fdd8c67471d7885e27076abfa1f1d868462e1b225db86618fbde	2015-12-18 04:53:49.389	c4d0fc	1
107	eddytyrus@gmail.com	edmond	3546722f003b19882312bc98e30c90cc45301694967bf82ef7ba4163befd1a38	2015-12-20 23:05:49.815	c7e514	1
109	kruhari@gmail.com	Andrew	915820b5a230f66d34b6effdc649c51ecb8cdabb6ae7102be4224695dd43c7a5	2015-12-21 02:58:41.107	a12195	1
111	Dkanjaah@gmail.com	Kanja	10cda03772fa57eb1fc245078c3190a40500d7312cb3449a5c655ce858ac5766	2015-12-21 04:50:43.805	ca0db8	1
112	mukinyumwangi@gmail.com	mukinyu	66a4a20de90c2726a01e52e8f9420b386164e90fb05fe93394ea9e4e364a61d6	2015-12-25 03:45:17.067	937496	1
113	johnagoro96@gmail.com 	okorej 	730c1539f04e49dedb337e9541f4d0800fba389a3da9470ca05345705e4ca8a9	2015-12-25 05:42:26.906	537461	1
114	evanswesanza35@gmail.com	Freddy 	d670fafa79fb0e2cb86f7b08e25886d822703e28deeb7a90bb1088752e542da3	2015-12-25 10:05:22.85	a19c0b	1
115	erickouma28@yahoo.com	ERICK	07356e8a472bca7eeb7a79dc0fe9a27df6d1d19ad82caee2bebc122463a1d42c	2015-12-26 03:33:16.786	6f49cf	1
116	suleimanchivole@gmail.com	Suleiman	70ddb34cd56fa4a2090d08ca277a4d2fa445dd6a839a3e71e00bd54d82074068	2015-12-26 09:52:24.475	ecc594	1
117	macimsshi@yahoo.com	Mercy mwaura	499f5a0bd3dd342dc928c249fa6ca4d96586114c56e986c35d7680bae8454118	2015-12-26 14:51:49.261	a829b1	1
118	carolina8888.cm@gmail.com	caroline wambui	cb03c2bde5a5a3837e63772afa46595dd32b3b42ae2dd095ddb0337057802f2a	2015-12-27 02:10:04.625	e00ef8	1
119	piusmakali1@gmail.com	pius	6ec6b0b042bd0b8a06ae87f3dff61303eb861dfec6507871798fe5715ac76eca	2015-12-27 14:15:56.26	c5fdc4	1
120	mbmoom@hotmail.com	mabruki21	ca51497d5aa817ed0eb0df5554d87876195edd2491b33d5affbf5139e771f049	2015-12-28 01:39:44.977	9f10df	1
121	williamnassor@gmail. com	nyamburah	56f96a6284eaacdf15413ab26c4549c2f70184b733aa344981c080d8bebcf2c6	2015-12-28 03:22:28.282	bbec24	1
122	eunicekinyita@yahoo.com	njeri kinyita	7ddc6f8cd9437ed3a26e5c56077d4bd138bb1aa29408851fb5f8ec438a6b6117	2015-12-29 01:36:39.623	8c380b	1
123	jokariuki2014.jk@gmail.com	joe.kariuki	14e2dc75043655d09c9068d711bf53c22291eb734723a0c28667ae79d98548ad	2015-12-30 08:08:07.458	3a3bcb	1
124	Mbogoedith@gmail.com 	E Wangari M	2d2e0ff6bb6c0c19995e8a095afadbce923e87cd604206d1ba790e7d56cc1a6f	2015-12-31 00:37:46.522	12f140	1
125	bwaweru.bw@gnail.com	Bilha Waweru	5477b516ed2a4d8602b0547424832ac8647d36db76dbd3315c93a3ef33d9efeb	2015-12-31 04:26:06.46	5e6fa8	1
126	virgyngas@gmail.com	virgyngas@gmail.com	0a4992ea442b53e3dca861deac09a8d4987004a8483079b12861080ea4aa1b52	2015-12-31 08:27:01.61	6967ff	1
127	mikebaha93@gmail.com	Michael Bahati	52193734b6ec4384dccead8cf94c0b56a9becf2df009bd6e771bffe6336a3cd5	2016-01-01 07:49:50.993	cebc9c	1
128	obieroelias@gmail.com	eliazojenz	1507267dbd2de063cb93ac94bd9853f0cce8dae57bd90775c16b61a960ec29e0	2016-01-04 08:59:33.579	b11ca8	1
129	ernestdihanda@gmail.com	ernestdiha	a5c49775b0a68d9f4dbd6c5cf41ed119aaf4c3df1a2a0f6c06c2ac966ab43e04	2016-01-04 10:11:07.768	d4dec0	1
130	analo.annabella@gmail.com	Annabella	bb1d276cdfcecc861ad9eb38f4ab43a6037e2e82dd6c333c63e168095c909e40	2016-01-05 17:23:46.491	5a520c	1
132	mshuzaj@gmail.com	ayub	26d620b6585e6233da21e1686ed7075817d47ee9efbba9a2c832b9020aee2fde	2016-01-06 06:37:53.476	77e3d0	1
133	athanusius@gmail.com	athanusius@gmail.com	9df0644ed16155cfea8642df92400dad047875b23ba22416f78de89e11b1d80f	2016-01-06 23:32:20.697	8aaf8d	1
134	simonn.nkanyiri@gmail.com	SIMONKANYIRI	5399ffb7a595aa131ac61b0b010abe432e4dbd15d444fb74d492b20cac6ee1ff	2016-01-07 01:04:30.074	48d173	1
137	huron_v@yahoo.com	huron_v	c3f809cb75f5bed226843b36073bb69ff0e5af3017b05e46882476f286c3c708	2016-01-07 06:26:25.477	934cd1	1
139	christopherowino87@yahoo.co	chris	19eeb46092bff4afc1aed411ffcaa4e78f5d491282ba0afac31688b4271941c4	2016-01-07 08:55:40.295	e058d2	1
140	cowino88@gmail.com	kris	19eeb46092bff4afc1aed411ffcaa4e78f5d491282ba0afac31688b4271941c4	2016-01-07 08:57:04.308	ae905f	1
141	kowino88@gmail.com	kristoph	19eeb46092bff4afc1aed411ffcaa4e78f5d491282ba0afac31688b4271941c4	2016-01-07 08:58:58.374	fb8dea	1
142	cowino1988@gmail.com	chrisokelo	19eeb46092bff4afc1aed411ffcaa4e78f5d491282ba0afac31688b4271941c4	2016-01-07 09:01:26.182	e8ce34	1
143	ngigijose2@gmail.com	Joseph	dcaa09850aaa2d605090fc347f51859644857435ad9ff86969352c7c85091f40	2016-01-07 10:31:48.544	0e3811	1
144	rotich.kiprono@gmail.com	Ken Rotich	6a56911893431990d964a29e27f94eab498b701de90478f3a5da3972992e3684	2016-01-07 14:30:29.164	0ace5d	1
145	Hemismail94@gmail.com	Hem	d99c235e7dfc4d14b0d20f3990ef2810a49ad449f46f083beb5827b76fc10032	2016-01-07 16:58:56.704	92633d	1
146	kennedywanjama88@gmail.com	kento	1efef6d1a2e0f4baa13d6de910555c1e5351cdf7cfbbb2bb71823d612750063e	2016-01-08 01:37:25.299	837f2c	1
147	mercywaiharo@gmail.com	shiku john	c3440bf0cae6f6f7ddac6bd202a88f646daf3c201f412c89099d5cc48aab8975	2016-01-08 02:45:07.626	1f6a62	1
148	jkonkara@gmail.com	john	de58ea343f4567502a792f29f7d3f04276d99c7c2e0b552e19c86a3e399fba19	2016-01-08 03:25:48.803	113ddb	1
149	konakush04@yahoo.com	salashnet	bc5481e05e40c546b536b7ace4cebd08fd3ae47e19c10dc0366b0ab2f7921318	2016-01-08 07:13:30.82	2a97d6	1
430	amelliaowuor@gmail.com	Amellia	50980e70aa93defc63e33ce8729d1fa4d28407f28fe12ae796b7014de10f764c	2016-06-04 08:33:04.074	a53495	1
151	shellymwas90@gmail.com	shelmith Mwangi	18295a42293acde87f4475e6321a1d25c739a58a24c356b1a844fe063d394ada	2016-01-08 10:40:39.209	f3ac98	1
152	reayqimm@gmail.com	Reayray	8acc7d157789b1650fcda131d0e25f48a258c2992a14b69d5289a1a3969beefa	2016-01-09 14:54:30.012	6b4e17	1
153	jmauric@ymail.com	jmauric	383199f4a798260ce6b34d7da1ff32a98e021cd9b6ed4d0965df2b741e68df5e	2016-01-11 00:25:04.683	0c4024	1
154	Peterchetambe91@gmail.com	Peter Chetambe	fe35f2af634052456f3faf703ca57df08cc2ac3db515f733f89d07b22204cfb9	2016-01-11 07:08:15.251	17b64d	1
155	harzmugambi200@gmail.com	harzmugambi200@gmail.com	5f0d909a3b91aabf0d7fd2a9236010f796d3e843eb1a291a325dfd8fc23c6a65	2016-01-11 07:49:57.59	b6e098	1
433	roselynkendi5@gmail.com 	Roselle Kendra 	52c85b1ec578bd79d462f07f6cfc81141aec44345e9934290c8b95222a3f9c11	2016-06-05 01:34:58.414	d9c69f	1
157	shyrohj@gmail.com	wanjiru	157fc55121ab2c59852c35d78aca98d840047e5d9668c423e4d3b146e1577901	2016-01-12 04:04:13.986	6c699e	1
158	nicksonmachani4@gmail.com 	Nickson_Nick 	0eb15ad185af2b351ef4be172745e9dcdfca32f2b0b4e96ffc45af98e813b74d	2016-01-12 04:07:07.141	b4d1c1	1
159	mwangidavid213@gmail.com	mwangi	b2c8865f8c52c26bbba9a9640ec6211f610d21fdaa570f827395b47e1ac8c11a	2016-01-12 04:45:39.689	0900ba	1
160	dkithinji08@gmail.com	Dennis	e1361d593bb89e7ab4610733148b875d813617426412671b3c29c7b0fc70b407	2016-01-12 05:54:26.315	0dc27e	1
161	dkithinji08@gmail.com	Dennis	e1361d593bb89e7ab4610733148b875d813617426412671b3c29c7b0fc70b407	2016-01-12 05:54:26.57	4b05a2	1
162	kamausuzan@gmail.com	kamausuzan@gmail.com	2c83f486c72ef47b9c562ef67df8b032ce3ae4e46e329f8bccb9a70442282b49	2016-01-12 12:43:28.407	79ea73	1
163	collinswandiga@gmail.com	collins wandiga	0b3d55690f6c31fd0ea3448a4f5b5e9f9aa1bbc6d209f088d639f13a562a6c2e	2016-01-12 14:01:27.338	5b43f2	1
164	harimugambi20@yahoo.com	harimugambi20@gmail.com	5f0d909a3b91aabf0d7fd2a9236010f796d3e843eb1a291a325dfd8fc23c6a65	2016-01-13 00:51:37.391	fba60c	1
166	maxwellsimwa@gmail.com	maxwellsimwa	1d05289d0d378075f6137814c52dfc637fb36bd54612d09a261308c87c3b9a5e	2016-01-13 06:32:46.33	e8eccd	1
167	nixonkaltem7@gmail.com 	Nixonkaltem	f3057b766f98a8f061a71eab2e3d7fae26b6eec9e66b0780e57a2550861ddad9	2016-01-13 06:58:19.269	7ca1d3	1
169	shadomiti@gmail.com	shadrack	8c5769ecb0357cbacbbb5fb740c19fdd766fd24cb8223b077cc4690bbf4e689d	2016-01-13 09:25:53.279	50bb26	1
170	TMogweno@gmail.com	OgwenoJ	4950af89b6c1dd1368574aaed178eb09630928c775854f04f6d653bfd820cda4	2016-01-13 11:36:48.044	c83b85	1
171	wahomecharles60@gmail.com	Charles	4c2771ddeb20830bf82ca2af40bfe8e7a65ecacb3852a3ca0cf50294ec55968e	2016-01-14 01:47:27.745	f5feb5	1
172	wangaricharles@yahoo.com	wahome	4c2771ddeb20830bf82ca2af40bfe8e7a65ecacb3852a3ca0cf50294ec55968e	2016-01-14 01:49:00.533	cc509d	1
173	marykamso@gmail.com	Mary wachira	60090dadb2691e8bd6efb6495c9cb4b3661af8da67dd0f32cc5fb9a03329b2a4	2016-01-14 03:00:02.9	990e76	1
174	kennedymwaririe@gmail.com	KENNEDY	bf331bd8b479d4901f73c8e2bb125a7780627891a36212919546d69b55890ddf	2016-01-14 04:37:49.896	1d2aa8	1
175	willywilliams240@gmail.com	william	d852863d4f74bd731cb03f90b30c67b67256593db8df07cf17c29766bd9c89dd	2016-01-14 08:00:12.389	9e3300	1
176	Collinsotieno30@yahoo.com	0725967352	895dfefa0d50dbe79486c0f8713236ca1d4f452f3baa287602dc162fdd42deef	2016-01-14 09:08:33.573	3a519f	1
177	joanmubea@gmail.com	joanmubea@gmail.com	e5cb62d36852a1fe21058af23db67108cef8977ff8e958f09c4930fdf7ce8b43	2016-01-14 15:41:52.073	c86713	1
178	mwendwa15@gmail.com	kelvin	9375209e1e69617ff61132f72eef5f4ae4e0d5262f9708ad8d6a9f9e58429ef3	2016-01-15 00:22:10.051	b4a79f	1
179	benzkim.bk@gmail.com	benson	92c7d71b95dc6540fc58e891dbe649fe72ae5e93b5f42fd7fbdeefe6cef3e51d	2016-01-15 02:03:27.395	927f8d	1
180	mutindanzwili@gmail.com	MUTINDA NZWILI	aa93f93215f858256076919a7c350f80f2507daf1d017e2ab86ecc20a96f909e	2016-01-15 03:08:21.286	fee52e	1
181	kephaodhiambo@yahoo.com	odhis	4759971ce5f612b794370b71bc8d9ceacf851b991ad9b39a221632b2b22ba321	2016-01-15 10:45:58.619	7d3d82	1
183	kellymwangi310@gmail.com	kellymwangi	eb4a9cbec84eb36fff282c8ce5bd31b9569b5b557de7f9982184c8ebdce918c4	2016-01-17 04:01:18.005	8d78fc	1
184	joelkyalo.G@gmail.com	joel kyalo	172a03e29240839feda0bde5502a83a181bdfabb1a3f04c40846959f42e09edb	2016-01-17 05:52:17.818	47ad40	1
185	njengafridah@gmail.com	fridah	9b1a2475460402f23ada4836825e7ff3440e3d6b3d1699faa5f9ab5504112745	2016-01-17 08:48:40.489	46d697	1
186	kaykutah24@gmail.com	kisienya	889bd4e8b881cc98e5a98ea2bf4d995ee19d9531ea22c00d63a41c72ca87781f	2016-01-17 09:22:35.871	3e7ffa	1
187	emmahmasime.em@gmail.com 	Emmah 	84c5ab41d25df993885c93ff8999aa5d0d71ada9d7b141bbc1325892f2238edf	2016-01-18 00:36:00.726	29bfec	1
188	daisymaureen57@gmail.com	Daisy Maureen	d4361cc20b36f0da0b19af980688ebd7ab8b170d4e6df6ceb6ea1f9101dd8aef	2016-01-18 02:00:08.681	69945e	1
189	dkgacau@gmail.com	gacau	f1e3c70a013cbdec1fbddca7d465bdf51fe66b1af0d2731b48819e769ef017d0	2016-01-18 03:34:12.759	bed24a	1
191	betiambe85@gmail.com	bnamulunda	4d0dccbcc4cb3efc7906355723969a58def7c167f86b9c404c3e893b39698976	2016-01-18 04:06:51.138	f1d85e	1
194	mokayahzekiah@yahoo.com	hezekiah	e56e4f91be8a2ae99ec60f56452cc5734a42884c720ad49b5c2b437df04a8d49	2016-01-19 00:18:12.153	be1638	1
195	mokayahezekiah@yahoo.com	monari	e56e4f91be8a2ae99ec60f56452cc5734a42884c720ad49b5c2b437df04a8d49	2016-01-19 00:21:15.723	fc3d0f	1
196	danwaweru.w@gmail.com	jobsearch	65660e35afed2dbe5afcc145a7430cf9bd72f040e3425b53352655cf0bb583f7	2016-01-19 02:03:58.175	e69bb3	1
197	rossjim44@gmail.com	ross	006425c2bc2bc240b60a95ffda20a7d1d48b2601ed71eb5111e555db03812235	2016-01-19 03:43:00.494	909cff	1
199	daisybill57@gmail.com	Bill	d4361cc20b36f0da0b19af980688ebd7ab8b170d4e6df6ceb6ea1f9101dd8aef	2016-01-19 11:09:35.741	548cac	1
203	Jeftaonyango@gmail.com	Jefta Calora	b149f98642979b2797cbe456c0fe2626922f51a74e6d377c9e533f11ff0e9c78	2016-01-20 03:51:10.262	37d955	1
204	zedekiahndenga@gmail.com	zedekiahndenga	9b17b0892273ed4652bb0b3d858fb87feb5f3010b0680a6e746a0a1c9efab73f	2016-01-20 04:15:15.491	6f34be	1
206	barnabayala@yahoo.com	Barnaba	5873d59e8a4e0061603cec147c0d646000c0ff20faa8b15448b6001a6888c00a	2016-01-20 12:47:40.612	c3fe2c	1
207	miroroabraham@gmail.com 	Miroro	ee7cf45035a0a50f471341be2c46cb2bca4c7e0f192b18eacebf06c5dfcd3e26	2016-01-20 14:43:21.897	597825	1
208	dndungu19@gmail.com	Denis	48845906426f71207363e6e881ae7bfc2fc58ed8698478b0de22202aceb83310	2016-01-21 00:48:49.149	9a64e5	1
210	evanskorir60@yahoo.com	evanson	65271cb9bef2c13c0282a326cfa7037a7748503e9bfc20539c7ab33dcd5e7b4b	2016-01-21 08:26:39.521	4ded2c	1
212	Dismasbrookz@yahoo.com	Drenz	2b227ab10b59fe1d5ccbf454bfb99c520c44e21775b556660bbff633ca8ef16c	2016-01-21 08:46:05.935	42ab6d	1
213		wyma06	987fa996fdadcccc64e215dfc146ae10507af68fce7eec6007a154c8bd444e1a	2016-01-22 00:53:05.573	9b0176	1
214	kevinomondi826@gmail.com	Omondi	642cba18578b7d5f05cbf47b39cd568ee103f239af5d5c4177c660ec2733c77c	2016-01-22 04:49:46.773	5dad67	1
215	willkesa@gmil.com	kakawilli	a06c7c88ea83b9dd2480361feaf5636659b3570887033ea8dac19d8c8ed92764	2016-01-22 10:48:55.494	601a65	1
216	Kakairemoses21@gmail.com	Festusmutuku	4c8f4f03d3afdef8d8175caf6d07c9b11e04a884733cabfbcd3b9c11d734ac2c	2016-01-22 14:00:40.961	ffe1b5	1
217	embingi97@gmail.com	emmanuel	9696b641b2914d16345b240af057242db8a497d894b964d58df173c736075991	2016-01-22 15:05:13.068	734d54	1
220	mogakakepha@gmail.com	mogaka kefa	0de46a1d9973cff40b0c66563042b3b811c9e1ee04b94509b044ba2f7498a48c	2016-01-24 00:58:19.489	60c2fa	1
221	walterotieno9@gmail.com	Walterwais	7e8074922ff2cf3b6afa63ed381bd7695a57f426fb1397f8f7918bf57761e9d2	2016-01-24 01:11:03.575	043513	1
222	bravelkavel@yahoo.com	brian	9337da77625ef717f57f24ea092fe5b41082ebb62187f7295521245191fac1e3	2016-01-24 12:20:35.491	dfc0f9	1
223	edwinraware@gmail.com	edwinsirima	b014c1938e1f481a67373a5f33259588113b13612ae390c7f1465d0b2d1c2d30	2016-01-24 13:41:52.706	606677	1
224	muigai407@gmail.com	Hellen	513981fbfd03f518d3124fe2ba6bfc32ee8b6282d8ff09015ce653e9b5c581c5	2016-01-24 13:44:18.234	126c6f	1
225	annwanjau13@yahoo.com	Anne	b17fc071e304dddf9e586f1c2ac28daf9b755326d5a403bfd3dd0fbb2c0ebb52	2016-01-24 22:00:26.441	ee5feb	1
228	muirurikirugi@yahoo.com	martin	6d05601d588916c88bb3e1f9590c6299467053bba8e102a7c0eac0de9ea87ab5	2016-01-25 05:35:33.602	e3c95d	1
229	nncy.sagala@yahoo.com	nncy.sagala@yahoo.com	4f4cfa227e411fc8537692f3bee9c931f99bbd1080532736fd76af5a4d666a7e	2016-01-25 08:08:48.599	2b0cc4	1
231	Ben. thuwa@gmail.com	Benson 	1487c47fbabb762ab35060902bf25a6d999dae545b0aa260b9d9c8b6c9afaed8	2016-01-26 00:51:34.921	7bdc82	1
232	cynthianzomo@gmail.com	cynthia	18aabdae295ac247e6d6ea5bca9ccca61b5b1d393593fcb61685657fb8115acc	2016-01-26 02:36:27.146	7293ce	1
233	joymogeni@gmail.com	joymogeni	88881c838368f221ae0e647dc7d772e1c44bd438b848143962b888546e5d3faf	2016-01-26 23:08:22.308	1a3bb7	1
234	cleophasmusasia@gmail.com	cleo	ad3b0d598ce20406c0bb94d8ad5ed89550f574cc556d5f695dcabebf360d951d	2016-01-27 00:41:06.19	33f618	1
235	pamain88@gmail.com	pamain88	5917fb81c001139824b6fe30dac8186bb1967f365fe29e69e054bc710f39b7bc	2016-01-27 01:28:00.876	ebc3cd	1
236	pamain66@yahoo.com	pamain66	a6a75de4a5a02d9332f2bac56786a09267e6d118a0649a20bddf1c0a03d33306	2016-01-27 01:29:35.531	66b9e7	1
237	Ben.thuwa@gmail.com 	Benson Mutiso 	1487c47fbabb762ab35060902bf25a6d999dae545b0aa260b9d9c8b6c9afaed8	2016-01-27 01:34:12.776	dfd100	1
238	pamain@gmail.com	pamain	5917fb81c001139824b6fe30dac8186bb1967f365fe29e69e054bc710f39b7bc	2016-01-27 01:48:39.911	5b7aff	1
239	laniengoya@gmail.com	laniengoya	03abbd2c2bd9f1c90fe2df19f72aa379b3355e7d4c1605b3d55360140884288b	2016-01-27 02:34:53.573	b488b0	1
240	bbnnjogu@gmail.com	Bernard Bryan	dc96c3239430705fece43a4d49471fa2a14bf24d651942f79ed225f4dcd638c2	2016-01-27 03:30:50.454	92efd8	1
241	terrykanyoro15@gmail.com	terry	21ed2f6e678ccc36e25fb4688424534effa532965e02bd1978be25cbfb28a989	2016-01-27 04:50:55.921	4e8328	1
243	ndungubonface@yahoo.com	muchori	8d1a00f05a883126ac2e5b71fbe64ceaaa6549654d78b945760fa89d710c2be2	2016-01-27 06:00:49.896	e84d2a	1
244	inzaialex@gmail.com	musango	50c0e0601bb657f43ea37ff1c9cb1fb0cc7a6930dc6047eb33bf09c4ea7b19ec	2016-01-27 07:04:49.885	5f5ffb	1
245	Kadzo.yvonne@yahoo.com	Yvonne	ee0f6a0f330a3a537f1e6e6ce9c39be5f0b130c37bb865c4e630cad0a5597d67	2016-01-27 08:17:48.622	2a0bd6	1
246	mogakakefa17@yahoo.com	mogaka	0de46a1d9973cff40b0c66563042b3b811c9e1ee04b94509b044ba2f7498a48c	2016-01-27 11:56:15.093	4e9b79	1
247	ericawaringa@hmail.com	erica	dc1b375fb6510e948268446054b1312433d037f84b461b5ed6443a8551dd2701	2016-01-27 12:43:42.127	cfddd0	1
248	ericawarenga@gmail.com	waringa	dc1b375fb6510e948268446054b1312433d037f84b461b5ed6443a8551dd2701	2016-01-27 12:44:51.686	39ed8a	1
249	magu.george@yahoo.com	george	8fe383f200324c4ef3df8c463fcc31982ebeaab54f1eb1972af1d4a39badb4cf	2016-01-27 16:58:52.261	07b551	1
251	simon.oyaro@gmail.com	simon oyaro	78091f02a54c59f6a0833616f225f261aec0e8d893cd7058ef0fa7cb923a1eb3	2016-01-28 08:48:29.523	3250ab	1
252	Gladomaina@yahoo.com	Gladomaina	463b36dcc334c7222c5852023036ce1e5eed2e0961f1f01d3e28c1a0a5d157df	2016-01-29 01:10:19.4	abec84	1
253	dianadee686@gmail.com	diana njeri	746e4ea52293fe9bd1cc52a1d48d13431b244e723d4fdcfe625baf242421def8	2016-01-29 06:08:20.935	f6d657	1
255	mosehwandera@gmail.com	wandera	74c5e9536447a0f30c94bc2a8ec3fdb0c4fee0b0f0bcb5d30d60d31248fb381d	2016-01-29 07:00:28.233	962b4f	1
256	mosehwandesh@gmail.com	moseh	74c5e9536447a0f30c94bc2a8ec3fdb0c4fee0b0f0bcb5d30d60d31248fb381d	2016-01-29 07:01:55.809	7d7cf5	1
257	salomemungai98@gmail.com	salomemungai	250735c8f2e44cfe5ddc46cc7ce93dfa3dfd9b61751d0c6b131918dee1bc601b	2016-01-29 07:49:54.414	efc97f	1
258	kiplangatishmael@gmail.com	ishmael	2a366f48610dabdc82eaabdf6c6a71ea7d31e40ac7fe2de4b4ef0c8a6aa173a7	2016-01-29 10:33:41.683	0a4a84	1
259	Denismutua@gmail.com	Denis mutua	b0f4c40f8c1b38bb5ea9e7582f657ecc1067ed2ce5fdb196541b3753cf2a0bb6	2016-01-29 14:01:57.93	0570ce	1
260	dorismwihandi@gmail.com	DMwihandi	0602620b14d9570144c994b27a3e2b0d9dcfdb71ed009271e5e398791f53a235	2016-01-30 10:05:17.044	e39d36	1
261	Millerfai@gmail.com	Edwinn	b8001d6a49401c2522556e219ecafd0c918819387d89ad6c2c87ff609314b870	2016-01-30 18:10:51.021	292e31	1
263	emuthike9@gmail.com	Edwin	51c6412adeb0ac2712de5f601aa4a6479979e7a3ef7f07cd43a793c08b5bb16e	2016-01-31 02:42:56.297	6a778d	1
265	gichukidominic@yahoo.com	domy	89b58cfb3d9e2a8c63226094255ec6b149aa7c75a87cf5e31f5f07d1eb3909e3	2016-01-31 10:33:39.07	a68307	1
268	momanyiobarare@googlemail.com	bararem	8093e053749548dcf6a48e7d4b31e3d6defa0046eaeb646e78e1718839a9ee0c	2016-02-01 04:25:47.49	57924f	1
269	barnet.barare@gmail.com	bararemo	8093e053749548dcf6a48e7d4b31e3d6defa0046eaeb646e78e1718839a9ee0c	2016-02-01 04:31:46.227	bf5c56	1
274	frankobino23@gmail.com	Francis	f11eb4e781d4608e5366766d9cefd7df62f550023afbf091bab3871f5735da52	2016-02-02 07:14:25.849	741ddf	1
276	charlesogutu859@gmail.com	vaka76	00e450aa2dae6eca257cfe24ace4ae90a0f96cddfc2084e18595722743dcc804	2016-02-03 03:59:45.486	abbe5c	1
277	mikenyash3@gmail.com	mike	8444af114b9fe2813af89338d0d58845c472fb787779f545af0abfb017bbc333	2016-02-03 05:28:28.933	7b9329	1
278	mburuflorence@gmail.com 	FLORENCE 	e9a9aedf20826de4ca3aac0012ec99085d4508701371d006359d9d06db20a7d2	2016-02-03 07:18:49.541	6ef260	1
279	martinnduxh@gmail.com	shayne martin	05c5f6ef21bb02be3db6d066c4e822e07ef75b2f85241333a7cba5dec74e2d33	2016-02-03 08:31:28.153	c8ffc6	1
280	rosey.kui@gmail.com	rosey-kui	7971fa50937f193c7465f2b3e2cd902e95c71724d0a575934bf619c84e4ad9b3	2016-02-03 12:24:59.747	dd9039	1
281	njerikariuki53@gmail.com	brooks	746e4ea52293fe9bd1cc52a1d48d13431b244e723d4fdcfe625baf242421def8	2016-02-03 14:14:49.048	569363	1
282	maxyshioyi@gmail.com	Maxmilla	ead260c04f50a62a664627c028077367b463129d3c52d480fce43df41741e27d	2016-02-04 07:44:00.401	ab0909	1
431	Shanyisaedith@gmail.com	Shanyisa Edith	e97b72b02dd56f00b4e5a6589a7055ae99faaf4e8e106ad688621f60b2323d22	2016-06-04 11:00:54.715	ec5915	1
284	listonkiptoo@gmail.com	lxton	9ceb15ec4126389f7072f0fe1bd792fad94ec2a8b2546812707a53f9119a607f	2016-02-04 14:10:09.117	5ecf07	1
285	gateris@yahoo.com	gateri	2b74db2b39e9c48e5f9735a2216d9e8ccac18d8527b30e340aa4ebfb7aa0ee6b	2016-02-05 03:09:05.804	6ab7c5	1
286	Jgathiga11@gmail.com	Joseph gathiga	c5e3e1f32c6ef97998df1aeda3694489d22bbf77dd4c0481ce3b4ad2ce9fe092	2016-02-05 03:38:11.501	fc8e8f	1
287	titusmutinda1@gmail.com	titus	a411c15be2c26ff66d121a7faee34c7aa1e206410291cf839ae3a969555d6b52	2016-02-05 05:16:35.817	d5f1f4	1
288	jefmanu@yahoo.com	Jefmanu	1abfca1de0e894294aa48360244cf188b8c0c66f72fdd96e38056994bb51e4ed	2016-02-05 07:47:51.023	7820b7	1
289	jerommym@gmail.com	jerommy	8144eeaef07f2e690febabccab48a3ba7a0c9ac7611f795d2519ec2a6b6c71f9	2016-02-05 08:26:24.037	2d6c3a	1
292	eutychusmwenda54@gmail.com	eutychusmwenda 	264713fefc660bfb4fb9580c9872c8ca19840bbf58a35a2bc930566751306e3a	2016-02-06 06:06:58.835	7809c4	1
293	eutychusmwenda54@gmail.com 	mwendaeutychus 	264713fefc660bfb4fb9580c9872c8ca19840bbf58a35a2bc930566751306e3a	2016-02-06 06:08:39.622	3af63d	1
294	janjeri95@gmail.com	jane njoroge	a243d2ad960dd7c4501e8910f62b479d71a2646a923c67733d6809a4085126e3	2016-02-06 14:48:30.669	f7eb56	1
295	shadrackkipchumba94@gmail.com	Shadrack	fbb45dc21889383dbb36fa6c0b3c55c2467e01296c6b7a7ad3baea454d2d0ba2	2016-02-06 23:47:47.536	05b9d3	1
296	antonoomwash91@gmail.com	Anto	86dc3c3f388d3342d781301e2658961cb5e131cfd0dd10078481a2176a44ffe3	2016-02-07 02:29:21.444	059ca9	1
297	antoniomwash91@gmail.com	Antonio	86dc3c3f388d3342d781301e2658961cb5e131cfd0dd10078481a2176a44ffe3	2016-02-07 02:32:05.533	57774a	1
298	kosgeisainaE@gmail.com	kosgeisaina	7433c6c30579d13b74c20088c9956d23e3a7e69b5ef9dd95e832b7b2b42c9745	2016-02-07 23:58:08.281	eb6cde	1
299	kosgeisaina4@gmail.com	sainakosgei	7433c6c30579d13b74c20088c9956d23e3a7e69b5ef9dd95e832b7b2b42c9745	2016-02-08 00:06:14.483	9bdb02	1
302	cymkamed.co.ke	kamaah	7d32954268f255f5f1d76b930e2b9724f872513566d2614c4210fa27f4b7edbf	2016-02-08 03:51:42.337	f6f59a	1
303	cynkamed@gmail.com	edwin	7d32954268f255f5f1d76b930e2b9724f872513566d2614c4210fa27f4b7edbf	2016-02-08 03:59:54.711	4d8d5c	1
304	collinsm50@Gmail.com	Collins muthoka	4e09173575fb0ecd7b6399a46f428070cf547c335a2aee5302ca4a6d74109219	2016-02-08 09:45:58.349	4c1ae0	1
305	hmululuh@gmail.com	Hellen Mululu	ebb91a0645def606e70028d4a26c8dcfecfbca220f4b7abad076751e090efc7e	2016-02-08 23:48:31.452	4839b6	1
306	kyalomulinge16@gmail.com	mulingejapheth	3382f4eb48c267fa048be62a187e0d18ce84a82bf999e6bb515d6b456ea7f46c	2016-02-09 05:29:38.204	658daa	1
307	hkrop@mail.com	hl30600	9d6ab497d137b2832963dd8838385c5278fb7839fbaa306ed8263e7cdd20ff44	2016-02-10 02:09:06.008	c5a1a3	1
308	ruthkinyanjui7@gmail.com	ruthnisty92	34c5638c1a7061768fc0f0d7f777dbcad2b2ab5a1007c7a2b7f9363b78dc6a1d	2016-02-10 06:09:44.023	eea07b	1
310	henrykangethe20@gmail.com 	H. Muhoro 	805a19a6de82078db2d02fea2b90afab9436945394f6a2ad7c5b1461a722f011	2016-02-11 01:00:43.916	c6f2c9	1
311	barazacaroline12@gmail.com	Caroline	b1a9d6910f1c97c41dd1d9adbe510375328fe32092a2db762be1d0bf16c71bf9	2016-02-11 02:29:04.704	72cee8	1
312	gitongamainer@gmail.com	Gitonga Maina 	3a5d6dd6e023ed3a687c2c37e8310b661391ed2f04236168dea2937b61f90c67	2016-02-11 15:39:43.299	326518	1
313	mesmlewa@gmail.com	Meshack	fc533b93e919dc0ec73e87f0ca4db7e342a33cbe0e3ddb51d6bc96f25a400872	2016-02-12 02:46:23.463	2e414c	1
316	sheddymstrong@gmail.com	sheddy	3f99b3940f44b78d6c881110c43e802daa791bbab9889459e7c6c89be043f75e	2016-02-13 01:51:16.955	55e4c2	1
317	sheddyems@gmail.com	sheddytom	3f99b3940f44b78d6c881110c43e802daa791bbab9889459e7c6c89be043f75e	2016-02-13 01:53:57.075	8d08ea	1
318	cleophasnyongesa88@gmail.com	0718062430	bf42f90ccee4fa1c4bce6d8547ad63b1141e8bfdaffac8548a665e34561a4f90	2016-02-14 08:02:10.672	c084d0	1
319	pmartsgroup@gmail.com	Martin	f92c3928cc7903f2ae3cb1a7c5994797adee819f44f090537dff6da7fe1627b4	2016-02-14 12:08:56.142	7d346f	1
320	machariajosphat@ymail.com	mashaa	25b5d60fca1441f0bb7022610b5a211ccc0e4b562c1997ff68068f9e9481209f	2016-02-15 02:45:30.352	e2d540	1
321	nyakioruth3@gmail.com	nyakio ruth	ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f	2016-02-15 04:56:16.216	9332ba	1
325	smaina41@yahoo.com	stephin	9b5a0cd39d1577ac1ee942ac358db97b3f692246591c352a4452b56aa1a92c7a	2016-02-16 01:57:19.314	fbd450	1
326	jumbadenoo@gmail.com	jumba	c3df63876746313d477468c2627d1ecbca9dacf1c8e5f1a7e9dd27382e26346b	2016-02-16 02:12:59.31	fe1e02	1
327	ian.m.narangu@gmail.com	ian12	539b7318b20b49ce3e8b30f597b1c568492354eb02b85c46902694410a261be7	2016-02-16 03:09:19.729	ab86c5	1
329	reenahmasitsa35@gmail.com	Evans 	b73d4c701674241c76efd2ff241d9efb3169cd01d90714715498addf9834a32d	2016-02-16 11:59:35.769	c82126	1
330	titus4savant@gmail.com	titusthegreat	40174e947b8915ec8acaba6f9ee7911a2bc1c5a998b8757ebcf1344ba7103ba5	2016-02-16 13:41:04.914	82847b	1
331	nuraangel.as@gmail.com	nuraangel	f0fd52e74857e4e8cf2dba8cf46befa7f6283264a7b28b3725c80718c59b32bd	2016-02-17 01:52:18.881	fadea5	1
332	yangjoe36@gmail.com	Joe wangai	51476e146ec2f847fac7bb2d5465f3a57bfd539304825472ff4ba6a13d6237ce	2016-02-17 06:08:32.367	63c6c9	1
334	carolynewmungai@outlook.com	carol-Mungai	5b151fcc853ab9e616477e2ade7d009784bd7753482b22a8c7be12bc3707c917	2016-02-18 06:35:53.142	666093	1
335	carolynewmungai@daystar.ac.ke	Carol	5b151fcc853ab9e616477e2ade7d009784bd7753482b22a8c7be12bc3707c917	2016-02-18 06:40:33.5	6bfa62	1
336	hatwori@gmail.com	haron	5ab6a40a7b67ffb1e402192d0394f1ce7dd7f77ff034885fb444a3fe0b09aa6c	2016-02-19 01:41:14.384	84ff85	1
337	josehwanyoike@gmail.Com	JOSEPH	0ecb9961e3134555029d47e6d36ac688611d115deed3da05f2903ba0520329c7	2016-02-19 03:16:21.416	f7bfee	1
338	gerrymanyengo@gmail.com	gerry	0f8b129580e8e5331c539d9f372b7424c40985f00b7e104f2e34df9660d81220	2016-02-19 07:20:11.716	e83f7f	1
339	pkkamau92@gmail.com	paul kamau	040e27f281343b880ed6ac05ce65713d4f744c348e3fe9d378acdc4143d02bf3	2016-02-19 09:58:16.64	41bd86	1
340	mbasali@yahoo.com	shabs	9c199a3d13b61cff427a0e6d20e8a29bb4db39f1674e286c6154a9b469cbe4c3	2016-02-19 11:31:27.024	dc02ec	1
341	dolinekerubo93@gmail.com	Doline kerubo	0f01e47dc127e506613028e94b6f94215f74be73203d63cc59565a1e3c996542	2016-02-21 03:25:40.911	e8b799	1
342	marlinejune93@gmail.com	marline	9afc7c2a6995190fddb4665d1e460109605ce50246690cc0d17b0c532497a28d	2016-02-21 09:13:51.706	a5d4cf	1
343	Alibashirmahat@gmail.com	nawaz	4862bc9c92bc6428dedb52d65a1eccb3d9ec2c506a6cf3ffcda66abf9881852f	2016-02-21 23:53:10.408	8a7385	1
344	pmagaiwa2030@gmail.com	wajoma	ecb08f462ffe029b3537bf8bbae483eff7b14b6b3cb485fe3703eb06942232d4	2016-02-22 07:50:56.325	da6bbc	1
345	pmagaiwa@yahoo.com	Magaiwa	ecb08f462ffe029b3537bf8bbae483eff7b14b6b3cb485fe3703eb06942232d4	2016-02-22 08:13:05.915	a9e1e7	1
346	pkepss@gmail.com	peterwiz	50700bcfc0f87bee340bdf2e608468cb567bf4c00b0e99c74ad8a86a2359bc48	2016-02-22 13:11:40.339	4564a8	1
347	daukariiuki@gmail.com	kariuki	ea8f8442f3a4107ab72c552475ef19d8f9707842f9e7cf6249e6c0f267a85b54	2016-02-22 23:36:02.166	16529d	1
348	eunicekaranja00@gmail.com	EUNICE	14628ec6f48a2939d5f1849a1c6262ed2406c8c9a18efa93731fcfe14f0db6b7	2016-02-23 03:06:24.92	571efc	1
351	Cherryjacob182@gmail.com	Lepaine	1e526104d638e618acfd41600d7630771e4db7428fcce65981439f2d834ece20	2016-02-23 08:19:00.871	812a2a	1
352	agotbonface@gmail.com	Agot Bonface 	ad67f5b2bfe4a845961b885be291e479d082d8f60ca819a13518032c6d008ab6	2016-02-23 11:41:59.389	bbeaa4	1
353	phesborn@yahoo.com	patty	53eac8acf53a809efc23455d97fd9d85ee488fc38180a8d8411614cd73c2708a	2016-02-24 13:59:24.407	143fca	1
354	echesapatrick@gmail.com	0729952086	d21105e61cbfc911bd3d1061370f0804d15431f8ef83828e4a9871c67e4e542b	2016-02-25 02:43:32.099	3bae7f	1
355	nicknjogu1@gmail.com	nick	ae70239ccdb2d3841ef49a8c18b7ae3cec11eff9ac103267892d7c8f3195c9de	2016-02-25 08:09:19.142	cae81d	1
356	stevebamz@gmail.com	stevebamz	8a860670e342938d394d8ef1b28b1d9ea6c534699e312d936b102cbfc2164908	2016-02-25 08:11:25.747	d6187b	1
357	vallarykanaga@gmail.com	vallary kanaga	b9f9ab6a93532d055272dadadef56288b514ff25bf639b12507e062a9c37b0af	2016-02-25 12:55:19.811	83732d	1
358	edgeroipiyo@gmail.com	Edgar	a2234cbc78b96d442867a92803590868f5335cfcad9e2e33af5744511f6b03e1	2016-02-26 10:21:26.672	6b0b43	1
359	caroleirungu@yahoo.com	carole	91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203	2016-02-27 14:11:25.826	afc790	1
360	jacmunguti@yahoo.com 	jackso	91add1a25f0735bf1a9a65fe58ea33f409245853051c1b9e6eeb4f4a7fd7d7ad	2016-02-27 15:08:11.58	65c7be	1
361	gibsonmunyao@gmail.com	Gibbs	721bf131fb81f973b2935d1d420a03a1bc933e23072bba7089a6a75ba3ce0bbf	2016-02-27 22:28:50.333	851fa0	1
362	oderoallan94@gmail.com	Oderoallan	f91c949f071cb165cb76345fcac53bfd6f5400affb4d31cabc0363aae50b119f	2016-02-28 08:57:48.431	039551	1
364	antonynainamania@gmail.com	Wainaina	c9f2d2fb2e587179813c8117869417feece2ebd3c14f0ca14686f7d77a7e5a6b	2016-02-29 03:20:46.02	453f0b	1
365	licdenis1@gmail.com	dennis	1200157d3e3bae86f2dc42a6cb778c68e585f50c6ae9bd3ee839f1c6b69173d6	2016-02-29 06:46:07.85	3fcdbc	1
366	0712938807	Joshua lalkalepi	5091049e5d88f1ea89467eecd02aae8ea96bd5f6dd800711200eaf858d0ba90c	2016-02-29 10:25:05.188	34466b	1
367	njoguedwin21@gmail.com	edwin njogu	aab623da06985442d163f6e0ad0471dd32d1fab09ea813ff8b7ea8721faf304a	2016-03-01 00:42:01.652	1c208b	1
368	Stellahchirchir2000@gmail.com	Stellah chirchir	b7465a38e6dd864c4659b20079e5b8d4236d647ed6c492b237dfe7ddeb744807	2016-03-01 03:29:49.807	52096a	1
369	sydneykimtai@gmail.com	Sydney	784503979a413c1b6b71cd36bd15725815f239332fb5f2a6ef796401e48f1c97	2016-03-01 05:03:27.59	7eb5ad	1
371	kibue_john@yahoo.com	kibue	07f493a7ba42777650f63c0405a69494686e4a8974556ca31ed817f190631f44	2016-03-01 08:14:57.342	c39857	1
372	wycliffemogire@gmail.com	mogire	fd232f8a7b545fd46b4a7a0562de2ae38a49bb9b9f8c166d219ea80d6e664673	2016-03-01 08:29:18.446	62fe82	1
374	mogirewycliffe@gmail.com	orecy	fd232f8a7b545fd46b4a7a0562de2ae38a49bb9b9f8c166d219ea80d6e664673	2016-03-01 08:33:06.973	507b0e	1
375	patricianyambura5@gmail.com	patricia	03f0e2ecc981725dbe72cd9bf3fe345a9567b9a07f6ec67de9c724911678d1ae	2016-03-02 02:43:27.972	08aa55	1
376	danykiptanui@gmail.com	Daniel korir	a96e181b8dad5f0cd514cb1916b2eb4e704dd01249bd0a90d2444e9f3d32fd85	2016-03-02 07:46:59.104	c24ac1	1
378	mwangievans404@gmailcom	mwangievans404 	a9a9865ff5303dd4847c6cbf19b00a4ff9ac06f0a8d7733ab9b0eedcacd046c3	2016-03-03 11:55:32.819	2e4c00	1
379	Abdiazizhulbale@gmail.com	sadam munir	b6a4114611743e3c60afc383321d3ea0cb6c29c2a8aa55680dbf511e5978cf25	2016-03-03 12:04:27.28	d4f867	1
380	kirimiphineas@gmail.com	phineaskim	16adc0bf877e54483823ad790ee53b69511ba740880cd7761df9da69909bc86f	2016-03-04 03:44:11.939	795431	1
381	Stephenhabu0@gmail.com	Habu stephen	96a48f7517a5335352c0ceca1639f736f8f5cadf3db22e6784ae2272bc196dcf	2016-03-04 10:48:17.3	6d4e1d	1
383	godfreyngige1@gmail.com	Godfrey	c6a0be2782fef066cc25ef204f99148ab889dbc9be9f521014fbf7cac6d1f104	2016-03-09 02:35:55.025	8ae3ea	1
387	wawairimujnr@yahoo.com	marthanjeri	b9eeacf8324e8475a90544dfcf90b6611c9ce515ebe5fe176ba77a8a93bff1a2	2016-03-10 15:11:06.394	d0dce6	1
390	gathuitasteve@gmail.com	steve	74c32153991ead80b34817c5ed299b28f4e6d2c5f615cb673efef3700975da7c	2016-03-12 00:21:41.857	eb3e32	1
394	golichagy@hotmail.com	shaheinab	9392b5830848249e192d38dce847d177fc62ce156083b39efbecb80ff5ffb845	2016-03-21 08:10:25.786	40912e	1
398	elooremeta@gmail.com	EccraL	c15367c599b163217f8816cb634f5f0291105fbda7db3715f623b30f42377ec5	2016-04-18 08:52:28.164	ec2d48	1
400	jemobarasa@gmail.com 	james 	ad621a23bd5c2474c1fe0909a8a38bb5fcccd382e855f97ef06d63a06b22dd7d	2016-05-03 15:43:20.117	761629	1
401	nartinthiongo45@gmail.com	marto	b6f8d434a847fb0f0c1a8d9b936b8ca952e224f205a55f4ba9b2c20f88fdc9e7	2016-05-05 15:32:01.646	7e2cbe	1
404	michaelindimuli.mi@gmail.com	Prince Indimuli	9bd2ef7a9ddbb22386f27f5f6885f8eeef6cdf57e96bbdef0f9e0421f1ec4654	2016-05-09 15:49:16.597	80315e	1
405	jmmuchiri24@gmail.com 	Muchiri 	e196da9927ac8cb4d3da8d3b38119efa4a742d88b5b82097640ae1053067eae7	2016-05-10 01:40:29.145	9875dc	1
406	njeri951@gmail.com	caroline	d50bb98c7a35a1c79bb48271fd84a174d2a4ee9dc8fd4ba696efa1e6bc6d2ece	2016-05-11 09:23:51.356	b67506	1
407	macrinaus.ke@gmail.com	Macrine	cf071f92e7806b02cdd88ac0992e15b6f985178a4aeaea077b22faf83a18b45a	2016-05-11 16:38:41.568	3f9381	1
408	jnangayo@gmail.com	jay89	3267db08309066a8e44ea682822a1882741ac412877b9e3227223c0d39db3e14	2016-05-12 06:31:09.845	322029	1
409	j_oann_a@outlook.com	jo89	e3b7eaa26d17e9a62fc3947811a60ce13a5080057257ce1a08da861321e69c82	2016-05-12 06:47:02.92	863440	1
410	kihatoloise@gmail.com	kihatoloise	4054f3982ee00b911aa98f64f9c787d453c17efeb84daae51864a23c108a5996	2016-05-17 00:40:30.896	81c225	1
411	otwanesamuel6@gmail.com	samuel otwane	e0ba25773f7c072963c402859b57dddad74a1174a8ee4353933a7537c9294cba	2016-05-17 00:49:01.108	4f5a35	1
412	notchrobin@gmail.com	robinson	88bbdc11d78c48fdb803e6fd00d679425e5f5a527417b6f557e45f0726c475c8	2016-05-18 02:05:12.534	742341	1
413	judynishi28@gmail.com	judy	11aa0f09f3b6daf2fe8183e019f7132a4941bbed04d857c211a5fd5c81611be9	2016-05-26 04:27:21.085	cb6686	1
414	Joenjeru34@gmail.com	Joe njeru	2c15683a72db678d4363f95191b57ac4e40db76279aefca0d24c0c9d045b8d90	2016-05-27 04:04:11.531	a9b836	1
415	oyugi601@gmail.com	james oyugi	66115c9ba52f83a91f5121c5ea36f09f79da33a6d270e8e6c34a95f1c66b4c07	2016-05-27 04:14:05.992	e8b367	1
416	amukowadavid0@gmail.com	david	b10105dd87280a78f492b7513a8795187cebebae1c7ee9da6485626313eaf2c3	2016-05-28 03:18:27.062	4f5915	1
417	rwkimemia@gmail.com	reayray	b7a955315ca4f3fcd0928b70052607f943fefd3d6e5783c83a493eb59225a999	2016-05-29 02:41:08.833	9516d0	1
418	Kennbila@yahoo.com	Mbila	a8d81703c91993eedc92e96664266ac6ea8f360d5527c61d67ffa0343e3e6d48	2016-05-29 22:00:21.314	761b85	1
419	reginagichuki00@gmail.com	regina	c050fcfa81578ecd67a72d5b42c3f1ede33bf93b5dc009a86f2c0633bdb397e5	2016-05-31 07:50:34.24	db12ae	1
420	lydsamley@gmail.com	sam	62291b4360146288c9eb61f79ea421f85b37709f1b7907bd3589eff2ee12aad5	2016-06-01 05:16:46.531	0f9d72	1
432	faithkawira88@yahoo.com	kawira	8ce13f1d16e3199939e17ed892593656ebbe23f5d4ef4f3f02e68aa94a81f1d0	2016-06-04 22:30:24.557	a07fd8	1
434	julietmuthoni@hotmail.com	JulietMuthoni	bccb1bb94f70794a2ff3c8c2cab3df6a01ff9d693c4d909336daaf436821bf97	2016-06-05 02:27:27.368	93d8d7	1
423	kisoso94@gmail.com	solitei	42f938acf9ce344c2a07c582e3ff358fe026543ad976ebb7a38bef17a31db6b9	2016-06-03 00:59:48.46	4f73dd	1
435	bessiemangah@gmail.com	Bessie	5a0d4715d666b69b5f19fe06cbb1aeba0125beb04db700351c96dd1d916f3a34	2016-06-05 02:59:43.306	bc8477	1
436	wanjirawawanjiku@gmail.com	mary	d350e60b40caf2241e4b1a3973b2b2986a18fae8e2d286ef32e1c8b9a01ec517	2016-06-05 05:22:57.108	180d2f	1
427	breizh@yahoo.de	Annabelle	5d1d44f5438e8cacd597fb7b3db97bcd8dd380845c03315175202dc96aa3320a	2016-06-03 07:39:33.514	d733f8	1
437	emuthonik65@gmail.com	Lizk	3d5cc4336fceb7fdaaee22ce2c539282d5b824d69b3bd8bf36c2aded4aad095c	2016-06-05 07:48:55.764	8221cf	1
438	joydanielz81@gmail.com	joy	0c769a60a0c4f1c117224579bf44a44e2a5ad666a50c6088412091e9f3ddc986	2016-06-05 08:51:50.748	c0ee58	1
439	juliannerose903@gmail.com	Rosejc90	e354913c77be7bd2f88cc342547ce421d131136daa23188fc3bb3bbe0d01801e	2016-06-05 11:11:16.956	d90e6e	1
441	ipascolynne@gmail.com	kanyanga	a1daaac57ee18e7e8a1a5f5e631a1271e887ab9d6e685f3cc0abcd60a088dfdf	2016-06-05 11:52:01.111	75fd16	1
442	rosemwale0@gmail.com	0727668277	c13f3fbb92ea5794ce3105392e6ef7b656f7df80213ea152e884c0a20ed7d831	2016-06-05 12:05:49.119	66fbc3	1
443	rosemwikali19@gmail.com 	Rose 	1bf8a6f818314dbd7e8eb263f4d4e5592643a2b1c465e2321f6299a6105a5bed	2016-06-05 13:46:12.151	ec9026	1
447	slymwanga@gmail.com 	Sylvia 	6b61c616d51af986ea7bb10e0b5e0ea266969639fbbb2a54d816206fb9855af5	2016-06-06 02:11:00.058	c2417a	1
448	isaacmuyelele@gmail.com	Isco	e461b08909a3473e726e5224381a3f337c6feeb45ba15c6b760dcd77bb6089cf	2016-06-07 05:05:45.431	a4b26c	1
450	sta20ashley@yahoo.com	smatheka 	0b748e59dd5514b6d10a5bb61f3cc53de24a909beab895e978ec17c89c98b0a5	2016-06-08 01:07:23.326	03e5ff	1
453	paulinanjenga@gmail.com	paulina	42da55d917eeaef61877aae8edc8ebd3ca84a8d58ab86a83526828ac61f25d9d	2016-06-08 07:53:00.128	5f2d11	1
457	mwauraken823@gmail.com	ken mwaura	bc73cae1c329b7c848ba60e4736ccaecf362bb902d1f53e40c7a47378d4f0d26	2016-06-10 04:12:31.18	6a7fe6	1
458	davidkibochi@gmail.com	0717525787	2269a96f4f446e5902b4a2aa2d12a27b6a0e13308bb9ef027530cb82fb04527d	2016-06-10 13:28:12.483	ae70d1	1
460	gachanja@localhost.localdomain	sanje200	e53f08145bbbd97c463f2ebdb2f96bca5f6e89f9a1506670ad30c82e9eae0399	2016-06-11 05:53:54.443	12e513	1
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('registration_id_seq', 460, true);


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
\.


--
-- Name: secondshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('secondshortlist_id_seq', 1, false);


--
-- Data for Name: seekers; Type: TABLE DATA; Schema: public; Owner: work
--

COPY seekers (id, groupid, statusid, username, password, expiry, email, mobile, othernumber, photo, firstname, lastname, middlename, address, dateofbirth, gender, website, maritalstatus, idnumber, pinnumber, passport, driverslicence, points, salaryid, datemodified, datecreated) FROM stdin;
3	1	1	cchesang	e7b5fc605fdf97a9c2dd5f910e445f1455027221aa62229023ecb966612e08c7	2014-09-09 09:31:22.737+03	chalosang67@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-08-08 09:31:22.74+03	2014-08-08 09:31:22.74+03
1	1	1	punuka	c2dc291d2c6086e49f88eecdb4a52d4057723adbba5f6abfe0f335272d728c6a	2014-06-23 17:16:20.203+03	esunyen@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-05-22 17:16:20.215+03	2014-05-22 17:16:20.215+03
154	1	1	Evancejowi	b0cd1955cf2cca1d014612f0f2d0a193fbd73a8e0b7e140b82a5014b4021ad4c	2016-04-23 17:37:38.504+03	ochieng504@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-24 17:37:38.506+03	2016-03-24 17:37:38.506+03
132	1	1	SILAS	599672836320e0c05971e6bae8db399b0f14961137103cb514362806172e211a	2016-04-08 09:00:36.882+03	otienosilas26@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-09 10:00:36.892+03	2016-03-09 10:00:36.892+03
4	1	1	JohnKMwangi	bb153e6b939ae3423b0e58f33d439bb4089945bd0aa3ffd5a76ac1fdd90b3a32	2015-02-07 14:55:17.079+03	jkyobe@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-06 14:55:17.081+03	2015-01-06 14:55:17.081+03
31	1	1	gnyakiamo	01b08028fd9e7d8bef0136d73cd18995486f0a1159d4d4eeb3809b3a7f0da5fa	2016-01-10 11:56:45.112+03	gnyakiamo@gmail.com	0722445965	0722369500	DSC_.jpg	Gerard	Nyakiamo	Majella	PO Box 7226-00200 Nairobi	1978-06-16	t		Married	20504422	A002716969Z			\N	14	2015-12-13 19:04:03.306+03	2015-12-13 19:04:03.306+03
5	1	1	dianakarambu	ae1c93e675b09e7719dc0547f49818ae2e5cdb1bb03197b9c36664972af38cd0	2015-02-23 14:28:50.333+03	karambu.diana@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-22 14:28:50.336+03	2015-01-22 14:28:50.336+03
6	1	1	silimoma	b60b904030bb2885b25a85e1b17df9bde902c4367157cd2bc6fc5be22604db2f	2015-02-23 16:10:25.319+03	silimoma1@gmail.com	0721993979		\N	Silvester	Mogute	Machuki	P.O. Box 12302	1980-05-03	t		Married	22353487				\N	4	2015-01-22 16:24:25.893+03	2015-01-22 16:24:25.893+03
7	1	1	gadan	487f570361f83e94f060ba056e12d0dee23d7ab7b9c29630dbc1c495f06879f5	2015-02-23 21:29:36.091+03	gadan812@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-22 21:29:36.094+03	2015-01-22 21:29:36.094+03
25	1	1	victorOchieng	6c5005c275aadec18e966d5e3a0d57aedbcc8ef0dbd753e4be90ebc8552bf894	2015-06-05 14:38:05.728+03	vtsony@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-05-06 14:38:05.731+03	2015-05-06 14:38:05.731+03
26	1	1	valentine	971872a2943db7074f16efbe42c756cfa92e6b8b4a53baac1ac51f31470b526e	2015-07-04 15:38:36.143+03	valentine.lengees@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-06-04 15:38:36.144+03	2015-06-04 15:38:36.144+03
8	1	1	Gonjobe	264a404d814268294574a838c39602d331acd99df28400d8f9643d731d5660a4	2015-02-22 06:39:07.845+03	ibrahimgonjobe@gmail.com	447951165412		profileimage.jpg	Ibrahim	Gonjobe	Abdi		\N	t							\N	1	2015-01-23 07:45:42.824+03	2015-01-23 07:45:42.824+03
9	1	1	Churchil	5a84a9e426e1efb1eff2e54ad4d7d75871ba20e0f36df0480d5411be9622a20c	2015-02-22 09:34:53.416+03	churchilo67@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 09:34:53.42+03	2015-01-23 09:34:53.42+03
10	1	1	lenawasae	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	2015-02-22 10:45:58.47+03	patricklenawasae@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 10:45:58.472+03	2015-01-23 10:45:58.472+03
12	1	1	muriukidavid	ddee49aaf4598765debfdc4897fe1b239187c74d1d67c50671d455b343b0230d	2015-02-22 14:40:11.851+03	muriukidavid74@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 14:40:11.853+03	2015-01-23 14:40:11.853+03
168	1	1	samuel.gachanja@cellulant.com	011e7edc9617c73102b0a506f7e0bc6008478266308fee802ef0f6e2500e8166	2016-06-30 12:52:20.268+03	samuel.gachanja@cellulant.com	\N	\N	\N	Samuel	Gachanja	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-05-31 12:52:20.27+03	2016-05-31 12:52:20.27+03
32	1	1	frankisky	f9e120dbf9cbf98a9f2b9c98f913d239c710e2edacf598ea82ff2da0f844f85f	2016-01-15 05:57:04.985+03	frankisky207@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-16 05:57:04.987+03	2015-12-16 05:57:04.987+03
11	1	1	jshobiero	be5d233f7451400b918c024b620e8b3d92c0decc574cb5a6b8370157e15dfb04	2015-02-22 13:55:44.764+03	joshmaiso@yahoo.com	\N	\N	Joshua.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 13:55:44.766+03	2015-01-23 13:55:44.766+03
13	1	1	ibrahim	0a9cd153d6269c8180a018343dedff7f7f2b6d44fd1a2eddddd640c8186010da	2015-02-22 21:06:03.423+03	ibrah.sallah@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-23 21:06:03.425+03	2015-01-23 21:06:03.425+03
14	1	1	Tom	71f566aba763fb7636f03bfeb321c6d4934d4a6d5cb777c49b1c1595260c573b	2015-02-24 17:03:44.542+03	tom.atak@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-25 17:03:44.545+03	2015-01-25 17:03:44.545+03
15	1	1	xliche	75e1a7bd6280b3e4821a271d44bc7307dfc832da062e6728b75a0d03ac66047b	2015-02-24 21:15:11.283+03	alinura18@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-25 21:15:11.285+03	2015-01-25 21:15:11.285+03
16	1	1	digitech	5dc96acd05a586796aca8476a97a9d2256b92c8e750716ff4b8466c4cf012a1b	2015-02-25 10:01:27.441+03	dgioche@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-01-26 10:01:27.445+03	2015-01-26 10:01:27.445+03
17	1	1	Halake	13b9175317e11edd9988113c08a9a8479587180ecfde5577ad92007058cd56cf	2015-03-12 02:12:35.497+03	legruz94@ovi.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-02-10 03:12:35.5+03	2015-02-10 03:12:35.5+03
18	1	1	dahalo	ee175e3e3901af3098163af1c14547f3ea6b50a3e78f12fb498b2b7a437caf19	2015-03-13 10:17:12.56+03	batula@ttieatec.co.ke	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-02-11 11:17:12.562+03	2015-02-11 11:17:12.562+03
19	1	1	Adan	f65a26d5207b145f4b68ea0b7cb98210614ac4961799dfb39cdaf4d03ba4c682	2015-03-28 06:18:50.036+03	hatarihallo@yahoo.com	\N	\N	45794_101011933293367_1433695_n[1].jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-02-26 07:18:50.041+03	2015-02-26 07:18:50.041+03
20	1	1	MaryMwaniki	80b59f6dee8743c4fcf3ba28c3f5b83e7f248e28e9501ad68be0431f8073285b	2015-04-09 12:41:55.94+03	mrymwaniki@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-03-10 12:41:55.943+03	2015-03-10 12:41:55.943+03
21	1	1	ruth	5d46376650f7ce2d65738543706053d96466ddd5dddf9c3065cb608b2cbebdf8	2015-04-12 18:01:23.386+03	ruthwangari18@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-03-13 18:01:23.388+03	2015-03-13 18:01:23.388+03
22	1	1	gracekinya	db6053e0172ef44df533d89bffd3473e856afaee2d5aabc9e788b4a7070086d7	2015-05-21 17:11:56.334+03	gracekinya@ymail.com	\N	\N	Grace.passport.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-04-21 17:11:56.336+03	2015-04-21 17:11:56.336+03
23	1	1	cnnganga	e0dd00ede0c3de906021a6739f955308a86312906e3677caecebd8fd840dbee3	2015-05-22 12:50:12.463+03	efilefu@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-04-22 12:50:12.465+03	2015-04-22 12:50:12.465+03
24	1	1	username	16f78a7d6317f102bbd95fc9a4f3ff2e3249287690b8bdad6b7810f82b34ace3	2015-05-31 07:05:31.366+03	askdfjasidueryqwoeaqw@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-05-01 07:05:31.377+03	2015-05-01 07:05:31.377+03
33	1	1	masawejr	9fc34c423d635f9b0eb25260e0d109f64e8bc3e0a07a4dff54c191a3cc20003a	2016-01-17 11:30:44.315+03	masawe4@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-18 11:30:44.318+03	2015-12-18 11:30:44.318+03
34	1	1	Mako	2898cd3326ce5e32e352a8389f4d4470259f3e5280f0107088b10c75b8bdf907	2016-01-17 14:39:54.269+03	gmakomere@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-18 14:39:54.271+03	2015-12-18 14:39:54.271+03
27	1	1	celestina	db18c8c9181c84963c59e6b8c994d4398262d1e9ea35d57bdf2dd9dbbdec38a0	2015-11-12 17:32:21.743+03	celestinakinyi@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-10-13 16:32:21.753+03	2015-10-13 16:32:21.753+03
28	1	1	Bob	ce92775f0054d245608b4c4169d8d620603dd9a718a39fb4713b9b99f6f54656	2016-01-06 07:58:39.731+03	bncyrus@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-07 07:58:39.734+03	2015-12-07 07:58:39.734+03
29	1	1	Chapia89	0a55cdd898bbad3e7fc7be3b17becac10fc13f4e1c0dd2efc7105030b1eaa04f	2016-01-06 10:30:28.586+03	chapiageorge@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-07 10:30:28.589+03	2015-12-07 10:30:28.589+03
30	1	1	chriskahuki	daf2322e35c7944b31df0c37891a42f3c0d1d75df338e3337b39e9100ba38286	2016-01-08 10:31:03.93+03	chriskahuki89@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-09 10:31:03.932+03	2015-12-09 10:31:03.932+03
35	1	1	Nancy	793ea4e1cbdc522d41d669ac3fab6a4991808d657ed6064304c97a73468dceb1	2016-01-18 11:24:27.581+03	nanky90@yahoo.co.uk	0727240372		\N	Nancy 	Muroki	Muthoni		\N	f		Single	28219776				\N	3	2015-12-19 11:30:19.548+03	2015-12-19 11:30:19.548+03
39	1	1	simonskariuki	f30cbd101bdae54d9d6599ba80880cc95ceb602d393feaf00772258c0e7ce29b	2016-02-06 09:52:14.736+03	simonskariuki@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-07 09:52:14.738+03	2016-01-07 09:52:14.738+03
36	1	1	JMwendwa	2b2abed13157dafd5ae00158e45486df2a888a735d869702f343f798d3c0be6e	2016-01-20 08:35:11.515+03	joneswillys@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-21 08:35:11.518+03	2015-12-21 08:35:11.518+03
37	1	1	Andy	915820b5a230f66d34b6effdc649c51ecb8cdabb6ae7102be4224695dd43c7a5	2016-01-20 11:12:02.079+03	kruhaah@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2015-12-21 11:12:02.082+03	2015-12-21 11:12:02.082+03
38	1	1	corazon	ded5b58d92c8f643c58cabea36048406a93e557ff5261bcbc3e6b2244dcb7835	2016-02-05 10:27:32.137+03	corazon.abuor01@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-06 10:27:32.139+03	2016-01-06 10:27:32.139+03
40	1	1	HKimuya	c3686beb3b3cac23e71a79538e3ffb6068c5cf28f57c97ca1f30ce1ac7d8962d	2016-02-06 11:18:26.461+03	hkimuya@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-07 11:18:26.463+03	2016-01-07 11:18:26.463+03
41	1	1	murag27@gmail.com	71f0f5911306a7511c94d0d174c3ab32f45d2c1e18f55d1490f9b78962f4cf29	2016-02-06 16:14:12.421+03	murag27@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-07 16:14:12.423+03	2016-01-07 16:14:12.423+03
42	1	1	THOMASMWALUKUKU	597d8d669c2b3bf71e61bc08f4b5d5fe419a88f8f9d3b43182d8343d39f0ad05	2016-02-07 15:34:47.858+03	tmwawasi7@gmail.com	254720041703	254722828515	\N	THOMAS	MWALUKUKU	MWAWASI	2546-80100	\N	t		SINGLE	27085330				\N	6	2016-01-08 15:39:39.347+03	2016-01-08 15:39:39.347+03
85	1	1	meshack	760d08f3b3a2b44d3762c917c6751637d8eabb0b5557da6eac283c8b883f774c	2016-03-01 09:57:03.509+03	mmagaki@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-31 09:57:03.511+03	2016-01-31 09:57:03.511+03
44	1	1	analo.annabella@gmail.com	6b581cded011aa62c25fe28ecad8f2d44713795a1494522ce36ca02540e2e016	2016-02-12 07:58:56.373+03	analo.annabella@gmail.com	\N	\N	\N	Annabella	Analo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-12 07:58:56.376+03	2016-01-12 07:58:56.376+03
45	1	1	EdwardKuhia	72c6a0815adb1ad2d2cd3967a6f0a3026bc9aa6e4d9d9941a6587a062ba0d283	2016-02-11 08:02:14.136+03	edwardzkuhiah@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-12 08:02:14.139+03	2016-01-12 08:02:14.139+03
46	1	1	wafulaps@gmail.com	fda1bf8d4edb5554581bf7e4d12c00c3cf0160c4815dfc613a075e44f54bacf4	2016-02-12 17:30:42.552+03	wafulaps@gmail.com	\N	\N	\N	peter simiyu	wafula	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-12 17:30:42.555+03	2016-01-12 17:30:42.555+03
47	1	1	mnicholas	81f2518bb61acea50d731eb2cf2c03d57716919c5e65d417d03611e5d9e38247	2016-02-12 11:52:29.993+03	mnicholas45@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-13 11:52:29.995+03	2016-01-13 11:52:29.995+03
48	1	1	peter	246fc1fad679f1b4d70789456129b270e51a2529911cfbf9bfd202322461e7c5	2016-02-12 16:43:07.755+03	petermalesi@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-13 16:43:07.756+03	2016-01-13 16:43:07.756+03
49	1	1	francistnd3@gmail.com	4e130acd424fa3de71a393fec33fa99c4d9f99111b00e78773fa3209d05b32f5	2016-02-14 11:59:36.536+03	francistnd3@gmail.com	\N	\N	\N	Francis	Otiende	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-14 11:59:36.539+03	2016-01-14 11:59:36.539+03
50	1	1	lawrencekatana07@gmail.com	eb6748a6e955a3dcef9b4a2aa34328a528d25ca123f54c077b15f5589b099580	2016-02-14 22:15:53.248+03	lawrencekatana07@gmail.com	\N	\N	\N	lawrence	katana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-14 22:15:53.251+03	2016-01-14 22:15:53.251+03
51	1	1	irenemwahu@gmail.com	2d4574b9dc2df962c8409a8835d200686775fca27f3ef33799de9aa7c1340217	2016-02-15 10:30:17.87+03	irenemwahu@gmail.com	\N	\N	\N	Irene	Mwahu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-15 10:30:17.872+03	2016-01-15 10:30:17.872+03
52	1	1	machiah	0b2011153938e458a220e0a088eb2e84a5330409b520a86e39523083bb7865d3	2016-02-15 15:32:17.996+03	rmachiah@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-16 15:32:17.998+03	2016-01-16 15:32:17.998+03
53	1	1	johnwaigwa07@gmail.com	e445dc9db88cdafc88f13c08fa347e30b1929ecdb66f7abe9209c104ce99c2e2	2016-02-16 18:27:15.292+03	johnwaigwa07@gmail.com	\N	\N	\N	john	waigwa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-16 18:27:15.294+03	2016-01-16 18:27:15.294+03
54	1	1	kipronobii27@gmail.com	12e2eedc6f8ea858fc3cf49492008a45c2c7d83afe5bd4e12cf2199d148eb2dd	2016-02-18 09:45:21.68+03	kipronobii27@gmail.com	\N	\N	\N	Bii	Robert	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-18 09:45:21.682+03	2016-01-18 09:45:21.682+03
55	1	1	dkgacau@gmail.com	818d654f09ef8d32d45bcb3fd3d885c37f3e9fd8e546249a89fb2d99e9e7975c	2016-02-18 11:41:21.719+03	dkgacau@gmail.com	\N	\N	\N	David	Gacau	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-18 11:41:21.721+03	2016-01-18 11:41:21.721+03
56	1	1	Josephmwangi	4ecd0db38e18828fde002a029e78b1cb366c70432cbf690fe0c4979ddf66b361	2016-02-17 12:28:56.045+03	jwanjerumwangi@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-18 12:28:56.047+03	2016-01-18 12:28:56.047+03
57	1	1	wellierazmuuziky@gmail.com	e7bde96c2692d9e861cdab79d507f4b80e2ed6a51814be605c830120a8cad65e	2016-02-18 21:32:54.952+03	wellierazmuuziky@gmail.com	\N	\N	\N	Prince	WellierAz	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-18 21:32:54.955+03	2016-01-18 21:32:54.955+03
74	1	1	wallace.munene	825bf5cdc7e00d42f703e57ff195d558ff0a87ba1d229be5dcc62879bae54a68	2016-02-24 18:17:48.09+03	wallace.munene2012@gmail.com	0724154710	0775541243	\N	WALLACE	KURIA	MUNENE	P.O.BOX 40428-00100 NAIROBI	1974-12-30	t	NIL	MARRIED	13427330	NIL	A2024807	1167231	\N	7	2016-01-25 18:50:24.812+03	2016-01-25 18:50:24.812+03
59	1	1	sophiehnjorogeh@gmail.com	7fe8796ba27df85f184e1cd2707f322e64d6fba5eff03d59dfd5adc4e94a9503	2016-02-19 21:06:36.63+03	sophiehnjorogeh@gmail.com	0704611160		\N	sophia	njoroge	Mukami		1993-05-01	f			29851438				\N	1	2016-01-19 21:09:14.171+03	2016-01-19 21:09:14.171+03
60	1	1	ndesh	0f8e47f41d07d83b3c8127db23e90d930f526e2aa2fc18a2247e82b507eb03cd	2016-02-18 21:10:56.507+03	ndegwa.mwangi@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-19 21:10:56.509+03	2016-01-19 21:10:56.509+03
61	1	1	kevin	f79f4919c558d3d565d997787d27c56af1bdf7399b727910c7bb7b36ef722445	2016-02-19 08:40:28.439+03	jessemowry@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-20 08:40:28.441+03	2016-01-20 08:40:28.441+03
62	1	1	kasembelig@gmail.com	3095f6a93cad41a428a31d353afe5b00bbd0895c17a69a33d80dc5d48321de4f	2016-02-20 11:53:32.734+03	kasembelig@gmail.com	\N	\N	\N	George	Kasembeli	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-20 11:53:32.735+03	2016-01-20 11:53:32.735+03
63	1	1	zedekiahndenga@gmail.com	d82ff9e627869a67c54451d97e99e01f5d80cd0311d81fb7493e9c0cca83556f	2016-02-20 12:20:20.516+03	zedekiahndenga@gmail.com	0713846689	0728555354	\N	zedekiah	ndenga		11647-00400	1996-02-07	t		single	33348185				\N	2	2016-01-20 12:29:54+03	2016-01-20 12:29:54+03
64	1	1	kasembeli	94f66619a3312e3def43bafde47f6211be2e02180d09dc69bec1764d68cce705	2016-02-19 13:24:24.205+03	kasembelig@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-20 13:24:24.207+03	2016-01-20 13:24:24.207+03
65	1	1	Wycklif	869410d0764fe76d3c2fb3e9ab6b4188162648b72ede1038ab0459d0087bb636	2016-02-19 14:48:17.628+03	wycklifjuma@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-20 14:48:17.63+03	2016-01-20 14:48:17.63+03
58	1	1	alboabu	a7de937615d204075b5a1d81c7797be01717382855d8f5b87eac7d7ab18f66d1	2016-02-18 14:52:12.821+03	albertabuga@gmail.com	0716108786		\N	ALBERT	ABUGA	OMBONGI	4203-00200 NAIROBI	1989-10-10	t		Single 	27484607				\N	6	2016-01-20 16:01:00.163+03	2016-01-20 16:01:00.163+03
66	1	1	miroroabraham@gmail.com	aee56f535bad79adcfb63adb56c9399179b6bb0def2db2685d62203ded4c23ac	2016-02-20 22:48:07.279+03	miroroabraham@gmail.com	\N	\N	\N	miroro	abraham	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-20 22:48:07.282+03	2016-01-20 22:48:07.282+03
67	1	1	Nzioka	148c54432dbf89bbed22adc222d0b677bbf0be064ca514828c5eac6e9263652e	2016-02-20 12:13:39.072+03	nziokapeter6@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-21 12:13:39.073+03	2016-01-21 12:13:39.073+03
68	1	1	leonard	20494fb3bef840e121473f558e5c74f7ff200b4c883d0057d0442b9eab1112c8	2016-02-20 16:31:37.705+03	mwiti40leonard@yahoo.com	0721683710		\N	Leonard	Mwiti	M'mithea	14325 00400	\N	t			27088636			yes	\N	13	2016-01-21 16:50:31.064+03	2016-01-21 16:50:31.064+03
69	1	1	mesavans58@gmail.com	21ea2b27a7fe308c6a87ce48eae9e8a2f947c0ae64838ea58fb4e49095003f5e	2016-02-22 10:52:59.563+03	mesavans58@gmail.com	\N	\N	20150902_124942.jpg	Felix	mesa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-22 10:52:59.565+03	2016-01-22 10:52:59.565+03
70	1	1	nganyi	c898e476cd802b4fd431dd2ecbbcf45e2610f092f2fafe7bf77ec78ababa7c08	2016-02-22 11:03:44.348+03	univer.nganyi@gmail.com	0719478752		\N	univer	omwoha	nganyi		\N	\N							\N	1	2016-01-23 11:08:21.514+03	2016-01-23 11:08:21.514+03
71	1	1	JosephTatua	f7b5af385b864e01273c835722beba6b5f20e9964e2d0a84e2ff5f767c4de6cb	2016-02-22 12:19:17.745+03	tatuajoseph@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-23 12:19:17.748+03	2016-01-23 12:19:17.748+03
72	1	1	joyceadoyo	4f68767fb911889640ee35990be3fbf0f946e4e7597f7c8fb3d35f0566029174	2016-02-24 11:37:09.701+03	joyceadoyo9@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-25 11:37:09.703+03	2016-01-25 11:37:09.703+03
73	1	1	JOELMURIITHI	ed20a60bd16f1fa722310fcded70966958942e356e260ff0fb9edcf920642e57	2016-02-24 13:26:22.078+03	suthmurii@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-25 13:26:22.08+03	2016-01-25 13:26:22.08+03
75	1	1	wakirugi	6d05601d588916c88bb3e1f9590c6299467053bba8e102a7c0eac0de9ea87ab5	2016-02-25 09:05:10.232+03	martinmuiru@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-26 09:05:10.234+03	2016-01-26 09:05:10.234+03
76	1	1	joengunyi13@gmail.com	865731e26f4a1aea1fff95740e2a26c2fd46218b426ac5352dda34277e009679	2016-02-26 15:57:01.772+03	joengunyi13@gmail.com	0725540491		\N	Joe	Ngunyi		79443 nai	1887-08-23	t		married	26362405		A1961957	SHJo90	\N	6	2016-01-26 16:09:50.159+03	2016-01-26 16:09:50.159+03
78	1	1	bonte	8d1a00f05a883126ac2e5b71fbe64ceaaa6549654d78b945760fa89d710c2be2	2016-02-26 14:06:34.746+03	ndungubonface@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-27 14:06:34.748+03	2016-01-27 14:06:34.748+03
79	1	1	inzaialex@gmail.com	525c7f333d7fed15c6c25031d76159ddabe771ada6c7c51591594e514834e6b8	2016-02-27 15:21:23.601+03	inzaialex@gmail.com	\N	\N	\N	alex	inzai	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-27 15:21:23.602+03	2016-01-27 15:21:23.602+03
80	1	1	msammy53@gmail.com	11e65a697a0b455de04364385ef1fb2f57074c7cb0ec431e8a96d960715042a3	2016-02-28 09:22:42.501+03	msammy53@gmail.com	\N	\N	\N	Sammy	Maish	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-28 09:22:42.502+03	2016-01-28 09:22:42.502+03
81	1	1	Reuben	4975a9d1a38e9ccbdbe819e8b5740c664583d25983f7bcf79f8aa10770bb9e60	2016-02-27 10:08:04.188+03	reubengee9979@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-28 10:08:04.19+03	2016-01-28 10:08:04.19+03
82	1	1	wwwsamuelnjoroge31@gmail.com	366308359bd4dd3c1b9406797bd882942630efccdfbc810156a1c360fa3df4ec	2016-02-28 13:26:06.99+03	wwwsamuelnjoroge31@gmail.com	\N	\N	\N	Samuel	Njoroge	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-28 13:26:06.992+03	2016-01-28 13:26:06.992+03
83	1	1	moses	74c5e9536447a0f30c94bc2a8ec3fdb0c4fee0b0f0bcb5d30d60d31248fb381d	2016-02-28 15:10:39.803+03	mosesonyango798@yahoo.com	0725843974	0763843975	\N	moses	wandera	onyango	2653	1986-02-25	t	n/a	single	25606615	n/a	n/a	n/a	\N	4	2016-01-29 15:17:09.27+03	2016-01-29 15:17:09.27+03
84	1	1	ndege.wdavid@gmail.com	7ea53fae775b9c101b16a5a9e770ecdf6ec9b6fbf2270751c32f8d70a2703f2b	2016-02-29 08:20:14.49+03	ndege.wdavid@gmail.com	\N	\N	\N	David	Ndege	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-30 08:20:14.492+03	2016-01-30 08:20:14.492+03
86	1	1	julius	01fa7cc62347c092848089b4b7708b2d5b9de84265b6d12244046467d267a22a	2016-03-01 13:47:23.03+03	kariukijulius5@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-31 13:47:23.032+03	2016-01-31 13:47:23.032+03
88	1	1	mburukevo78	938351ecfb94aaf99fafa1c0395c83270b8146023d50ab49a009fbd3fb1d5ee0	2016-03-02 11:49:06.617+03	mburukevo78@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-01 11:49:06.619+03	2016-02-01 11:49:06.619+03
115	1	1	sagroigg@gmail.com	6abfe14bfd83aad1a3e36dc1dfc20f56b8b033aeeadea46033d44192587d6e69	2016-03-17 08:17:24.471+03	sagroigg@gmail.com	0712839036		\N	meduwa	sagroi			\N	t		SINGLE	24449864				\N	16	2016-02-17 12:03:36.111+03	2016-02-17 12:03:36.111+03
116	1	1	mainamartin	7a5e3e140fa0cfba83fbac9465675d9c78673bf04635c7edc28f69f9f7351f64	2016-03-18 17:03:34.462+03	mainamartin35@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-17 18:03:34.464+03	2016-02-17 18:03:34.464+03
89	1	1	barare	8093e053749548dcf6a48e7d4b31e3d6defa0046eaeb646e78e1718839a9ee0c	2016-03-02 12:40:41.668+03	momanyiobarare@gmail.com	\N	\N	New_Image_1.JPG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-01 12:40:41.67+03	2016-02-01 12:40:41.67+03
90	1	1	johnness	49cd70bf9115971dac02034994323f792e280a66fc7113f2a8af664f094e0298	2016-03-02 13:47:42.844+03	jnsokoth@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-01 13:47:42.846+03	2016-02-01 13:47:42.846+03
92	1	1	charlesdnguli@gmail.com	ae82eff3025ea3fffbc06e9e373237612e665c49306e8f630099847f9add75d3	2016-03-02 08:50:27.613+03	charlesdnguli@gmail.com	\N	\N	\N	Charles	Darwin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-02 08:50:27.614+03	2016-02-02 08:50:27.614+03
117	1	1	ann25karweni@gmail.com	ab5a0243013eb53f46181eb7ae1f7c2d00aba61eb3877f7066ef713dda686564	2016-03-18 10:07:58.523+03	ann25karweni@gmail.com	\N	\N	\N	Ann	Karweni	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-18 11:07:58.526+03	2016-02-18 11:07:58.526+03
118	1	1	m.unice88@gmail.com	6c87b57aaaaa95444dc9700c02b1e2d5af17978450e26c0b7c6cc03b759e6a8d	2016-03-19 14:05:55.969+03	m.unice88@gmail.com	\N	\N	\N	mwai	eunice	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-19 15:05:55.971+03	2016-02-19 15:05:55.971+03
119	1	1	sheillah.wangala@gmail.com	a2a04e13828ab2e40e083e5911cfdc59f0ee94913c54cd2f0db938ae3892c6a5	2016-03-19 14:55:18.899+03	sheillah.wangala@gmail.com	\N	\N	\N	Sheillah	wangala	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-19 15:55:18.901+03	2016-02-19 15:55:18.901+03
91	1	1	mubeajoan@gmail.com	e5cb62d36852a1fe21058af23db67108cef8977ff8e958f09c4930fdf7ce8b43	2016-03-02 20:33:07.522+03	mubeajoan@gmail.com	0723983408	0723983408	DSC_5036.JPG	Joan	Mubea	Wambui	2337-00900 Kiambu	1986-02-15	f		single	28678758			C2188472	\N	5	2016-02-02 09:38:41.569+03	2016-02-02 09:38:41.569+03
93	1	1	Joshua	bad4c4a4c9b7db7248a0551b69ef4630109063bf14829c4b47c33b098bd34813	2016-03-03 10:08:17.227+03	njaabuj@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-02 10:08:17.228+03	2016-02-02 10:08:17.228+03
95	1	1	CharleSonko	3c3353f3325d5a5f3371e819ce6fdb7580bb87237818c8f2a15a9050e2b4f64b	2016-03-04 10:43:10.92+03	charles.sonko@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-03 10:43:10.921+03	2016-02-03 10:43:10.921+03
96	1	1	joyce	4f68767fb911889640ee35990be3fbf0f946e4e7597f7c8fb3d35f0566029174	2016-03-04 14:51:35.901+03	joypeter418@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-03 14:51:35.903+03	2016-02-03 14:51:35.903+03
97	1	1	PerisMaina	f0b093a1523ef73910617c6b6af46980e333c8d1a9ec2deb50294389e4306376	2016-03-05 21:05:24.911+03	perismaina20@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-04 21:05:24.913+03	2016-02-04 21:05:24.913+03
98	1	1	titusmutinda1@gmail.com	052e941bab28da24ad5da6d3f32edbb1a4ae95fd1d12ae26c18f311f45557de2	2016-03-05 13:20:53.026+03	titusmutinda1@gmail.com	\N	\N	\N	Titus	Mutinda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-05 13:20:53.028+03	2016-02-05 13:20:53.028+03
99	1	1	ogirajustus	9dbc9bdb231aecfad994ae6e54c6c792f07435f005fe6410b9844fdec7f65988	2016-03-07 00:27:21.252+03	ogirajustus@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-06 00:27:21.254+03	2016-02-06 00:27:21.254+03
100	1	1	liston	9ceb15ec4126389f7072f0fe1bd792fad94ec2a8b2546812707a53f9119a607f	2016-03-07 12:06:59.541+03	liston294@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-06 12:06:59.542+03	2016-02-06 12:06:59.542+03
101	1	1	benedict	5bac04cabe0790bef011a631f025ac3b66c3fc9c30e47cf8cf94ad03c85665a8	2016-03-09 09:00:27.612+03	bendict37@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-08 09:00:27.614+03	2016-02-08 09:00:27.614+03
102	1	1	chrishuks	daf2322e35c7944b31df0c37891a42f3c0d1d75df338e3337b39e9100ba38286	2016-03-09 09:55:57.351+03	chriskahuki@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-08 09:55:57.353+03	2016-02-08 09:55:57.353+03
103	1	1	maina	021ae0d51255c0d4a54228d28e18730b3652e75484e83fbee393727f68fdd9ff	2016-03-11 14:57:00.976+03	mainadorcas3@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-10 14:57:00.977+03	2016-02-10 14:57:00.977+03
104	1	1	mkikei42@gmail.com	88b40cf1b020f139d24198dad49ea82d079ebe4f613c1111a3ed9fad7bbf4507	2016-03-10 16:30:18.372+03	mkikei42@gmail.com	\N	\N	\N	Mike	Kikei	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-10 16:30:18.374+03	2016-02-10 16:30:18.374+03
105	1	1	cecillokech@gmail.com	220b0c09a3f6b8123b46db41c774ab4e1a5c80cd1537fc31339c53c36966205d	2016-03-11 19:44:16.425+03	cecillokech@gmail.com	\N	\N	\N	cecill	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-11 19:44:16.427+03	2016-02-11 19:44:16.427+03
106	1	1	Sharks	fc533b93e919dc0ec73e87f0ca4db7e342a33cbe0e3ddb51d6bc96f25a400872	2016-03-13 09:50:44.883+03	meshmlewa@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-12 10:50:44.885+03	2016-02-12 10:50:44.885+03
107	1	1	NgugiJames	8bf39393c97bb6abaf497469614ee7e20d3c5f7c4f264ffc7695aa2762d1de51	2016-03-13 10:28:41.161+03	jamesngugit@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-12 11:28:41.163+03	2016-02-12 11:28:41.163+03
108	1	1	georgemaxwell42@gmail.com	5adbe33e60b3af02e8368566d1fcdfad17314897511b539aae2336ff6970d0e3	2016-03-13 00:05:24.848+03	georgemaxwell42@gmail.com	\N	\N	\N	george	maxwell	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-13 00:05:24.85+03	2016-02-13 00:05:24.85+03
109	1	1	ivy.ivynne@gmail.com	7f44bdefce36753b258dc36285af9c779d6b7b85f385f1e332611d561a2581c9	2016-03-13 22:03:44.081+03	ivy.ivynne@gmail.com	\N	\N	\N	Ivynne	Ivy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-13 23:03:44.083+03	2016-02-13 23:03:44.083+03
110	1	1	kenedy	ca0026f357ecf6c02329415389009ed59513bc5f8f26d38dd74d85ab00201239	2016-03-16 12:05:25.286+03	kipkorirkenedy79@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-15 13:05:25.288+03	2016-02-15 13:05:25.288+03
111	1	1	maiyoalex26@gmail.com	0eda2c2e5782514ffd953fa561e8fdb1af1c3e6645233ae5fc0548f3613ebf4c	2016-03-15 18:50:24.769+03	maiyoalex26@gmail.com	\N	\N	\N	ALEX	MAIYO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-15 19:50:24.771+03	2016-02-15 19:50:24.771+03
112	1	1	kim	b371dbc4b0268fd4fb467c755690433d1c50348b944b696087a8700a4235217e	2016-03-16 19:53:57.438+03	ypkimani@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-15 20:53:57.44+03	2016-02-15 20:53:57.44+03
113	1	1	antonywanjohi92@gmail.com	ab029f62ad9826e8a0b4375374ef7084e8031298cc233f411045fe6130a8c944	2016-03-16 11:07:49.42+03	antonywanjohi92@gmail.com	\N	\N	\N	Wanjohi	Antony	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-16 12:07:49.422+03	2016-02-16 12:07:49.422+03
114	1	1	mashaaa	b12339c74b709f0a0f6c347ae70922b03fb6e094bc216bf06f2b36ad29239c94	2016-03-17 13:31:38.84+03	jojiemashaaa@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-16 14:31:38.842+03	2016-02-16 14:31:38.842+03
94	1	1	cassini	3cd77a4dc666d90aebf9164f07168bdc4db47c964fccfd1576a1b907edeba7c4	2016-03-03 10:18:18.807+03	ry_reys@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-02 10:18:18.808+03	2016-02-02 10:18:18.808+03
123	1	1	victormurimi.vm@gmail.com	a6c1f4fa3f12f7acc4d4402d7c146f3f05ad5409712b79b9c6df43a209d2c734	2016-03-24 10:56:15.387+03	victormurimi.vm@gmail.com	\N	\N	\N	Victor	Murimi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-24 11:56:15.389+03	2016-02-24 11:56:15.389+03
124	1	1	cashiers.adams@nwch.co.ke	379f14282b41d227c53630c09b805fb22c50b3262280f183ac10424e49ed30b7	2016-03-25 02:58:25.441+03	cashiers.adams@nwch.co.ke	\N	\N	\N	NWCH CASHIERS	ADAMS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-25 03:58:25.443+03	2016-02-25 03:58:25.443+03
120	1	1	pmagaiwa2030@gmail.com	e9035378422d8b44b2468765097a72f6114bcc31a9a5103b83e97eed741f89a7	2016-03-23 08:31:11.635+03	pmagaiwa2030@gmail.com	254723495344	254735055470	11218949_1103506539681809_4399579009971368935_n.jpg	paul	Magaiwa	wANKURU	105 ISIBANIA	1989-11-05	\N		Single	27284867	A007673246Z			\N	4	2016-02-23 10:11:25.458+03	2016-02-23 10:11:25.458+03
121	1	1	justus	257b298faeb1d0f7e67422d37d0fc22e885ced61984ddd8b349acf3d3b9e8cc4	2016-03-24 14:14:24.453+03	jgisemba@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-23 15:14:24.455+03	2016-02-23 15:14:24.455+03
122	1	1	samukaru	0d0a778fc6350d883a005a94328755cc9df1796ecc4f37eb7c4cabc018dadc74	2016-03-24 14:29:42.427+03	samkaru08@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-02-23 15:29:42.429+03	2016-02-23 15:29:42.429+03
126	1	1	njoguedwin21@gmail.com	8e0b41ea752b3e69b7cf6e7f34bb445ed5e7ffdc6c108cec932a03b7f40815d4	2016-04-01 08:02:19.567+03	njoguedwin21@gmail.com	0705871680 		\N	edwin	Nyagah	Njogu		1994-04-01	t		Single	23425694				\N	1	2016-03-01 09:12:06.676+03	2016-03-01 09:12:06.676+03
127	1	1	DWanjiku	0602620b14d9570144c994b27a3e2b0d9dcfdb71ed009271e5e398791f53a235	2016-03-31 14:21:54.128+03	dorismwihandi@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-01 15:21:54.13+03	2016-03-01 15:21:54.13+03
128	1	1	Ekason	34d2d07c18d6aea182e27d9ae683ce652d88bb771a8f96f44128ce4d78ba4616	2016-03-31 15:32:51.682+03	kirema.ekandi@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-01 16:32:51.684+03	2016-03-01 16:32:51.684+03
129	1	1	daniel	65a12bd3309bd5a881d1597c0cef3f33fbf50ba69834a682d65d76c076b6edd4	2016-04-02 12:59:51.962+03	kingori1daniel@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-03 13:59:51.964+03	2016-03-03 13:59:51.964+03
130	1	1	kibuejohn	07f493a7ba42777650f63c0405a69494686e4a8974556ca31ed817f190631f44	2016-04-02 13:57:36.377+03	upstate_realestate@yahoo.com	\N	\N	IMG_20151222_074939.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-03 14:57:36.38+03	2016-03-03 14:57:36.38+03
131	1	1	gabrielmbariah@gmail.com	e5c718787fa37d3db661d1ed0a8e3f3b6a59d42099510f96ce6f9a2cabe890f3	2016-04-05 17:31:57.755+03	gabrielmbariah@gmail.com	\N	\N	\N	Gabriel	Mbariah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-05 18:31:57.758+03	2016-03-05 18:31:57.758+03
133	1	1	oresha	0b6c074311791b73bf951c5862e59497c46ba7a5546e07455995a2f6d72ee16b	2016-04-08 10:42:34.778+03	catherineoresha@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-09 11:42:34.781+03	2016-03-09 11:42:34.781+03
125	1	1	Antony	9600c54b06688f426b2bf85b2962d4fce46868832e528de74d69a432d2dece0c	2016-03-30 12:51:49.509+03	antomiz3x@gmail.com	0787315807	0791594615	\N	Antony	Mugaru	Wainaina		\N	t		Single	29467000				\N	3	2016-03-09 16:32:41.792+03	2016-03-09 16:32:41.792+03
134	1	1	Nicckolamulwa	92162bee8ac0cf693299f74fe0ecf89f268f387cb28932bca564e359bba976e3	2016-04-08 16:33:10.555+03	mbithimulwa@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-09 17:33:10.558+03	2016-03-09 17:33:10.558+03
135	1	1	kenkish	6e7febc85dba06abed40e50d30ff1d65bcaec66051eb0b442c9302897c35f146	2016-04-09 12:20:13.307+03	kish.ken93@gmail.com	254705911306		\N	ken	murithi	kinyua		\N	\N							\N	1	2016-03-10 13:26:03.406+03	2016-03-10 13:26:03.406+03
136	1	1	shawnpahot@gmail.com	3b066f9ac306c96bbdaee14cfc9d232e61659378cbd3f2f2120cdc7c4e33c859	2016-04-10 22:03:04.015+03	shawnpahot@gmail.com	\N	\N	\N	Shawnpaho	Tabie	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-10 23:03:04.017+03	2016-03-10 23:03:04.017+03
137	1	1	Miriga	43fc2cbc707f40a617ba178a7faac9cc789fc0f7947caf2e4454b9ecef608050	2016-04-10 08:48:15.631+03	dennismiriga@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-11 09:48:15.633+03	2016-03-11 09:48:15.633+03
138	1	1	Prosper	ad6a7fc0506f62a09201c64eeb04b31cc204f7fd8a8fa9b300032222e58264dd	2016-04-10 11:42:34.838+03	prokwizera@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-11 12:42:34.84+03	2016-03-11 12:42:34.84+03
140	1	1	phesborn@gmail.com	f3b16daaa73d5498cbf3bd61075744a840b359ae68d2cc01bf0452307ae4e53a	2016-04-13 22:05:58.781+03	phesborn@gmail.com	\N	\N	\N	patrick	hesborn	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-13 22:05:58.795+03	2016-03-13 22:05:58.795+03
141	1	1	LeonaObura	ac6d54d268c0c188e1eb83222fcfb8b166988007917444993205710df2e2a147	2016-04-13 10:06:03.886+03	asikoobura@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-14 10:06:03.89+03	2016-03-14 10:06:03.89+03
142	1	1	maryjacinta30@gmail.com	6c041bc0c3438beb6bb8589806f90bd8e87c75ccbc641f58efc97b08aa29ecdd	2016-04-15 09:56:12.577+03	maryjacinta30@gmail.com	\N	\N	\N	Mary	Jacinta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-15 09:56:12.579+03	2016-03-15 09:56:12.579+03
155	1	1	brendawangui21@gmail.com	13a7e0ec1493f76ae620f8d77a25f0630d2da07ff24fe89fa48f7305a75853dd	2016-04-30 12:28:46.483+03	brendawangui21@gmail.com	\N	\N	\N	Brenda	Wangui	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-30 12:28:46.485+03	2016-03-30 12:28:46.485+03
143	1	1	justusnaa26@gmail.com	eb19c475393952c1c49ceebed8479d761d0ceb7b058c471583e73b4e234c6f23	2016-04-15 11:03:14.411+03	justusnaa26@gmail.com	\N	\N	PASPORT_1.JPG	Justus	Naa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-15 11:03:14.413+03	2016-03-15 11:03:14.413+03
157	1	1	kirwanelson@gmail.com	18d8f56b8ed4428ef5fb6146a0724f000ec2d0d2c7479fe575f2fdf166726fa0	2016-05-05 21:45:37.648+03	kirwanelson@gmail.com	\N	\N	\N	Nelson	Kirwa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-05 21:45:37.65+03	2016-04-05 21:45:37.65+03
139	1	1	gathuitasteve@gmail.com	2ad21f04e5aa3cf80279272a156b7c830ed9330f660cf19955869bed0e9b9ab5	2016-04-12 07:25:32.617+03	gathuitasteve@gmail.com	0723471260		\N	Stephen	Mwangi			\N	t		Married	27455092	A007375571D			\N	1	2016-03-16 13:37:07.874+03	2016-03-16 13:37:07.874+03
145	1	1	sammokeyo@gmail.com	4099981d2d2daabbc2973f2ae5a8b7ff5e1bde8cbeafe75971d4f8de596c5766	2016-04-17 11:07:21.115+03	sammokeyo@gmail.com	\N	\N	\N	Samm	Okeyo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-17 11:07:21.118+03	2016-03-17 11:07:21.118+03
146	1	1	ibrahrotich2012@gmail.com	444dd6bf11615425b82d3d0adc29e816a914970d06ab187e9a4393499c194500	2016-04-21 13:49:06.112+03	ibrahrotich2012@gmail.com	\N	\N	\N	IBRAH	ROTICH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-21 13:49:06.114+03	2016-03-21 13:49:06.114+03
147	1	1	morganmoga92@gmail.com	5334a93723f1286b7baece96cba6eb5aba371ff5bdcd3dcf7dd8fa201a63c735	2016-04-21 15:31:24.308+03	morganmoga92@gmail.com	\N	\N	\N	morgan	moga	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-21 15:31:24.31+03	2016-03-21 15:31:24.31+03
148	1	1	zac	e4716a94d48d6185187076a89718b08f9fbb911908465e37124ae9545faa4621	2016-04-21 16:49:43.443+03	zacgachuru@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-22 16:49:43.446+03	2016-03-22 16:49:43.446+03
149	1	1	kengitiye@gmail.com	ea4b70ea22f0bcdd9ac852f7eeca043cdc82005c48d03dea78b1e12bd3b915f6	2016-04-22 17:39:21.966+03	kengitiye@gmail.com	\N	\N	\N	Kenneth	Gitiye	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-22 17:39:21.968+03	2016-03-22 17:39:21.968+03
150	1	1	michaelndungu2@gmail.com	d39630f5d7b5d987c401eb1f26b67a69c0be199bd0edb6916d9ec29343adae74	2016-04-23 12:37:58.546+03	michaelndungu2@gmail.com	\N	\N	\N	Michael	Ndungu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-23 12:37:58.549+03	2016-03-23 12:37:58.549+03
151	1	1	godfreyngige1@gmail.com	390c556d6bc8be7789aa94c442902191593dd2dcdeb94fadf8f43fe4e0e9f2d8	2016-04-23 12:57:51.255+03	godfreyngige1@gmail.com	\N	\N	\N	Godfrey	Ngige	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-23 12:57:51.258+03	2016-03-23 12:57:51.258+03
152	1	1	stevemarauni@gmail.com	6edc83596f07153e29c41e6b7925b2255b783e023838c186deca4779b918fd15	2016-04-23 22:31:07.868+03	stevemarauni@gmail.com	0708954968		\N	Stephen	namasambu	maraun	71-50402 kimilili	1994-02-20	t		single	30361172				\N	1	2016-03-23 22:44:55.054+03	2016-03-23 22:44:55.054+03
153	1	1	tiddywinx@gmail.com	425f5d74e8c864610fb306c41c7d59de61c263b555f99ec889d1d297303fa34b	2016-04-24 00:34:47.594+03	tiddywinx@gmail.com	0705434232	0735381500	\N	Simon	Maina	Kanyi		1994-01-01	t		Single					\N	1	2016-03-24 00:41:50.138+03	2016-03-24 00:41:50.138+03
158	1	1	eddylagat45@gmail.com	bc0ed7e25c1106776e141f2d2064e2f94983a0e739bfb3d54a5d57368a971bd7	2016-05-11 17:03:29.18+03	eddylagat45@gmail.com	0721377306	0710685222	\N	Edwin	Kiplagat	Agui	2004-3100	1991-07-01	t		single	28677395				\N	1	2016-04-11 17:14:19.294+03	2016-04-11 17:14:19.294+03
160	1	1	Elijah	c3efb46164c9aa2f66d497208c1d8db465253e5af8593d043fc8f6a55d978b03	2016-05-18 10:50:47.933+03	elijahkimani.ek@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-18 10:50:47.935+03	2016-04-18 10:50:47.935+03
161	1	1	egatobu60@gmail.com	d307a2a229cc482f1ff6ae66f7a47361dd885e015b5e11a27ce7440819927740	2016-05-19 08:05:06.157+03	egatobu60@gmail.com	\N	\N	\N	Elias	Gatobu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-19 08:05:06.159+03	2016-04-19 08:05:06.159+03
162	1	1	stevenrugi@gmail.com	765075f45e3219ab7dde207e0ca459874eadb04900ef622a19476e35a723511e	2016-05-21 21:58:48.737+03	stevenrugi@gmail.com	\N	\N	\N	rugi	mbumbui	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-21 21:58:48.74+03	2016-04-21 21:58:48.74+03
163	1	1	jessemgitau@gmail.com	a726a4823ba2e9a5a87572e6d071eba9e3930f90603750a5a9a90e3fe10a335f	2016-05-23 08:10:17.425+03	jessemgitau@gmail.com	\N	\N	\N	jesse	gitau	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-23 08:10:17.428+03	2016-04-23 08:10:17.428+03
164	1	1	Alfred	c57b745d3eb01b5eaf97a9ea48bb092c8519409f78797ed51aa3fd4f56ac5194	2016-05-25 10:28:34.582+03	wainainafreddie@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-25 10:28:34.584+03	2016-04-25 10:28:34.584+03
43	1	1	gksamuel1@gmail.com	e066efd78fc65b9ab70186fa0a12f7c0eee727c7f481f79b2ee726ff4316d47d	2017-07-29 10:39:47.026+03	gksamuel1@gmail.com	\N	\N	\N	Samuel	Gachanja	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-01-10 14:24:53.322+03	2016-01-10 14:24:53.322+03
167	1	1	benard.mwangi@gmail.com	4bd1c6f24b88289dd9e48f9579a09e273075c13d6d79663d8ea8872ed3c3feb9	2016-06-24 01:56:28.156+03	benard.mwangi@gmail.com	\N	\N	\N	Benard	Mwangi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-05-24 01:56:28.158+03	2016-05-24 01:56:28.158+03
165	1	1	Leymar	968744aa71dd170a4cb6a1bf7b2e20f470a664fd8524a068eca350cf174a185d	2016-05-09 20:11:42.497+03	leymarstan15@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-05-08 20:11:42.5+03	2016-05-08 20:11:42.5+03
166	1	1	omagachi	45cadf101dc85981d9e6915a9e03cf27d7aa7663b510d18546195dc26564bb6d	2016-06-08 10:36:56.978+03	omagachi_pope@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-05-09 10:36:56.985+03	2016-05-09 10:36:56.985+03
156	1	1	Janemargaret	4d322cbae227be4b8b3270fa641851b3a680b806f70848ea6dcb59859855bc32	2016-10-06 15:12:06.652+03	janemargaret2012@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-03-30 12:31:45.291+03	2016-03-30 12:31:45.291+03
159	1	1	mitch2000020@gmail.com	4921eead1e496a7470f48fbcb44ab5399721061333d67b55f1b86a9d046b408e	2016-06-04 16:35:59.198+03	mitch2000020@gmail.com	\N	\N	\N	Marisan	Mitchkaline	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-04-15 22:04:16.062+03	2016-04-15 22:04:16.062+03
169	1	1	David	e1124f144551ad194d30d2def56ad1587711fa39e6c0c72a1373b326fc941944	2016-07-01 12:43:47.846+03	dkariukimuniu@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-01 12:43:47.848+03	2016-06-01 12:43:47.848+03
170	1	1	sandypatty21	903062cbb54b80eafee21ef370bbb79e25d6b5073d9011a2c50b8334d20dab93	2016-06-04 07:56:28.647+03	oduorsandra@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 07:56:28.65+03	2016-06-03 07:56:28.65+03
171	1	1	rayscope59@gmail.com	189c93b28a29a036dee4af142a146fc730a078cdcb85c55ae9e02a5cf1d20ba2	2016-07-03 08:03:39.052+03	rayscope59@gmail.com	\N	\N	\N	Ray	Scope	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 08:03:39.054+03	2016-06-03 08:03:39.054+03
172	1	1	abujeandrew	54b0ade60780c028bc2c8f41e06ff31132be3cd01d35eb0a4679f6976b2670fa	2016-07-03 08:43:04.014+03	abujeandrew@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 08:43:04.017+03	2016-06-03 08:43:04.017+03
173	1	1	domminicy@yahoo.com	1ffec87cd6c1142384deb08428e031342947f54fc3e0ab69ba3cf69228756560	2016-07-03 10:26:34.522+03	domminicy@yahoo.com	\N	\N	\N	domminic	yetto	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 10:26:34.525+03	2016-06-03 10:26:34.525+03
174	1	1	Kinstanley	e80f1944e47a0eda808c6fcaaeffbaab17894b20003a229c60e4c503353efce7	2016-07-03 11:32:27.562+03	kinstanley@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 11:32:27.565+03	2016-06-03 11:32:27.565+03
175	1	1	Ebony	86cc26d71c084b7ff86f978eac8e5b4cc4c5cb16b50b19ab9c8e77aeea85fa45	2016-07-03 14:52:57.915+03	breizh_2000@yahoo.de	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 14:52:57.917+03	2016-06-03 14:52:57.917+03
176	1	1	georgearan	c8b7b78e147133ffcdf54db5716d4befbae3b1da391ba60bb09800157ab5eab2	2016-06-04 17:43:45.138+03	georgearan@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-03 17:43:45.141+03	2016-06-03 17:43:45.141+03
177	1	1	shanice24ke@gmail.com	f1174af6d135fc63203a2dd531db8713c5139ff2c270829d998f2db21c366dc2	2016-07-04 08:31:35.408+03	shanice24ke@gmail.com	\N	\N	\N	Lorna	Nyakundi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-04 08:31:35.41+03	2016-06-04 08:31:35.41+03
178	1	1	wanjikukabiru6@gmail.com	c152792e2c6f03c9490a6bf868eb65daad6bc40d7a9d8256f620be5a311c0b45	2016-07-05 10:15:15.96+03	wanjikukabiru6@gmail.com	\N	\N	\N	wanjiku	kabiru	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 10:15:15.963+03	2016-06-05 10:15:15.963+03
179	1	1	wanjirawawanjiku@gmail.com	4f0e9ac70350e895d130d134e660c7d47f4929a7117cc8b339663b23b73f50b9	2016-07-05 12:25:25.409+03	wanjirawawanjiku@gmail.com	\N	\N	\N	Mary	Wanjira	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 12:25:25.412+03	2016-06-05 12:25:25.412+03
180	1	1	nyagahlucy972@gmail.com	f549657148f1f9080301e5ca045f7a4389889e0be6e72a78051191a7b2203ce4	2016-07-05 18:31:33.918+03	nyagahlucy972@gmail.com	\N	\N	\N	Lucy	Nyagah	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 18:31:33.921+03	2016-06-05 18:31:33.921+03
181	1	1	charlesnganga	e0dd00ede0c3de906021a6739f955308a86312906e3677caecebd8fd840dbee3	2016-06-06 18:54:18.434+03	charles.n.nganga	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 18:54:18.437+03	2016-06-05 18:54:18.437+03
182	1	1	charles.n.nganga@gmail.com	bf0947fa09c161f154aafc05a5381728d6b1469f0c97f0abc9ac975b74abbf0c	2016-07-05 19:00:35.133+03	charles.n.nganga@gmail.com	\N	\N	\N	Charles	Nganga	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 19:00:35.135+03	2016-06-05 19:00:35.135+03
183	1	1	chembenin@yahoo.com	6fd9cb18c64256eca68ee6b5748e2cfecd8e5b71279b182f23220af025eee2cd	2016-06-06 21:56:55.76+03	chembenin@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 21:56:55.763+03	2016-06-05 21:56:55.763+03
184	1	1	Qui	bb39c445af1a9e6f7aa2b72f6e640991a9c1b5554c1a003870945fffa17bef06	2016-07-05 23:04:16.871+03	quiviq@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-05 23:04:16.873+03	2016-06-05 23:04:16.873+03
185	1	1	Aileen	43e42d9051cb9a615adebc3a8ef6bce93777850eab24fa4f0066baf48aef27f2	2016-06-07 08:59:46.575+03	aileenndiritu@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-06 08:59:46.578+03	2016-06-06 08:59:46.578+03
186	1	1	lymaks84@gmail.com	36dd9eb01b6381abb2696586a633071ad6179e68f5655e8abb99c2d198c750c9	2016-07-07 18:50:05.549+03	lymaks84@gmail.com	\N	\N	\N	Lydia	Cherotich	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-07 18:50:05.552+03	2016-06-07 18:50:05.552+03
187	1	1	Kenti5	36b06732a8099e080aabb90e720233eee64d42acefff8ce5fd3ee21d5981f4b0	2016-06-09 01:19:19.498+03	Kfmwaura9@gmail.com	0724561346		\N	Kenneth	Mwaura	Francis	Complex View Estate, Kasarani 	1992-08-01	t		Single					\N	1	2016-06-08 01:26:16.676+03	2016-06-08 01:26:16.676+03
194	1	1	Nancie	764fdcb7d297077dab522b0f3a9f256535e0e060933d48f1171309b8250a2aa6	2016-06-11 23:02:04.387+03	nancyjoe2010@gmail.com	0721804229	0786394330	\N	Nancy	Ndungu	Waithera	42601-00100	1986-06-01	f		Single	24682322	A003538232V			\N	8	2016-06-10 23:06:39.624+03	2016-06-10 23:06:39.624+03
188	1	1	Evelyne Wanjiru	0618e68b12e1ce34a17f7da66ab82b85ab03e21c85f53132e48939dd672a841c	2016-06-09 08:14:40.929+03	evelynewanjiru66@gmail.com	0710654446		\N	Evelyne	Muchiri	Wanjiru	34 Murang'a	1997-05-01	f		single	33958438	2892			\N	2	2016-06-08 08:16:45.13+03	2016-06-08 08:16:45.13+03
189	1	1	esthermwende7@gmail.com	f8983026419f99e90b87880319cf9ad9009655a9dd6f6e1dc6b948d4541e7afb	2016-07-08 08:41:32.708+03	esthermwende7@gmail.com	\N	\N	\N	esther	mwende	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-08 08:41:32.711+03	2016-06-08 08:41:32.711+03
190	1	1	Nick	49bf7ee2bcd6c2deedc0c2597f0a5d883ca94a89fbbfac81b0adc92465958e4b	2016-06-09 13:07:12.325+03	nickmwas92@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-08 13:07:12.328+03	2016-06-08 13:07:12.328+03
191	1	1	wambui	283be211087cec9e0acf049b2ac0bea69551f981e5672e59c8ec1bf19e906d67	2016-06-09 21:19:03.107+03	wambuikuria80@gmail.com	0718039301	0725980280	\N	Joan	Kuria	wambui		1994-01-01	f		single	31559061				\N	3	2016-06-08 21:27:13.591+03	2016-06-08 21:27:13.591+03
2	1	1	seeker	d7afa135a6c4f59914bf29c0a8d8d8384218aa832f46443d49d600f06945992e	2016-06-19 08:35:41.746+03	customerservice@myjob.co.ke	0720920293		Dts_news_bill_gates_wikipedia.JPG	Samuel	Gachanja			1966-01-01	f							\N	1	2016-05-08 06:49:37.915+03	2016-05-08 06:49:37.915+03
192	1	1	Jeff wahome	0e6af4fdf63ac0bd505d518ed64416979464a8583e6b56da23ece5800c00ee3f	2016-06-10 10:28:34.753+03	jeffwahomesnr@gmail.com	0716973297		\N	Geoffrey	Wahome	Mwangi	114 Giakanja	1991-12-01	t		Single	30125568				\N	4	2016-06-09 10:54:21.566+03	2016-06-09 10:54:21.566+03
193	1	1	Johnmugo	47402b8e51fa05134f37279443f4d6138941c0530354e47d00c6c8a1886c7a25	2016-06-11 10:04:00.747+03	johnmugo016@gmail.com	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2016-06-10 10:04:00.75+03	2016-06-10 10:04:00.75+03
\.


--
-- Name: seekers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('seekers_id_seq', 194, true);


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: work
--

COPY status (id, description) FROM stdin;
1	-
2	County Government
\.


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('status_id_seq', 2, true);


--
-- Data for Name: tellafriend; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tellafriend (id, seekerid, jobid, friend, datecreated, name) FROM stdin;
1	2	2	gksamuel1@gmail.com	2014-06-10 14:24:36.594+03	gachanja
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
3	\N	Make sure there are no gaps in your C.Vs	3	\N
2	gachanja	tip 2	2	2012-11-05 11:32:17.412489+03
4	\N	Do not add too much color to your c.v	3	\N
5	\N	do not apply for many jobs in the same company at once	0	\N
6	\N	Research on the internet for salary of the position you are applying	0	\N
1	gachanja	tip 1	3	2012-11-05 11:32:17.412489+03
\.


--
-- Name: tip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tip_id_seq', 6, true);


--
-- Data for Name: tiprate; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tiprate (id, tipid, rate, userid, seekerid) FROM stdin;
1	2	5	1	\N
2	1	5	\N	2
3	3	5	\N	2
4	2	1	\N	11
5	4	2	\N	30
6	1	4	\N	30
7	3	2	\N	67
8	2	2	\N	95
9	4	5	\N	133
10	1	2	\N	175
\.


--
-- Name: tiprate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tiprate_id_seq', 10, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: work
--

COPY users (id, companyid, accountid, groupid, username, name, email, description, admin, active, password, datemodified) FROM stdin;
2	2	2	2	suzzynjogu	\N	velvetconcepts@gmail.com	\N	t	t	388b5e4c8c954caa9a9070ac2663816d0bce162ca3aaba6be613faa127c9cc25	2014-06-04 04:36:41.02
3	1	3	2	suenjogu	sue	suenjogu@email.com	boss sue company	f	t	5efdfe	2014-06-10 04:42:30.696
4	3	4	2	des	\N	desshila@yahoo.com	\N	t	t	49c2ce276b9ebab29cf5433edbbbaaaeb2dfc60cab65fa0086453f1e982ee0a9	2014-07-14 11:29:59.938
5	4	5	2	isiolocounty	\N	customerservice@myjob.co.ke	\N	t	t	fe61051d0a314c1fc760ae14739de4b014d1d4aa541f5c0f50ec8a367d9599db	2015-01-11 10:02:19.582
1	1	1	2	employer	samuel gachanja	gksamuel1@gmail.com		t	t	8efdf55724c97710333b1e6e7ad03e1b61c9c4206a35ca33898058c6e15c9c42	2014-06-10 04:41:41.532
6	52	6	2	jaelsagina	\N	jaelsagina@gmail.com	\N	t	t	c95b657cb96fae2bee95587bdc9b7fdb43a43bcc8a3692544fc72f8d43b42757	2016-03-14 10:03:55.448
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: work
--

COPY work (id, seekerid, startdate, enddate, company, website, address, companyphone, location, "position", jobdescription, refereename, refereeemail, refereemobile, datemodified) FROM stdin;
3	11	2009-02-02	2014-12-31	Kenya Women Finance Trust					ICT OFFICER					2015-01-23 06:08:48.688
4	11	2008-01-28	2009-12-31	Airland Mails Logistics					ICT OFFICER					2015-01-23 06:10:28.493
5	11	2005-09-01	2007-12-03	Westview Travels					IT Support Assistant					2015-01-23 06:13:45.28
6	11	2001-11-01	2004-01-31	Uchumi Supermarkets LTD					Customer Care Officer					2015-01-23 06:15:41.088
7	8	2014-07-21	2015-02-28	Adecco, Uk	http://www.adecco.co.uk/	Siskin Parkway West	+442476514081	Coventry, UK	General Operative	•\tStarting up, shutting down operation equipment, troubleshooting shooting & software update	HR 	N/A	N/A	2015-01-23 16:01:15.364
1	2	1965-06-01	1967-06-01	cellulant	cellulant.com	2345234	2452341	nairobi	team lead	software engieers	refereename	refereeemail	04394584	2015-02-15 08:54:54.646
9	51	2014-01-01	2014-04-01	equity bank	www.equitybank.co.ke		0763068009	thika	university intern cash department 	teller	george wachira	george.wachira@equitybank.co.ke	0763068009	2016-01-15 02:38:40.721
8	51	2013-04-01	2013-08-01	equity bank	www.equitybank.co.ke		0763068071	githurai	university intern cash department 	teller	thomas thuo	thomas.thuo@equitybank.co.ke	0763068071	2016-01-15 02:39:22.177
10	51	2014-09-01	2015-01-01	equity bank	www.equitybank.co.ke		0763068066	gatundu	university intern cash department 	teller	henry maguta	henry.maguta@equitybank.co.ke	0763068066	2016-01-15 02:42:00.173
11	52	2015-09-01	2016-01-16	ANGAZA AFRIKA SACCO	info@aasacco.com	1527	072341554	thika	graduate trainee / accounts assistant		REBECCA WANJIRU MBUGUA		0704896654	2016-01-16 07:37:15.459
12	52	2014-01-13	2014-04-12	KENYA CANNERS SACCO		www.kenyacannerssacco.com	067/21162	thika	credit intern		DOUGLAS GITAU KINYANJUI		0720519240	2016-01-16 07:42:24.314
13	68	2014-01-06	2016-01-21	Mastermind Tobacco Kenya Ltd	www.mastermindkenya.co.ke	68144 00400	020279800	Mombasa road Mlolongo	Accountant	Handling payables, management accounts and treasury accounts	Mr. Duncan Marete	dkiambia@gmail.com	0725 529 959	2016-01-21 08:37:31.628
14	54	2012-08-01	2016-01-26	Tea Research Institute		20205 - 820 Kericho		kericho	Laboratory Technologist		Kiplangat Ben. Rop	kiplangatrop	0712166637	2016-01-26 03:33:39.018
15	89	2013-01-01	2016-02-01	Mesora Group				Buru buru	Accountant					2016-02-01 04:43:38.429
16	89	2011-01-03	2012-12-28	ashnil hotels					Branch Accountant					2016-02-01 04:46:51.602
17	89	2009-06-01	2012-01-02	Nakumatt					Payable and receivebles  accountant					2016-02-01 04:48:39.423
18	100	2014-05-14	2014-12-31	digital computers		744 - 20210		litein town	network administrator	managing  network	rose chelangat		0724039042	2016-02-06 04:11:16.318
19	120	2012-06-04	2016-03-07	villa surgicals and equipments limited	www.villasurgicals.com	13163	0728-516599	Nairobi	Accountant	1.Preparation of sales invoices,Posting of all purchases,sales in the system,Preparation of KRA returns and submission through itax,Preparation of tender documents and submission.	GORDON AYIEKO	gordonrmj@yahoo.com	254720358011	2016-02-23 01:42:37.894
20	121	2013-12-02	2015-05-13	Newport Africa	www.newportafrica.com			Nairobi	IT Assistant					2016-02-23 07:23:36.406
21	121	2015-05-14	2016-02-23	Tx2	www.tx2.co.ke				IT consultant					2016-02-23 07:24:38.985
22	130	2013-11-07	2014-12-07	naivas ltd		nssshq.co.ke		road c industrial area	shop attendant/sales pwerson	customer service in general	mr. samuel barasa			2016-03-03 07:09:01.998
23	43	1966-01-01	1970-01-01	Oracle					Project Manager					2016-03-12 19:20:28.966
24	180	2003-09-01	2004-02-01	Emz designs					saleswoman					2016-06-05 11:44:05.066
25	191	2012-03-01	2016-02-01	national oil real energy			0721279030	ngong rd	sales/customer service	attending to customers 	Florence wangari		0712946003	2016-06-08 14:45:23.6
26	192	2016-01-01	2016-04-01	Miller & co Advocates		45707-00100		Nairobi	Legal trainee	reparations case assistant	Nancy Mwangi			2016-06-09 03:32:58.504
\.


--
-- Name: work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('work_id_seq', 26, true);


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

