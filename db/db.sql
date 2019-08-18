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
    formid int,
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
    code character varying(9) NOT NULL,
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
\.


--
-- Name: abuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('abuse_id_seq', 1, false);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: work
--

COPY accounts (id, mainaccount, companyid, name, description, datecreated) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('accounts_id_seq', 1, false);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: work
--

COPY applications (id, jobid, seekerid, datemodified, letter, comment, viewed, userid, commentdate, attachment) FROM stdin;
\.


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('applications_id_seq', 1, false);


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
\.


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('company_id_seq', 1, false);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: work
--

COPY contact (id, seekerid, companyid, userid, comment, commentdate, response, responsedate) FROM stdin;
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: work
--

COPY content (id, title, content) FROM stdin;
4	Splash Page	<div id="slidehtml1" class="cc-html"> <h3>Full Profile</h3> <p> <strong>Rapid Job Applications</strong><br/> <strong>Submit Attachments</strong><br/> <strong>Application Tracking</strong><br/> <strong>User Rating</strong><br/> </p> </div> <div id="slidehtml2" class="cc-html"> <h3>User Management</h3> <p> <strong>No Adverts</strong><br/> <strong>Applicant Rating</strong><br/> <strong>Audit Trails</strong><br/> <strong>Much more....</strong><br/> </p> </div>
3	Welcome Page	 <strong>REMEMBER: "if you are not paying for a service, you are not the customer; you are the product being sold!!!!!!"</strong><br/>Usually the people who are paying are the customers. We want you to be the customer.<br/>Here we make every effort to bridge the gap between job seekers and employers.<br/>We offer advanced tools for both the job seeker and the employer.<br/>For the employer to fill in vacancies with the right personnel, and for job seekers to quickly get the job that suits them.<br/>
5	Mpesa Instructions	To extend your membership use <strong>LIPA NA MPESA</strong> to send payments to <strong><font color="red">Till number 116125</font></strong> (Silver Ray I.T Solutions)<br/>\n<br>\n<strong>INSTRUCTIONS</strong>\n<ol>\n<li>Go to M-PESA on your phone.</li>\n<li>Select <strong><font color="blue">Lipa na M-PESA</font></strong>.</li>\n<li>Select <strong><font color="blue">Buy Goods and Services</font></strong>.</li>\n<li>Enter <strong><font color="red">Till number 116125</font></strong>.</li>\n<li>Enter Amount then your M-PESA PIN.</li>\n<li>Confirm that you have entered <strong><font color="red">Till number 116125</font></strong>.</li>\n<li>Wait for response from M-PESA.</li>\n<li>Enter the <strong><font color="blue">mobile number</font></strong> that you used to send below.</li>\n\n</ol>
2	Company Registration Email	<table style="font-family:Verdana,Arial,sans-serif;font-size: 12px; margin:0px;width: 100%;min-height: 100%;background-color: #008bcf;">\n    <tr>\n        <td>\n            <table style="border:2px solid #006b9d;background-color: #ffffff; width:80%;margin-left:10%;margin-right:10%;">\n                <tr><td style="padding:5px;font-weight: bold;font-size: 14px;color:#ffffff;background-color: #003f7f;">Welcome</td></tr>\n                <tr><td style="padding:5px;">\n                        Hi UUUUU,<br>Please <a href="http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU" style="font-weight: bold;">CLICK HERE</a> to complete your registration. Alternatively you can copy the link below and paste it on your browser<br><br>http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU<br><br>\n                        As a registered member of MyJob.co.ke you will enjoy the following features\n                    </td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Virus Scanning</td></tr>\n                <tr><td style="padding:5px;">Avoid virus infected files from potential employees</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">File Attachments</td></tr>\n                <tr><td style="padding:5px;">Attach files to vacancies and receive attachments</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Instant results</td></tr>\n                <tr><td style="padding:5px;">For each vacancy you add our system will search our database of potential employees and give you instant results</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Multiple Users</td></tr>\n                <tr><td style="padding:5px;">This single registration will cater for all the users within your organisation</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Applicant Rating</td></tr>\n                <tr><td style="padding:5px;">Our system grades applicants for a vacancy giving you recommendations for the most qualified for the job</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Full Profile</td></tr>\n                <tr><td style="padding:5px;">Our system allows potential applicants to add all the necessary details they feel will assist them to secure the job, including photo and attachments</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Shortlisting</td></tr>\n                <tr><td style="padding:5px;">Our provides for shortlist management</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Feedback</td></tr>\n                <tr><td style="padding:5px;">Our system allows you to give feedback to the potential candidates</td></tr>\n                <tr><td style="padding:5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Notes</td></tr>\n                <tr><td style="padding:5px;">Our system allows you to take down notes for each applicant</td></tr>\n            </table>\n        </td>\n    </tr>\n</table>
1	Seeker Registration Email	<table style="font-family:Verdana,Arial,sans-serif;font-size: 12px; margin:0px;width: 100%;min-height: 100%;background-color: #008bcf;">\n    <tr>\n        <td>\n            <table style="border:2px solid #006b9d;background-color: #ffffff;width:80%;margin-left:10%;margin-right:10%;">\n                <tr><td style="padding: 5px;font-weight: bold;font-size: 14px;color:#ffffff;background-color: #003f7f;">Welcome</td></tr>\n                <tr><td style="padding: 5px;">\n                        Hi UUUUU,<br>Please <a href="http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU" style="font-weight: bold;">CLICK HERE</a> to complete your registration. Alternatively you can copy the link below and paste it on your browser<br><br>http://DDDDD/faces/registration/Confirm.xhtml?asdewedhyfse=CCCCC&username=UUUUU<br><br>\n                        As a registered member of MyJob.co.ke you will enjoy the following features\n                    </td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Full Profile</td></tr>\n                <tr><td style="padding: 5px;">Our system allows you to set up your full profile </td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Community Policing</td></tr>\n                <tr><td style="padding: 5px;">Report suspicious vacancies</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Avoid Duplicate Applications</td></tr>\n                <tr><td style="padding: 5px;">Our system will let  you know when you are applying for a vacancy that you have already applied before</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Edit After Application</td></tr>\n                <tr><td style="padding: 5px;">Our system allows you to edit you application after you have already sent it</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Withdraw Application</td></tr>\n                <tr><td style="padding: 5px;">After you have applied for a vacancy, you can still withdraw it.</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Attachments</td></tr>\n                <tr><td style="padding: 5px;">Send attachments with your application</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Employer Feedback</td></tr>\n                <tr><td style="padding: 5px;">Get feedback from your potential employer</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">User Feedback</td></tr>\n                <tr><td style="padding: 5px;">We give you the opportunity to let us know how we can improve the service</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Sharing</td></tr>\n                <tr><td style="padding: 5px;">Let your friends know when you have spotted a vacancy that is suitable for them</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Advise</td></tr>\n                <tr><td style="padding: 5px;">Get and contribute job searching tips with other job seekers</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Virus Scanning </td></tr>\n                <tr><td style="padding: 5px;">We scan your C.V and other files you upload for viruses</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Application Management</td></tr>\n                <tr><td style="padding: 5px;">You will be able to see when a potential employer has viewed your application</td></tr>\n                <tr><td style="padding: 5px;background-color: #eee;font-weight: bold;border:1px solid #b2b2b2;">Application Letter Management</td></tr>\n                <tr><td style="padding: 5px;">Save several application letters in advance and choose the one you would like a potential employer to view</td></tr>\n            </table>\n        </td>\n    </tr>\n</table>\n
6	Terms and Conditions	Welcome to our website.<br/>If you continue to browse and use this website, you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Silver Ray I.T Solutions's relationship with you in relation to this website.<br/> If you disagree with any part of these terms and conditions, please do not use our website.<br/><br/>\n \n \n The term 'Silver Ray I.T Solutions' or 'us' or 'we' refers to the owner of the website whose registered address is P.O Box 68003, 00200 Nairobi, Kenya. Our company registration number is C. 132940 Registered in the Republic of Kenya.<br/>The term 'you' refers to the user or viewer of our website.<br/><br/>\n \n \n The use of this website is subject to the following terms of use:<br/><br/>\n \n \n <ul><li>The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>\n <li>This website uses cookies to monitor browsing preferences.</li>\n <li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\n <li>Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.</li>\n <li>This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>\n <li>All trade marks reproduced in this website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>\n <li>Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.</li>\n <li>From time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).</li>\n <li>Your use of this website and any dispute arising out of such use of the website is subject to the laws of Kenya.</li>
\.


--
-- Name: content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('content_id_seq', 6, true);


--
-- Data for Name: coverletters; Type: TABLE DATA; Schema: public; Owner: work
--

COPY coverletters (id, seekerid, name, letter, datemodified) FROM stdin;
\.


--
-- Name: coverletters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('coverletters_id_seq', 1, false);


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: work
--

COPY education (id, seekerid, startdate, enddate, institution, website, location, certification, refereename, address, email, mobileno, datemodified) FROM stdin;
\.


--
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('education_id_seq', 1, false);


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

SELECT pg_catalog.setval('files_id_seq', 1, false);


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
\.


--
-- Name: firstshortlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('firstshortlist_id_seq', 1, false);


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

SELECT pg_catalog.setval('formquestions_id_seq', 84, true);


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: work
--

COPY forms (id, companyid, userid, title, description, datemodified) FROM stdin;
\.


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('forms_id_seq', 204, true);


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
\.


--
-- Name: inmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('inmessage_id_seq', 1, false);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: work
--

COPY jobs (id, companyid, userid, referenceno, title, summary, jobdescription, qualifications, experience, instructions, startdate, enddate, email, maxapplications, datemodified, attachment, positionsid, salaryid, categoryid, accountid) FROM stdin;
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('jobs_id_seq', 1, false);


--
-- Data for Name: lostpassword; Type: TABLE DATA; Schema: public; Owner: work
--

COPY lostpassword (id, code, username, datemodified) FROM stdin;
14	bc81cb	seeker	2014-10-05 09:34:36-04
15	bd61ac	seeker	2014-10-05 09:44:49.925-04
16	43ba1d	seeker	2014-10-05 09:57:37.574-04
17	65f3f8	seeker	2014-10-05 09:57:57.497-04
18	4145b3	seeker	2014-10-05 09:58:36.245-04
19	d8733e	seeker	2014-10-05 09:59:16.822-04
20	7bfa14	seeker	2014-10-05 10:00:20.574-04
\.


--
-- Name: lostpassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('lostpassword_id_seq', 20, true);


--
-- Data for Name: mpesa; Type: TABLE DATA; Schema: public; Owner: work
--

COPY mpesa (id, inmessageid, source, name, code, amount, paytime, receivetime, processed, processtime, fromtime, totime, seekerid, companyid) FROM stdin;
\.


--
-- Name: mpesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('mpesa_id_seq', 1, false);


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
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: work
--

COPY pages (id, seekerid, title, content, datemodified) FROM stdin;
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('pages_id_seq', 1, false);


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
1	text
2	true/false
\.


--
-- Name: questiontypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('questiontypes_id_seq', 2, true);


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: work
--

COPY registration (id, email, username, password, createdate, code, groupid) FROM stdin;
\.


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('registration_id_seq', 1, false);


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

COPY seekers (id, groupid, statusid, username, password, expiry, email, mobile, othernumber, photo, firstname, lastname, middlename, address, dateofbirth, gender, website, maritalstatus, idnumber, pinnumber, passport, driverslicence, points, salaryid, datemodified) FROM stdin;
\.


--
-- Name: seekers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('seekers_id_seq', 1, false);


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: work
--

COPY status (id, description) FROM stdin;
1	-
\.


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('status_id_seq', 1, true);


--
-- Data for Name: tellafriend; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tellafriend (id, seekerid, jobid, friend, datecreated, name) FROM stdin;
\.


--
-- Name: tellafriend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tellafriend_id_seq', 1, false);


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
2	gachanja	tip 2	5	2013-02-08 04:12:31.967862-05
1	gachanja	tip 1	5	2013-02-08 04:12:26.144093-05
\.


--
-- Name: tip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tip_id_seq', 2, true);


--
-- Data for Name: tiprate; Type: TABLE DATA; Schema: public; Owner: work
--

COPY tiprate (id, tipid, rate, userid, seekerid) FROM stdin;
\.


--
-- Name: tiprate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('tiprate_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: work
--

COPY users (id, companyid, accountid, groupid, username, name, email, description, admin, active, password, datemodified) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: work
--

COPY work (id, seekerid, startdate, enddate, company, website, address, companyphone, location, "position", jobdescription, refereename, refereeemail, refereemobile, datemodified) FROM stdin;
\.


--
-- Name: work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: work
--

SELECT pg_catalog.setval('work_id_seq', 1, false);


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
-- Name: questiontypes_questiontype_key; Type: CONSTRAINT; Schema: public; Owner: work; Tablespace: 
--

ALTER TABLE ONLY questiontypes
    ADD CONSTRAINT questiontypes_questiontype_key UNIQUE (questiontype);


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

ALTER TABLE ONLY jobs
    ADD CONSTRAINT fk_jobs_formid FOREIGN KEY (formid) REFERENCES forms(id);


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
-- Name: formanswers_seekerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY formanswers
    ADD CONSTRAINT formanswers_seekerid_fkey FOREIGN KEY (seekerid) REFERENCES seekers(id);


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
-- Name: forms_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY forms
    ADD CONSTRAINT forms_companyid_fkey FOREIGN KEY (companyid) REFERENCES company(id);


--
-- Name: forms_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: work
--

ALTER TABLE ONLY forms
    ADD CONSTRAINT forms_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


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

