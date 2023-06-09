PGDMP         0                {            alfagift-api    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    alfagift-api    DATABASE     �   CREATE DATABASE "alfagift-api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "alfagift-api";
                postgres    false            �            1259    16400    tb_master_user    TABLE       CREATE TABLE public.tb_master_user (
    id bigint NOT NULL,
    alamat character varying(255),
    email character varying(255) NOT NULL,
    jenis_kelamin character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    tgl_lahir date,
    role_id bigint NOT NULL
);
 "   DROP TABLE public.tb_master_user;
       public         heap    postgres    false            �            1259    16399    tb_master_user_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.tb_master_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_master_user_id_seq;
       public          postgres    false    215                       0    0    tb_master_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_master_user_id_seq OWNED BY public.tb_master_user.id;
          public          postgres    false    214            �            1259    16409    tb_master_user_role    TABLE     �   CREATE TABLE public.tb_master_user_role (
    id bigint NOT NULL,
    role_name character varying(255) NOT NULL,
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 '   DROP TABLE public.tb_master_user_role;
       public         heap    postgres    false            �            1259    16408    tb_master_user_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_master_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tb_master_user_role_id_seq;
       public          postgres    false    217                       0    0    tb_master_user_role_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tb_master_user_role_id_seq OWNED BY public.tb_master_user_role.id;
          public          postgres    false    216            �            1259    16474    tb_master_user_role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_master_user_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tb_master_user_role_role_id_seq;
       public          postgres    false    217                       0    0    tb_master_user_role_role_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tb_master_user_role_role_id_seq OWNED BY public.tb_master_user_role.role_id;
          public          postgres    false    218            �            1259    16491    tb_master_user_role_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_master_user_role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tb_master_user_role_user_id_seq;
       public          postgres    false    217                       0    0    tb_master_user_role_user_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tb_master_user_role_user_id_seq OWNED BY public.tb_master_user_role.user_id;
          public          postgres    false    219            l           2604    16403    tb_master_user id    DEFAULT     v   ALTER TABLE ONLY public.tb_master_user ALTER COLUMN id SET DEFAULT nextval('public.tb_master_user_id_seq'::regclass);
 @   ALTER TABLE public.tb_master_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            m           2604    16461    tb_master_user_role id    DEFAULT     �   ALTER TABLE ONLY public.tb_master_user_role ALTER COLUMN id SET DEFAULT nextval('public.tb_master_user_role_id_seq'::regclass);
 E   ALTER TABLE public.tb_master_user_role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            n           2604    16475    tb_master_user_role role_id    DEFAULT     �   ALTER TABLE ONLY public.tb_master_user_role ALTER COLUMN role_id SET DEFAULT nextval('public.tb_master_user_role_role_id_seq'::regclass);
 J   ALTER TABLE public.tb_master_user_role ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    218    217            o           2604    16492    tb_master_user_role user_id    DEFAULT     �   ALTER TABLE ONLY public.tb_master_user_role ALTER COLUMN user_id SET DEFAULT nextval('public.tb_master_user_role_user_id_seq'::regclass);
 J   ALTER TABLE public.tb_master_user_role ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    219    217            
          0    16400    tb_master_user 
   TABLE DATA           d   COPY public.tb_master_user (id, alamat, email, jenis_kelamin, nama, tgl_lahir, role_id) FROM stdin;
    public          postgres    false    215   �%                 0    16409    tb_master_user_role 
   TABLE DATA           N   COPY public.tb_master_user_role (id, role_name, role_id, user_id) FROM stdin;
    public          postgres    false    217   f&                  0    0    tb_master_user_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_master_user_id_seq', 11, true);
          public          postgres    false    214                       0    0    tb_master_user_role_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tb_master_user_role_id_seq', 15, true);
          public          postgres    false    216                       0    0    tb_master_user_role_role_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tb_master_user_role_role_id_seq', 15, true);
          public          postgres    false    218                       0    0    tb_master_user_role_user_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tb_master_user_role_user_id_seq', 15, true);
          public          postgres    false    219            q           2606    16407 "   tb_master_user tb_master_user_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_master_user
    ADD CONSTRAINT tb_master_user_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tb_master_user DROP CONSTRAINT tb_master_user_pkey;
       public            postgres    false    215            u           2606    16463 ,   tb_master_user_role tb_master_user_role_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tb_master_user_role
    ADD CONSTRAINT tb_master_user_role_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.tb_master_user_role DROP CONSTRAINT tb_master_user_role_pkey;
       public            postgres    false    217            s           2606    16416 +   tb_master_user uk_e3f6xuicskkotk3k8euowmh60 
   CONSTRAINT     g   ALTER TABLE ONLY public.tb_master_user
    ADD CONSTRAINT uk_e3f6xuicskkotk3k8euowmh60 UNIQUE (email);
 U   ALTER TABLE ONLY public.tb_master_user DROP CONSTRAINT uk_e3f6xuicskkotk3k8euowmh60;
       public            postgres    false    215            w           2606    16418 0   tb_master_user_role uk_hgfveo3y2ysx8rop8eh5qaaj0 
   CONSTRAINT     p   ALTER TABLE ONLY public.tb_master_user_role
    ADD CONSTRAINT uk_hgfveo3y2ysx8rop8eh5qaaj0 UNIQUE (role_name);
 Z   ALTER TABLE ONLY public.tb_master_user_role DROP CONSTRAINT uk_hgfveo3y2ysx8rop8eh5qaaj0;
       public            postgres    false    217            x           2606    16464 *   tb_master_user fk9lq7rv9i3eqkykeb4h54llo8o    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_master_user
    ADD CONSTRAINT fk9lq7rv9i3eqkykeb4h54llo8o FOREIGN KEY (role_id) REFERENCES public.tb_master_user_role(id);
 T   ALTER TABLE ONLY public.tb_master_user DROP CONSTRAINT fk9lq7rv9i3eqkykeb4h54llo8o;
       public          postgres    false    217    215    3189            y           2606    16481 /   tb_master_user_role fkiu42qx5k6g9e2jn5sth5hnppd    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_master_user_role
    ADD CONSTRAINT fkiu42qx5k6g9e2jn5sth5hnppd FOREIGN KEY (id) REFERENCES public.tb_master_user_role(id);
 Y   ALTER TABLE ONLY public.tb_master_user_role DROP CONSTRAINT fkiu42qx5k6g9e2jn5sth5hnppd;
       public          postgres    false    217    3189    217            z           2606    16498 /   tb_master_user_role fkmxrw7ytehgjv1ytifyiqj60gf    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_master_user_role
    ADD CONSTRAINT fkmxrw7ytehgjv1ytifyiqj60gf FOREIGN KEY (role_id) REFERENCES public.tb_master_user_role(id);
 Y   ALTER TABLE ONLY public.tb_master_user_role DROP CONSTRAINT fkmxrw7ytehgjv1ytifyiqj60gf;
       public          postgres    false    3189    217    217            
   f   x�3�,��M-�H-JU�/K-R(�HU(J��K�/�L�M��q(I-�K����I�������y�
ƜF�� d�i�e�ͤ��<�)F��b5Ĉ+F��� (�-Y         =   x�3�t�4�4�2�tL����4�4�2�tI-K��/H-�4�4�24�,I-�R��\1z\\\ LL�     