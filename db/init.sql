--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-20 23:22:31 +07

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

DROP DATABASE "workout-v-2";
--
-- TOC entry 3687 (class 1262 OID 16385)
-- Name: workout-v-2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "workout-v-2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "workout-v-2" OWNER TO postgres;

\connect -reuse-previous=on "dbname='workout-v-2'"

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

--
-- TOC entry 3674 (class 0 OID 16517)
-- Dependencies: 215
-- Data for Name: Exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (4, '2023-03-17 06:39:22.03', '2023-03-17 06:39:22.03', 'атжумания', '/uploads/exercise/chest.svg', 5);
INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (6, '2023-03-17 06:39:22.252', '2023-03-17 06:39:22.252', 'атжумания', '/uploads/exercise/chest.svg', 5);
INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (7, '2023-03-17 06:39:22.386', '2023-03-17 06:39:22.386', 'атжумания', '/uploads/exercise/chest.svg', 5);
INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (8, '2023-03-17 06:39:22.537', '2023-03-17 06:39:22.537', 'атжумания', '/uploads/exercise/chest.svg', 5);
INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (9, '2023-03-17 06:39:22.67', '2023-03-17 06:39:22.67', 'атжумания', '/uploads/exercise/chest.svg', 5);
INSERT INTO public."Exercise" (id, created_at, updated_at, title, icon_path, times) VALUES (5, '2023-03-17 06:39:22.135', '2023-03-17 13:19:39.136', 'атжумания', '/uploads/exercise/chest.svg', 5);


--
-- TOC entry 3677 (class 0 OID 17200)
-- Dependencies: 218
-- Data for Name: Exercise_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Exercise_log" (id, created_at, updated_at, is_completed, user_id, workout_log_id, exercise_id) VALUES (1, '2023-03-17 11:27:44.837', '2023-03-17 12:56:26.54', true, 1, NULL, NULL);
INSERT INTO public."Exercise_log" (id, created_at, updated_at, is_completed, user_id, workout_log_id, exercise_id) VALUES (2, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', false, 1, 1, NULL);


--
-- TOC entry 3679 (class 0 OID 17209)
-- Dependencies: 220
-- Data for Name: Exercise_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (2, '2023-03-17 11:27:44.837', '2023-03-17 11:27:44.837', 0, 0, false, 1);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (3, '2023-03-17 11:27:44.837', '2023-03-17 11:27:44.837', 0, 0, false, 1);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (4, '2023-03-17 11:27:44.837', '2023-03-17 11:27:44.837', 0, 0, false, 1);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (5, '2023-03-17 11:27:44.837', '2023-03-17 11:27:44.837', 0, 0, false, 1);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (1, '2023-03-17 11:27:44.837', '2023-03-17 12:52:39.415', 10, 20, true, 1);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (6, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', 0, 0, false, 2);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (7, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', 0, 0, false, 2);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (8, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', 0, 0, false, 2);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (9, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', 0, 0, false, 2);
INSERT INTO public."Exercise_time" (id, created_at, updated_at, weight, repeat, is_completed, exercise_log_id) VALUES (10, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', 0, 0, false, 2);


--
-- TOC entry 3670 (class 0 OID 16400)
-- Dependencies: 211
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."User" (id, created_at, updated_at, email, name, password, images) VALUES (1, '2023-03-16 14:10:36.272', '2023-03-16 14:10:36.272', 'test@test.ru', 'Conrad Pfannerstill', '$argon2id$v=19$m=65536,t=3,p=4$/zbO49jFOKrVqTP22rRRlg$hM6cbLbWjZIhIHrnrLA6zlFdKVEJdZv1ny+AAvg0ve0', NULL);
INSERT INTO public."User" (id, created_at, updated_at, email, name, password, images) VALUES (2, '2023-03-16 14:16:12.988', '2023-03-16 14:16:12.988', 'goga@test.ru', 'Ms. John Stokes', '$argon2id$v=19$m=65536,t=3,p=4$3ZZGRP223owiumcIr8qGTg$8MvUDGE+305mUJ69iQigu/Uo8glH1KbKefj1F+h4TDE', NULL);
INSERT INTO public."User" (id, created_at, updated_at, email, name, password, images) VALUES (3, '2023-03-16 14:17:29.251', '2023-03-16 14:17:29.251', 'go1ga@test.ru', 'Henry Price', '$argon2id$v=19$m=65536,t=3,p=4$vz/XzOO7KUB9BhoqAH790g$SNCZBJHzAqL4doxWtDPjUZT7cpGghVPlBQn9CsPYSRE', NULL);
INSERT INTO public."User" (id, created_at, updated_at, email, name, password, images) VALUES (4, '2023-03-16 14:17:53.563', '2023-03-16 14:17:53.563', 'go1ga1@test.ru', 'Sherman Walsh', '$argon2id$v=19$m=65536,t=3,p=4$ZyYIxw8F7VR1TtE6ojSkow$EevShRVRGmEmfLSDtXJKO00ogpftXFqmlprg6Cb5Bzs', NULL);
INSERT INTO public."User" (id, created_at, updated_at, email, name, password, images) VALUES (5, '2023-03-20 15:52:02.627', '2023-03-20 15:52:02.627', 'dfg@dfg.dfg', 'Gene Smith', '$argon2id$v=19$m=65536,t=3,p=4$X/lYvl326QBA5tJJFLl9pg$sBvO6wJd3wxzRkira3iapeC4dIpupe2czNgYC2Zj4JI', NULL);


--
-- TOC entry 3672 (class 0 OID 16507)
-- Dependencies: 213
-- Data for Name: Workout; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Workout" (id, created_at, updated_at, title) VALUES (2, '2023-03-17 07:29:13.375', '2023-03-17 07:29:13.375', 'атжумания упраженения');


--
-- TOC entry 3681 (class 0 OID 17220)
-- Dependencies: 222
-- Data for Name: Workout_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Workout_log" (id, created_at, updated_at, is_completed, user_id, workout_id) VALUES (1, '2023-03-17 13:19:39.136', '2023-03-17 13:19:39.136', false, 1, 2);


--
-- TOC entry 3675 (class 0 OID 16526)
-- Dependencies: 216
-- Data for Name: _ExerciseToWorkout; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."_ExerciseToWorkout" ("A", "B") VALUES (5, 2);


--
-- TOC entry 3668 (class 0 OID 16388)
-- Dependencies: 209
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('ba11984f-3b29-46fc-b3d3-f073985fa49b', 'df89f2916046ba36a195e4b61ac83e672deb872ba5eae1cba9ae138b98bbaf69', '2023-03-16 20:22:44.760437+07', '20230316132244_create_user_model', NULL, NULL, '2023-03-16 20:22:44.747033+07', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('ea2995c2-3626-4d98-aa20-6aefd02375d8', '4ba8c091578878cd9f8d47b248ee5c371ff931fbd50076bd5530047680ea5932', '2023-03-16 20:29:56.579573+07', '20230316132956_image_user_to_images', NULL, NULL, '2023-03-16 20:29:56.574064+07', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('000374c6-b5c9-4cdd-858c-8743e90df4ff', '1913e808acf6d4bb1876ae004968a86e467144837d717e2d0ad7567e0f97735d', '2023-03-16 22:11:24.723873+07', '20230316151124_add_exercise_and_workout_model', NULL, NULL, '2023-03-16 22:11:24.708118+07', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('1d4d0e59-05ef-4d2f-8dc8-bc37ad8b6aac', 'edb58ac8b6672ccfda95d6898fcc9e551d39bad8e9f7de31db2b182060a99b69', '2023-03-16 22:29:35.606403+07', '20230316152935_in_model_exercise_update_col_name_time_on_times', NULL, NULL, '2023-03-16 22:29:35.602867+07', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('050f19cb-b595-4671-b025-b7539123ddeb', '8fbf9620ab8d50e53c610cd2b64ba90381f88fe435740d72cd213e0fec7a2001', '2023-03-17 14:55:32.420721+07', '20230317075532_add_exercise_and_workout_logs', NULL, NULL, '2023-03-17 14:55:32.39719+07', 1);
INSERT INTO public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('8429b742-1110-44a8-add3-0b0aedb399bf', '6a2636bd2a6e01e9d5b7d0ea449c2a90b9de4e78941738043d220ad32a93888d', '2023-03-17 20:58:53.242281+07', '20230317135853_update_schema', NULL, NULL, '2023-03-17 20:58:53.236788+07', 1);


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 214
-- Name: Exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Exercise_id_seq"', 9, true);


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 217
-- Name: Exercise_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Exercise_log_id_seq"', 2, true);


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 219
-- Name: Exercise_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Exercise_time_id_seq"', 10, true);


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 210
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 5, true);


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 212
-- Name: Workout_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Workout_id_seq"', 2, true);


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 221
-- Name: Workout_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Workout_log_id_seq"', 1, true);


-- Completed on 2023-03-20 23:22:31 +07

--
-- PostgreSQL database dump complete
--

