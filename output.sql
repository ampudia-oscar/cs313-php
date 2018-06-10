--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1.pgdg16.04+1)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-1.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: project; Type: SCHEMA; Schema: -; Owner: cfyquqamkkrnvv
--

CREATE SCHEMA project;


ALTER SCHEMA project OWNER TO cfyquqamkkrnvv;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agent; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.agent (
    id integer NOT NULL,
    agent character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    name character varying(45),
    email character varying(45)
);


ALTER TABLE project.agent OWNER TO cfyquqamkkrnvv;

--
-- Name: agent_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.agent_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: agent_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.agent_id_seq OWNED BY project.agent.id;


--
-- Name: center; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.center (
    id integer NOT NULL,
    center character varying(45) NOT NULL,
    address character varying(145),
    email character varying(45),
    phone character varying(45),
    city character varying(45) NOT NULL,
    country character varying(45) NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE project.center OWNER TO cfyquqamkkrnvv;

--
-- Name: center_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.center_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.center_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: center_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.center_id_seq OWNED BY project.center.id;


--
-- Name: contact; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.contact (
    id integer NOT NULL,
    firstname character varying(45) NOT NULL,
    lastname character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone character varying(45),
    quotation_id integer NOT NULL
);


ALTER TABLE project.contact OWNER TO cfyquqamkkrnvv;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.contact_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.contact_id_seq OWNED BY project.contact.id;


--
-- Name: program; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.program (
    id integer NOT NULL,
    program character varying(245) NOT NULL,
    description character varying(245) NOT NULL,
    language character varying(145) NOT NULL,
    currency character varying(3) NOT NULL,
    cost integer NOT NULL,
    weeks integer NOT NULL,
    lessons character varying(45),
    center_id integer NOT NULL
);


ALTER TABLE project.program OWNER TO cfyquqamkkrnvv;

--
-- Name: program_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.program_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: program_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.program_id_seq OWNED BY project.program.id;


--
-- Name: quotation; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.quotation (
    id integer NOT NULL,
    datecreated date,
    dateexpired date,
    currencyexchange integer NOT NULL,
    program_id integer NOT NULL,
    agent_id integer NOT NULL
);


ALTER TABLE project.quotation OWNER TO cfyquqamkkrnvv;

--
-- Name: quotation_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.quotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.quotation_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: quotation_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.quotation_id_seq OWNED BY project.quotation.id;


--
-- Name: school; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project.school (
    id integer NOT NULL,
    school character varying(45) NOT NULL,
    email character varying(45),
    website character varying(45),
    logo character varying(45)
);


ALTER TABLE project.school OWNER TO cfyquqamkkrnvv;

--
-- Name: school_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.school_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: school_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.school_id_seq OWNED BY project.school.id;


--
-- Name: user; Type: TABLE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE TABLE project."user" (
    id integer NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(60) NOT NULL
);


ALTER TABLE project."user" OWNER TO cfyquqamkkrnvv;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: project; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE project.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project.user_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE project.user_id_seq OWNED BY project."user".id;


--
-- Name: note; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.note (
    note_id integer NOT NULL,
    user_id integer NOT NULL,
    session_id integer NOT NULL,
    speaker_id integer NOT NULL,
    talk_id integer NOT NULL,
    note text NOT NULL
);


ALTER TABLE public.note OWNER TO cfyquqamkkrnvv;

--
-- Name: note_note_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.note_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_note_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: note_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.note_note_id_seq OWNED BY public.note.note_id;


--
-- Name: scriptures; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.scriptures (
    id integer NOT NULL,
    book character varying(255) NOT NULL,
    chapter integer NOT NULL,
    verse integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.scriptures OWNER TO cfyquqamkkrnvv;

--
-- Name: scriptures_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.scriptures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scriptures_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: scriptures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.scriptures_id_seq OWNED BY public.scriptures.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.session (
    session_id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    session character varying(20) NOT NULL
);


ALTER TABLE public.session OWNER TO cfyquqamkkrnvv;

--
-- Name: session_session_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.session_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_session_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: session_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.session_session_id_seq OWNED BY public.session.session_id;


--
-- Name: speaker; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.speaker (
    speaker_id integer NOT NULL,
    speaker_name character varying(30) NOT NULL,
    "position" character varying(50)
);


ALTER TABLE public.speaker OWNER TO cfyquqamkkrnvv;

--
-- Name: speaker_speaker_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.speaker_speaker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speaker_speaker_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: speaker_speaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.speaker_speaker_id_seq OWNED BY public.speaker.speaker_id;


--
-- Name: talk; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.talk (
    talk_id integer NOT NULL,
    talk_name character varying(200) NOT NULL,
    session_id integer NOT NULL,
    speaker_id integer NOT NULL
);


ALTER TABLE public.talk OWNER TO cfyquqamkkrnvv;

--
-- Name: talk_talk_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.talk_talk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.talk_talk_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: talk_talk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.talk_talk_id_seq OWNED BY public.talk.talk_id;


--
-- Name: topic; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.topic (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.topic OWNER TO cfyquqamkkrnvv;

--
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.topic_id_seq OWNED BY public.topic.id;


--
-- Name: topic_scripture; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public.topic_scripture (
    topic_id integer NOT NULL,
    scripture_id integer NOT NULL
);


ALTER TABLE public.topic_scripture OWNER TO cfyquqamkkrnvv;

--
-- Name: user; Type: TABLE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO cfyquqamkkrnvv;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO cfyquqamkkrnvv;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- Name: agent id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.agent ALTER COLUMN id SET DEFAULT nextval('project.agent_id_seq'::regclass);


--
-- Name: center id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.center ALTER COLUMN id SET DEFAULT nextval('project.center_id_seq'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.contact ALTER COLUMN id SET DEFAULT nextval('project.contact_id_seq'::regclass);


--
-- Name: program id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.program ALTER COLUMN id SET DEFAULT nextval('project.program_id_seq'::regclass);


--
-- Name: quotation id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.quotation ALTER COLUMN id SET DEFAULT nextval('project.quotation_id_seq'::regclass);


--
-- Name: school id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.school ALTER COLUMN id SET DEFAULT nextval('project.school_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project."user" ALTER COLUMN id SET DEFAULT nextval('project.user_id_seq'::regclass);


--
-- Name: note note_id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note ALTER COLUMN note_id SET DEFAULT nextval('public.note_note_id_seq'::regclass);


--
-- Name: scriptures id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.scriptures ALTER COLUMN id SET DEFAULT nextval('public.scriptures_id_seq'::regclass);


--
-- Name: session session_id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.session ALTER COLUMN session_id SET DEFAULT nextval('public.session_session_id_seq'::regclass);


--
-- Name: speaker speaker_id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.speaker ALTER COLUMN speaker_id SET DEFAULT nextval('public.speaker_speaker_id_seq'::regclass);


--
-- Name: talk talk_id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.talk ALTER COLUMN talk_id SET DEFAULT nextval('public.talk_talk_id_seq'::regclass);


--
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic ALTER COLUMN id SET DEFAULT nextval('public.topic_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: agent; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.agent (id, agent, password, name, email) FROM stdin;
\.


--
-- Data for Name: center; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.center (id, center, address, email, phone, city, country, school_id) FROM stdin;
1	Amboise	9 mail Saint- Thomas	amb-info@eurocentres.com	33247231060	Amboise	France	1
2	Berlín	Bernburger Str. 30-31	ver-info@eurocentres.com	4903026394999	Berlin	Germany	1
3	Boston - NESE	36 John F. Kennedy St		-6178647170	Cambridge	USA	1
4	Bournemouth	26 Dean Park Road	bth-info@eurocentres.com	441202554426	Bournemouth	United Kingdom	1
5	Brighton	20 North Street	bri-info@eurocentres.com	441273324545	Brighton	United Kingdom	1
6	Cairns	91-97 Mulgrave Road	cns-info@eurocentres.com	61740548691	Cairns	Canada	1
7	Cambridge	57 Bateman Street	cam-info@eurocentres.com	441223353607	Cambridge	United Kingdom	1
8	Ciudad del Cabo	50-on-Long/ 50 Long St. 1st Floor	cap-info@eurocentres.com	27214231833	Cape Town	Australia	1
9	Dublin	4 North Great Georges St	admin@alphacollege.com	35318747024	Dublin	United Kingdom	1
10	East Lansing	English Language Center Michigan State University	elc@msu.edu	15173530800	East Lansing	United States	1
11	Florencia	Palazzo Guadagni 	fir-info@eurocentres.com	39055213030	Florencia	Italy	1
12	Kanazawa	1-5-3 Hon-machi	kan-info@eurocentres.com	81762601543	Kanazawa	Japan	1
13	La Rochelle	Avenue Michel Crépeau	lar-info@eurocentres.com	33546505733	La Rochelle	France	1
14	Lausana	Rue de Genevé 35	lsn-info@eurocentres.com	41213187130	Lausana	Switzerland	1
15	Londres Central	56 Eccleston Square	vic-info@eurocentres.com	442078344155	Londres Central	United Kingdom	1
16	Londres Eltham					United Kingdom	1
17	Londres Lee Green	21 Meadowcourt Road	lee-info@eurocentres.com	442083185633	Londres Lee Green	United Kingdom	1
18	Melbourne					Canada	1
19	Moscú	Liden & Denz Language Centre Moscow	moscow@lidenz.ru	74952544991	Moscú	Russia	1
20	Nueva York	American Language Program Room 504	alp@columbia.edu	12128543584	Nueva York	United States	1
21	París	13 passage Dauphine	par-info@eurocentres.com	330140467200	Paris	France	1
22	Pekin	Ping An Fu Hotel	bei-info@eurocentres.com	8613520103215	Pekin	China	1
23	San Diego					United States	1
24	San Petersburgo	Liden & Denz Language Centre St. Petersburg	bookings@lidenz.ru	78123340788	San Petersburgo	Russia	1
25	Sliema	12 Taliana Lane		35625588500	Sliema	South Africa	1
26	Sydney	128 Chalmers Street	syd_info@eurocentres.com	61296994588	Sydney	Canada	1
27	Toronto	#220-111 Peter Street	tor-info@eurocentres.com	14165421626	Toronto	Ireland	1
28	Vancouver	#250-815 West Hastings Street	van-info@eurocentres.com	16046887942	Vancouver	Ireland	1
29	Atlanta	1100 South Marietta Parkway		-6789154960	Marietta	USA	2
30	Berkeley	2425 Prospect Street		-5108450201	Berkeley	USA	2
31	Boston Downtown	125 Tremont Street		-6175744820	Boston	USA	2
32	Boston-Newton	777 Dedham Street		6172444448	Newton	USA	2
33	Bristol	1 Old Ferry Road		-4012545300	Bristol	USA	2
34	Charlotte	5200 Park Road		-7045274172	Charlotte	USA	2
35	Chicago	7200 West Division Street		-7084885010	River Forest	USA	2
36	Chicago-Romeoville	1 University Parkway			Romeoville	USA	2
37	Cincinnati	60 West Charlton Street		-5135564034	Cincinnati	USA	2
38	Clemson Greenville	225 South Pleasantburg Drive		-8642335993	Greenville	USA	2
39	Cleveland	11321 Juniper Rd		-2163682716	Cleveland	USA	2
40	Columbus	1216 Sunbury Rd		6142517360	Columbus	USA	2
41	Dallas	800 West Campbell Road		9722344611	Richardson	USA	2
42	DeKalb	385 Wirtz Drive		8157534600	DeKalb	USA	2
43	Denver	3645 West 112th Ave		-3034045717	Westminster	USA	2
44	Fort Wayne	2101 E Coliseum Blvd		2604810357	Fort Wayne	USA	2
45	Fredericksburg	1125 Jefferson Davis		5403712039	Fredericksburg	USA	2
46	Garden City	1 South Avenue		-5168773910	Garden City	USA	2
47	Grand Forks	221 Centennial Dr.		-7017776785	Grand Forks	USA	2
48	Grand Rapids	1150 Au Sable Hall		-6163319222	Allendale	USA	2
49	Honolulu	1188 Fort Street	hnl@els.edu	-8085438075	Honolulu	USA	2
50	Houston	4200 Montrose Blvd		-7135212030	Houston	USA	2
51	Houston-Clear Lake	2700 Bay Area Blvd		2812833034	Houston	USA	2
52	Indianapolis	151 West Ohio Street		-3172742371	Indianapolis	USA	2
53	Johnson City	503 South Dossett Drive		-4234397147	Johnson City	USA	2
54	La Verne	1886 Third Street		-9095935555	La Verne	USA	2
55	Lubbock	1921 Broadway Street		8067475340	Lubbock	USA	2
56	Manhattan	75 Varick Street		-2124319330	New York	USA	2
57	Melbourne	150 West University Boulevard		-3217273990	Melbourne	USA	2
58	Miami	11300 NE Second Avenue		-3058993390	Miami Shores	USA	2
59	Milwaukee	1834 W Wisconsin Ave		4143449325	Milwaukee	USA	2
60	Nashville	820 Fairview Avenue		-6158982980	Murfreesboro	USA	2
61	New Haven 	1211 Campbell Avenue,		-2039312970	West Haven	USA	2
62	Oklahoma City	1915 N.W. 24th Street		-4055253738	Oklahoma City	USA	2
63	Orlando	800 Celebration Avenue		-3219392444	Celebration	USA	2
64	Philadelphia	5414 Overbrook Avenue		-2154734430	Philadelphia	USA	2
65	Pittsburgh	201 Wood Street Lawrence Hall, Room 804		-4123923802	Pittsburgh	USA	2
66	Portland	2811 NE Holman St.		-5032808552	Portland	USA	2
67	Riverdale	6301 Riverdale Ave.		-7187966325	Riverdale	USA	2
68	Rochester	350 New Campus Drive		5853957500	Brockport	USA	2
69	Ruston	305 Wisteria St.		-3182572012	Ruston	USA	2
70	San Antonio	4301 Broadway		-2102835077	San Antonio	USA	2
71	San Diego	110 West C Street		-6195570136	San Diego	USA	2
72	San Francisco-Dowtown 	300 Montgomery Street, Suite 200		-4157965356	San Francisco	USA	2
73	San Francisco-North Bay 	190 Palm Avenue		-4154853224	San Rafael	USA	2
74	Santa Barbara	104 West Anapamu, Suite I		-8059660172	Santa Barbara	USA	2
75	Santa Cruz					USA	2
76	Santa Monica	1413 Second Street		-3104514544	Santa Monica	USA	2
77	Seattle	400 East Pine Street		-2066231481	Seattle	USA	2
78	Silicon Valley 	21269 Stevens Creek Blvd		4088651164	Cupertino	USA	2
79	St. Louis	1 University Dr		-3145164621	St. Louis	USA	2
80	St. Paul	2115 Summit Avenue		-6519625990	St. Paul	USA	2
81	St. Petersburg	4200 54th Avenue South		-7278647820	St. Petersburg	USA	2
82	Tacoma	1101 South Yakima Ave		2536807284	Tacoma	USA	2
83	Tampa	701 W Kennedy Blvd		8132576328	Tampa	USA	2
84	Teaneck	1000 River Road, Robison Hall		-2019070004	Teaneck	USA	2
85	Thousand Oaks	203 Faculty Street		-8054933760	Thousand Oaks	USA	2
86	Vancouver					Canada	2
87	Washington	4000 Chesapeake St NW		-2022430138	Washington	USA	2
88	Florencia	Via Fiume 17 50123	info@linguaviva.it	-39055294359	Firenze	Italy	3
89	Milan	Corso Buenos Aires 43 20124	info@linguadue.com	-390229519972	Milan	Italy	3
90	Ada	East Central University, 1100 E. 14th Street, PMB Y-3	tlcada@thelanguagecompany.com	-5805595945	Ada	USA	4
91	Berkeley	2470 Telegraph Avenue, Suite 200	tlcberkeley@thelanguagecompany.com	-5108488110	Berkeley	USA	4
92	Boston	Bay State College, 122 Commonwealth Avenue	tlcboston@thelanguagecompany.com	-6176073240	Boston	USA	4
93	Bowling Green	Bowling Green State University, Moseley Hall, Room 404A	tlcbowlinggreen@thelanguagecompany.com	-4193729114	Bowling Green	USA	4
94	Dallas/Fort Worth	Texas Wesleyan University, 1201 Wesleyan Street	tlcdfw@thelanguagecompany.com	-8175312991	Dallas/Fort Wort	USA	4
95	Edmond	University of Central Oklahoma, 100 N. University Drive, P.M.B. 341881	tlcedmond@thelanguagecompany.com	-4053412125	 Edmond	USA	4
96	Fairfax	2810 Old Lee Highway, #100	tlcfairfax@thelanguagecompany.com	-7035601568	Fairfax	USA	4
97	Fort Wayne	3800 N. Anthony Blvd.	tlc-fortwayne@ivytech.edu	-2604804141	Fort Wayne	USA	4
98	Frostburg	Frostburg State University, 101 Braddock Road	tlcfrostburg@thelanguagecompany.com	-3016871097	Frostburg	USA	4
99	Kirksville	Truman State University, Kirk Building 215, 100 E. Normal avenue	tlckirksville@thelanguagecompany.com	-6606276001	Kirksville	USA	4
100	Minot	Minot State University, Dakota Hall, 500 University Ave. West	tlcminot@thelanguagecompany.com	-7018584561	Minot	USA	4
101	Orlando	Florida Mall Business Center, 1650 Sand Lake Rd., Suite 100	tlcorlando@thelanguagecompany.com	-4078595444	Orlando	USA	4
102	Philadelphia	111 S. Independence Mall East Suite 840	tlcphilly@thelanguagecompany.com	-2678869399	Philadelphia	USA	4
103	South Bend	Indiana University South Bend, 1700 Mishawaka Avenue, Suite 001	tlcsouthbend@thelanguagecompany.com	-5742873622	South Bend	USA	4
104	Auckland	Level 1 10-12 Scotia Place	auc@LSI.edu	64093033097	Auckland	New Zealand	5
105	Berkeley	2015 Center Street	ber@LSI.edu	15108414695	Berkeley	USA	5
106	Boston	105 Beach Street	bos@LSI.edu	16175423600	Boston	USA	5
107	Brighton	13 Ventnor Villas	bri@LSI.edu	4401273722060	Brighton	UK	5
108	Brisbane	93 Edward Street	bne@LSI.edu	610732216977	Brisbane	Australia	5
109	Cambridge	41 Tenison Road	cam@LSI.edu	4401223361783	Cambridge CB1 2DG	UK	5
110	London Central	19-21 Ridgmount Street	lon@LSI.edu	4402074676500	London WC1E 7AH	UK	5
111	London Hampstead	13 Lyndhurst Terrace	ham@LSI.edu	4402077948111	London NW3 5QA	UK	5
112	New York	431 Canal Street 12th Floor	nyc@LSI.edu	12129659940	New York	USA	5
113	Paris	350 Rue St Honoré	par@LSI.edu	330142605370	Paris	France	5
114	San Diego	1706 5th Avenue	info-san@lsi.edu	16192342881	San Diego	USA	5
116	Vancouver	101 808 Nelson Street	van@LSI.edu	16046837654	Vancouver B.C. V6Z 2H2	Canada	5
117	Zurich	Kreuzstrasse 36	zur@LSI.edu	410442515889	Zurich	Switzerland	5
115	Toronto	1055 Yonge St 210	tor@LSI.edu	14169286888	Toronto ON M4W 2L2	Canada	5
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.contact (id, firstname, lastname, email, phone, quotation_id) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.program (id, program, description, language, currency, cost, weeks, lessons, center_id) FROM stdin;
1	Standard		Italiano	EUR	380	2	20	88
2	Standard		Italiano	EUR	570	3	20	88
3	Standard		Italiano	EUR	760	4	20	88
4	Standard	Semana Adicional	Italiano	EUR	190	1	20	88
5	Long Term Standard		Italiano	EUR	2040	12	20	88
6	Long Term Standard	Semana Adicional	Italiano	EUR	170	1	20	88
7	Long Term Standard		Italiano	EUR	3840	24	20	88
8	Long Term Standard	Semana Adicional	Italiano	EUR	160	1	20	88
9	Intensive		Italiano	EUR	580	2	30	88
10	Intensive		Italiano	EUR	870	3	30	88
11	Intensive		Italiano	EUR	1160	4	30	88
12	Intensive	Semana Adicional	Italiano	EUR	290	1	30	88
13	Super Intensive		Italiano	EUR	1300	2	30	88
14	Super Intensive		Italiano	EUR	1950	3	30	88
15	Super Intensive		Italiano	EUR	2600	4	30	88
16	Super Intensive	Semana Adicional	Italiano	EUR	650	1	30	88
17	Italian + Cooking		Italiano	EUR	780	2	26	88
18	Italian + Cooking		Italiano	EUR	1070	3	26	88
19	Italian + Cooking		Italiano	EUR	1350	4	26	88
20	Art History	Art History	Italiano	EUR	185	2	7	88
21	Italian + Arts	Interior Design	Italiano	EUR	1400	4	28	88
22	Italian + Arts	Interior Design	Italiano	EUR	5250	16	32	88
23	Italian + Arts	Fashion	Italiano	EUR	1400	4	28	88
24	Italian + Arts	Fashion	Italiano	EUR	5250	16	32	88
25	Italian + Arts	Photography	Italiano	EUR	1400	4	28	88
26	Italian + Arts	Photography	Italiano	EUR	5250	16	32	88
27	Italian + Arts	Painting	Italiano	EUR	1400	4	28	88
28	Italian + Arts	Painting	Italiano	EUR	5250	16	32	88
29	One to One	Standard	Italiano	EUR	920	1	20	88
30	One to One	Intensive	Italiano	EUR	1380	1	30	88
31	One to One	Super Intensive	Italiano	EUR	1840	1	40	88
32	Cultural Programme for Seniors		Italiano	EUR	980	2	18	88
33	Individual prepatory for CILS		Italiano	EUR	460	1	10	88
34	Preparatory for Italian University		Italiano	EUR	2450	9	250	88
35	Internship Programme		Italiano	EUR	900	8		88
36	Internship Programme		Italiano	EUR	1110	12		88
37	Internship Programme		Italiano	EUR	1320	16		88
38	Standard		Italiano	EUR	380	2	20	89
39	Standard		Italiano	EUR	570	3	20	89
40	Standard		Italiano	EUR	760	4	20	89
41	Standard	Semana Adicional	Italiano	EUR	190	1	20	89
42	Long Term Standard		Italiano	EUR	2040	12	20	89
43	Long Term Standard	Semana Adicional	Italiano	EUR	170	1	20	89
44	Long Term Standard		Italiano	EUR	3840	24	20	89
45	Long Term Standard	Semana Adicional	Italiano	EUR	160	1	20	89
46	Intensive		Italiano	EUR	580	2	30	89
47	Intensive		Italiano	EUR	870	3	30	89
48	Intensive	Intensive	Italiano	EUR	1160	4	30	89
49	Intensive	Semana Adicional	Italiano	EUR	290	1	30	89
50	Super Intensive		Italiano	EUR	1300	2	30	89
51	Super Intensive		Italiano	EUR	1950	3	30	89
52	Super Intensive		Italiano	EUR	2600	4	30	89
53	Super Intensive	Semana Adicional	Italiano	EUR	650	1	30	89
54	Evening Courses		Italiano	EUR	450	12	48	89
55	Summer Programmes	Italian + Fashion Design	Italiano	EUR	1400	4	28	89
56	Summer Programmes	Italian + Interior Design 	Italiano	EUR	1400	4	28	89
57	One to One	Standard	Italiano	EUR	920	1	20	89
58	One to One	Intensive	Italiano	EUR	1380	1	30	89
59	One to One	Super Intensive	Italiano	EUR	1840	1	40	89
60	Individual prepatory for CILS		Italiano	EUR	460	1	10	89
61	Preparatory for Italian University		Italiano	EUR	2450	9	250	89
62	Preparatory for Italian University		Italiano	EUR	1280	4	120	89
63	Preparatory for Fashion & Design Schools		Italiano	EUR	1230	6	120	89
64	Internship Programme		Italiano	EUR	900	8	0	89
65	Internship Programme		Italiano	EUR	1110	12	0	89
66	Internship Programme		Italiano	EUR	1320	16	0	89
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.quotation (id, datecreated, dateexpired, currencyexchange, program_id, agent_id) FROM stdin;
\.


--
-- Data for Name: school; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project.school (id, school, email, website, logo) FROM stdin;
1	Eurocentres	contact@eurocentres.com	www.eurocentres.com	\N
2	ELS	info@els.edu	www.els.edu	\N
3	Linguaviva	info@linguaviva.it	www.linguaviva.it	\N
4	The Language Company (TLC)	info@thelanguagecompany.com	www.thelanguagecompany.com	\N
5	Language Studies International (LSI)		www.lsi.edu	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: project; Owner: cfyquqamkkrnvv
--

COPY project."user" (id, username, password) FROM stdin;
1	admin	admin
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.note (note_id, user_id, session_id, speaker_id, talk_id, note) FROM stdin;
1	1	1	1	2	God sanctifies the most difficult days of mothers.
2	1	1	1	2	Parents teach their children throughout their life, from first prayer, to parenting advice.
3	1	3	2	1	Give thanks when we receive revelation.
4	1	3	2	1	Stretch beyond your personal ability to receive revelation.
5	1	2	2	3	Include conference talks in FHE over next 6 months.
6	1	2	2	3	Spend time in the temple.
\.


--
-- Data for Name: scriptures; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.scriptures (id, book, chapter, verse, content) FROM stdin;
1	John	1	5	And the light shineth in darkness; and the darkness comprehended it not.
2	Doctrine and Covenants	88	49	The light shineth in darkness, and the darkness comprehendeth it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in him and by him.
3	Doctrine and Covenants	93	28	He that keepeth his commandments receiveth truth and light, until he is glorified in truth and knoweth all things.
4	Mosiah	16	9	He is the light and the life of the world; yea, a light that is endless, that can never be darkened; yea, and also a life which is endless, that there can be no more death.
5	John	1	5	And the light shineth in darkness; and the darkness comprehended it not.
6	Doctrine and Covenants	88	49	The light shineth in darkness, and the darkness comprehendeth it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in him and by him.
7	Doctrine and Covenants	93	28	He that keepeth his commandments receiveth truth and light, until he is glorified in truth and knoweth all things.
8	Mosiah	16	9	He is the light and the life of the world; yea, a light that is endless, that can never be darkened; yea, and also a life which is endless, that there can be no more death.
9	Hebrews	11	4	By faith Abel offered unto God a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, God testifying of his gifts: and by it he being dead yet speaketh.
10	Hebrews	11	4	By faith Abel offered unto God a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, God testifying of his gifts: and by it he being dead yet speaketh.
11	1 Corinthians	13	13	And now abideth faith, hope, charity, these three; but the greatest of these is charity.
12	Moroni	7	47	But charity is the pure love of Christ, and it endureth forever; and whoso is found possessed of it at the last day, it shall be well with him.
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.session (session_id, year, month, session) FROM stdin;
1	2018	4	Saturday Morning
2	2018	4	Sunday Afternoon
3	2018	4	Sunday Morning
\.


--
-- Data for Name: speaker; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.speaker (speaker_id, speaker_name, "position") FROM stdin;
1	Brian K. Taylor	Seventy
2	Russel M. Nelson	Prophet
\.


--
-- Data for Name: talk; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.talk (talk_id, talk_name, session_id, speaker_id) FROM stdin;
1	Revelation for the Church, Revelation for Our Lives	3	2
2	Am I A Child Of God?	1	1
3	Let Us All Press On	2	2
\.


--
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.topic (id, name) FROM stdin;
1	Faith
2	Sacrifice
3	Charity
4	Witness
\.


--
-- Data for Name: topic_scripture; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public.topic_scripture (topic_id, scripture_id) FROM stdin;
1	1
4	10
1	11
3	11
3	12
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: cfyquqamkkrnvv
--

COPY public."user" (user_id, user_name, password) FROM stdin;
1	Tammy	password
\.


--
-- Name: agent_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.agent_id_seq', 1, false);


--
-- Name: center_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.center_id_seq', 117, true);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.contact_id_seq', 1, false);


--
-- Name: program_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.program_id_seq', 66, true);


--
-- Name: quotation_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.quotation_id_seq', 1, false);


--
-- Name: school_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.school_id_seq', 5, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: project; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('project.user_id_seq', 1, true);


--
-- Name: note_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.note_note_id_seq', 6, true);


--
-- Name: scriptures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.scriptures_id_seq', 12, true);


--
-- Name: session_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.session_session_id_seq', 3, true);


--
-- Name: speaker_speaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.speaker_speaker_id_seq', 2, true);


--
-- Name: talk_talk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.talk_talk_id_seq', 3, true);


--
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.topic_id_seq', 4, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cfyquqamkkrnvv
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, true);


--
-- Name: agent agent_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (id);


--
-- Name: center center_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.center
    ADD CONSTRAINT center_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (id);


--
-- Name: school school_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: note pk_note_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT pk_note_1 PRIMARY KEY (note_id);


--
-- Name: scriptures pk_scriptures_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.scriptures
    ADD CONSTRAINT pk_scriptures_1 PRIMARY KEY (id);


--
-- Name: session pk_session_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT pk_session_1 PRIMARY KEY (session_id);


--
-- Name: speaker pk_speaker_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.speaker
    ADD CONSTRAINT pk_speaker_1 PRIMARY KEY (speaker_id);


--
-- Name: talk pk_talk_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.talk
    ADD CONSTRAINT pk_talk_1 PRIMARY KEY (talk_id);


--
-- Name: user pk_user_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT pk_user_1 PRIMARY KEY (user_id);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- Name: topic_scripture topic_scripture_pkey; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic_scripture
    ADD CONSTRAINT topic_scripture_pkey PRIMARY KEY (topic_id, scripture_id);


--
-- Name: topic_scripture uq_scrip_top_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic_scripture
    ADD CONSTRAINT uq_scrip_top_1 UNIQUE (scripture_id, topic_id);


--
-- Name: topic uq_topic_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT uq_topic_1 UNIQUE (name);


--
-- Name: user uq_user_1; Type: CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uq_user_1 UNIQUE (user_name);


--
-- Name: fk_topic_scripture_scripture_idx; Type: INDEX; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE INDEX fk_topic_scripture_scripture_idx ON public.topic_scripture USING btree (scripture_id);


--
-- Name: fk_topic_scripture_topic_idx; Type: INDEX; Schema: public; Owner: cfyquqamkkrnvv
--

CREATE INDEX fk_topic_scripture_topic_idx ON public.topic_scripture USING btree (topic_id);


--
-- Name: center fk_center_school; Type: FK CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.center
    ADD CONSTRAINT fk_center_school FOREIGN KEY (school_id) REFERENCES project.school(id);


--
-- Name: contact fk_contact_quotation1; Type: FK CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.contact
    ADD CONSTRAINT fk_contact_quotation1 FOREIGN KEY (quotation_id) REFERENCES project.quotation(id);


--
-- Name: program fk_program_center1; Type: FK CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.program
    ADD CONSTRAINT fk_program_center1 FOREIGN KEY (center_id) REFERENCES project.center(id);


--
-- Name: quotation fk_quotation_agent1; Type: FK CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.quotation
    ADD CONSTRAINT fk_quotation_agent1 FOREIGN KEY (agent_id) REFERENCES project.agent(id);


--
-- Name: quotation fk_quotation_program1; Type: FK CONSTRAINT; Schema: project; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY project.quotation
    ADD CONSTRAINT fk_quotation_program1 FOREIGN KEY (program_id) REFERENCES project.program(id);


--
-- Name: note fk_note_1; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fk_note_1 FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- Name: note fk_note_2; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fk_note_2 FOREIGN KEY (session_id) REFERENCES public.session(session_id);


--
-- Name: note fk_note_3; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fk_note_3 FOREIGN KEY (speaker_id) REFERENCES public.speaker(speaker_id);


--
-- Name: note fk_note_4; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fk_note_4 FOREIGN KEY (talk_id) REFERENCES public.talk(talk_id);


--
-- Name: talk fk_talk_1; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.talk
    ADD CONSTRAINT fk_talk_1 FOREIGN KEY (session_id) REFERENCES public.session(session_id);


--
-- Name: talk fk_talk_2; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.talk
    ADD CONSTRAINT fk_talk_2 FOREIGN KEY (speaker_id) REFERENCES public.speaker(speaker_id);


--
-- Name: topic_scripture fk_topic_scripture_scripture; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic_scripture
    ADD CONSTRAINT fk_topic_scripture_scripture FOREIGN KEY (scripture_id) REFERENCES public.scriptures(id);


--
-- Name: topic_scripture fk_topic_scripture_topic; Type: FK CONSTRAINT; Schema: public; Owner: cfyquqamkkrnvv
--

ALTER TABLE ONLY public.topic_scripture
    ADD CONSTRAINT fk_topic_scripture_topic FOREIGN KEY (topic_id) REFERENCES public.topic(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cfyquqamkkrnvv
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cfyquqamkkrnvv;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO cfyquqamkkrnvv;


--
-- PostgreSQL database dump complete
--

