--Table ms_location_storage
CREATE TABLE IF NOT EXISTS public.ms_location_storage
(
    location_id integer NOT NULL DEFAULT nextval('ms_location_storage_location_id_seq'::regclass),
    location_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ms_location_storage_pkey PRIMARY KEY (location_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ms_location_storage
    OWNER to postgres;
	
--Table ms_user	
CREATE TABLE IF NOT EXISTS public.ms_user
(
    id integer NOT NULL DEFAULT nextval('ms_user_id_seq'::regclass),
    user_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean NOT NULL,
    CONSTRAINT ms_user_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ms_user
    OWNER to postgres;
	
--Table tr_bpkb
CREATE TABLE IF NOT EXISTS public.tr_bpkb
(
    agreement_number character varying(100) COLLATE pg_catalog."default" NOT NULL,
    bpkb_no character varying(100) COLLATE pg_catalog."default",
    branch_id character varying(10) COLLATE pg_catalog."default",
    bpkb_date timestamp without time zone,
    faktur_no character varying(100) COLLATE pg_catalog."default",
    faktur_date timestamp without time zone,
    location_id integer,
    police_no character varying(20) COLLATE pg_catalog."default",
    bpkb_date_in timestamp without time zone,
    created_by character varying(20) COLLATE pg_catalog."default",
    created_on timestamp without time zone,
    last_updated_by character varying(20) COLLATE pg_catalog."default",
    last_updated_on timestamp without time zone,
    CONSTRAINT tr_bpkb_pkey PRIMARY KEY (agreement_number),
    CONSTRAINT tr_bpkb_location_id_fkey FOREIGN KEY (location_id)
        REFERENCES public.ms_location_storage (location_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tr_bpkb
    OWNER to postgres;