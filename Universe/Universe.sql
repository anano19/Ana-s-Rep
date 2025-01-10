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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_visible boolean NOT NULL,
    orbit_period numeric NOT NULL,
    discovered_year integer,
    planet_id integer,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    has_black_hole boolean NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    planet_id integer,
    description text
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
    name character varying(255) NOT NULL,
    type character varying(100),
    size integer NOT NULL,
    star_id integer,
    description text
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
    name character varying(255) NOT NULL,
    temperature integer NOT NULL,
    age numeric NOT NULL,
    galaxy_id integer,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Swift-Tuttle', false, 133, 1862, 5, NULL);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', true, 2533, 1995, 4, NULL);
INSERT INTO public.comet VALUES (3, 'Encke Comet', true, 3.3, 1786, 2, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, false, 'Nearest galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 30000, true, 'A spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, true, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 150000, false, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 120000, true, 'A giant elliptical galaxy in the Virgo Cl
uster, known for its supermassive black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 2, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 3122, 6, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 3643, 6, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 5150, 7, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', 1528, 7, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 7, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 2706, 12, NULL);
INSERT INTO public.moon VALUES (11, 'Charon', 1212, 11, NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 1577, 3, NULL);
INSERT INTO public.moon VALUES (13, 'Oberon', 1523, 3, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 1152, 3, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 472, 3, NULL);
INSERT INTO public.moon VALUES (16, 'Mimas', 396, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Tethys', 1066, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1469, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Dione', 1122, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Adrastea', 16, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Rocky', 12742, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Rocky', 6779, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 'Rocky', 12104, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 139820, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 116460, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 49528, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Proxima b', 'Rocky', 11312, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri b', 'Rocky', 11500, 2, NULL);
INSERT INTO public.planet VALUES (9, 'Rigel b', 'Gas Giant', 120000, 5, NULL);
INSERT INTO public.planet VALUES (10, 'Sirius b', 'White Dwarf', 1600, 4, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 581 g', 'Rocky', 12300, 3, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Rocky', 12500, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 4600000000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5790, 5500000000, 2, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, 100000000, 3, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 9940, 200000000, 4, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 12000, 80000000, 5, NULL);
INSERT INTO public.star VALUES (6, 'Polaris', 6000, 70000000, 1, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

