SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE foods (
    food_id integer NOT NULL,
    food_name character varying(100) NOT NULL,
    delicious boolean
);


CREATE SEQUENCE foods_food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE foods_food_id_seq OWNED BY foods.food_id;


ALTER TABLE ONLY foods ALTER COLUMN food_id SET DEFAULT nextval('foods_food_id_seq'::regclass);


ALTER TABLE ONLY foods
    ADD CONSTRAINT foods_pkey PRIMARY KEY (food_id);



SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE lunches (
    lunch_id integer NOT NULL,
    date date
);


CREATE SEQUENCE lunch_lunch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE lunch_lunch_id_seq OWNED BY lunches.lunch_id;


ALTER TABLE ONLY lunches ALTER COLUMN lunch_id SET DEFAULT nextval('lunch_lunch_id_seq'::regclass);


ALTER TABLE ONLY lunches
    ADD CONSTRAINT lunch_pkey PRIMARY KEY (lunch_id);



SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE foodstuffs (
    foodstuff_id integer NOT NULL,
    name character varying(50)
);


COPY foodstuffs (foodstuff_id, name) FROM stdin;
1	난류
2	우유
3	메밀
4	땅콩
5	대두
6	밀
7	고등어
8	게
9	새우
10	돼지고기
11	복숭아
12	토마토
13	아황산염
14	호두
15	닭고기
16	소고기
17	오징어
18	조개류
\.


ALTER TABLE ONLY foodstuffs
    ADD CONSTRAINT foodstuffs_pkey PRIMARY KEY (foodstuff_id);



SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE foods_foodstuffs (
    food_id integer,
    foodstuff_id integer
);



ALTER TABLE ONLY foods_foodstuffs
    ADD CONSTRAINT foods_foodstuffs_food_id_fkey FOREIGN KEY (food_id) REFERENCES foods(food_id);


ALTER TABLE ONLY foods_foodstuffs
    ADD CONSTRAINT foods_foodstuffs_foodstuff_id_fkey FOREIGN KEY (foodstuff_id) REFERENCES foodstuffs(foodstuff_id);



SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE lunches_foods (
    lunch_id integer,
    food_id integer
);


ALTER TABLE ONLY lunches_foods
    ADD CONSTRAINT lunches_foods_food_id_fkey FOREIGN KEY (food_id) REFERENCES foods(food_id);


ALTER TABLE ONLY lunches_foods
    ADD CONSTRAINT lunches_foods_lunch_id_fkey FOREIGN KEY (lunch_id) REFERENCES lunches(lunch_id);
