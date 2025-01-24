--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying NOT NULL,
    size_in_light_years numeric,
    distance_from_earth numeric
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: black_hole_back_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_back_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_back_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_back_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_back_hole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text,
    is_elliptical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    description text,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.black_hole_back_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagitario A*', 0.00002, 26000);
INSERT INTO public.blackhole VALUES (2, 'M87*', 0.00004, 55000000);
INSERT INTO public.blackhole VALUES (3, 'Cygnus X-1', 0.00001, 6000);
INSERT INTO public.blackhole VALUES (4, 'V404 Cygni', 0.000015, 7800);
INSERT INTO public.blackhole VALUES (5, 'GRO J1655-40', 0.000012, 11000);
INSERT INTO public.blackhole VALUES (6, 'GW150914', 0.00003, 1300000000);
INSERT INTO public.blackhole VALUES (7, 'GW170817', 0.000025, 130000000);
INSERT INTO public.blackhole VALUES (8, 'TON 618', 0.0001, 10400000000);
INSERT INTO public.blackhole VALUES (9, 'Holmberg 15A', 0.00008, 700000000);
INSERT INTO public.blackhole VALUES (10, 'IC 1101', 0.00009, 1000000000);
INSERT INTO public.blackhole VALUES (11, 'NGC 4889', 0.00007, 308000000);
INSERT INTO public.blackhole VALUES (12, 'Phoenix A', 0.0001, 5700000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia, hogar del Sistema Solar.', false, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Galaxia espiral más cercana a la Vía Láctea.', false, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Galaxia del Sombrero', 'Galaxia espiral con un bulbo central brillante.', false, 13000, 29000000);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del Triángulo', 'Galaxia espiral en el Grupo Local.', false, 6000, 3000000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Galaxia elíptica con un núcleo activo.', true, 12000, 13000000);
INSERT INTO public.galaxy VALUES (6, 'Galaxia de Bode', 'Galaxia espiral en la constelación de la Osa Mayor.', false, 13000, 12000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'La única luna natural de la Tierra.', true, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 'La luna más grande y cercana a Marte.', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'La luna más pequeña y lejana de Marte.', false, 2);
INSERT INTO public.moon VALUES (4, 'Ganímedes', 'La luna más grande de Júpiter y del sistema solar.', true, 3);
INSERT INTO public.moon VALUES (5, 'Calisto', 'Una luna con una superficie muy craterizada.', true, 3);
INSERT INTO public.moon VALUES (6, 'Io', 'Una luna volcánica de Júpiter.', true, 3);
INSERT INTO public.moon VALUES (7, 'Europa', 'Una luna con un océano bajo su superficie helada.', true, 3);
INSERT INTO public.moon VALUES (8, 'Amaltea', 'Una luna irregular y rojiza de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (9, 'Himalia', 'La luna más grande del grupo de satélites irregulares de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (10, 'Elara', 'Una luna irregular de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (11, 'Pasífae', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (12, 'Carme', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (13, 'Sinope', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (14, 'Lisitea', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (15, 'Ananké', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (16, 'Leda', 'Una luna irregular y retrógrada de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (17, 'Tebe', 'Una luna irregular de Júpiter.', false, 3);
INSERT INTO public.moon VALUES (18, 'Metis', 'La luna más cercana a Júpiter.', false, 3);
INSERT INTO public.moon VALUES (19, 'Adrastea', 'Una luna pequeña y cercana a Júpiter.', false, 3);
INSERT INTO public.moon VALUES (21, 'Calírroe', 'Una luna irregular y retrógrada de Júpiter.', false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', true, 0, 1);
INSERT INTO public.planet VALUES (2, 'Marte', false, 0.000005, 1);
INSERT INTO public.planet VALUES (3, 'Júpiter', false, 0.00004, 1);
INSERT INTO public.planet VALUES (4, 'Sirio b', false, 8.6, 2);
INSERT INTO public.planet VALUES (5, 'Sirio c', false, 8.6, 2);
INSERT INTO public.planet VALUES (6, 'Proxima b', true, 4.24, 3);
INSERT INTO public.planet VALUES (7, 'Proxima c', false, 4.24, 3);
INSERT INTO public.planet VALUES (8, 'Betelgeuse I', false, 642.5, 4);
INSERT INTO public.planet VALUES (9, 'Betelgeuse II', false, 642.5, 4);
INSERT INTO public.planet VALUES (10, 'Vega b', false, 25.04, 5);
INSERT INTO public.planet VALUES (11, 'Vega c', false, 25.04, 5);
INSERT INTO public.planet VALUES (12, 'Proxima d', false, 4.24, 6);
INSERT INTO public.planet VALUES (13, 'Proxima e', false, 4.24, 6);
INSERT INTO public.planet VALUES (14, 'Rigel b', false, 860, 7);
INSERT INTO public.planet VALUES (15, 'Rigel c', false, 860, 7);
INSERT INTO public.planet VALUES (16, 'Arcturus b', false, 36.7, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Estrella central del Sistema Solar.', 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Sirio', 'La estrella más brillante en el cielo nocturno.', 230, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Alfa Centauri A', 'Una de las estrellas más cercanas al Sol.', 6000, 4.37, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'Estrella brillante en la constelación de Andrómeda.', 60, 97, 2);
INSERT INTO public.star VALUES (5, 'Mirach', 'Gigante roja en la constelación de Andrómeda.', 200, 200, 2);
INSERT INTO public.star VALUES (6, 'Sombrero A1', 'Estrella en el bulbo central de la Galaxia del Sombrero.', 5000, 29000000, 3);
INSERT INTO public.star VALUES (7, 'Sombrero B2', 'Estrella en el disco de la Galaxia del Sombrero.', 3000, 29000000, 3);
INSERT INTO public.star VALUES (8, 'Triangulum X1', 'Estrella joven en la Galaxia del Triángulo.', 100, 3000000, 4);
INSERT INTO public.star VALUES (9, 'Triangulum Y2', 'Estrella en formación en la Galaxia del Triángulo.', 50, 3000000, 4);
INSERT INTO public.star VALUES (10, 'Centaurus Alpha', 'Estrella en el núcleo de Centaurus A.', 12000, 13000000, 5);
INSERT INTO public.star VALUES (11, 'Centaurus Beta', 'Estrella en los brazos espirales de Centaurus A.', 8000, 13000000, 5);
INSERT INTO public.star VALUES (12, 'Bode Alpha', 'Estrella brillante en el núcleo de la Galaxia de Bode.', 5000, 12000000, 6);
INSERT INTO public.star VALUES (13, 'Bode Beta', 'Estrella en los brazos espirales de la Galaxia de Bode.', 3000, 12000000, 6);


--
-- Name: black_hole_back_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_back_hole_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: blackhole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: blackhole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

