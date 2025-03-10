PGDMP  )    0                {         	   veteriner    16.1    16.1 G    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17193 	   veteriner    DATABASE     }   CREATE DATABASE veteriner WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE veteriner;
                postgres    false            �            1259    17196    animal    TABLE     k  CREATE TABLE public.animal (
    animal_id bigint NOT NULL,
    animal_breed character varying(255) NOT NULL,
    animal_colour character varying(255),
    animal_bdate date,
    animal_gender character varying(255) NOT NULL,
    animal_name character varying(255) NOT NULL,
    animal_species character varying(255) NOT NULL,
    customer_id integer NOT NULL
);
    DROP TABLE public.animal;
       public         heap    postgres    false            �            1259    17194    animal_animal_id_seq    SEQUENCE     }   CREATE SEQUENCE public.animal_animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.animal_animal_id_seq;
       public          postgres    false    217            �           0    0    animal_animal_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.animal_animal_id_seq OWNED BY public.animal.animal_id;
          public          postgres    false    215            �            1259    17195    animal_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.animal_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.animal_customer_id_seq;
       public          postgres    false    217            �           0    0    animal_customer_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.animal_customer_id_seq OWNED BY public.animal.customer_id;
          public          postgres    false    216            �            1259    17208    appointment    TABLE     �   CREATE TABLE public.appointment (
    appointment_date_id bigint NOT NULL,
    appointment_date timestamp(6) without time zone NOT NULL,
    animal_id integer NOT NULL,
    doctor_id integer NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    17206    appointment_animal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointment_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.appointment_animal_id_seq;
       public          postgres    false    221            �           0    0    appointment_animal_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.appointment_animal_id_seq OWNED BY public.appointment.animal_id;
          public          postgres    false    219            �            1259    17205 #   appointment_appointment_date_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointment_appointment_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.appointment_appointment_date_id_seq;
       public          postgres    false    221            �           0    0 #   appointment_appointment_date_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.appointment_appointment_date_id_seq OWNED BY public.appointment.appointment_date_id;
          public          postgres    false    218            �            1259    17207    appointment_doctor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointment_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.appointment_doctor_id_seq;
       public          postgres    false    221            �           0    0    appointment_doctor_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.appointment_doctor_id_seq OWNED BY public.appointment.doctor_id;
          public          postgres    false    220            �            1259    17218    available_date    TABLE     �   CREATE TABLE public.available_date (
    available_date_id bigint NOT NULL,
    available_date date NOT NULL,
    doctor_id integer NOT NULL
);
 "   DROP TABLE public.available_date;
       public         heap    postgres    false            �            1259    17216 $   available_date_available_date_id_seq    SEQUENCE     �   CREATE SEQUENCE public.available_date_available_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.available_date_available_date_id_seq;
       public          postgres    false    224            �           0    0 $   available_date_available_date_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.available_date_available_date_id_seq OWNED BY public.available_date.available_date_id;
          public          postgres    false    222            �            1259    17217    available_date_doctor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.available_date_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.available_date_doctor_id_seq;
       public          postgres    false    224                        0    0    available_date_doctor_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.available_date_doctor_id_seq OWNED BY public.available_date.doctor_id;
          public          postgres    false    223            �            1259    17226    customer    TABLE     <  CREATE TABLE public.customer (
    customer_id bigint NOT NULL,
    customer_address character varying(150) NOT NULL,
    customer_city character varying(255),
    customer_mail character varying(100) NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_phone character varying(100) NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    17225    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    226                       0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    225            �            1259    17235    doctor    TABLE     .  CREATE TABLE public.doctor (
    doctor_id bigint NOT NULL,
    doctor_address character varying(150) NOT NULL,
    doctor_city character varying(255),
    doctor_mail character varying(100) NOT NULL,
    doctor_name character varying(100) NOT NULL,
    doctor_phone character varying(100) NOT NULL
);
    DROP TABLE public.doctor;
       public         heap    postgres    false            �            1259    17234    doctor_doctor_id_seq    SEQUENCE     }   CREATE SEQUENCE public.doctor_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.doctor_doctor_id_seq;
       public          postgres    false    228                       0    0    doctor_doctor_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.doctor_doctor_id_seq OWNED BY public.doctor.doctor_id;
          public          postgres    false    227            �            1259    17245    vaccine    TABLE       CREATE TABLE public.vaccine (
    vaccine_id bigint NOT NULL,
    vaccine_code character varying(55) NOT NULL,
    vaccine_name character varying(100) NOT NULL,
    vaccine_finish_date date NOT NULL,
    vaccine_start_date date NOT NULL,
    animal_id integer NOT NULL
);
    DROP TABLE public.vaccine;
       public         heap    postgres    false            �            1259    17244    vaccine_animal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vaccine_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.vaccine_animal_id_seq;
       public          postgres    false    231                       0    0    vaccine_animal_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.vaccine_animal_id_seq OWNED BY public.vaccine.animal_id;
          public          postgres    false    230            �            1259    17243    vaccine_vaccine_id_seq    SEQUENCE        CREATE SEQUENCE public.vaccine_vaccine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.vaccine_vaccine_id_seq;
       public          postgres    false    231                       0    0    vaccine_vaccine_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.vaccine_vaccine_id_seq OWNED BY public.vaccine.vaccine_id;
          public          postgres    false    229            8           2604    17199    animal animal_id    DEFAULT     t   ALTER TABLE ONLY public.animal ALTER COLUMN animal_id SET DEFAULT nextval('public.animal_animal_id_seq'::regclass);
 ?   ALTER TABLE public.animal ALTER COLUMN animal_id DROP DEFAULT;
       public          postgres    false    215    217    217            9           2604    17200    animal customer_id    DEFAULT     x   ALTER TABLE ONLY public.animal ALTER COLUMN customer_id SET DEFAULT nextval('public.animal_customer_id_seq'::regclass);
 A   ALTER TABLE public.animal ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    216    217    217            :           2604    17211    appointment appointment_date_id    DEFAULT     �   ALTER TABLE ONLY public.appointment ALTER COLUMN appointment_date_id SET DEFAULT nextval('public.appointment_appointment_date_id_seq'::regclass);
 N   ALTER TABLE public.appointment ALTER COLUMN appointment_date_id DROP DEFAULT;
       public          postgres    false    221    218    221            ;           2604    17212    appointment animal_id    DEFAULT     ~   ALTER TABLE ONLY public.appointment ALTER COLUMN animal_id SET DEFAULT nextval('public.appointment_animal_id_seq'::regclass);
 D   ALTER TABLE public.appointment ALTER COLUMN animal_id DROP DEFAULT;
       public          postgres    false    221    219    221            <           2604    17213    appointment doctor_id    DEFAULT     ~   ALTER TABLE ONLY public.appointment ALTER COLUMN doctor_id SET DEFAULT nextval('public.appointment_doctor_id_seq'::regclass);
 D   ALTER TABLE public.appointment ALTER COLUMN doctor_id DROP DEFAULT;
       public          postgres    false    221    220    221            =           2604    17221     available_date available_date_id    DEFAULT     �   ALTER TABLE ONLY public.available_date ALTER COLUMN available_date_id SET DEFAULT nextval('public.available_date_available_date_id_seq'::regclass);
 O   ALTER TABLE public.available_date ALTER COLUMN available_date_id DROP DEFAULT;
       public          postgres    false    224    222    224            >           2604    17222    available_date doctor_id    DEFAULT     �   ALTER TABLE ONLY public.available_date ALTER COLUMN doctor_id SET DEFAULT nextval('public.available_date_doctor_id_seq'::regclass);
 G   ALTER TABLE public.available_date ALTER COLUMN doctor_id DROP DEFAULT;
       public          postgres    false    223    224    224            ?           2604    17229    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    226    225    226            @           2604    17238    doctor doctor_id    DEFAULT     t   ALTER TABLE ONLY public.doctor ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctor_doctor_id_seq'::regclass);
 ?   ALTER TABLE public.doctor ALTER COLUMN doctor_id DROP DEFAULT;
       public          postgres    false    228    227    228            A           2604    17248    vaccine vaccine_id    DEFAULT     x   ALTER TABLE ONLY public.vaccine ALTER COLUMN vaccine_id SET DEFAULT nextval('public.vaccine_vaccine_id_seq'::regclass);
 A   ALTER TABLE public.vaccine ALTER COLUMN vaccine_id DROP DEFAULT;
       public          postgres    false    231    229    231            B           2604    17249    vaccine animal_id    DEFAULT     v   ALTER TABLE ONLY public.vaccine ALTER COLUMN animal_id SET DEFAULT nextval('public.vaccine_animal_id_seq'::regclass);
 @   ALTER TABLE public.vaccine ALTER COLUMN animal_id DROP DEFAULT;
       public          postgres    false    230    231    231            �          0    17196    animal 
   TABLE DATA           �   COPY public.animal (animal_id, animal_breed, animal_colour, animal_bdate, animal_gender, animal_name, animal_species, customer_id) FROM stdin;
    public          postgres    false    217   �U       �          0    17208    appointment 
   TABLE DATA           b   COPY public.appointment (appointment_date_id, appointment_date, animal_id, doctor_id) FROM stdin;
    public          postgres    false    221   �V       �          0    17218    available_date 
   TABLE DATA           V   COPY public.available_date (available_date_id, available_date, doctor_id) FROM stdin;
    public          postgres    false    224   �V       �          0    17226    customer 
   TABLE DATA           ~   COPY public.customer (customer_id, customer_address, customer_city, customer_mail, customer_name, customer_phone) FROM stdin;
    public          postgres    false    226   @W       �          0    17235    doctor 
   TABLE DATA           p   COPY public.doctor (doctor_id, doctor_address, doctor_city, doctor_mail, doctor_name, doctor_phone) FROM stdin;
    public          postgres    false    228   ZX       �          0    17245    vaccine 
   TABLE DATA           }   COPY public.vaccine (vaccine_id, vaccine_code, vaccine_name, vaccine_finish_date, vaccine_start_date, animal_id) FROM stdin;
    public          postgres    false    231   RY                  0    0    animal_animal_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.animal_animal_id_seq', 5, true);
          public          postgres    false    215                       0    0    animal_customer_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.animal_customer_id_seq', 1, false);
          public          postgres    false    216                       0    0    appointment_animal_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.appointment_animal_id_seq', 1, false);
          public          postgres    false    219                       0    0 #   appointment_appointment_date_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.appointment_appointment_date_id_seq', 5, true);
          public          postgres    false    218            	           0    0    appointment_doctor_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.appointment_doctor_id_seq', 1, false);
          public          postgres    false    220            
           0    0 $   available_date_available_date_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.available_date_available_date_id_seq', 5, true);
          public          postgres    false    222                       0    0    available_date_doctor_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.available_date_doctor_id_seq', 1, false);
          public          postgres    false    223                       0    0    customer_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_customer_id_seq', 6, true);
          public          postgres    false    225                       0    0    doctor_doctor_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.doctor_doctor_id_seq', 5, true);
          public          postgres    false    227                       0    0    vaccine_animal_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.vaccine_animal_id_seq', 1, false);
          public          postgres    false    230                       0    0    vaccine_vaccine_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.vaccine_vaccine_id_seq', 6, true);
          public          postgres    false    229            D           2606    17204    animal animal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (animal_id);
 <   ALTER TABLE ONLY public.animal DROP CONSTRAINT animal_pkey;
       public            postgres    false    217            F           2606    17215    appointment appointment_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (appointment_date_id);
 F   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_pkey;
       public            postgres    false    221            H           2606    17224 "   available_date available_date_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.available_date
    ADD CONSTRAINT available_date_pkey PRIMARY KEY (available_date_id);
 L   ALTER TABLE ONLY public.available_date DROP CONSTRAINT available_date_pkey;
       public            postgres    false    224            J           2606    17233    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    226            L           2606    17242    doctor doctor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctor_id);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            postgres    false    228            N           2606    17251    vaccine vaccine_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.vaccine
    ADD CONSTRAINT vaccine_pkey PRIMARY KEY (vaccine_id);
 >   ALTER TABLE ONLY public.vaccine DROP CONSTRAINT vaccine_pkey;
       public            postgres    false    231            P           2606    17257 '   appointment fk2kkeptdxfuextg5ch7xp3ytie    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk2kkeptdxfuextg5ch7xp3ytie FOREIGN KEY (animal_id) REFERENCES public.animal(animal_id);
 Q   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fk2kkeptdxfuextg5ch7xp3ytie;
       public          postgres    false    4676    221    217            O           2606    17252 "   animal fk6pvxm5gfjqxclb651be9unswe    FK CONSTRAINT     �   ALTER TABLE ONLY public.animal
    ADD CONSTRAINT fk6pvxm5gfjqxclb651be9unswe FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 L   ALTER TABLE ONLY public.animal DROP CONSTRAINT fk6pvxm5gfjqxclb651be9unswe;
       public          postgres    false    226    4682    217            R           2606    17267 *   available_date fkk0d6pu1wxarsoou0x2e1cc2on    FK CONSTRAINT     �   ALTER TABLE ONLY public.available_date
    ADD CONSTRAINT fkk0d6pu1wxarsoou0x2e1cc2on FOREIGN KEY (doctor_id) REFERENCES public.doctor(doctor_id);
 T   ALTER TABLE ONLY public.available_date DROP CONSTRAINT fkk0d6pu1wxarsoou0x2e1cc2on;
       public          postgres    false    228    4684    224            S           2606    17272 #   vaccine fkne3kmh8y5pcyxwl4u2w9prw6j    FK CONSTRAINT     �   ALTER TABLE ONLY public.vaccine
    ADD CONSTRAINT fkne3kmh8y5pcyxwl4u2w9prw6j FOREIGN KEY (animal_id) REFERENCES public.animal(animal_id);
 M   ALTER TABLE ONLY public.vaccine DROP CONSTRAINT fkne3kmh8y5pcyxwl4u2w9prw6j;
       public          postgres    false    217    4676    231            Q           2606    17262 '   appointment fkoeb98n82eph1dx43v3y2bcmsl    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fkoeb98n82eph1dx43v3y2bcmsl FOREIGN KEY (doctor_id) REFERENCES public.doctor(doctor_id);
 Q   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fkoeb98n82eph1dx43v3y2bcmsl;
       public          postgres    false    228    4684    221            �   �   x�M�;�0D��)���v¯�4 !R��,�Xql�w��b��ތ��[Mn��.�R����s1�R����CX�$LAa��� #s�V����1l�ha�#�;P,��B�nPTt�(h�,��(�53.%Oħ��e}��R�Rh:�W��Yz\�&�y[�LTI6�5j��,*_z��/�\�\�?���=>\I6*Sv2�^��P�      �   K   x�U��� C�s<P�Ug��s�Q*��$�\Q��,~?�sF#�%��Kd�\�S����Eȳ�~t�� p�      �   5   x�EǱ  �:������ϡ�|���B����bV����9~�_O#y�      �   
  x�}��N�0E��W�V��8V ��""AC3J�p�ȉ���Q��[�Gw���V�ҵ�y=��M9)�\����~nפ��m��"!��J)�$X#��ݢx��Sz�v����"0�h�
SP���m�^����B�c����k̍G�lY��8cJ-�>��Ƈ�1�	�c�QP�<�辀N�*%�PE�/|n�Er���d�4t��+�W8�\�ZrTV��v����2��?�������]�w��o����      �   �   x�e��N�0����'����h�Z	��+�Y�cGN�x|�p̜F��O��P����	��nN.��|}Z&w���L�^�8�9ح)p!�.s��d�o.vwx5�ބ��ǰİ�����U����$p��z���=t&�%�`�bcf&Ygv����R��)�O.��{h��0��%S<��AUUu]7YL�0����m��6��hXgL�{J;�m�A)��.��G��7lj1      �   �   x��ϱ
�0��9�)|��ܘt� 8��S�TR��j#�O�hłn�~��8IY1��T���Rum�&�qA�S��3\���4������d��n��H�(�MI��2��$s�n�5j?)��� H��0y�	f��8m�[���uҧ I�b��h���yu�M��E����p��
8 �M�W^     