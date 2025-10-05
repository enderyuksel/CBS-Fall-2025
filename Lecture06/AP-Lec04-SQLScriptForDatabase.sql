DROP TABLE IF EXISTS public.enrollment CASCADE;
DROP TABLE IF EXISTS public.courseprogram CASCADE;
DROP TABLE IF EXISTS public.courseoffering CASCADE;
DROP TABLE IF EXISTS public.student CASCADE;
DROP TABLE IF EXISTS public.course CASCADE;
DROP TABLE IF EXISTS public.studyprogram CASCADE;
DROP TABLE IF EXISTS public.teacher CASCADE;

DROP SEQUENCE IF EXISTS public.enrollment_id_seq;
DROP SEQUENCE IF EXISTS public.courseprogram_id_seq;
DROP SEQUENCE IF EXISTS public.courseoffering_id_seq;
DROP SEQUENCE IF EXISTS public.student_id_seq;
DROP SEQUENCE IF EXISTS public.course_id_seq;
DROP SEQUENCE IF EXISTS public.studyprogram_id_seq;
DROP SEQUENCE IF EXISTS public.teacher_id_seq;

BEGIN;
-- Create the tables
CREATE TABLE public.course (
    id integer NOT NULL,
    coursename text NOT NULL,
    description text,
    ects numeric NOT NULL
);

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


CREATE TABLE public.courseoffering (
    id integer NOT NULL,
    courseid integer NOT NULL,
    teacherid integer NOT NULL,
    semester text NOT NULL,
    year integer NOT NULL
);


CREATE SEQUENCE public.courseoffering_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courseoffering_id_seq OWNED BY public.courseoffering.id;


CREATE TABLE public.courseprogram (
    id integer NOT NULL,
    courseid integer NOT NULL,
    studyprogramid integer NOT NULL,
    coursetype integer NOT NULL
);

CREATE SEQUENCE public.courseprogram_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.courseprogram_id_seq OWNED BY public.courseprogram.id;


CREATE TABLE public.enrollment (
    id integer NOT NULL,
    studentid integer NOT NULL,
    courseofferingid integer NOT NULL,
    grade text
);


CREATE SEQUENCE public.enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollment_id_seq OWNED BY public.enrollment.id;


CREATE TABLE public.student (
    id integer NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    studyprogramid integer NOT NULL,
    dob date,
    email text NOT NULL,
    phone text NOT NULL
);


CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


CREATE TABLE public.studyprogram (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    level text NOT NULL
);


CREATE SEQUENCE public.studyprogram_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.studyprogram_id_seq OWNED BY public.studyprogram.id;


CREATE TABLE public.teacher (
    id integer NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    degree text NOT NULL,
    department text NOT NULL,
    specialization text
);


CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;
-- End table creation
COMMIT;

BEGIN;
-- Alter tables
ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);

ALTER TABLE ONLY public.courseoffering ALTER COLUMN id SET DEFAULT nextval('public.courseoffering_id_seq'::regclass);

ALTER TABLE ONLY public.courseprogram ALTER COLUMN id SET DEFAULT nextval('public.courseprogram_id_seq'::regclass);


ALTER TABLE ONLY public.enrollment ALTER COLUMN id SET DEFAULT nextval('public.enrollment_id_seq'::regclass);

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);



ALTER TABLE ONLY public.studyprogram ALTER COLUMN id SET DEFAULT nextval('public.studyprogram_id_seq'::regclass);


ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);
COMMIT;

BEGIN;
INSERT INTO public.studyprogram (id, name, description, level) VALUES (1, 'Digital Business', NULL, 'Masters');
INSERT INTO public.course (id, coursename, description, ects) VALUES (1, 'Applied programming', 'A course to learn Full stack web development', 7.5);
INSERT INTO public.teacher (id, firstname, lastname, degree, department, specialization) VALUES (1, 'John', 'Doe', 'PhD Data Science', 'Digitalization', 'Programming');
INSERT INTO public.student (id, firstname, lastname, studyprogramid, dob, email, phone) VALUES (1, 'Bruce', 'Wayne', 1, '2001-01-24', 'bruce@wayneenterprizes.com', '12345678');
INSERT INTO public.courseoffering (id, courseid, teacherid, semester, year) VALUES (1, 1, 1, 'Fall', 2024);
INSERT INTO public.enrollment (id, studentid, courseofferingid, grade) VALUES (1, 1, 1, '7');
COMMIT;

BEGIN;
SELECT pg_catalog.setval('public.course_id_seq', 1, true);



SELECT pg_catalog.setval('public.courseoffering_id_seq', 1, true);


SELECT pg_catalog.setval('public.courseprogram_id_seq', 1, false);


SELECT pg_catalog.setval('public.enrollment_id_seq', 1, true);


SELECT pg_catalog.setval('public.student_id_seq', 1, true);


SELECT pg_catalog.setval('public.studyprogram_id_seq', 1, true);

SELECT pg_catalog.setval('public.teacher_id_seq', 1, true);

COMMIT;

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.courseoffering
    ADD CONSTRAINT courseoffering_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.courseprogram
    ADD CONSTRAINT courseprogram_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.studyprogram
    ADD CONSTRAINT studyprogram_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.courseoffering
    ADD CONSTRAINT fk_courseoffering_courseid FOREIGN KEY (courseid) REFERENCES public.course(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;



ALTER TABLE ONLY public.courseoffering
    ADD CONSTRAINT fk_courseoffering_teacherid FOREIGN KEY (teacherid) REFERENCES public.teacher(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;



ALTER TABLE ONLY public.courseprogram
    ADD CONSTRAINT fk_courseprogram_courseid FOREIGN KEY (courseid) REFERENCES public.course(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE ONLY public.courseprogram
    ADD CONSTRAINT fk_courseprogram_programid FOREIGN KEY (studyprogramid) REFERENCES public.studyprogram(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT fk_enrollment_offeringid FOREIGN KEY (courseofferingid) REFERENCES public.courseoffering(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT fk_enrollment_studentid FOREIGN KEY (studentid) REFERENCES public.student(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE ONLY public.student
    ADD CONSTRAINT fk_student_studyprogramid FOREIGN KEY (studyprogramid) REFERENCES public.studyprogram(id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;

