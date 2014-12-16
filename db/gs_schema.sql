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
-- Name: organizations; Type: TABLE; Schema: public; Owner: gs_chair; Tablespace: 
--

CREATE TABLE organizations (
    organization_id integer NOT NULL,
    fraternity boolean NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.organizations OWNER TO gs_chair;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: gs_chair
--

CREATE SEQUENCE organizations_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_organization_id_seq OWNER TO gs_chair;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gs_chair
--

ALTER SEQUENCE organizations_organization_id_seq OWNED BY organizations.organization_id;


--
-- Name: scorecards; Type: TABLE; Schema: public; Owner: gs_chair; Tablespace: 
--

CREATE TABLE scorecards (
    scorecard_id integer NOT NULL,
    set_aesthetics integer DEFAULT 0,
    set_interaction integer DEFAULT 0,
    costumes integer DEFAULT 0,
    vocals integer DEFAULT 0,
    band integer DEFAULT 0,
    featured integer DEFAULT 0,
    energy integer DEFAULT 0,
    entertainment_value integer DEFAULT 0,
    philanthropy_points integer DEFAULT 0,
    followable integer DEFAULT 0,
    script_quality integer DEFAULT 0,
    acting integer DEFAULT 0,
    variety integer DEFAULT 0,
    execution integer DEFAULT 0,
    opening boolean DEFAULT false,
    scene_transitions boolean DEFAULT false,
    plot boolean DEFAULT false,
    song_dialogue_flow boolean DEFAULT false,
    pacing boolean DEFAULT false,
    band_singer_syncronization boolean DEFAULT false,
    characters_established boolean DEFAULT false,
    enunciation boolean DEFAULT false,
    set_move_at_end boolean DEFAULT false,
    show_id integer NOT NULL,
    user_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userUserId" integer,
    "showShowId" integer
);


ALTER TABLE public.scorecards OWNER TO gs_chair;

--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE; Schema: public; Owner: gs_chair
--

CREATE SEQUENCE scorecards_scorecard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scorecards_scorecard_id_seq OWNER TO gs_chair;

--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gs_chair
--

ALTER SEQUENCE scorecards_scorecard_id_seq OWNED BY scorecards.scorecard_id;


--
-- Name: showlistings; Type: TABLE; Schema: public; Owner: gs_chair; Tablespace: 
--

CREATE TABLE showlistings (
    show_id integer NOT NULL,
    organization_id integer NOT NULL,
    "showShowId" integer,
    "organizationOrganizationId" integer
);


ALTER TABLE public.showlistings OWNER TO gs_chair;

--
-- Name: shows; Type: TABLE; Schema: public; Owner: gs_chair; Tablespace: 
--

CREATE TABLE shows (
    show_id integer NOT NULL,
    name character varying(255) NOT NULL,
    show_order integer NOT NULL,
    description text,
    competitive boolean NOT NULL,
    doubles boolean NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.shows OWNER TO gs_chair;

--
-- Name: shows_show_id_seq; Type: SEQUENCE; Schema: public; Owner: gs_chair
--

CREATE SEQUENCE shows_show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_show_id_seq OWNER TO gs_chair;

--
-- Name: shows_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gs_chair
--

ALTER SEQUENCE shows_show_id_seq OWNED BY shows.show_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gs_chair; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    password_digest character varying(255) NOT NULL,
    active boolean DEFAULT true
);


ALTER TABLE public.users OWNER TO gs_chair;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gs_chair
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO gs_chair;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gs_chair
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: organization_id; Type: DEFAULT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY organizations ALTER COLUMN organization_id SET DEFAULT nextval('organizations_organization_id_seq'::regclass);


--
-- Name: scorecard_id; Type: DEFAULT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY scorecards ALTER COLUMN scorecard_id SET DEFAULT nextval('scorecards_scorecard_id_seq'::regclass);


--
-- Name: show_id; Type: DEFAULT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY shows ALTER COLUMN show_id SET DEFAULT nextval('shows_show_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: gs_chair
--

COPY organizations (organization_id, fraternity, name) FROM stdin;
\.


--
-- Name: organizations_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gs_chair
--

SELECT pg_catalog.setval('organizations_organization_id_seq', 1, false);


--
-- Data for Name: scorecards; Type: TABLE DATA; Schema: public; Owner: gs_chair
--

COPY scorecards (scorecard_id, set_aesthetics, set_interaction, costumes, vocals, band, featured, energy, entertainment_value, philanthropy_points, followable, script_quality, acting, variety, execution, opening, scene_transitions, plot, song_dialogue_flow, pacing, band_singer_syncronization, characters_established, enunciation, set_move_at_end, show_id, user_id, "createdAt", "updatedAt", "userUserId", "showShowId") FROM stdin;
\.


--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gs_chair
--

SELECT pg_catalog.setval('scorecards_scorecard_id_seq', 1, false);


--
-- Data for Name: showlistings; Type: TABLE DATA; Schema: public; Owner: gs_chair
--

COPY showlistings (show_id, organization_id, "showShowId", "organizationOrganizationId") FROM stdin;
\.


--
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: gs_chair
--

COPY shows (show_id, name, show_order, description, competitive, doubles, year) FROM stdin;
\.


--
-- Name: shows_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gs_chair
--

SELECT pg_catalog.setval('shows_show_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gs_chair
--

COPY users (user_id, first_name, last_name, username, role, password_digest, active) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gs_chair
--

SELECT pg_catalog.setval('users_user_id_seq', 1, false);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (organization_id);


--
-- Name: scorecards_pkey; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT scorecards_pkey PRIMARY KEY (scorecard_id);


--
-- Name: showlistings_pkey; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY showlistings
    ADD CONSTRAINT showlistings_pkey PRIMARY KEY (show_id, organization_id);


--
-- Name: shows_pkey; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (show_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: gs_chair; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: scorecards_showShowId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT "scorecards_showShowId_fkey" FOREIGN KEY ("showShowId") REFERENCES shows(show_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: scorecards_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT scorecards_show_id_fkey FOREIGN KEY (show_id) REFERENCES shows(show_id);


--
-- Name: scorecards_userUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT "scorecards_userUserId_fkey" FOREIGN KEY ("userUserId") REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: scorecards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT scorecards_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: showlistings_organizationOrganizationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY showlistings
    ADD CONSTRAINT "showlistings_organizationOrganizationId_fkey" FOREIGN KEY ("organizationOrganizationId") REFERENCES organizations(organization_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: showlistings_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY showlistings
    ADD CONSTRAINT showlistings_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations(organization_id);


--
-- Name: showlistings_showShowId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY showlistings
    ADD CONSTRAINT "showlistings_showShowId_fkey" FOREIGN KEY ("showShowId") REFERENCES shows(show_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: showlistings_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gs_chair
--

ALTER TABLE ONLY showlistings
    ADD CONSTRAINT showlistings_show_id_fkey FOREIGN KEY (show_id) REFERENCES shows(show_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: alex
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM alex;
GRANT ALL ON SCHEMA public TO alex;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

