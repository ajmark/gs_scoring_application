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
-- Name: organizations; Type: TABLE; Schema: public; Owner: alex; Tablespace: 
--

CREATE TABLE organizations (
    organization_id integer NOT NULL,
    name character varying(255) NOT NULL,
    fraternity boolean NOT NULL
);


ALTER TABLE public.organizations OWNER TO alex;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE organizations_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_organization_id_seq OWNER TO alex;

--
-- Name: organizations_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE organizations_organization_id_seq OWNED BY organizations.organization_id;


--
-- Name: scorecards; Type: TABLE; Schema: public; Owner: alex; Tablespace: 
--

CREATE TABLE scorecards (
    scorecard_id integer NOT NULL,
    show_id integer NOT NULL,
    user_id integer NOT NULL,
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
    set_move_at_end boolean DEFAULT false
);


ALTER TABLE public.scorecards OWNER TO alex;

--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE scorecards_scorecard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scorecards_scorecard_id_seq OWNER TO alex;

--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE scorecards_scorecard_id_seq OWNED BY scorecards.scorecard_id;


--
-- Name: show_listings; Type: TABLE; Schema: public; Owner: alex; Tablespace: 
--

CREATE TABLE show_listings (
    show_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.show_listings OWNER TO alex;

--
-- Name: shows; Type: TABLE; Schema: public; Owner: alex; Tablespace: 
--

CREATE TABLE shows (
    show_id integer NOT NULL,
    name character varying(255) NOT NULL,
    show_order integer NOT NULL,
    description text,
    competitive boolean NOT NULL,
    doubles boolean NOT NULL,
    year integer
);


ALTER TABLE public.shows OWNER TO alex;

--
-- Name: shows_show_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE shows_show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_show_id_seq OWNER TO alex;

--
-- Name: shows_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE shows_show_id_seq OWNED BY shows.show_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: alex; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'judge'::character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    CONSTRAINT check_first_name CHECK (((first_name)::text ~* '^[a-z]+$'::text)),
    CONSTRAINT check_last_name CHECK (((last_name)::text ~* '^([a-z]|\s)+$'::text)),
    CONSTRAINT check_role CHECK (((role)::text ~* '^(judge|admin)$'::text))
);


ALTER TABLE public.users OWNER TO alex;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: alex
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO alex;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alex
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: organization_id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY organizations ALTER COLUMN organization_id SET DEFAULT nextval('organizations_organization_id_seq'::regclass);


--
-- Name: scorecard_id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY scorecards ALTER COLUMN scorecard_id SET DEFAULT nextval('scorecards_scorecard_id_seq'::regclass);


--
-- Name: show_id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY shows ALTER COLUMN show_id SET DEFAULT nextval('shows_show_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: alex
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY organizations (organization_id, name, fraternity) FROM stdin;
1	Alpha Chi Omega	f
2	Alpha Kappa Delta Phi	f
3	Alpha Phi	f
4	Delta Delta Delta	f
5	Delta Gamma	f
6	Kappa Alpha Theta	f
7	Kappa Kappa Gamma	f
8	Alpha Epsilon Pi	t
9	Delta Tau Delta	t
10	Delta Upsilon	t
11	Kappa Sigma	t
12	Lambda Phi Epsilon	t
13	Pi Kappa Alpha	t
14	Phi Delta Theta	t
15	Sigma Alpha Epsilon	t
16	Sigma Chi	t
17	Sigma Nu	t
18	Sigma Phi Epsilon	t
19	Sigma Tau Gamma	t
20	Alpha Sigma Phi	t
\.


--
-- Name: organizations_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('organizations_organization_id_seq', 20, true);


--
-- Data for Name: scorecards; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY scorecards (scorecard_id, show_id, user_id, set_aesthetics, set_interaction, costumes, vocals, band, featured, energy, entertainment_value, philanthropy_points, followable, script_quality, acting, variety, execution, opening, scene_transitions, plot, song_dialogue_flow, pacing, band_singer_syncronization, characters_established, enunciation, set_move_at_end) FROM stdin;
\.


--
-- Name: scorecards_scorecard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('scorecards_scorecard_id_seq', 1, false);


--
-- Data for Name: show_listings; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY show_listings (show_id, organization_id) FROM stdin;
\.


--
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY shows (show_id, name, show_order, description, competitive, doubles, year) FROM stdin;
3	Seussical	10	\N	t	t	2015
2	Lion King	2	\N	t	t	2015
1	Aladdin	6	\N	t	t	2015
4	Lambda Step Show	1	\N	f	f	2015
5	Avenue Q	3	\N	t	f	2015
6	School of Rock	4	\N	t	f	2015
7	Star Trek	5	\N	t	f	2015
8	Squidward on the Roof	7	\N	t	f	2015
9	Wicked	8	\N	t	t	2015
10	Spamalot	9	\N	t	t	2015
11	Thoroughly Modern Millie	11	\N	t	t	2015
12	Pitch Perfect	12	\N	t	t	2015
13	Mean Girls	13	\N	t	f	2015
14	Alpha Sigma Phi	14	\N	f	f	2015
\.


--
-- Name: shows_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('shows_show_id_seq', 14, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alex
--

COPY users (user_id, username, first_name, last_name, role, password, active) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alex
--

SELECT pg_catalog.setval('users_user_id_seq', 1, false);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (organization_id);


--
-- Name: scorecards_pkey; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT scorecards_pkey PRIMARY KEY (scorecard_id);


--
-- Name: show_listings_pkey; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY show_listings
    ADD CONSTRAINT show_listings_pkey PRIMARY KEY (show_id, organization_id);


--
-- Name: shows_pkey; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (show_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: alex; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: organization_listing_fk; Type: FK CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY show_listings
    ADD CONSTRAINT organization_listing_fk FOREIGN KEY (organization_id) REFERENCES organizations(organization_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: show_listing_fk; Type: FK CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY show_listings
    ADD CONSTRAINT show_listing_fk FOREIGN KEY (show_id) REFERENCES shows(show_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: show_scorecard_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT show_scorecard_fkey FOREIGN KEY (show_id) REFERENCES shows(show_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: user_scorecard_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alex
--

ALTER TABLE ONLY scorecards
    ADD CONSTRAINT user_scorecard_fkey FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;


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

