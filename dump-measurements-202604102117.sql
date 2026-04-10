--
-- PostgreSQL database dump
--

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.0

-- Started on 2026-04-10 21:17:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16694)
-- Name: measurements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurements (
    measurement_id integer NOT NULL,
    tool_id integer,
    resource_id integer,
    system_name character varying,
    value character varying,
    unit character varying(50),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.measurements OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16698)
-- Name: measurements_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measurements_measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.measurements_measurement_id_seq OWNER TO postgres;

--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 218
-- Name: measurements_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measurements_measurement_id_seq OWNED BY public.measurements.measurement_id;


--
-- TOC entry 219 (class 1259 OID 16699)
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    resource_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16704)
-- Name: resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resources_resource_id_seq OWNER TO postgres;

--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 220
-- Name: resources_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_resource_id_seq OWNED BY public.resources.resource_id;


--
-- TOC entry 221 (class 1259 OID 16705)
-- Name: systems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.systems (
    system_id integer NOT NULL,
    os_name character varying(255) NOT NULL,
    os_version character varying(50),
    architecture character varying(50),
    system_name character varying(255),
    kernel_name character varying
);


ALTER TABLE public.systems OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16710)
-- Name: systems_system_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.systems_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.systems_system_id_seq OWNER TO postgres;

--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 222
-- Name: systems_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.systems_system_id_seq OWNED BY public.systems.system_id;


--
-- TOC entry 223 (class 1259 OID 16711)
-- Name: tools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tools (
    tool_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    version character varying(50),
    documentation_url character varying(255)
);


ALTER TABLE public.tools OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16716)
-- Name: tools_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tools_tool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tools_tool_id_seq OWNER TO postgres;

--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 224
-- Name: tools_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tools_tool_id_seq OWNED BY public.tools.tool_id;


--
-- TOC entry 3947 (class 2604 OID 16717)
-- Name: measurements measurement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurements ALTER COLUMN measurement_id SET DEFAULT nextval('public.measurements_measurement_id_seq'::regclass);


--
-- TOC entry 3949 (class 2604 OID 16718)
-- Name: resources resource_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN resource_id SET DEFAULT nextval('public.resources_resource_id_seq'::regclass);


--
-- TOC entry 3950 (class 2604 OID 16719)
-- Name: systems system_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.systems ALTER COLUMN system_id SET DEFAULT nextval('public.systems_system_id_seq'::regclass);


--
-- TOC entry 3951 (class 2604 OID 16720)
-- Name: tools tool_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools ALTER COLUMN tool_id SET DEFAULT nextval('public.tools_tool_id_seq'::regclass);


--
-- TOC entry 4109 (class 0 OID 16694)
-- Dependencies: 217
-- Data for Name: measurements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurements (measurement_id, tool_id, resource_id, system_name, value, unit, "timestamp") FROM stdin;
2	3	2	movie.sysad.su	0.12	%	2026-04-01 17:56:26.279904
3	3	2	movie.sysad.su	0.12	%	2026-04-01 17:56:44.571901
10	2	1	movie.sysad.su	3835	MB	2026-04-01 18:40:01.798575
11	2	3	movie.sysad.su	2684	MB	2026-04-01 18:40:01.801084
14	4	4	movie.sysad.su	60367	MB	2026-04-01 19:13:17.677171
15	4	5	movie.sysad.su	55532	MB	2026-04-01 19:13:17.68053
17	3	2	sysad.su	0.24	%	2026-04-03 11:57:38.774633
18	2	1	sysad.su	1832	MB	2026-04-03 11:58:25.275259
19	2	3	sysad.su	564	MB	2026-04-03 11:58:25.279972
20	4	4	sysad.su	40197	MB	2026-04-03 11:58:40.938008
21	4	5	sysad.su	35355	MB	2026-04-03 11:58:40.942408
\.


--
-- TOC entry 4111 (class 0 OID 16699)
-- Dependencies: 219
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (resource_id, name, description) FROM stdin;
2	cpu	нагрузка на процессор
1	total_ram	общий  объем оперативной памяти
3	free_ram	свободный объем оперативной памяти
4	total_size	общий объем диска
5	free_size	свободный объем диска
\.


--
-- TOC entry 4113 (class 0 OID 16705)
-- Dependencies: 221
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.systems (system_id, os_name, os_version, architecture, system_name, kernel_name) FROM stdin;
1	Debian	13	x86_64	movie.sysad.su	6.12.74+deb13+1-amd64
2	Debian	13	x86_64	sysad.su	6.12.74+deb13+1-amd64
\.


--
-- TOC entry 4115 (class 0 OID 16711)
-- Dependencies: 223
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tools (tool_id, name, description, version, documentation_url) FROM stdin;
1	hostname	выводит имя компьютера	1.0	hostname --help
2	free	отображает информацию о состоянии оперативеной памяти(RAM)	1.0	man free
3	mpstat	выводит среднюю загрузку процессора	1.0	man mpstat
4	df	выводит информацию о объеме диска	1.0	man df
\.


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 218
-- Name: measurements_measurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measurements_measurement_id_seq', 1883, true);


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 220
-- Name: resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_resource_id_seq', 1, false);


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 222
-- Name: systems_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.systems_system_id_seq', 2, true);


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 224
-- Name: tools_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tools_tool_id_seq', 1, false);


--
-- TOC entry 3953 (class 2606 OID 16722)
-- Name: measurements measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (measurement_id);


--
-- TOC entry 3955 (class 2606 OID 16724)
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);


--
-- TOC entry 3957 (class 2606 OID 16726)
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (system_id);


--
-- TOC entry 3960 (class 2606 OID 16728)
-- Name: tools tools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (tool_id);


--
-- TOC entry 3958 (class 1259 OID 16748)
-- Name: systems_system_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX systems_system_name_idx ON public.systems USING btree (system_name);


--
-- TOC entry 3961 (class 2606 OID 16729)
-- Name: measurements measurements_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resources(resource_id);


--
-- TOC entry 3962 (class 2606 OID 16757)
-- Name: measurements measurements_systems_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_systems_fk FOREIGN KEY (system_name) REFERENCES public.systems(system_name);


--
-- TOC entry 3963 (class 2606 OID 16739)
-- Name: measurements measurements_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES public.tools(tool_id);


-- Completed on 2026-04-10 21:17:14

--
-- PostgreSQL database dump complete
--

