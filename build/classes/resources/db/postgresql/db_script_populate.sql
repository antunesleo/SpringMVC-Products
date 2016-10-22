PGDMP     :                	    t           springmvc-product    9.5.4    9.5.4     _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            a           1262    73746    springmvc-product    DATABASE     �   CREATE DATABASE "springmvc-product" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
 #   DROP DATABASE "springmvc-product";
          
   antunesleo    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            b           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            c           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12397    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            d           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    73770    product    TABLE     s  CREATE TABLE product (
    id integer NOT NULL,
    name character varying(50),
    description character varying(255),
    isactive boolean,
    category character varying(50),
    untperpallet numeric,
    guaranteedays numeric(10,0),
    uom character varying(50),
    ismanufactured boolean,
    issold boolean,
    isdiscontinued boolean,
    price numeric(10,2)
);
    DROP TABLE public.product;
       public      
   antunesleo    false    6            �            1259    73768    product_id_seq    SEQUENCE     p   CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public    
   antunesleo    false    182    6            e           0    0    product_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE product_id_seq OWNED BY product.id;
            public    
   antunesleo    false    181            �           2604    73773    id    DEFAULT     Z   ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public    
   antunesleo    false    182    181    182            \          0    73770    product 
   TABLE DATA                     public    
   antunesleo    false    182   +       f           0    0    product_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('product_id_seq', 1, false);
            public    
   antunesleo    false    181            �           2606    73778    product_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public      
   antunesleo    false    182    182            \   �   x�e��
�P��>��Y �1h�BB
����wA����R��/��-��o朢��S����PZ
�X\��s^a�D���<c+Ïk,cz�࿃W�$$i��1^P��ecI�к���H}'H��0���7X����$�#�~����gm�7~%�z���Mo5KEl     