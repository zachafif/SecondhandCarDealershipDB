PGDMP         "                |            postgres    14.9    14.9 B    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    13754    postgres    DATABASE     h   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE postgres;
                postgres    false            :           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3385                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            ;           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            N           1247    16401    mpaa_rating    TYPE     a   CREATE TYPE public.mpaa_rating AS ENUM (
    'G',
    'PG',
    'PG-13',
    'R',
    'NC-17'
);
    DROP TYPE public.mpaa_rating;
       public          postgres    false            Q           1247    16412    year    DOMAIN     k   CREATE DOMAIN public.year AS integer
	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));
    DROP DOMAIN public.year;
       public          postgres    false            �            1255    16414    _group_concat(text, text)    FUNCTION     �   CREATE FUNCTION public._group_concat(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT CASE
  WHEN $2 IS NULL THEN $1
  WHEN $1 IS NULL THEN $2
  ELSE $1 || ', ' || $2
END
$_$;
 0   DROP FUNCTION public._group_concat(text, text);
       public          postgres    false            �            1255    24660 6   euclidian_distance(numeric, numeric, numeric, numeric)    FUNCTION       CREATE FUNCTION public.euclidian_distance(lon1 numeric, lat1 numeric, lon2 numeric, lat2 numeric) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
	distance float;

BEGIN
	distance=SQRT(POWER(lat2 - lat1, 2) + POWER(lon2 - lon1, 2));
	RETURN distance;
END
$$;
 a   DROP FUNCTION public.euclidian_distance(lon1 numeric, lat1 numeric, lon2 numeric, lat2 numeric);
       public          postgres    false            �            1255    16579    last_updated()    FUNCTION     �   CREATE FUNCTION public.last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $$;
 %   DROP FUNCTION public.last_updated();
       public          postgres    false            e           1255    16415    group_concat(text) 	   AGGREGATE     c   CREATE AGGREGATE public.group_concat(text) (
    SFUNC = public._group_concat,
    STYPE = text
);
 *   DROP AGGREGATE public.group_concat(text);
       public          postgres    false    231            �            1259    16394    actor_actor_id_seq    SEQUENCE     {   CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.actor_actor_id_seq;
       public          postgres    false            �            1259    16447    address_address_id_seq    SEQUENCE        CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.address_address_id_seq;
       public          postgres    false            �            1259    24606    bid    TABLE     �   CREATE TABLE public.bid (
    bid_id integer NOT NULL,
    bid_date date NOT NULL,
    product_id integer NOT NULL,
    buyer_id integer NOT NULL,
    bid_price integer NOT NULL
);
    DROP TABLE public.bid;
       public         heap    postgres    false            �            1259    24605    bid_bid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.bid_bid_id_seq;
       public          postgres    false    224            <           0    0    bid_bid_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.bid_bid_id_seq OWNED BY public.bid.bid_id;
          public          postgres    false    223            �            1259    24669    buyer    TABLE     �   CREATE TABLE public.buyer (
    buyer_id integer NOT NULL,
    buyer_name character(50) NOT NULL,
    contact character(100),
    domicile integer
);
    DROP TABLE public.buyer;
       public         heap    postgres    false            �            1259    24668    buyer_buyer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buyer_buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.buyer_buyer_id_seq;
       public          postgres    false    230            =           0    0    buyer_buyer_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.buyer_buyer_id_seq OWNED BY public.buyer.buyer_id;
          public          postgres    false    229            �            1259    16416    category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_category_id_seq;
       public          postgres    false            �            1259    24647    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    nama_kota character(50),
    latitude numeric(10,6),
    longitude numeric(10,6)
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    16453    city_city_id_seq    SEQUENCE     y   CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.city_city_id_seq;
       public          postgres    false            �            1259    16459    country_country_id_seq    SEQUENCE        CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.country_country_id_seq;
       public          postgres    false            �            1259    16465    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false            �            1259    16422    film_film_id_seq    SEQUENCE     y   CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.film_film_id_seq;
       public          postgres    false            �            1259    16478    inventory_inventory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inventory_inventory_id_seq;
       public          postgres    false            �            1259    16484    language_language_id_seq    SEQUENCE     �   CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.language_language_id_seq;
       public          postgres    false            �            1259    16495    payment_payment_id_seq    SEQUENCE        CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false            �            1259    24642    product    TABLE     ;  CREATE TABLE public.product (
    product_id integer NOT NULL,
    brand character(10),
    model character(20),
    body_type character(20),
    year public.year,
    price integer,
    trans_type character(10),
    colour character(50),
    milleage integer,
    seller_id integer NOT NULL,
    post_date date
);
    DROP TABLE public.product;
       public         heap    postgres    false    849            �            1259    16537    rental_rental_id_seq    SEQUENCE     }   CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.rental_rental_id_seq;
       public          postgres    false            �            1259    24662    seller    TABLE     �   CREATE TABLE public.seller (
    seller_id integer NOT NULL,
    seller_name character(50) NOT NULL,
    contact character(100),
    domicile integer
);
    DROP TABLE public.seller;
       public         heap    postgres    false            �            1259    24661    seller_seller_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seller_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.seller_seller_id_seq;
       public          postgres    false    228            >           0    0    seller_seller_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.seller_seller_id_seq OWNED BY public.seller.seller_id;
          public          postgres    false    227            �            1259    16548    staff_staff_id_seq    SEQUENCE     {   CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.staff_staff_id_seq;
       public          postgres    false            �            1259    16557    store_store_id_seq    SEQUENCE     {   CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.store_store_id_seq;
       public          postgres    false            �           2604    24609 
   bid bid_id    DEFAULT     h   ALTER TABLE ONLY public.bid ALTER COLUMN bid_id SET DEFAULT nextval('public.bid_bid_id_seq'::regclass);
 9   ALTER TABLE public.bid ALTER COLUMN bid_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    24672    buyer buyer_id    DEFAULT     p   ALTER TABLE ONLY public.buyer ALTER COLUMN buyer_id SET DEFAULT nextval('public.buyer_buyer_id_seq'::regclass);
 =   ALTER TABLE public.buyer ALTER COLUMN buyer_id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    24665    seller seller_id    DEFAULT     t   ALTER TABLE ONLY public.seller ALTER COLUMN seller_id SET DEFAULT nextval('public.seller_seller_id_seq'::regclass);
 ?   ALTER TABLE public.seller ALTER COLUMN seller_id DROP DEFAULT;
       public          postgres    false    227    228    228            -          0    24606    bid 
   TABLE DATA           P   COPY public.bid (bid_id, bid_date, product_id, buyer_id, bid_price) FROM stdin;
    public          postgres    false    224   �F       3          0    24669    buyer 
   TABLE DATA           H   COPY public.buyer (buyer_id, buyer_name, contact, domicile) FROM stdin;
    public          postgres    false    230   4J       /          0    24647    city 
   TABLE DATA           G   COPY public.city (city_id, nama_kota, latitude, longitude) FROM stdin;
    public          postgres    false    226   CP       .          0    24642    product 
   TABLE DATA           �   COPY public.product (product_id, brand, model, body_type, year, price, trans_type, colour, milleage, seller_id, post_date) FROM stdin;
    public          postgres    false    225   �Q       1          0    24662    seller 
   TABLE DATA           K   COPY public.seller (seller_id, seller_name, contact, domicile) FROM stdin;
    public          postgres    false    228   4V       ?           0    0    actor_actor_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.actor_actor_id_seq', 1, false);
          public          postgres    false    210            @           0    0    address_address_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.address_address_id_seq', 1, false);
          public          postgres    false    213            A           0    0    bid_bid_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bid_bid_id_seq', 101, true);
          public          postgres    false    223            B           0    0    buyer_buyer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.buyer_buyer_id_seq', 50, true);
          public          postgres    false    229            C           0    0    category_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);
          public          postgres    false    211            D           0    0    city_city_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);
          public          postgres    false    214            E           0    0    country_country_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.country_country_id_seq', 1, false);
          public          postgres    false    215            F           0    0    customer_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customer_customer_id_seq', 1, false);
          public          postgres    false    216            G           0    0    film_film_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.film_film_id_seq', 1, false);
          public          postgres    false    212            H           0    0    inventory_inventory_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 1, false);
          public          postgres    false    217            I           0    0    language_language_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.language_language_id_seq', 1, false);
          public          postgres    false    218            J           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);
          public          postgres    false    219            K           0    0    rental_rental_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.rental_rental_id_seq', 1, false);
          public          postgres    false    220            L           0    0    seller_seller_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.seller_seller_id_seq', 50, true);
          public          postgres    false    227            M           0    0    staff_staff_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.staff_staff_id_seq', 1, false);
          public          postgres    false    221            N           0    0    store_store_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.store_store_id_seq', 1, false);
          public          postgres    false    222            �           2606    24611    bid bid_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (bid_id);
 6   ALTER TABLE ONLY public.bid DROP CONSTRAINT bid_pkey;
       public            postgres    false    224            �           2606    24674    buyer buyer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (buyer_id);
 :   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_pkey;
       public            postgres    false    230            �           2606    24651    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    226            �           2606    24646    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    225            �           2606    24667    seller seller_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (seller_id);
 <   ALTER TABLE ONLY public.seller DROP CONSTRAINT seller_pkey;
       public            postgres    false    228            -   �  x�UVkns;����\ـ_{��_�7М�TUT�`�<��I{�=�ٛ�&g����7����>�~c���)c���}c�CJSC�����m�:|�\��zĿ׬�r63� �)��̓��Nm�b�y���^�X�?֛�2�ڛF7C�Ԩ�B�c�\܁ ~qm�\@��F3|}2ײ���zK%��f���X<��Ȝ�8Ƀ��񊓷qx+
�_\�M�_D?.��d驖��+��o�ܡ$��"5@��*eT��H	�0�Ј�vo��6I�$4�G殌j �1��.�G; #��@vT4��Β*WT�A���Ө�Hi"�����"V��`���d�G���B:S�J��&�@g�U�g����Otg����
=<V"s�ě��\SD�
L�.M-ڠ�<)`lՄ�\��T�i*U� �<���?d?6��-� u�~d��_���RNN�5�:;	�
jpB^{S��>����j�cҎS��ً��'�޵:o���yg�֚i<���3J?3��s������%1e�&Fs���Q�f�d�Q�3F���{��,(�`u��-VO�v�i�����$�7,�*��D�l]!�R�'�ZU�
N7�v���b�{�M��S���a�b�z�$ ����v

�C|V��.j9�]^��{���YS�� ;�J�F�A��&�9n����Η�{�ZL}��Uq��l5��˥�+�.�%���2��&�f��R1���O��Ta�[v���G�5�m�{��ސ��I��,����h
���Yq)ggĠ�kO���Ir�*=���3l}��^UY$ssD�9W�����T��3�Ѳ�$�v����ܫBb�nw2�g��}�ݕ��w�)R��ݺ��λ�4��iN?wo�gD^}��
QW��f,�P�R�����T��O      3   �  x��Y�n9=S_���
ܗ�c�D��1lxsaЊԶ���%���S$[���D>����^�{E����WC7T��ChN��I�2Z���̈G�~W���뇾�?�>�MFRk���J��+<�*�������%~�Uӕm�yW��g�B&���������À�7]�ۘÏ�މ<��-1��!xtcq�z|�)��Ƿ��쇗a?�	��gT+�ĒJ"�a��]h��,���ؕ���!5�L��=9��& �Ak�2���U~�gER+0�-eh�#:dϢK��-~�|1_ʞp�h�U&9s�k���=���h�{��%�T`f���A�E_7{Hڃ���^mޜ)c�e�/`�PC�x�����9{h���1���Y,��Y�q(/�h����O��{�n�����y
�\�AYx�@^&�]躘��쪩V��i��%V�j\�����$���e�-e��6{_�7�b<�Z�	��˱��ta
}�]�*ʂ���ЈO�%6�b+���b���it����f_z|C𥩛)����q h�|�Uf@�lW���7����fg�]�^h�?	tRcmd�L�Y��J|�i+��0	�10`�q�x��1��K�[����k|^���;	���/�0�2ɪ�j�i�[�>����mD�h@�0�ahE��9�Qap�.!aa��C=k�|:HS#�2������9�(��o��o��k���>�h�,���@�n^�:[o24������̣M��$�w��\o��k��Ф,,8�^s�r���*�ߋ�7�6�=-pU��w�&|�� Ԡ��x<�C��a��������a�8��PKL�&ƪӓ$�7nе������	��?�����:���k��}��ϗ�s��Sf 0+�A���]�\�vH���E;	�X_�Sh��x�م���tU�l[��Aj�=���9R`˕�6�C}CW� _���7;��2揇���c���L�����w��w��.)�k�D��o��BD}:�0����m����o̟a*,E���רc�I�o�
���f'A_Q	���m��P�q�A���D��z���參uSBgl��i�o�� �f]���ДX�s(��υI�-�5����\c��eQ��aע�C�p C�Tλ�����.1�8�F��/Ay�-��&���6k��l�?�����=���'�/3BS���9$j�E�~��z� �aZ��|I�Ega����?���y�y���׃����'�$J�s0�K)R�]n~���(������{#ڹ�3��2=}|	��w�	�)�DRz���#��G�ۮ����K��p�6���ӑ��w���k�B��6X����H�+�o���4*��(�� ����0�|�{�߆�������~� �p2����R:t���M�4Խ�4���PJ� �,˳a��
�+�̾o�x����ʙs�k������b�?�:�Y      /   ~  x��Խj�0�9z��@��Nw��Щ�PH;�\I	&�{����8�Lv���� ���׻G�kgϗ����Y݋�,1�
��L1p	o��^;]�!D�3�R��[lmֲd��%�s�x�m��k;�QaĬL��b����-I�#�X���_�|փ��9e/r�+ �*�/�f��Sg{?a����D�Jv������+]���k��I��9�k�km���:k�
��K���]����?=�p�հdL��b�4�þ�����e�}�,L�}��Գ���Q�s+6b`�a����VS�T��:m�[���.gM�!�a�S����=�(O'���c�N�V|��2y�k<|�G]�e/,Xl �C)��;�� \?��      .   S  x����j#I����"/।:_فa`a�̞`n:�I����wI�~���t%ۖ��EC�ʇ�K�K�e��?VW���W���U��O�����v5>8ު��t����ݕ������64� ��f��@"�+���{�t�v�7.��!�q�FY��\F��e���YX� �+t`z^.�I������=7`M����k�,;bH�2
�&E��X�M�2`���co�E`��DL'�kՁYʦ�l0#�_창?����.I?\�e`sQ� �̤���Ģ�\0Xk��a*J3%F	�2O!��.m�)�f"~'2d��nDV��ׇ��יd��N牟�\*�8�i	�ο���������������
&3�Ct?��J�k��Ȩ2U�Ǟ�L�
@�C	$��z�B�T1��^�a�J��?W�cu�q�?^?<�z�w�YЅ���s����#�c�0�WY:H�0Z2/�Yqɬ����08��hJeds��,d}R� 5�LI�����8���7��!K�e{���17���<,�k��f�N�DG&��d��C��&�a+��,4~5;fT�!�"=��a��D��MF:s�L6[�= �L&����>զ�������S�����7��3&Vm&7�~F:�O�d���gp�YR�`�tJf~ �	�L�j�zv��ƚa~�!�k�*�L�fM�7�\�G�2j�6��Ykͦ7 /�B~�?ݷ�����e�wV,:3�9Fè��h~�F6��f��i�˟����%1�L�崳n������6l2K'fS�
-���Y6��F��Vg0�N�J�d׿m&���p29���fg��k�̳���&�����ĝ9I��$S�;� Y��@?Ȍ�6n̨a�L�e-��̨d�c����3m�`2#������ۙ�1k` K#�dF�+���}�[�d]�4Y����g�5V�dF�J2jg�Pt�F=����dF�z2�� ���l8�f?k2#`��"U�/S��O7���nN/�ou�����X?��ܙ���X���=�j��fH&8I�㒅��d}m�f��@<.����
 Μ��l2��81��<Ǳ4���l����h}x�Mj�_�R�c��      1   �  x��Y�Nc7}v��Ή|�<r��0�ES�Ő4ǐ��s�(��nۤЪW� �Hh�K����;݌���7x��y�����'���z���A#B����A�k:b�`y<���޴�Yt�����"�!V�bI�*�x5}��������BbfIe��%�q��H����_��_�FFxڰC,��Ti^
�D��׮�C�.+�(-�e�2���ǆw���/��ͫ�ˁG8��Y��<�=9���=9<[��}�$fE��S0F�J�	D�Bq:v��{Wò�ԛ�H@�����#������ܪsw~�𭫷C�?��x���$#c�O87&��8��S���f��u�k3���j(�`siK�ʎ�(E7��pM7���@�0�YL�E���#���be���� �i���OH��J�!��U`��rh�MR��u��P�gH�4�->��f#*��w�s�M�3��>��j�X"w�T_�~\t��w�۰�.����X_b$?Ġ"�U���W�� �N|�;�߶w��W`�0�ZlDl	���Xu4Ϡ�.'}�_`6�Y��e�=�5a>|R��~A>@���zyD����l���������4���T���ό�;h�d��v��5����Gd�?F���#����M����Bڨ*4՗1�c|�y��,�����R��ab����̭����ܻ&
���Фo&�?X=��48��1���r��z�sPsB�woPc
-��_�D_����{7�y���Xڊ����D��T��8��ю_l�7���0�c#���������n���$��j�5��������o����6��(�7_�?$|��~i��,c߄I�E�5�6(o����U��B���c#N��OAB�>���z����`_$V����8��/��?�.z�u��*)xq}�,�c��x<m�����0��[,�)tۈ��9:z����9�[��{Ҏ_��RS��e�K���x���=�Exh���K���Ku�n�<��0��߫��6J,-f^�)�����ہ?��B+Ii��K�߸��W��Y.���U��``4��e��O���r�\��%�t�^�~p0X�3�+������vaC��wY?�c���T\���x?M"7���d�����V��2J������� ��M��儦��p>��bk
xS}K����:���"$|RF�`VJh]�W���~�w7��з�2��Ѕ�����͇@��������o�u�2�:[��D��a�tm����(!U�Q|���B�fE���m����BW�W���\���Y.B�%���w�����a��@��'�"����5�_�u-�O]h�|�/�Sa��O�@��ϴ�џ�vX�*�}����%A����j�����黡�Jmc%g8��o��h�l�ۇ     