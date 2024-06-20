PGDMP  :                    |         	   MASTER_DB    16.1    16.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24926 	   MASTER_DB    DATABASE     m   CREATE DATABASE "MASTER_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "MASTER_DB";
                postgres    false            �            1259    24937    ms_location_storage    TABLE     �   CREATE TABLE public.ms_location_storage (
    location_id integer NOT NULL,
    location_name character varying(255) NOT NULL
);
 '   DROP TABLE public.ms_location_storage;
       public         heap    postgres    false            �            1259    24936 #   ms_location_storage_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ms_location_storage_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.ms_location_storage_location_id_seq;
       public          postgres    false    218                       0    0 #   ms_location_storage_location_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.ms_location_storage_location_id_seq OWNED BY public.ms_location_storage.location_id;
          public          postgres    false    217            �            1259    24928    ms_user    TABLE     �   CREATE TABLE public.ms_user (
    id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_active boolean NOT NULL
);
    DROP TABLE public.ms_user;
       public         heap    postgres    false            �            1259    24927    ms_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ms_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ms_user_id_seq;
       public          postgres    false    216                        0    0    ms_user_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ms_user_id_seq OWNED BY public.ms_user.id;
          public          postgres    false    215            �            1259    24964    tr_bpkb    TABLE     7  CREATE TABLE public.tr_bpkb (
    agreement_number character varying(100) NOT NULL,
    bpkb_no character varying(100),
    branch_id character varying(10),
    bpkb_date timestamp without time zone,
    faktur_no character varying(100),
    faktur_date timestamp without time zone,
    location_id integer,
    police_no character varying(20),
    bpkb_date_in timestamp without time zone,
    created_by character varying(20),
    created_on timestamp without time zone,
    last_updated_by character varying(20),
    last_updated_on timestamp without time zone
);
    DROP TABLE public.tr_bpkb;
       public         heap    postgres    false            }           2604    24940    ms_location_storage location_id    DEFAULT     �   ALTER TABLE ONLY public.ms_location_storage ALTER COLUMN location_id SET DEFAULT nextval('public.ms_location_storage_location_id_seq'::regclass);
 N   ALTER TABLE public.ms_location_storage ALTER COLUMN location_id DROP DEFAULT;
       public          postgres    false    217    218    218            |           2604    24931 
   ms_user id    DEFAULT     h   ALTER TABLE ONLY public.ms_user ALTER COLUMN id SET DEFAULT nextval('public.ms_user_id_seq'::regclass);
 9   ALTER TABLE public.ms_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    24937    ms_location_storage 
   TABLE DATA           I   COPY public.ms_location_storage (location_id, location_name) FROM stdin;
    public          postgres    false    218   W                 0    24928    ms_user 
   TABLE DATA           E   COPY public.ms_user (id, user_name, password, is_active) FROM stdin;
    public          postgres    false    216   {                 0    24964    tr_bpkb 
   TABLE DATA           �   COPY public.tr_bpkb (agreement_number, bpkb_no, branch_id, bpkb_date, faktur_no, faktur_date, location_id, police_no, bpkb_date_in, created_by, created_on, last_updated_by, last_updated_on) FROM stdin;
    public          postgres    false    219   �       !           0    0 #   ms_location_storage_location_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.ms_location_storage_location_id_seq', 1, false);
          public          postgres    false    217            "           0    0    ms_user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ms_user_id_seq', 1, true);
          public          postgres    false    215            �           2606    24942 ,   ms_location_storage ms_location_storage_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.ms_location_storage
    ADD CONSTRAINT ms_location_storage_pkey PRIMARY KEY (location_id);
 V   ALTER TABLE ONLY public.ms_location_storage DROP CONSTRAINT ms_location_storage_pkey;
       public            postgres    false    218                       2606    24935    ms_user ms_user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ms_user
    ADD CONSTRAINT ms_user_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ms_user DROP CONSTRAINT ms_user_pkey;
       public            postgres    false    216            �           2606    24968    tr_bpkb tr_bpkb_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tr_bpkb
    ADD CONSTRAINT tr_bpkb_pkey PRIMARY KEY (agreement_number);
 >   ALTER TABLE ONLY public.tr_bpkb DROP CONSTRAINT tr_bpkb_pkey;
       public            postgres    false    219            �           2606    24969     tr_bpkb tr_bpkb_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tr_bpkb
    ADD CONSTRAINT tr_bpkb_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.ms_location_storage(location_id);
 J   ALTER TABLE ONLY public.tr_bpkb DROP CONSTRAINT tr_bpkb_location_id_fkey;
       public          postgres    false    219    3457    218                  x�3�,I-.����� ��         !   x�3�LL����4�0722�Ht�,����� Q��         z   x�+.)��K�,F���Lt�t���,�L,���	IT������.k	DzƦ��1~@�U�Z\b�h4�i��������������)�)�F�0��Lb�2�21�3�077������� �?Gh     