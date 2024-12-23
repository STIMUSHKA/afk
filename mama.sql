PGDMP  5                    |            afk    14.12    16.3 �   d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    25430    afk    DATABASE     w   CREATE DATABASE afk WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE afk;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            h           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    25585    admin_permissions    TABLE     �  CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 %   DROP TABLE public.admin_permissions;
       public         heap    postgres    false    4            �            1259    25584    admin_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public          postgres    false    4    236            i           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public          postgres    false    235                       1259    25804    admin_permissions_role_lnk    TABLE     �   CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);
 .   DROP TABLE public.admin_permissions_role_lnk;
       public         heap    postgres    false    4                       1259    25803 !   admin_permissions_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.admin_permissions_role_lnk_id_seq;
       public          postgres    false    274    4            j           0    0 !   admin_permissions_role_lnk_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;
          public          postgres    false    273            �            1259    25609    admin_roles    TABLE     �  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.admin_roles;
       public         heap    postgres    false    4            �            1259    25608    admin_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public          postgres    false    4    240            k           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public          postgres    false    239            �            1259    25597    admin_users    TABLE     �  CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.admin_users;
       public         heap    postgres    false    4            �            1259    25596    admin_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public          postgres    false    238    4            l           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public          postgres    false    237                       1259    25816    admin_users_roles_lnk    TABLE     �   CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);
 )   DROP TABLE public.admin_users_roles_lnk;
       public         heap    postgres    false    4                       1259    25815    admin_users_roles_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.admin_users_roles_lnk_id_seq;
       public          postgres    false    276    4            m           0    0    admin_users_roles_lnk_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;
          public          postgres    false    275            �            1259    25455    files    TABLE       CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.files;
       public         heap    postgres    false    4                       1259    25709    files_folder_lnk    TABLE     �   CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);
 $   DROP TABLE public.files_folder_lnk;
       public         heap    postgres    false    4                       1259    25708    files_folder_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.files_folder_lnk_id_seq;
       public          postgres    false    258    4            n           0    0    files_folder_lnk_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;
          public          postgres    false    257            �            1259    25454    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    216    4            o           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    215                        1259    25697    files_related_mph    TABLE     �   CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);
 %   DROP TABLE public.files_related_mph;
       public         heap    postgres    false    4            �            1259    25696    files_related_mph_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.files_related_mph_id_seq;
       public          postgres    false    4    256            p           0    0    files_related_mph_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;
          public          postgres    false    255                       1259    26181 	   fractions    TABLE     l  CREATE TABLE public.fractions (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.fractions;
       public         heap    postgres    false    4                       1259    26180    fractions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fractions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.fractions_id_seq;
       public          postgres    false    284    4            q           0    0    fractions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.fractions_id_seq OWNED BY public.fractions.id;
          public          postgres    false    283                       1259    26157    heroes    TABLE     �  CREATE TABLE public.heroes (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    awakened boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    type character varying(255),
    class character varying(255)
);
    DROP TABLE public.heroes;
       public         heap    postgres    false    4                       1259    26193    heroes_fraction_lnk    TABLE     �   CREATE TABLE public.heroes_fraction_lnk (
    id integer NOT NULL,
    hero_id integer,
    fraction_id integer,
    hero_ord double precision
);
 '   DROP TABLE public.heroes_fraction_lnk;
       public         heap    postgres    false    4                       1259    26192    heroes_fraction_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.heroes_fraction_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.heroes_fraction_lnk_id_seq;
       public          postgres    false    4    286            r           0    0    heroes_fraction_lnk_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.heroes_fraction_lnk_id_seq OWNED BY public.heroes_fraction_lnk.id;
          public          postgres    false    285                       1259    26156    heroes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.heroes_id_seq;
       public          postgres    false    4    282            s           0    0    heroes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.heroes_id_seq OWNED BY public.heroes.id;
          public          postgres    false    281            �            1259    25489    i18n_locale    TABLE     �  CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.i18n_locale;
       public         heap    postgres    false    4            �            1259    25488    i18n_locale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public          postgres    false    220    4            t           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public          postgres    false    219            �            1259    25633    strapi_api_token_permissions    TABLE     �  CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 0   DROP TABLE public.strapi_api_token_permissions;
       public         heap    postgres    false    4            �            1259    25632 #   strapi_api_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strapi_api_token_permissions_id_seq;
       public          postgres    false    4    244            u           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;
          public          postgres    false    243                       1259    25829 &   strapi_api_token_permissions_token_lnk    TABLE     �   CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);
 :   DROP TABLE public.strapi_api_token_permissions_token_lnk;
       public         heap    postgres    false    4                       1259    25828 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq;
       public          postgres    false    278    4            v           0    0 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;
          public          postgres    false    277            �            1259    25621    strapi_api_tokens    TABLE     Y  CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 %   DROP TABLE public.strapi_api_tokens;
       public         heap    postgres    false    4            �            1259    25620    strapi_api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public          postgres    false    242    4            w           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public          postgres    false    241            �            1259    25669    strapi_core_store_settings    TABLE     �   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap    postgres    false    4            �            1259    25668 !   strapi_core_store_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public          postgres    false    4    250            x           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public          postgres    false    249            �            1259    25446    strapi_database_schema    TABLE     �   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap    postgres    false    4            �            1259    25445    strapi_database_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public          postgres    false    214    4            y           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public          postgres    false    213            �            1259    25687    strapi_history_versions    TABLE     ]  CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);
 +   DROP TABLE public.strapi_history_versions;
       public         heap    postgres    false    4            �            1259    25686    strapi_history_versions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.strapi_history_versions_id_seq;
       public          postgres    false    4    254            z           0    0    strapi_history_versions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;
          public          postgres    false    253            �            1259    25432    strapi_migrations    TABLE     �   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap    postgres    false    4            �            1259    25431    strapi_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public          postgres    false    4    210            {           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public          postgres    false    209            �            1259    25439    strapi_migrations_internal    TABLE     �   CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 .   DROP TABLE public.strapi_migrations_internal;
       public         heap    postgres    false    4            �            1259    25438 !   strapi_migrations_internal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_migrations_internal_id_seq;
       public          postgres    false    212    4            |           0    0 !   strapi_migrations_internal_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;
          public          postgres    false    211            �            1259    25513    strapi_release_actions    TABLE     �  CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 *   DROP TABLE public.strapi_release_actions;
       public         heap    postgres    false    4            �            1259    25512    strapi_release_actions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_release_actions_id_seq;
       public          postgres    false    224    4            }           0    0    strapi_release_actions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;
          public          postgres    false    223                       1259    25733 "   strapi_release_actions_release_lnk    TABLE     �   CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);
 6   DROP TABLE public.strapi_release_actions_release_lnk;
       public         heap    postgres    false    4                       1259    25732 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.strapi_release_actions_release_lnk_id_seq;
       public          postgres    false    4    262            ~           0    0 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;
          public          postgres    false    261            �            1259    25501    strapi_releases    TABLE       CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 #   DROP TABLE public.strapi_releases;
       public         heap    postgres    false    4            �            1259    25500    strapi_releases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_releases_id_seq;
       public          postgres    false    222    4                       0    0    strapi_releases_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;
          public          postgres    false    221            �            1259    25657 !   strapi_transfer_token_permissions    TABLE     �  CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 5   DROP TABLE public.strapi_transfer_token_permissions;
       public         heap    postgres    false    4            �            1259    25656 (   strapi_transfer_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.strapi_transfer_token_permissions_id_seq;
       public          postgres    false    4    248            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;
          public          postgres    false    247                       1259    25841 +   strapi_transfer_token_permissions_token_lnk    TABLE     �   CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);
 ?   DROP TABLE public.strapi_transfer_token_permissions_token_lnk;
       public         heap    postgres    false    4                       1259    25840 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq;
       public          postgres    false    4    280            �           0    0 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;
          public          postgres    false    279            �            1259    25645    strapi_transfer_tokens    TABLE     =  CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 *   DROP TABLE public.strapi_transfer_tokens;
       public         heap    postgres    false    4            �            1259    25644    strapi_transfer_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_transfer_tokens_id_seq;
       public          postgres    false    246    4            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;
          public          postgres    false    245            �            1259    25678    strapi_webhooks    TABLE     �   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap    postgres    false    4            �            1259    25677    strapi_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public          postgres    false    252    4            �           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public          postgres    false    251            �            1259    25525    strapi_workflows    TABLE     �  CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 $   DROP TABLE public.strapi_workflows;
       public         heap    postgres    false    4            �            1259    25524    strapi_workflows_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.strapi_workflows_id_seq;
       public          postgres    false    226    4            �           0    0    strapi_workflows_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;
          public          postgres    false    225                       1259    25745 .   strapi_workflows_stage_required_to_publish_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);
 B   DROP TABLE public.strapi_workflows_stage_required_to_publish_lnk;
       public         heap    postgres    false    4                       1259    25744 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq;
       public          postgres    false    4    264            �           0    0 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;
          public          postgres    false    263            �            1259    25537    strapi_workflows_stages    TABLE     �  CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 +   DROP TABLE public.strapi_workflows_stages;
       public         heap    postgres    false    4            �            1259    25536    strapi_workflows_stages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.strapi_workflows_stages_id_seq;
       public          postgres    false    4    228            �           0    0    strapi_workflows_stages_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;
          public          postgres    false    227                       1259    25768 '   strapi_workflows_stages_permissions_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);
 ;   DROP TABLE public.strapi_workflows_stages_permissions_lnk;
       public         heap    postgres    false    4                       1259    25767 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq;
       public          postgres    false    268    4            �           0    0 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;
          public          postgres    false    267            
           1259    25756 $   strapi_workflows_stages_workflow_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);
 8   DROP TABLE public.strapi_workflows_stages_workflow_lnk;
       public         heap    postgres    false    4            	           1259    25755 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq;
       public          postgres    false    266    4            �           0    0 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;
          public          postgres    false    265            �            1259    25549    up_permissions    TABLE     s  CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 "   DROP TABLE public.up_permissions;
       public         heap    postgres    false    4            �            1259    25548    up_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public          postgres    false    4    230            �           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public          postgres    false    229                       1259    25780    up_permissions_role_lnk    TABLE     �   CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);
 +   DROP TABLE public.up_permissions_role_lnk;
       public         heap    postgres    false    4                       1259    25779    up_permissions_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.up_permissions_role_lnk_id_seq;
       public          postgres    false    4    270            �           0    0    up_permissions_role_lnk_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;
          public          postgres    false    269            �            1259    25561    up_roles    TABLE     �  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.up_roles;
       public         heap    postgres    false    4            �            1259    25560    up_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public          postgres    false    4    232            �           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public          postgres    false    231            �            1259    25573    up_users    TABLE     g  CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.up_users;
       public         heap    postgres    false    4            �            1259    25572    up_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public          postgres    false    234    4            �           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public          postgres    false    233                       1259    25792    up_users_role_lnk    TABLE     �   CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);
 %   DROP TABLE public.up_users_role_lnk;
       public         heap    postgres    false    4                       1259    25791    up_users_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.up_users_role_lnk_id_seq;
       public          postgres    false    272    4            �           0    0    up_users_role_lnk_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;
          public          postgres    false    271            �            1259    25473    upload_folders    TABLE     �  CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 "   DROP TABLE public.upload_folders;
       public         heap    postgres    false    4            �            1259    25472    upload_folders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.upload_folders_id_seq;
       public          postgres    false    218    4            �           0    0    upload_folders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;
          public          postgres    false    217                       1259    25721    upload_folders_parent_lnk    TABLE     �   CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);
 -   DROP TABLE public.upload_folders_parent_lnk;
       public         heap    postgres    false    4                       1259    25720     upload_folders_parent_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.upload_folders_parent_lnk_id_seq;
       public          postgres    false    260    4            �           0    0     upload_folders_parent_lnk_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;
          public          postgres    false    259                        1259    26244    user_heroes    TABLE     �  CREATE TABLE public.user_heroes (
    id integer NOT NULL,
    document_id character varying(255),
    signature_item integer,
    furniture integer,
    engraving integer,
    rarity character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.user_heroes;
       public         heap    postgres    false    4            "           1259    26256    user_heroes_hero_lnk    TABLE     u   CREATE TABLE public.user_heroes_hero_lnk (
    id integer NOT NULL,
    user_hero_id integer,
    hero_id integer
);
 (   DROP TABLE public.user_heroes_hero_lnk;
       public         heap    postgres    false    4            !           1259    26255    user_heroes_hero_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_heroes_hero_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.user_heroes_hero_lnk_id_seq;
       public          postgres    false    4    290            �           0    0    user_heroes_hero_lnk_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.user_heroes_hero_lnk_id_seq OWNED BY public.user_heroes_hero_lnk.id;
          public          postgres    false    289                       1259    26243    user_heroes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_heroes_id_seq;
       public          postgres    false    288    4            �           0    0    user_heroes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_heroes_id_seq OWNED BY public.user_heroes.id;
          public          postgres    false    287            $           1259    26267 &   user_heroes_users_permissions_user_lnk    TABLE     �   CREATE TABLE public.user_heroes_users_permissions_user_lnk (
    id integer NOT NULL,
    user_hero_id integer,
    user_id integer,
    user_hero_ord double precision
);
 :   DROP TABLE public.user_heroes_users_permissions_user_lnk;
       public         heap    postgres    false    4            #           1259    26266 -   user_heroes_users_permissions_user_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_heroes_users_permissions_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.user_heroes_users_permissions_user_lnk_id_seq;
       public          postgres    false    4    292            �           0    0 -   user_heroes_users_permissions_user_lnk_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.user_heroes_users_permissions_user_lnk_id_seq OWNED BY public.user_heroes_users_permissions_user_lnk.id;
          public          postgres    false    291            6           2604    25588    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            I           2604    25807    admin_permissions_role_lnk id    DEFAULT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);
 L   ALTER TABLE public.admin_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274            8           2604    25612    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            7           2604    25600    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            J           2604    25819    admin_users_roles_lnk id    DEFAULT     �   ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);
 G   ALTER TABLE public.admin_users_roles_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    275    276            ,           2604    25458    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            A           2604    25712    files_folder_lnk id    DEFAULT     z   ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);
 B   ALTER TABLE public.files_folder_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            @           2604    25700    files_related_mph id    DEFAULT     |   ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);
 C   ALTER TABLE public.files_related_mph ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            N           2604    26184    fractions id    DEFAULT     l   ALTER TABLE ONLY public.fractions ALTER COLUMN id SET DEFAULT nextval('public.fractions_id_seq'::regclass);
 ;   ALTER TABLE public.fractions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283    284            M           2604    26160 	   heroes id    DEFAULT     f   ALTER TABLE ONLY public.heroes ALTER COLUMN id SET DEFAULT nextval('public.heroes_id_seq'::regclass);
 8   ALTER TABLE public.heroes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    281    282            O           2604    26196    heroes_fraction_lnk id    DEFAULT     �   ALTER TABLE ONLY public.heroes_fraction_lnk ALTER COLUMN id SET DEFAULT nextval('public.heroes_fraction_lnk_id_seq'::regclass);
 E   ALTER TABLE public.heroes_fraction_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    285    286    286            .           2604    25492    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            :           2604    25636    strapi_api_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);
 N   ALTER TABLE public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            K           2604    25832 )   strapi_api_token_permissions_token_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);
 X   ALTER TABLE public.strapi_api_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    277    278    278            9           2604    25624    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            =           2604    25672    strapi_core_store_settings id    DEFAULT     �   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            +           2604    25449    strapi_database_schema id    DEFAULT     �   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            ?           2604    25690    strapi_history_versions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);
 I   ALTER TABLE public.strapi_history_versions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            )           2604    25435    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            *           2604    25442    strapi_migrations_internal id    DEFAULT     �   ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);
 L   ALTER TABLE public.strapi_migrations_internal ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            0           2604    25516    strapi_release_actions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);
 H   ALTER TABLE public.strapi_release_actions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            C           2604    25736 %   strapi_release_actions_release_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);
 T   ALTER TABLE public.strapi_release_actions_release_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            /           2604    25504    strapi_releases id    DEFAULT     x   ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);
 A   ALTER TABLE public.strapi_releases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            <           2604    25660 $   strapi_transfer_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);
 S   ALTER TABLE public.strapi_transfer_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            L           2604    25844 .   strapi_transfer_token_permissions_token_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);
 ]   ALTER TABLE public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    279    280    280            ;           2604    25648    strapi_transfer_tokens id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);
 H   ALTER TABLE public.strapi_transfer_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            >           2604    25681    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            1           2604    25528    strapi_workflows id    DEFAULT     z   ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);
 B   ALTER TABLE public.strapi_workflows ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            D           2604    25748 1   strapi_workflows_stage_required_to_publish_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);
 `   ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    264    264            2           2604    25540    strapi_workflows_stages id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);
 I   ALTER TABLE public.strapi_workflows_stages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            F           2604    25771 *   strapi_workflows_stages_permissions_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);
 Y   ALTER TABLE public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    268    268            E           2604    25759 '   strapi_workflows_stages_workflow_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);
 V   ALTER TABLE public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266            3           2604    25552    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            G           2604    25783    up_permissions_role_lnk id    DEFAULT     �   ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);
 I   ALTER TABLE public.up_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    270    270            4           2604    25564    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            5           2604    25576    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            H           2604    25795    up_users_role_lnk id    DEFAULT     |   ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);
 C   ALTER TABLE public.up_users_role_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    272    272            -           2604    25476    upload_folders id    DEFAULT     v   ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);
 @   ALTER TABLE public.upload_folders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            B           2604    25724    upload_folders_parent_lnk id    DEFAULT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);
 K   ALTER TABLE public.upload_folders_parent_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            P           2604    26247    user_heroes id    DEFAULT     p   ALTER TABLE ONLY public.user_heroes ALTER COLUMN id SET DEFAULT nextval('public.user_heroes_id_seq'::regclass);
 =   ALTER TABLE public.user_heroes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    288    287    288            Q           2604    26259    user_heroes_hero_lnk id    DEFAULT     �   ALTER TABLE ONLY public.user_heroes_hero_lnk ALTER COLUMN id SET DEFAULT nextval('public.user_heroes_hero_lnk_id_seq'::regclass);
 F   ALTER TABLE public.user_heroes_hero_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    290    289    290            R           2604    26270 )   user_heroes_users_permissions_user_lnk id    DEFAULT     �   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.user_heroes_users_permissions_user_lnk_id_seq'::regclass);
 X   ALTER TABLE public.user_heroes_users_permissions_user_lnk ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    292    291    292            )          0    25585    admin_permissions 
   TABLE DATA           �   COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    236   ��      O          0    25804    admin_permissions_role_lnk 
   TABLE DATA           `   COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
    public          postgres    false    274   �      -          0    25609    admin_roles 
   TABLE DATA           �   COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    240   ��      +          0    25597    admin_users 
   TABLE DATA             COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    238   ��      Q          0    25816    admin_users_roles_lnk 
   TABLE DATA           Y   COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
    public          postgres    false    276   ��                0    25455    files 
   TABLE DATA             COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    216   ��      ?          0    25709    files_folder_lnk 
   TABLE DATA           L   COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
    public          postgres    false    258   �      =          0    25697    files_related_mph 
   TABLE DATA           b   COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
    public          postgres    false    256         Y          0    26181 	   fractions 
   TABLE DATA           �   COPY public.fractions (id, document_id, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    284         W          0    26157    heroes 
   TABLE DATA           �   COPY public.heroes (id, document_id, name, awakened, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, type, class) FROM stdin;
    public          postgres    false    282   |	      [          0    26193    heroes_fraction_lnk 
   TABLE DATA           Q   COPY public.heroes_fraction_lnk (id, hero_id, fraction_id, hero_ord) FROM stdin;
    public          postgres    false    286   �*                0    25489    i18n_locale 
   TABLE DATA           �   COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    220   q.      1          0    25633    strapi_api_token_permissions 
   TABLE DATA           �   COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    244   �.      S          0    25829 &   strapi_api_token_permissions_token_lnk 
   TABLE DATA           �   COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
    public          postgres    false    278   �.      /          0    25621    strapi_api_tokens 
   TABLE DATA           �   COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    242   /      7          0    25669    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public          postgres    false    250   -/                0    25446    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public          postgres    false    214   �L      ;          0    25687    strapi_history_versions 
   TABLE DATA           �   COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
    public          postgres    false    254   �X                0    25432    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public          postgres    false    210   �X                0    25439    strapi_migrations_internal 
   TABLE DATA           F   COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
    public          postgres    false    212   Y                0    25513    strapi_release_actions 
   TABLE DATA           �   COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    224   �Y      C          0    25733 "   strapi_release_actions_release_lnk 
   TABLE DATA           s   COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
    public          postgres    false    262   �Y                0    25501    strapi_releases 
   TABLE DATA           �   COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    222   	Z      5          0    25657 !   strapi_transfer_token_permissions 
   TABLE DATA           �   COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    248   &Z      U          0    25841 +   strapi_transfer_token_permissions_token_lnk 
   TABLE DATA           �   COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
    public          postgres    false    280   CZ      3          0    25645    strapi_transfer_tokens 
   TABLE DATA           �   COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    246   `Z      9          0    25678    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public          postgres    false    252   }Z                0    25525    strapi_workflows 
   TABLE DATA           �   COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    226   �Z      E          0    25745 .   strapi_workflows_stage_required_to_publish_lnk 
   TABLE DATA           l   COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
    public          postgres    false    264   �Z      !          0    25537    strapi_workflows_stages 
   TABLE DATA           �   COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    228   �Z      I          0    25768 '   strapi_workflows_stages_permissions_lnk 
   TABLE DATA           w   COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
    public          postgres    false    268   �Z      G          0    25756 $   strapi_workflows_stages_workflow_lnk 
   TABLE DATA           v   COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
    public          postgres    false    266   [      #          0    25549    up_permissions 
   TABLE DATA           �   COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    230   +[      K          0    25780    up_permissions_role_lnk 
   TABLE DATA           ]   COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
    public          postgres    false    270   �`      %          0    25561    up_roles 
   TABLE DATA           �   COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    232   �a      '          0    25573    up_users 
   TABLE DATA           �   COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    234   Fb      M          0    25792    up_users_role_lnk 
   TABLE DATA           K   COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
    public          postgres    false    272   Oc                0    25473    upload_folders 
   TABLE DATA           �   COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    218   xc      A          0    25721    upload_folders_parent_lnk 
   TABLE DATA           ]   COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
    public          postgres    false    260   �c      ]          0    26244    user_heroes 
   TABLE DATA           �   COPY public.user_heroes (id, document_id, signature_item, furniture, engraving, rarity, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public          postgres    false    288   �c      _          0    26256    user_heroes_hero_lnk 
   TABLE DATA           I   COPY public.user_heroes_hero_lnk (id, user_hero_id, hero_id) FROM stdin;
    public          postgres    false    290   �f      a          0    26267 &   user_heroes_users_permissions_user_lnk 
   TABLE DATA           j   COPY public.user_heroes_users_permissions_user_lnk (id, user_hero_id, user_id, user_hero_ord) FROM stdin;
    public          postgres    false    292   bg      �           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 100, true);
          public          postgres    false    235            �           0    0 !   admin_permissions_role_lnk_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 100, true);
          public          postgres    false    273            �           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public          postgres    false    239            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public          postgres    false    237            �           0    0    admin_users_roles_lnk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);
          public          postgres    false    275            �           0    0    files_folder_lnk_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 177, true);
          public          postgres    false    257            �           0    0    files_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.files_id_seq', 179, true);
          public          postgres    false    215            �           0    0    files_related_mph_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.files_related_mph_id_seq', 190, true);
          public          postgres    false    255            �           0    0    fractions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.fractions_id_seq', 9, true);
          public          postgres    false    283            �           0    0    heroes_fraction_lnk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.heroes_fraction_lnk_id_seq', 179, true);
          public          postgres    false    285            �           0    0    heroes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.heroes_id_seq', 178, true);
          public          postgres    false    281            �           0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);
          public          postgres    false    219            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);
          public          postgres    false    243            �           0    0 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);
          public          postgres    false    277            �           0    0    strapi_api_tokens_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);
          public          postgres    false    241            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 30, true);
          public          postgres    false    249            �           0    0    strapi_database_schema_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 7, true);
          public          postgres    false    213            �           0    0    strapi_history_versions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);
          public          postgres    false    253            �           0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public          postgres    false    209            �           0    0 !   strapi_migrations_internal_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);
          public          postgres    false    211            �           0    0    strapi_release_actions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);
          public          postgres    false    223            �           0    0 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);
          public          postgres    false    261            �           0    0    strapi_releases_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);
          public          postgres    false    221            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);
          public          postgres    false    247            �           0    0 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);
          public          postgres    false    279            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);
          public          postgres    false    245            �           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public          postgres    false    251            �           0    0    strapi_workflows_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);
          public          postgres    false    225            �           0    0 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);
          public          postgres    false    263            �           0    0    strapi_workflows_stages_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);
          public          postgres    false    227            �           0    0 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);
          public          postgres    false    267            �           0    0 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);
          public          postgres    false    265            �           0    0    up_permissions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.up_permissions_id_seq', 45, true);
          public          postgres    false    229            �           0    0    up_permissions_role_lnk_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 45, true);
          public          postgres    false    269            �           0    0    up_roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);
          public          postgres    false    231            �           0    0    up_users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_users_id_seq', 2, true);
          public          postgres    false    233            �           0    0    up_users_role_lnk_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 2, true);
          public          postgres    false    271            �           0    0    upload_folders_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, true);
          public          postgres    false    217            �           0    0     upload_folders_parent_lnk_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);
          public          postgres    false    259            �           0    0    user_heroes_hero_lnk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.user_heroes_hero_lnk_id_seq', 19, true);
          public          postgres    false    289            �           0    0    user_heroes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_heroes_id_seq', 19, true);
          public          postgres    false    287            �           0    0 -   user_heroes_users_permissions_user_lnk_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.user_heroes_users_permissions_user_lnk_id_seq', 21, true);
          public          postgres    false    291            �           2606    25592 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public            postgres    false    236            �           2606    25809 :   admin_permissions_role_lnk admin_permissions_role_lnk_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_pkey;
       public            postgres    false    274                       2606    25813 8   admin_permissions_role_lnk admin_permissions_role_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);
 b   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_uq;
       public            postgres    false    274    274            �           2606    25616    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public            postgres    false    240            �           2606    25604    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public            postgres    false    238                       2606    25821 0   admin_users_roles_lnk admin_users_roles_lnk_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_pkey;
       public            postgres    false    276            	           2606    25825 .   admin_users_roles_lnk admin_users_roles_lnk_uq 
   CONSTRAINT     u   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);
 X   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_uq;
       public            postgres    false    276    276            �           2606    25714 &   files_folder_lnk files_folder_lnk_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_pkey;
       public            postgres    false    258            �           2606    25718 $   files_folder_lnk files_folder_lnk_uq 
   CONSTRAINT     m   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);
 N   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_uq;
       public            postgres    false    258    258            \           2606    25462    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    216            �           2606    25704 (   files_related_mph files_related_mph_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.files_related_mph DROP CONSTRAINT files_related_mph_pkey;
       public            postgres    false    256                        2606    26188    fractions fractions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.fractions
    ADD CONSTRAINT fractions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.fractions DROP CONSTRAINT fractions_pkey;
       public            postgres    false    284            &           2606    26198 ,   heroes_fraction_lnk heroes_fraction_lnk_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.heroes_fraction_lnk
    ADD CONSTRAINT heroes_fraction_lnk_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.heroes_fraction_lnk DROP CONSTRAINT heroes_fraction_lnk_pkey;
       public            postgres    false    286            (           2606    26202 *   heroes_fraction_lnk heroes_fraction_lnk_uq 
   CONSTRAINT     u   ALTER TABLE ONLY public.heroes_fraction_lnk
    ADD CONSTRAINT heroes_fraction_lnk_uq UNIQUE (hero_id, fraction_id);
 T   ALTER TABLE ONLY public.heroes_fraction_lnk DROP CONSTRAINT heroes_fraction_lnk_uq;
       public            postgres    false    286    286                       2606    26164    heroes heroes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.heroes DROP CONSTRAINT heroes_pkey;
       public            postgres    false    282            p           2606    25496    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public            postgres    false    220            �           2606    25640 >   strapi_api_token_permissions strapi_api_token_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_pkey;
       public            postgres    false    244                       2606    25834 R   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_pkey;
       public            postgres    false    278                       2606    25838 P   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);
 z   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_uq;
       public            postgres    false    278    278            �           2606    25628 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public            postgres    false    242            �           2606    25676 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public            postgres    false    250            X           2606    25453 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public            postgres    false    214            �           2606    25694 4   strapi_history_versions strapi_history_versions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.strapi_history_versions DROP CONSTRAINT strapi_history_versions_pkey;
       public            postgres    false    254            V           2606    25444 :   strapi_migrations_internal strapi_migrations_internal_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_migrations_internal DROP CONSTRAINT strapi_migrations_internal_pkey;
       public            postgres    false    212            T           2606    25437 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public            postgres    false    210            z           2606    25520 2   strapi_release_actions strapi_release_actions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_pkey;
       public            postgres    false    224            �           2606    25738 J   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_pkey;
       public            postgres    false    262            �           2606    25742 H   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);
 r   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_uq;
       public            postgres    false    262    262            u           2606    25508 $   strapi_releases strapi_releases_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_pkey;
       public            postgres    false    222            �           2606    25664 H   strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_pkey;
       public            postgres    false    248                       2606    25846 \   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey;
       public            postgres    false    280                       2606    25850 Z   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq;
       public            postgres    false    280    280            �           2606    25652 2   strapi_transfer_tokens strapi_transfer_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_pkey;
       public            postgres    false    246            �           2606    25685 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public            postgres    false    252                       2606    25532 &   strapi_workflows strapi_workflows_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_pkey;
       public            postgres    false    226            �           2606    25750 b   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey;
       public            postgres    false    264            �           2606    25754 `   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq;
       public            postgres    false    264    264            �           2606    25773 T   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey;
       public            postgres    false    268            �           2606    25777 R   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);
 |   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_uq;
       public            postgres    false    268    268            �           2606    25544 4   strapi_workflows_stages strapi_workflows_stages_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_pkey;
       public            postgres    false    228            �           2606    25761 N   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey;
       public            postgres    false    266            �           2606    25765 L   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);
 v   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_uq;
       public            postgres    false    266    266            �           2606    25556 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public            postgres    false    230            �           2606    25785 4   up_permissions_role_lnk up_permissions_role_lnk_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_pkey;
       public            postgres    false    270            �           2606    25789 2   up_permissions_role_lnk up_permissions_role_lnk_uq 
   CONSTRAINT        ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);
 \   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_uq;
       public            postgres    false    270    270            �           2606    25568    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public            postgres    false    232            �           2606    25580    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public            postgres    false    234            �           2606    25797 (   up_users_role_lnk up_users_role_lnk_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_pkey;
       public            postgres    false    272            �           2606    25801 &   up_users_role_lnk up_users_role_lnk_uq 
   CONSTRAINT     m   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);
 P   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_uq;
       public            postgres    false    272    272            �           2606    25726 8   upload_folders_parent_lnk upload_folders_parent_lnk_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_pkey;
       public            postgres    false    260            �           2606    25730 6   upload_folders_parent_lnk upload_folders_parent_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);
 `   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_uq;
       public            postgres    false    260    260            g           2606    25482 +   upload_folders upload_folders_path_id_index 
   CONSTRAINT     i   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);
 U   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_id_index;
       public            postgres    false    218            i           2606    25484 (   upload_folders upload_folders_path_index 
   CONSTRAINT     c   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);
 R   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_index;
       public            postgres    false    218            k           2606    25480 "   upload_folders upload_folders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_pkey;
       public            postgres    false    218            1           2606    26261 .   user_heroes_hero_lnk user_heroes_hero_lnk_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.user_heroes_hero_lnk
    ADD CONSTRAINT user_heroes_hero_lnk_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.user_heroes_hero_lnk DROP CONSTRAINT user_heroes_hero_lnk_pkey;
       public            postgres    false    290            3           2606    26265 ,   user_heroes_hero_lnk user_heroes_hero_lnk_uq 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_heroes_hero_lnk
    ADD CONSTRAINT user_heroes_hero_lnk_uq UNIQUE (user_hero_id, hero_id);
 V   ALTER TABLE ONLY public.user_heroes_hero_lnk DROP CONSTRAINT user_heroes_hero_lnk_uq;
       public            postgres    false    290    290            ,           2606    26251    user_heroes user_heroes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_heroes
    ADD CONSTRAINT user_heroes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_heroes DROP CONSTRAINT user_heroes_pkey;
       public            postgres    false    288            8           2606    26272 R   user_heroes_users_permissions_user_lnk user_heroes_users_permissions_user_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk
    ADD CONSTRAINT user_heroes_users_permissions_user_lnk_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk DROP CONSTRAINT user_heroes_users_permissions_user_lnk_pkey;
       public            postgres    false    292            :           2606    26276 P   user_heroes_users_permissions_user_lnk user_heroes_users_permissions_user_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk
    ADD CONSTRAINT user_heroes_users_permissions_user_lnk_uq UNIQUE (user_hero_id, user_id);
 z   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk DROP CONSTRAINT user_heroes_users_permissions_user_lnk_uq;
       public            postgres    false    292    292            �           1259    25594 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public            postgres    false    236            �           1259    25593    admin_permissions_documents_idx    INDEX     z   CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);
 3   DROP INDEX public.admin_permissions_documents_idx;
       public            postgres    false    236    236    236            �           1259    25810    admin_permissions_role_lnk_fk    INDEX     m   CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);
 1   DROP INDEX public.admin_permissions_role_lnk_fk;
       public            postgres    false    274            �           1259    25811    admin_permissions_role_lnk_ifk    INDEX     h   CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);
 2   DROP INDEX public.admin_permissions_role_lnk_ifk;
       public            postgres    false    274            �           1259    25814    admin_permissions_role_lnk_oifk    INDEX     p   CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);
 3   DROP INDEX public.admin_permissions_role_lnk_oifk;
       public            postgres    false    274            �           1259    25595 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public            postgres    false    236            �           1259    25618    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public            postgres    false    240            �           1259    25617    admin_roles_documents_idx    INDEX     n   CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);
 -   DROP INDEX public.admin_roles_documents_idx;
       public            postgres    false    240    240    240            �           1259    25619    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public            postgres    false    240            �           1259    25606    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public            postgres    false    238            �           1259    25605    admin_users_documents_idx    INDEX     n   CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);
 -   DROP INDEX public.admin_users_documents_idx;
       public            postgres    false    238    238    238                       1259    25822    admin_users_roles_lnk_fk    INDEX     ]   CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);
 ,   DROP INDEX public.admin_users_roles_lnk_fk;
       public            postgres    false    276                       1259    25823    admin_users_roles_lnk_ifk    INDEX     ^   CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);
 -   DROP INDEX public.admin_users_roles_lnk_ifk;
       public            postgres    false    276                       1259    25826    admin_users_roles_lnk_ofk    INDEX     _   CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);
 -   DROP INDEX public.admin_users_roles_lnk_ofk;
       public            postgres    false    276                       1259    25827    admin_users_roles_lnk_oifk    INDEX     `   CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);
 .   DROP INDEX public.admin_users_roles_lnk_oifk;
       public            postgres    false    276            �           1259    25607    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public            postgres    false    238            Y           1259    25470    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public            postgres    false    216            Z           1259    25469    files_documents_idx    INDEX     b   CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);
 '   DROP INDEX public.files_documents_idx;
       public            postgres    false    216    216    216            �           1259    25715    files_folder_lnk_fk    INDEX     S   CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);
 '   DROP INDEX public.files_folder_lnk_fk;
       public            postgres    false    258            �           1259    25716    files_folder_lnk_ifk    INDEX     V   CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);
 (   DROP INDEX public.files_folder_lnk_ifk;
       public            postgres    false    258            �           1259    25719    files_folder_lnk_oifk    INDEX     V   CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);
 )   DROP INDEX public.files_folder_lnk_oifk;
       public            postgres    false    258            �           1259    25705    files_related_mph_fk    INDEX     U   CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);
 (   DROP INDEX public.files_related_mph_fk;
       public            postgres    false    256            �           1259    25707    files_related_mph_idix    INDEX     Z   CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);
 *   DROP INDEX public.files_related_mph_idix;
       public            postgres    false    256            �           1259    25706    files_related_mph_oidx    INDEX     W   CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");
 *   DROP INDEX public.files_related_mph_oidx;
       public            postgres    false    256            ]           1259    25471    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public            postgres    false    216                       1259    26190    fractions_created_by_id_fk    INDEX     Y   CREATE INDEX fractions_created_by_id_fk ON public.fractions USING btree (created_by_id);
 .   DROP INDEX public.fractions_created_by_id_fk;
       public            postgres    false    284                       1259    26189    fractions_documents_idx    INDEX     j   CREATE INDEX fractions_documents_idx ON public.fractions USING btree (document_id, locale, published_at);
 +   DROP INDEX public.fractions_documents_idx;
       public            postgres    false    284    284    284            !           1259    26191    fractions_updated_by_id_fk    INDEX     Y   CREATE INDEX fractions_updated_by_id_fk ON public.fractions USING btree (updated_by_id);
 .   DROP INDEX public.fractions_updated_by_id_fk;
       public            postgres    false    284                       1259    26166    heroes_created_by_id_fk    INDEX     S   CREATE INDEX heroes_created_by_id_fk ON public.heroes USING btree (created_by_id);
 +   DROP INDEX public.heroes_created_by_id_fk;
       public            postgres    false    282                       1259    26165    heroes_documents_idx    INDEX     d   CREATE INDEX heroes_documents_idx ON public.heroes USING btree (document_id, locale, published_at);
 (   DROP INDEX public.heroes_documents_idx;
       public            postgres    false    282    282    282            "           1259    26199    heroes_fraction_lnk_fk    INDEX     Y   CREATE INDEX heroes_fraction_lnk_fk ON public.heroes_fraction_lnk USING btree (hero_id);
 *   DROP INDEX public.heroes_fraction_lnk_fk;
       public            postgres    false    286            #           1259    26200    heroes_fraction_lnk_ifk    INDEX     ^   CREATE INDEX heroes_fraction_lnk_ifk ON public.heroes_fraction_lnk USING btree (fraction_id);
 +   DROP INDEX public.heroes_fraction_lnk_ifk;
       public            postgres    false    286            $           1259    26203    heroes_fraction_lnk_oifk    INDEX     \   CREATE INDEX heroes_fraction_lnk_oifk ON public.heroes_fraction_lnk USING btree (hero_ord);
 ,   DROP INDEX public.heroes_fraction_lnk_oifk;
       public            postgres    false    286                       1259    26167    heroes_updated_by_id_fk    INDEX     S   CREATE INDEX heroes_updated_by_id_fk ON public.heroes USING btree (updated_by_id);
 +   DROP INDEX public.heroes_updated_by_id_fk;
       public            postgres    false    282            m           1259    25498    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public            postgres    false    220            n           1259    25497    i18n_locale_documents_idx    INDEX     n   CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);
 -   DROP INDEX public.i18n_locale_documents_idx;
       public            postgres    false    220    220    220            q           1259    25499    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public            postgres    false    220            �           1259    25642 -   strapi_api_token_permissions_created_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_created_by_id_fk;
       public            postgres    false    244            �           1259    25641 *   strapi_api_token_permissions_documents_idx    INDEX     �   CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);
 >   DROP INDEX public.strapi_api_token_permissions_documents_idx;
       public            postgres    false    244    244    244            
           1259    25835 )   strapi_api_token_permissions_token_lnk_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);
 =   DROP INDEX public.strapi_api_token_permissions_token_lnk_fk;
       public            postgres    false    278                       1259    25836 *   strapi_api_token_permissions_token_lnk_ifk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);
 >   DROP INDEX public.strapi_api_token_permissions_token_lnk_ifk;
       public            postgres    false    278                       1259    25839 +   strapi_api_token_permissions_token_lnk_oifk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);
 ?   DROP INDEX public.strapi_api_token_permissions_token_lnk_oifk;
       public            postgres    false    278            �           1259    25643 -   strapi_api_token_permissions_updated_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_updated_by_id_fk;
       public            postgres    false    244            �           1259    25630 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public            postgres    false    242            �           1259    25629    strapi_api_tokens_documents_idx    INDEX     z   CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);
 3   DROP INDEX public.strapi_api_tokens_documents_idx;
       public            postgres    false    242    242    242            �           1259    25631 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public            postgres    false    242            �           1259    25695 (   strapi_history_versions_created_by_id_fk    INDEX     u   CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);
 <   DROP INDEX public.strapi_history_versions_created_by_id_fk;
       public            postgres    false    254            w           1259    25522 '   strapi_release_actions_created_by_id_fk    INDEX     s   CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);
 ;   DROP INDEX public.strapi_release_actions_created_by_id_fk;
       public            postgres    false    224            x           1259    25521 $   strapi_release_actions_documents_idx    INDEX     �   CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);
 8   DROP INDEX public.strapi_release_actions_documents_idx;
       public            postgres    false    224    224    224            �           1259    25739 %   strapi_release_actions_release_lnk_fk    INDEX     �   CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);
 9   DROP INDEX public.strapi_release_actions_release_lnk_fk;
       public            postgres    false    262            �           1259    25740 &   strapi_release_actions_release_lnk_ifk    INDEX     {   CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);
 :   DROP INDEX public.strapi_release_actions_release_lnk_ifk;
       public            postgres    false    262            �           1259    25743 '   strapi_release_actions_release_lnk_oifk    INDEX     �   CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);
 ;   DROP INDEX public.strapi_release_actions_release_lnk_oifk;
       public            postgres    false    262            {           1259    25523 '   strapi_release_actions_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_release_actions_updated_by_id_fk;
       public            postgres    false    224            r           1259    25510     strapi_releases_created_by_id_fk    INDEX     e   CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);
 4   DROP INDEX public.strapi_releases_created_by_id_fk;
       public            postgres    false    222            s           1259    25509    strapi_releases_documents_idx    INDEX     v   CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);
 1   DROP INDEX public.strapi_releases_documents_idx;
       public            postgres    false    222    222    222            v           1259    25511     strapi_releases_updated_by_id_fk    INDEX     e   CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);
 4   DROP INDEX public.strapi_releases_updated_by_id_fk;
       public            postgres    false    222            �           1259    25666 2   strapi_transfer_token_permissions_created_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_created_by_id_fk;
       public            postgres    false    248            �           1259    25665 /   strapi_transfer_token_permissions_documents_idx    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);
 C   DROP INDEX public.strapi_transfer_token_permissions_documents_idx;
       public            postgres    false    248    248    248                       1259    25847 .   strapi_transfer_token_permissions_token_lnk_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);
 B   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_fk;
       public            postgres    false    280                       1259    25848 /   strapi_transfer_token_permissions_token_lnk_ifk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);
 C   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_ifk;
       public            postgres    false    280                       1259    25851 0   strapi_transfer_token_permissions_token_lnk_oifk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);
 D   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_oifk;
       public            postgres    false    280            �           1259    25667 2   strapi_transfer_token_permissions_updated_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_updated_by_id_fk;
       public            postgres    false    248            �           1259    25654 '   strapi_transfer_tokens_created_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_created_by_id_fk;
       public            postgres    false    246            �           1259    25653 $   strapi_transfer_tokens_documents_idx    INDEX     �   CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);
 8   DROP INDEX public.strapi_transfer_tokens_documents_idx;
       public            postgres    false    246    246    246            �           1259    25655 '   strapi_transfer_tokens_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_updated_by_id_fk;
       public            postgres    false    246            |           1259    25534 !   strapi_workflows_created_by_id_fk    INDEX     g   CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);
 5   DROP INDEX public.strapi_workflows_created_by_id_fk;
       public            postgres    false    226            }           1259    25533    strapi_workflows_documents_idx    INDEX     x   CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);
 2   DROP INDEX public.strapi_workflows_documents_idx;
       public            postgres    false    226    226    226            �           1259    25751 1   strapi_workflows_stage_required_to_publish_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);
 E   DROP INDEX public.strapi_workflows_stage_required_to_publish_lnk_fk;
       public            postgres    false    264            �           1259    25752 2   strapi_workflows_stage_required_to_publish_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);
 F   DROP INDEX public.strapi_workflows_stage_required_to_publish_lnk_ifk;
       public            postgres    false    264            �           1259    25546 (   strapi_workflows_stages_created_by_id_fk    INDEX     u   CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);
 <   DROP INDEX public.strapi_workflows_stages_created_by_id_fk;
       public            postgres    false    228            �           1259    25545 %   strapi_workflows_stages_documents_idx    INDEX     �   CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);
 9   DROP INDEX public.strapi_workflows_stages_documents_idx;
       public            postgres    false    228    228    228            �           1259    25774 *   strapi_workflows_stages_permissions_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);
 >   DROP INDEX public.strapi_workflows_stages_permissions_lnk_fk;
       public            postgres    false    268            �           1259    25775 +   strapi_workflows_stages_permissions_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);
 ?   DROP INDEX public.strapi_workflows_stages_permissions_lnk_ifk;
       public            postgres    false    268            �           1259    25778 +   strapi_workflows_stages_permissions_lnk_ofk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);
 ?   DROP INDEX public.strapi_workflows_stages_permissions_lnk_ofk;
       public            postgres    false    268            �           1259    25547 (   strapi_workflows_stages_updated_by_id_fk    INDEX     u   CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);
 <   DROP INDEX public.strapi_workflows_stages_updated_by_id_fk;
       public            postgres    false    228            �           1259    25762 '   strapi_workflows_stages_workflow_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);
 ;   DROP INDEX public.strapi_workflows_stages_workflow_lnk_fk;
       public            postgres    false    266            �           1259    25763 (   strapi_workflows_stages_workflow_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);
 <   DROP INDEX public.strapi_workflows_stages_workflow_lnk_ifk;
       public            postgres    false    266            �           1259    25766 )   strapi_workflows_stages_workflow_lnk_oifk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);
 =   DROP INDEX public.strapi_workflows_stages_workflow_lnk_oifk;
       public            postgres    false    266            �           1259    25535 !   strapi_workflows_updated_by_id_fk    INDEX     g   CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);
 5   DROP INDEX public.strapi_workflows_updated_by_id_fk;
       public            postgres    false    226            �           1259    25558    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public            postgres    false    230            �           1259    25557    up_permissions_documents_idx    INDEX     t   CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);
 0   DROP INDEX public.up_permissions_documents_idx;
       public            postgres    false    230    230    230            �           1259    25786    up_permissions_role_lnk_fk    INDEX     g   CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);
 .   DROP INDEX public.up_permissions_role_lnk_fk;
       public            postgres    false    270            �           1259    25787    up_permissions_role_lnk_ifk    INDEX     b   CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);
 /   DROP INDEX public.up_permissions_role_lnk_ifk;
       public            postgres    false    270            �           1259    25790    up_permissions_role_lnk_oifk    INDEX     j   CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);
 0   DROP INDEX public.up_permissions_role_lnk_oifk;
       public            postgres    false    270            �           1259    25559    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public            postgres    false    230            �           1259    25570    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public            postgres    false    232            �           1259    25569    up_roles_documents_idx    INDEX     h   CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);
 *   DROP INDEX public.up_roles_documents_idx;
       public            postgres    false    232    232    232            �           1259    25571    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public            postgres    false    232            �           1259    25582    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public            postgres    false    234            �           1259    25581    up_users_documents_idx    INDEX     h   CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);
 *   DROP INDEX public.up_users_documents_idx;
       public            postgres    false    234    234    234            �           1259    25798    up_users_role_lnk_fk    INDEX     U   CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);
 (   DROP INDEX public.up_users_role_lnk_fk;
       public            postgres    false    272            �           1259    25799    up_users_role_lnk_ifk    INDEX     V   CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);
 )   DROP INDEX public.up_users_role_lnk_ifk;
       public            postgres    false    272            �           1259    25802    up_users_role_lnk_oifk    INDEX     X   CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);
 *   DROP INDEX public.up_users_role_lnk_oifk;
       public            postgres    false    272            �           1259    25583    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public            postgres    false    234            ^           1259    25464    upload_files_created_at_index    INDEX     U   CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);
 1   DROP INDEX public.upload_files_created_at_index;
       public            postgres    false    216            _           1259    25468    upload_files_ext_index    INDEX     G   CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);
 *   DROP INDEX public.upload_files_ext_index;
       public            postgres    false    216            `           1259    25463    upload_files_folder_path_index    INDEX     W   CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);
 2   DROP INDEX public.upload_files_folder_path_index;
       public            postgres    false    216            a           1259    25466    upload_files_name_index    INDEX     I   CREATE INDEX upload_files_name_index ON public.files USING btree (name);
 +   DROP INDEX public.upload_files_name_index;
       public            postgres    false    216            b           1259    25467    upload_files_size_index    INDEX     I   CREATE INDEX upload_files_size_index ON public.files USING btree (size);
 +   DROP INDEX public.upload_files_size_index;
       public            postgres    false    216            c           1259    25465    upload_files_updated_at_index    INDEX     U   CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);
 1   DROP INDEX public.upload_files_updated_at_index;
       public            postgres    false    216            d           1259    25486    upload_folders_created_by_id_fk    INDEX     c   CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);
 3   DROP INDEX public.upload_folders_created_by_id_fk;
       public            postgres    false    218            e           1259    25485    upload_folders_documents_idx    INDEX     t   CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);
 0   DROP INDEX public.upload_folders_documents_idx;
       public            postgres    false    218    218    218            �           1259    25727    upload_folders_parent_lnk_fk    INDEX     g   CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);
 0   DROP INDEX public.upload_folders_parent_lnk_fk;
       public            postgres    false    260            �           1259    25728    upload_folders_parent_lnk_ifk    INDEX     l   CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);
 1   DROP INDEX public.upload_folders_parent_lnk_ifk;
       public            postgres    false    260            �           1259    25731    upload_folders_parent_lnk_oifk    INDEX     j   CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);
 2   DROP INDEX public.upload_folders_parent_lnk_oifk;
       public            postgres    false    260            l           1259    25487    upload_folders_updated_by_id_fk    INDEX     c   CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);
 3   DROP INDEX public.upload_folders_updated_by_id_fk;
       public            postgres    false    218            )           1259    26253    user_heroes_created_by_id_fk    INDEX     ]   CREATE INDEX user_heroes_created_by_id_fk ON public.user_heroes USING btree (created_by_id);
 0   DROP INDEX public.user_heroes_created_by_id_fk;
       public            postgres    false    288            *           1259    26252    user_heroes_documents_idx    INDEX     n   CREATE INDEX user_heroes_documents_idx ON public.user_heroes USING btree (document_id, locale, published_at);
 -   DROP INDEX public.user_heroes_documents_idx;
       public            postgres    false    288    288    288            .           1259    26262    user_heroes_hero_lnk_fk    INDEX     `   CREATE INDEX user_heroes_hero_lnk_fk ON public.user_heroes_hero_lnk USING btree (user_hero_id);
 +   DROP INDEX public.user_heroes_hero_lnk_fk;
       public            postgres    false    290            /           1259    26263    user_heroes_hero_lnk_ifk    INDEX     \   CREATE INDEX user_heroes_hero_lnk_ifk ON public.user_heroes_hero_lnk USING btree (hero_id);
 ,   DROP INDEX public.user_heroes_hero_lnk_ifk;
       public            postgres    false    290            -           1259    26254    user_heroes_updated_by_id_fk    INDEX     ]   CREATE INDEX user_heroes_updated_by_id_fk ON public.user_heroes USING btree (updated_by_id);
 0   DROP INDEX public.user_heroes_updated_by_id_fk;
       public            postgres    false    288            4           1259    26273 )   user_heroes_users_permissions_user_lnk_fk    INDEX     �   CREATE INDEX user_heroes_users_permissions_user_lnk_fk ON public.user_heroes_users_permissions_user_lnk USING btree (user_hero_id);
 =   DROP INDEX public.user_heroes_users_permissions_user_lnk_fk;
       public            postgres    false    292            5           1259    26274 *   user_heroes_users_permissions_user_lnk_ifk    INDEX     �   CREATE INDEX user_heroes_users_permissions_user_lnk_ifk ON public.user_heroes_users_permissions_user_lnk USING btree (user_id);
 >   DROP INDEX public.user_heroes_users_permissions_user_lnk_ifk;
       public            postgres    false    292            6           1259    26277 +   user_heroes_users_permissions_user_lnk_oifk    INDEX     �   CREATE INDEX user_heroes_users_permissions_user_lnk_oifk ON public.user_heroes_users_permissions_user_lnk USING btree (user_hero_ord);
 ?   DROP INDEX public.user_heroes_users_permissions_user_lnk_oifk;
       public            postgres    false    292            O           2606    25952 4   admin_permissions admin_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public          postgres    false    3485    236    238            o           2606    26112 8   admin_permissions_role_lnk admin_permissions_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_fk;
       public          postgres    false    274    236    3480            p           2606    26117 9   admin_permissions_role_lnk admin_permissions_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_ifk;
       public          postgres    false    240    274    3490            P           2606    25957 4   admin_permissions admin_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public          postgres    false    238    3485    236            S           2606    25972 (   admin_roles admin_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public          postgres    false    3485    240    238            T           2606    25977 (   admin_roles admin_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public          postgres    false    238    240    3485            Q           2606    25962 (   admin_users admin_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public          postgres    false    3485    238    238            q           2606    26122 .   admin_users_roles_lnk admin_users_roles_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_fk;
       public          postgres    false    238    276    3485            r           2606    26127 /   admin_users_roles_lnk admin_users_roles_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_ifk;
       public          postgres    false    276    3490    240            R           2606    25967 (   admin_users admin_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public          postgres    false    238    238    3485            ;           2606    25852    files files_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public          postgres    false    238    216    3485            _           2606    26032 $   files_folder_lnk files_folder_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_fk;
       public          postgres    false    3420    216    258            `           2606    26037 %   files_folder_lnk files_folder_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_ifk;
       public          postgres    false    258    3435    218            ^           2606    26027 &   files_related_mph files_related_mph_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.files_related_mph DROP CONSTRAINT files_related_mph_fk;
       public          postgres    false    256    216    3420            <           2606    25857    files files_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public          postgres    false    216    3485    238            y           2606    26204 $   fractions fractions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.fractions
    ADD CONSTRAINT fractions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.fractions DROP CONSTRAINT fractions_created_by_id_fk;
       public          postgres    false    238    284    3485            z           2606    26209 $   fractions fractions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.fractions
    ADD CONSTRAINT fractions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.fractions DROP CONSTRAINT fractions_updated_by_id_fk;
       public          postgres    false    284    238    3485            w           2606    26168    heroes heroes_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.heroes DROP CONSTRAINT heroes_created_by_id_fk;
       public          postgres    false    282    238    3485            {           2606    26214 *   heroes_fraction_lnk heroes_fraction_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.heroes_fraction_lnk
    ADD CONSTRAINT heroes_fraction_lnk_fk FOREIGN KEY (hero_id) REFERENCES public.heroes(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.heroes_fraction_lnk DROP CONSTRAINT heroes_fraction_lnk_fk;
       public          postgres    false    3611    282    286            |           2606    26219 +   heroes_fraction_lnk heroes_fraction_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.heroes_fraction_lnk
    ADD CONSTRAINT heroes_fraction_lnk_ifk FOREIGN KEY (fraction_id) REFERENCES public.fractions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.heroes_fraction_lnk DROP CONSTRAINT heroes_fraction_lnk_ifk;
       public          postgres    false    284    3616    286            x           2606    26173    heroes heroes_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.heroes
    ADD CONSTRAINT heroes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.heroes DROP CONSTRAINT heroes_updated_by_id_fk;
       public          postgres    false    238    282    3485            ?           2606    25872 (   i18n_locale i18n_locale_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public          postgres    false    238    3485    220            @           2606    25877 (   i18n_locale i18n_locale_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public          postgres    false    3485    238    220            W           2606    25992 J   strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_created_by_id_fk;
       public          postgres    false    3485    244    238            s           2606    26132 P   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;
 z   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_fk;
       public          postgres    false    3500    278    244            t           2606    26137 Q   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_ifk;
       public          postgres    false    278    242    3495            X           2606    25997 J   strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_updated_by_id_fk;
       public          postgres    false    3485    238    244            U           2606    25982 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public          postgres    false    242    238    3485            V           2606    25987 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public          postgres    false    3485    238    242            ]           2606    26022 @   strapi_history_versions strapi_history_versions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_history_versions DROP CONSTRAINT strapi_history_versions_created_by_id_fk;
       public          postgres    false    254    238    3485            C           2606    25892 >   strapi_release_actions strapi_release_actions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_created_by_id_fk;
       public          postgres    false    3485    238    224            c           2606    26052 H   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;
 r   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_fk;
       public          postgres    false    262    224    3450            d           2606    26057 I   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;
 s   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_ifk;
       public          postgres    false    222    3445    262            D           2606    25897 >   strapi_release_actions strapi_release_actions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_updated_by_id_fk;
       public          postgres    false    224    3485    238            A           2606    25882 0   strapi_releases strapi_releases_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_created_by_id_fk;
       public          postgres    false    238    222    3485            B           2606    25887 0   strapi_releases strapi_releases_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_updated_by_id_fk;
       public          postgres    false    3485    238    222            [           2606    26012 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk;
       public          postgres    false    3485    238    248            u           2606    26142 Z   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk;
       public          postgres    false    3510    248    280            v           2606    26147 [   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk;
       public          postgres    false    3505    280    246            \           2606    26017 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk;
       public          postgres    false    248    238    3485            Y           2606    26002 >   strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_created_by_id_fk;
       public          postgres    false    246    238    3485            Z           2606    26007 >   strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_updated_by_id_fk;
       public          postgres    false    246    3485    238            E           2606    25902 2   strapi_workflows strapi_workflows_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_created_by_id_fk;
       public          postgres    false    3485    238    226            e           2606    26062 `   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk;
       public          postgres    false    3455    226    264            f           2606    26067 a   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk;
       public          postgres    false    3460    228    264            G           2606    25912 @   strapi_workflows_stages strapi_workflows_stages_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_created_by_id_fk;
       public          postgres    false    228    3485    238            i           2606    26082 R   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 |   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_fk;
       public          postgres    false    3460    268    228            j           2606    26087 S   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 }   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk;
       public          postgres    false    236    3480    268            H           2606    25917 @   strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_updated_by_id_fk;
       public          postgres    false    3485    228    238            g           2606    26072 L   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 v   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_fk;
       public          postgres    false    228    266    3460            h           2606    26077 M   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;
 w   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk;
       public          postgres    false    226    266    3455            F           2606    25907 2   strapi_workflows strapi_workflows_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_updated_by_id_fk;
       public          postgres    false    3485    238    226            I           2606    25922 .   up_permissions up_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public          postgres    false    230    238    3485            k           2606    26092 2   up_permissions_role_lnk up_permissions_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_fk;
       public          postgres    false    270    3465    230            l           2606    26097 3   up_permissions_role_lnk up_permissions_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_ifk;
       public          postgres    false    270    3470    232            J           2606    25927 .   up_permissions up_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public          postgres    false    230    3485    238            K           2606    25932 "   up_roles up_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public          postgres    false    232    3485    238            L           2606    25937 "   up_roles up_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public          postgres    false    232    238    3485            M           2606    25942 "   up_users up_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public          postgres    false    238    234    3485            m           2606    26102 &   up_users_role_lnk up_users_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_fk;
       public          postgres    false    234    3475    272            n           2606    26107 '   up_users_role_lnk up_users_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_ifk;
       public          postgres    false    3470    232    272            N           2606    25947 "   up_users up_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public          postgres    false    234    3485    238            =           2606    25862 .   upload_folders upload_folders_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_created_by_id_fk;
       public          postgres    false    3485    218    238            a           2606    26042 6   upload_folders_parent_lnk upload_folders_parent_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_fk;
       public          postgres    false    3435    260    218            b           2606    26047 7   upload_folders_parent_lnk upload_folders_parent_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_ifk;
       public          postgres    false    218    260    3435            >           2606    25867 .   upload_folders upload_folders_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_updated_by_id_fk;
       public          postgres    false    3485    238    218            }           2606    26278 (   user_heroes user_heroes_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes
    ADD CONSTRAINT user_heroes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.user_heroes DROP CONSTRAINT user_heroes_created_by_id_fk;
       public          postgres    false    238    3485    288                       2606    26288 ,   user_heroes_hero_lnk user_heroes_hero_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_hero_lnk
    ADD CONSTRAINT user_heroes_hero_lnk_fk FOREIGN KEY (user_hero_id) REFERENCES public.user_heroes(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.user_heroes_hero_lnk DROP CONSTRAINT user_heroes_hero_lnk_fk;
       public          postgres    false    290    3628    288            �           2606    26293 -   user_heroes_hero_lnk user_heroes_hero_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_hero_lnk
    ADD CONSTRAINT user_heroes_hero_lnk_ifk FOREIGN KEY (hero_id) REFERENCES public.heroes(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.user_heroes_hero_lnk DROP CONSTRAINT user_heroes_hero_lnk_ifk;
       public          postgres    false    290    282    3611            ~           2606    26283 (   user_heroes user_heroes_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes
    ADD CONSTRAINT user_heroes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.user_heroes DROP CONSTRAINT user_heroes_updated_by_id_fk;
       public          postgres    false    288    3485    238            �           2606    26298 P   user_heroes_users_permissions_user_lnk user_heroes_users_permissions_user_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk
    ADD CONSTRAINT user_heroes_users_permissions_user_lnk_fk FOREIGN KEY (user_hero_id) REFERENCES public.user_heroes(id) ON DELETE CASCADE;
 z   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk DROP CONSTRAINT user_heroes_users_permissions_user_lnk_fk;
       public          postgres    false    288    3628    292            �           2606    26303 Q   user_heroes_users_permissions_user_lnk user_heroes_users_permissions_user_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk
    ADD CONSTRAINT user_heroes_users_permissions_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.user_heroes_users_permissions_user_lnk DROP CONSTRAINT user_heroes_users_permissions_user_lnk_ifk;
       public          postgres    false    3475    234    292            )      x�ݚ]o��ǯ��bu���!��E��je�1��`��U�{��f��	�T�U���?Q�������9o4ek��:�D\�0�2�AߌBv//c�(�?kNs���?�z����0�'���瀼D���q]��?���Um2����B��*�2)>�0�R��?M��'�����*��tYgl�s��-��\�ۢ?SQc�5�l���_C��~��A��1%3��AUH�y���5��9���~�B ;���f�0`�a�+�����ޟ�"��;"O�mdy��եŐ��X�6P��S#��k.|Q�C`+�ª�}�(Fe��D�_��7��������hJ�yR�@��%�$+�p�4�چ!n��k򣩈=;v�ߩRP�(Ƹe���Vgd
M|;������w" !m�W��mk��aU���D<���St
�mJ���w�i��1��W��''�Ԇ�q������5�9�혤��L��/�׳�x��@w`�Z-�:�~H�����|+�����}�;��Ҏ
�������"��m��k0\����V#U�aW�Q�8M�tO�h�,nH����V�r�I��k�~�i��G�uG��F�52[+P	�E��t0x��Dß��ss�&� ��;��0��a��luL1����2�4��=��%0�(�+ SV�&�RI�I\�4Js�-Sm��]y���U���ǭ������(���c�Vuc������)e��ħFU=V<�Z�r %�W��ŜWM%���k����y�k�ݽi�By,w�;�t���bK��p\Q�u3*��a�3��eG��Ȭ�m*�4ѕ�$��i�c����
-r9����8��Ȧ���M�(|�P�tG��u��}�M	�x��:�B����(��@w\�AV�>cU��9�%�:���̞ӄ_vT	0kg۾����]��c����c�)�=�>�V
x�Z�,Ð�&��)j��d?c],�/&~�] ˰�C]k�uEX����I�J¤{n�?����͑� hlљ�Bt��A]�$�2�������B0�&ä�3�-b��@�6�Dg���1E�JʶkGlw�$u�fY6-�C&7p~��١�1�`,�U�`:�0E���6��E�~��#Oa:�eg}Ӿﲱ����XeV}�w�e� ye���T�*�jkq�U��FZ��K��v��t�G@�7S`���D�ٰ�VFKR~��g��=cՁ��0�֚�2U�	�e��K��ု�j��<xz{���tG�7�%\���o&M�FM��S�gwك��� �i���rlE,XS#�u� _g�'�۾����sC�Hw�̬SIZv�1�e$��޵�N^�<N��tG�JU�^[kه���K"�����D;��s �m�_w��22)�/�j��`9��ߓ������5۸V�Z�\�Zu%c2�~�����v�ivv<H<'��!�G�:�h����U��͐,��̳R��|�K<�ہ�x0XK��l3���=���m�S����x؁�h�hZ�5��ۖ㬲I��g���I<��@w<	HTM,�Y���C���r���l���'��N
�D�U���^"�%��B��|�yͻ��I=��@w_���8UA��x�:��Z����#�9פ�y�;��w�D��P�2�MD9k��St�UH�.�&)VUKad�?�����wٴ
d�`�t	G��g<�io(��i<.p~�]'ޏݕb+5S�F���$���~��aN��kۑ�PX���uإk�ujSU˘QN��}q�;��K��⵨BuQR��|�9�x|q�;�,��63��u�ql��ܻ��U5��tƸ1_AOtG� �M��m�.Sy��"����Y#CO,tG�V���|Y�@�d�9�x����蜛CO�w������%V�ԏ��M��7V=��YK{�����>h�8e�V�ݪsSˇ{��9��3đ���\��[-�	2�r8�?�:�m��)�HwD0"L�"Z�Y�Y��Y����h?�U���C�����3-I�uB�*�ۑ$ì�P�L�>ܯ;*�H�%�S��Pe�U9�SYM;Sp�|�:E�'�#�aa ��F�HH��X,��}XgK�����`sa�ע.� �!j�)�]���uncO=:�T��M,
�����f�ɗF��Κ��8ؑ�R��ifQ�r�Y[��M6����+���@��� LX�C���<�E��C�����e��0ʑ�bЪ����V{��9O�
�K�2�����Z=�~<�M_������xyFw��:ZKP�y�g�E���g.�ƗuG����ɸ�f�t���k�`QU_Ӻ��
[h��P�����[!y��o/?��[G[��/?�-��o�z� � ��D����(g��f
-6���M����z�I���|�Z�~_N �N3���E����LA1�_/�U�����4�Zw
A���u��5��P�b��wOY���:����@w�P�ؑ�4)��bE
�ặ��9}�:��ߩ� (�h�'��\��8K�i�x9���G��3ݻ�o�r���׷�ݮo���^YC�kA�$/A��|�bO����Z��[��VR�M�/�\L�?j�Q|Q׫��	����0��P�
�}�Se������ݭw?��D*�ڨ���[;e'
�'7��=�.�~�q�F���Q�_����zG�ɛr{�;�鴟Dno4�Үo����z��w�E�rS���-m�O�Zo�}:bU��w=�h��*�����|���f�ׯ�no_�^�F��~u�����o��M��^�=ݢ[z��g�7�e�b�o���Qo���ן\t>>[rJw�D��g��ʘ5�5F%TUD�E�C�ә��}Jwa�`/�i]�<�b�lQ��[w���Y]�] ��� 8�K�<W97��"y~�l������S�L�m�R��]Z�Y�#f\dW���1�����f
����4%�5:��m� ���5f?������wl�@����	�h7�q����]�������wǴ>���O�1      O   �  x��ۭ� ��b������_��l�H/c��ã����7;qs0�7'us�ѷ�q0Z����|n��x7���|�n�+h�kCC_���@�>�xڥu���K�]xډ�������2L�:풔��0A/i��0Q�问�7��W�[�%,�>��K�=z���(�����fA��H��_a�Yѯ6ҬB��� ͖q%���j'��/͍�i~7Ri�FH�dB�cҼ�R��j-͗y)->�ݏ�x�@Jc�mKg�wc������(�"�E�>���ݧ�Xֵ���X���%-��(i�k/i�F��znPҲX�������r؁V�2v���]h�`��c��0�V�1�2��e֏�a������t�v�ak������Vp7�������m�N���r��{�N1���0�^7��#��h~�      -     x����r�0 k��0�a�\�M�֍,Hc��$��#G�.���n��R�φ��R�P��t��L~C��\x/���A���b���<[`Te��8�T��v4H�h0p��I�ڄd����4�j8����|��"Ow��g�(#��2-�y�&��<��^���N���`0_u��0�:i0�*gA*֍�K��"���|�hކT���7-��Eʹ�����
+N.�w�Bh����ր׾���'��7��N��^�(�~ Mg�e      +   �   x����
�0 ���St��ps��)2*�D"Ȇ��4�\�Y�ۗ������z�J�ˡ����P��F>>�����y,2�V"�zԶG�"�9q�h'��������8*�ݠC:����{��g�҆U��ŗ)���$��b���X�!�(������<�9�~�O9q      Q      x�3�4�@�=... �            x�Ž˒㸒&�f?E�Yϰq�����f36�f� �"�wRI���U5%P	H�*�6VV�_D�w w�F�8T����T}[UC��%C����6��.���y�#e����0��Li�E��Z����)���c�V%�����/T�Q�����@�C�ߑ�w ���?)���R�}!�� F��������7��U�K���|.�����"/{�w����_�WB1C	�w��J���� j쟄o$�+�$�D�����fB\OX�Mxƫ`שJ���q��.w������HJH��Ob�.�##a��
��ZZp?N�?�!g���ƌDk��8�� Vɢϯ��_�t�L�ȨTb���Yx 3�O�b����3UkW������щ��ZM�Lrh��X�z�m�_�Y�13��#�H|,0cQót�Q^�:�%5��T�ku=f��2a�f�2�1C�2��0f�π�c����z]c����׊=�F%�̨b��l��xt�M�_�Yx3�����y��Ѓ(����$;���P���pL䯼,<���v�O�f2�L2��ZTuWk��d�����A�TJn�{�-Zx33��
x,0� j;�&u��I�ZP�%;0`�m��jܡf�a�X����{���Ԍ�Rpi��p6�����R 1s�q5��c����BQ�ei���:�F�n�)O�9_� �e+-����:*{�Cy	�S�{�����ӝ�<+�t�wb\��tLM���1�n��WjFMě�?��5���U1VWt��U	}�-B]�w�"-�Qз:2�xWx5#���;�������i 	��z�tjS���� $��.��n��P��Pj�N}���b�i/�IV=K��Bv�|9_�I�
)S�\�o�ԯ�,<������@n��i�\V��	IEq��lS-�����$�\�����8*��0j0�ܣ���&��OW���(X���ۚ���,�&aa�њt�Yx5#��|OMF��~(J6]br#)�au��CQ�������4պQE������G�\��������L�]����_�w)�4ɨ��;Nj<ݿ�5򎪋:���/�.mԟ�_���ݩ��G7SUm��|wX���E��!e�A�E~�<�z�����_/�x�&��W����'���?>V)޶�y ��(������n0��T���L�pR@��T��xس�Yx��!�s�y+�S�Q�u_!�Wbśsy�=ɖ����d�\n���ϥ杵Z�w��m3�3ke�����a��
7_������(��DQ�ZoG<��h�	�\�������L*L��ɑ>-�۫�$�>�X}�a��}>>��v��5Ht$����u�,N��ϗ+��̨�Ƅ�.}&2�@fۡ�H��]}��'��O;,W����3�c}����V�$����G��l�G�VS�1�]*��pF	��H���%���\N�J��\���:��g��*�΁�7��waPD#U6�kv����"9��<[S�"��H�x�D-<�����Qx/��X�����
����4�W���Hlt�ֱVU�����9MS� ���_�ԏ:������Nb v�I؛'��1O ��������Kʯ�ߞ�=ML~811�s�5����ܨǞ��"���ȭ���`���K^��t�Ǵ���[.��i�P	�1(yg��U���@_Z��X�d������k䷭�CǏ ����k���̉$<�=6��0�<K�|��є
��Z��
ͪ�:S�ޘJp�k\hht�)_�߉mYx 7zwj��n:�︱趌uI+�O����d�����!%$�^���Z���ø�@'>w(����
	��sb0�B'���K�"�Ƕ�7�$�������cQ�[t�	�l�A���o��)�F~w�!�����cX��"_��3��U� {B�rk�2��!�0��5�Rej~����$ ؕ�m�B���G��C�q������0��슻��4�t��zA�:ٖ׀�`D�n�g=u�F�����{���LT�)x¤�)X��R���WԠd)�F2t��0j4�^
���ʤ���XX�o�ڮ3�t��߂Q���;�|�3JM ?�wrKGey���"�T���m���+�P�)��f�U&x5S� z+�m��D8�}R&��۹��K٢R�ɫm��H2�2�Ӿ��Q�o�	��-5��,OU3u�]pZUs�E]$�$�8�������Pj�����3朰��X�2RRN�K���pʈ�-#�Wf�a���3|��;�^k<*y5�%Wb��\���4���漈t[|��S�a�a�d�|NrKMD���˼��l��!�:4uX����x۬��)����JM���rKMF%��:TK��$�r.�B3�z��z��4�$j|���Qێ�{�s P# ʮuZ-"iO+�p���,q�	��q�o�d��o�a�`L}ɦ���2B`�����|���4ӡ%�5㦼���ͽ�$��h��`��b�˻�-5�<�O���KҞf�o�N����J�p�0�԰����0��Y�����/z/���c�����V�w/l��r�0F���.sv]�Ddo���ܶ5ơf�a��%9�[j$�J<�ಽT��v�j��eLi*8о�(����Q�1澵��R���<��<��0��)S�JiOˀ f
J�	o��p�O��bL=�ہ�Rc�7�D5U4�
}$
��3�Sxߥ}��V���c���Vly�*���@�V�gV��I�@��8i�$	�:�6���E~=��?[;9�6�b�宝^'��>E�o�{/�*QrIƢ�2�KW\��d�e��ߥR�*2��9R�E~W�"��'J�vh�媔m��sr"|�R�+�?�[���Vt�\�:���M�n����<�q���CG*�ȯ�'�O��x���Wr�F,�	�����
��n:� �z�F؝��9�{p�:!XB�%��d�a��v��X��R��IErn����d��W3áu�i\��L��H7bAc��t-<��!�i��RC�ujS��o
�Yo�k����u�g)i��~\j��XXx(5�<Nځ�R�ѵ�8�
��*1V�2��{��Ϫ����,CH%4}��������E�I�	O^�����^S~��zU��1���s����a��Ku2O������W�t ��K"E@�V��0U4���L�Ō��R�����L�R��w�kQ_L�ޯ��t�gF���?���/��z_S~��v=���������r��s�|&|l��AX������n�1�J�k��I�ɍU�`���b�h��iPg_����w����Q?��yVvӵtI/�������N�p��z7--ꋛ
��� �Ta�<-_S~�����\wq��pa}t;,�rIL�}&|<-Y�|����^%��뮩���( �A*�$qH�
�9��wA;���c_������Q߃��żQ½Ⱥ���R��fJ
̼9n�=,<�׽p�s��&�˩��N{��^<�~�	6q:���<�\����ïq�<����[��X%��\s���J���9@9lb�� J���.�dp,<���	�T�3H�\/��̧T�����:�c��������P��Խ[�c�-<�ڽ%�g�x'ޙ#�ѵZ���LkѶ�9��I����x����R�J�皼[^(Z��&\�k>7P����+��P��I�$1,<����ԧrKG'ؐ��t�+B�D�,�4-I��e��l����0j���=�>rK�Di�������vc��LTP����d S����
�&�0j8�V����R6�e��tN�4dmWZ�e(�vZ̨��N��Pj�x����Ƣ��6�����nz����v�F�NSf�o��0,<������@n�����\Nu�h�W(i��S��R8K �|�ë���TŇ7$%����/U�1τ�UJc�2y �*Q;#8����5G��M~%����:��9=���q�)|��0jۯ�W�u ��dt��U��4s2Ps��f$��tB�A�n�r5��c��    ������Ȫ�>��7m�5ASQ��>dg0<Ki�=!�m?wb+F����%���4��F��^�dƺZ�^6���4E�k���`x(5!};�{���ya����ݺ�R�`9�j�P� u�4���^ v��=�a�d,�����-5M����w��$��l^ѐNҥ&�?�0Ʉ��Ý�"��o��;0�� <S��R�?���ʭR7����j��d��f�H͠����!"3�5?�L�ȯ߇ğ�l�&�a�
���'>>V)��Y�O�V�4Z),�F$�����f�,/��~K�	P�A�����!�i��ت�1,_�v"τ�U�9��7s ���v�B�sK���H���+���g�$�{ؠ� i�vm����d�a�HL��rK�G:�ͩ@ҞH
�Z����)�O�df;�(	}5���L�0j4fn���R�"�t�W�Z��Z�S���=G��3�y3���lF��-�3��%�Q�^�J�%9�W�ԗ�ܳµ�{F��.h���\�������bVW�|���I@�ӟ�
xM�5��5	�%^5	pw~����m��L��tyL��ӡ�a�D�R /}��$鳬��
"�ݻ\���O9	�o��X�w+j�$?}5	PA^Q��k�o��r��a�ku��������[����Y�;���0�D`����J.CO�(��L��'��c�}����e�I�1c��q(�3F���sr����\�i_�q7��Ùi��$*��ZȢ���0���D�a�����k�g�{䲣�6Prbu�|'�Cnt�Pn�E�x���u���O)�>]ր��TaD%��/����è��M��-/U��<=>-����xI3�N�! P�%Kar����,<��1����L�2�yY�`�� ��T%��H)��s\�ձ[x53��^n��(р�"Ay_L%�	n�k���q� d`�q�b��-<�ڦy�Ԩ�-5UY����H<�x=d���!��ibH�T�	���9UYx5o/�C��ƣU�6�,��tkRMۿ+J���<Չ��f'�ȱ������8�D�䖚���k�+��д^�Y�( ��a8�Zyӥ���<��|e�v��-5��X�|������4����(1Z*o*C���F�m��7���Զa�S	VY���47�dWC��{*��@��S(C<��-<���/rv ��`t�[`���ܞ��n�P�}���"�I�ܐ�����C�y��-5�s^��eT7m����Q=�!5c4�ʧ5�I�v����{�����e���f��KqQ	=�蒄�8Bg&S�o!�*x5#��s(��Hd.`Ii��*0��ª3e9��iؽ��W#	�Yx(5I}��{��F#=���B	��:�6gYK=iCg�e�"�ճ�<�A��}P������Jc��%�Yc�LH4#(x:��=�����㇉)�N�QJ��,��}��[�vX�Bﵵ�����X�0�n�ȡ�j�G3��BS�:b�*շ�䦿\��l�I��u�ɱ�0j(�����-5�}� >S�4�)�k����s�4�@��~��sDu��<��N�ȡ�R�Q%u_�}Slf�Xq��8Ap(JF�������è�_��x����PU��W����q�u�N�=�}�O┩����-���\�a~�cl�A�a�����g��:�\!�9�w:���Ȉ���E�yd2�U�	=|I�,U ��({x-�"��o�O[0`�;,_�s��g��:e���|����^s���*�WT�]�&~[�EƓT1Œ�H,��:��6��ګf�a�^��m�D�X��2����w:�Ѱ�Z�LT;��*0�����U� �R�z�9t�s>�ܤ{��@.��Ht��2�sy�FS���W#���Z���;�����1x����Z ��D�kʯ�ߞ���g�)��PvT�<��6�3�c뽿��s����O>mSqd�r^�����5=L���E����z%"�a��%�~�W���M��H�I�/$_S~��z��Og��X�|�B���3�C����S<A��5_*#Ӛ�Jթ��:���Ϯ��}� �D�c�>���)f��0r�mI�>i�u�݂�'�Z�����Nv�P�[�X���M.����0�E��K��w�R� �ѽ�����Ei;̠w���X�ȏ�ה_#������
��d+�a��� �T�L�xQ��p��w�ˣ�3q���͉,��r�Yʀ �YF̰/�婈�ø������;n"Z�p�H�����8��2�]#�T0�S�3:���m����|�MF��ۆ*M8�D7���T�����H��L���������j�	vX����l�3�c�����k�V�D]O)���L��I�L���g,�I��?���0n4�P��|�F�
55�F-S����L�"!O�kcK`������r��7���w�P4�tNd�`�W�aD]�1�^�����R ����>��x7s_��@�ㆣ,]`�1-硾�[5�"�f`��P*Y�����B�ƍos�Su �q#ъA�ך���1���B�Df\�2|�ͭs��0n�����w�h��`C��tlIK�`��i�����FC��7�e�a�d�^4��7y=���+3ˆiv�����B��Q�[�J7�F���yb�7�l��˒��eNQ��Ѐ�%����٤�����~��s������xi��X�[��K�&}�W�X�Y�i�����Z�����7��:w�&(��U'�����ޖg\f�ҙ<<Y�h|�	ۣ����4p����NQ,�oν�[�"�*�Ƌ����\ӵZ+�24K3�`��L�6�,���q���3���rn�9g�ˌ�I�G�C�aQ�*m�>g�m;g�a��Ϊ'�v �qCѢ5熶����i�������<�\$
���-�۩s���R۔��w�8�3�c���i�T�R �Wj�Y-&�]�l]Q[��H[�5�����R�E~{qe�T0�v/��5,ow"gz&|�S#����N�$*�c�m�����^�r_���[QeLIp�aZ�wuz����N%�b�V�_�ru*<]p�	�T�Xc��w:�Q����Nfn�.�����Dqp� C�UBܒ,�q^-<����&8�︱�Z����N�fK[�Iz�͐�7E��[�^�y���Q#_	ҁ|ǍG-�`��!��pY�{����I�U�?����~��D	���G}�,����4�����,�5��ȯWa}Z��}q��=zyA���ْ�z�@�3_5��n�5�zf�V�6A��_��ߔD�'����/����U�?�X^���<���k䷣����I���ت;,7�=��g��֋b��s ���@�2M�@������cC��d��6�p��/*B�z�<,9��4w9���h�[J��kd}f��B�rh.��)6"S��'gn���6�����UGFKmL2ոL(��҉s����5���'�',ˀz�Ǣ����X�gӔ��%��3=�)�F~{��.Sl5�����:>�3��eg����{�5_��k],J�i�͙L��<`j*(D(���f���r���[��&�\�è�y��P�f�rp�1j$��f>�����1�Rx/�qCQ����jH���U.�ݧ�<��d���po��}����b���{�>~�qTg��W�ִG|0k[�:�f	��Po���n�̄/ws �q#�M�+Y�Y7��N��L�wsn~��������ƍoV�[.��w�hT].IQ�d���T 9T�-�v.&%����>1���q1u�i=�?�EK��4�a���b)Q�\n��L`d�q;�u�M���a�����g�1M]6��ʛөIn�y`��=0���S���IOkp��o�An 1N�ڡ|�MD#ZY:7�j�Yu����Ne@�W�*I�I���˽Bf�a�`�g;�;n2Z�e��	���%�Y���[�,�b�����s��E��C�I��s(�ܶ)1�k�?-bN:��i�c���El>' (C���y���ø!���C� �  ��N=]Uq�ھ��M'�b���%$�f���,�{ �t�^hw�1,��?w�y&|�������|�SUO����Z�a�JVi.����t��`.��a�E~=�/>ө�|��cX����t�3�c��{A�g�Bq47hʇL�2G!|���d�V�}I�Zk,S���c��I��B��ε��r�{�}&|�P�-޾��^��)��ɤZ��r�j}t\�p���W�@BMj܎?�S-l�a��6��Z�C���=i7��g�Ҫ/ ��p3I��ӫ�9nB��C�	�J�@��7%�!p
Me%��F�Iv���5����N)P\I��	l���M?�/g	�K�~��5��ȯ��{NH��"v��r���<�\<y&|l��b�ϯ{/ߙ�v�2����X���Ҍ�y5���%�4�<E�-���&�(��|)?�����k�C��C�ڶ�vX�;aτ��{_�~/ߙ����.�,R6�ԍ��S�0ָ���pg2A(��3~�W͗<��O�l��)�F~�|��4g6���;,����eτ������L����-"���d�	���H�
�8	*�Ux��݇�,<������@�綝9
Nn� *��գȋeE}�`s�%�sJ�-<����C��x �q��9ESt�@J_AV�����ޤ�D%5#���>����q#��O�;n(�*�vk�+hf}-MN�G]P��Lq��}ar�ؤ��r��s�8��ᨪL��[mT6�D�R�����Fe�Rb|�����ømK���|ǍD�� �M_���l�J��H3�0�M�k���qc�����{���Pt�W:'u5��on����4}�&J��B$����W�-��'�O�>F$�5��kX����D}&|��{#@�>�V���ƹ�n�_���v���BS5�m��4��t���tj���)�4�vQI;,_C2�z�	��o�w:%Q���͑��5GH�s��^w�V�<�	�����m�}��2l�����]��N����N��/�����tJ���'9�tX�6���k�~[�d&,��p�Z���7|�R�%%;*�J�*�g��*ݎ.�7��w*eQQ���e��̊j(�x�����!۟d�c#!��+�?�)c���˷�b7��D�X��j�O��8����`����gz��2'���l��{�v���"��"}x�j]$;�0�>>֩؎<���|�S��JO��եQҘ�em����zt��r��~�/��>_8�na�yt�%���o��wa��m��vX�������b�T��w�+��0�Ȭ�aVq��U��j5��@��������sZ��e��O�K��LP��&�/)�F~��}>̐#��Kj��cXnpv[	���3�c�1v�aʭ�r-��[aڢ� �$Y�:оX}�v�B�H�Y��|-껹�7W_�~~k�5���o�/�4� w�;,�e-���D��|Q�+�{+��.���4��I��=�R��l2�^o���'�����8$̼�mQ_�]���`S�v�������k�mW>��[}Jd��a���N�τ�m��Zx+��.��kK�.*յ���L�����߾���fF��]�����_b{g�����9�ה_#�k�$��3��~�B�ǰ�uw�n!��cۥ�
���|qt�$��OӬ/���yh|a�'ni�x��Z�m��l���ӡ`�~~��5����/�!��|9�ٍ�����&�k�������%���|IT��p�׶�V֪��I�'���۫o�Mk�@-�{��W_�����\��^S~���� �g�K�1;,���6	&|l�|�}f�N�ms��|��[X/M���;u��7�OBf� S��,���Cۻ��C��_xx�%��ȯ�}xf#���쨼�`N]�3�c���f��xg�,j����T�=2؜����k����0��%��-ŵ�����s������|�}I�5�7���+��u�{�[I��s<>��{{__R�@�3_]��؜Ln.3��<m>�����8�,����`Q_�{�Ͼ}f�2�s��5����\�tl�d����/Y���3�c��gu ߙ������%+J��������6��G�߾��a�& {[InQ_\}e޼�������5���o�/��yOw��ǰ|/v����	�/������(��80�v��iqM˄��p�Ng�2C��t#����}4�P������ۿ�g�K      ?   >  x�%��q�0 CѳPL��ҋ��#�I𛉠$"\��կ�}�kS�&׮�-�C��\��w�.��r��S!������^E�ܶ��;�&�o^�L�2��N��R�L.�[PsU=������֊���oѾ�ߣ	jnk]Ps[������֖�涶u��#���]A�m��n�UPw[��ֿ�?\��և��>u��%���oA�m�n�W�p�(���F4�6�����i|#��!h�mLA�mc	n[�t�8����4�6���YM��&h�mvA�m�c~3��4�6��鶹-��#h�m^A�m�Zn[U�r�j���V�ܶ���ś���wq	Zn[[�v�:�����ݶ����]m��&h�mwA�m{�n�S�v������˿��#�m_A�m�:n;U�q�i���Nt�v���3��%��p��ws؎��s]��"��VA�m�	�n�]�u�����t�v��붻e*��n��x�|��p����N������κ�������N��������ν=#CR<KCR��M���78<��m�G��fǻc��鱿������x��o��A��B�!�"�(�-")�9")����,��I��I�LI�I�I�lI��I�,I�I��I���g�g�H�g�H�g�H�g�H�g�H�g�H�g�H�g�H�g�H�g�H�������3k$ųl$�3n$ųo$�3q$ųr$�3t$ųu$�3w$ųx$�����Y��=��>��Y?��@���@��A��YB��C���C��D���}w�,�#I�l#I��#I�,$I�$I��$I�L%I�%I�&I�l&I���ʷ~��5/=�      =   �  x�u�;nUQC��:�G�B�ib���Nw�"h�'
+$����������׿�o�/}�����mצڡQ_�S��n�F}�n���͓F�8��P@^yS�]�E@>�R�[��2)����x�U�7E@��P�S�/E@��:��" ϊ��(�����Ȼ" ��|*�ȷ"^�mR�Y�E@^ySd��z�C�OE@��V���yV�E�WE@�yWd���S�/E@��z&E@�yQ�U�7E@��Pd�j|�K�oE�/�I�gE@^yU�M�wE@>�Td���|+ΕI�gE@^yU�M�wE@>�T�K�}�=�I�gE@^yU�M�wE@>�T�K�oEЉ��!����c�H���"�k����*�i�H���"�˶����*z���"ᵪH��A	�UE�kU��ZU$�V	�UE�kU��ZU���ZU$�V	�UEb<��Hx�*^���ת"ᵪHx�*^��^�^���ת"ᵪHx�*�%E�kU��ZU$�V	�UE�kUѳ�kU��ZU$�V	�UE�kU�D��ZU$�V	�UE�kU��[�K��ZU$�V	�UE�kU��ZU$��.Q$�V	�UE�kU��K�K��ZU$�V	�UE�kU��ZU$�V��qV	�UE�kU��;�K��ZU |��/�޲�	oyF��g	oyF��g	oyF��!F�����{�ZuƇ��oooo�x��      Y   h  x��ѻn�  ���*zAxM�vh�vɂ�6�|�}���HU�V�;���5o��E��4Ď��m�}��ֹ� ��'�����T�qI������|P`6̊�5.vI��h��K�i�8$����)2�Tg���B�l����C����^��C�oe&O��֨�Xؘh$�J�ꎐ��k�k]�?��D�i�zq�pb��l�Tɸ�uFvx�����4{.P� f�f'*@-^��8�쪏�#�ڃo���Z_%�����ו������uU��~n&k�ԃ?�q�)^N%

Aov|�
8d֚��&�����[���dmR�$#������ɒr����c�+|<����      W      x��}K��6�����o5��]���diԲw�..H�$H� �7�����)���iδ�T"�y2q !P�2�s?[�8ji�;k��+���N�韧W�V����lHr�'��D��	E���svC�s� ������	�3V�|���E�Z>C?�.My��i]35����L���>��N�Zs�~4
:���W����9<�A��>d\�~�C�H���A��bv#T@��j��CrR����~�y���YQ!os]�?���{����w���d9s�a�`0JQW0�C�UvT\<�-g����ZMr��}���I?,��<0S��"fk��v��tךp���!�C���h�)^g�E4�g��b��-��F�����&s��lai"�X&R�o9�:��LE��~"g�>{��ۘ�J��� ,���n
e\.k���)xG��u?z��c�����v�
A/8��Zd���sp�ԣJ�V'��O~2��κyz��?��b|[8�/�X���Y���nm��D�D�'��JZ���!B?�߉o���t���rsC��U>���R�>�������;�жPG�gq��
j˧!uB_�)",Sb�C�.a<��'�^)6U��w\��5��px���?�D�K�F]�e�'���u�<��:M�2(�g8������jXxF�-��p���*Iz*��N�y�h��L��R𹋩z��75��{V��UԾ��9t�O��v��Z�
�_���Q��T�ފ���xKɞŽ�8L��1�ue�8v���:�2��µ(x+��(��q��,{�/J/�ԉ��JX-�gX����6��r7�]8{
�9#�>��(J����N�w[�Cg���m��@�I���<�!�q��MǼ��RrzN�T����[�r�(���!��g�z��;�f��rS���?z�?��bS(s���uų�C��8� �����S�D�.��9��e�/�KN�w($g[2�!��9"�1�F�~�=)ꅮ)x�ua2��A�H�L�X�����T�n�.�͈#��+�j��ـ�����$	=�Z��C	�BE���ǡ�ٚzE�w�l���g��B��W85q�z9dݴR��U����G���1�@ں��o���L��@�`��!�T�6MG)��]��5���}Щ�7f}��%֩���;��z��{Hs����9�&Hx�O]:�bR�_L��l�ײ҅)��^��w:2k=@����6�����9�rκ�\��Q͆�wCY�/\��&�ƴ�4��x�fԵ�`?�u�X��1�k֤9ZB�hf,��6ֵ��Q��ɚ"�G�I��������N�=�� ���"!�,�mR#�+�#���o��(��29��d�S>���!�˲QJGsEa�˰K&��Cv����N>�g��X�glK���gtP��2�m��CV�Y=���A��"��V��bKU<��٢�q��ݲ-����oƩ(����
��sj7<WJ!N��N,�7�:G�^H=gU���z�r��B3D�� ���Ɲ���^��$kBޙ؈�!~�z.�r)�8[&��N�c����x,˞Lz=�5�3�I�!K�<�w��B�$	]�y`�rd'x�)_L�yC�,�_���1e����Bd�gG8�Y��� )�.f���a���w*���G�+Z�	����L�w{|g�F��C�z�������tꜜ�s�*r��:��Dm��\uz7({z�.���~����9�}3�A��02��5�E��7�lI��Tu]��v�9;�e���-��~�$r4QU6�h���dLL�sz�|�;}�5*�{Ƈݚ�.CS;/j�1, *�,�!*��ɒ�Pkޛ��j�n�lE���;`^	��!���cGoL"��Ql}2����NG��+����}�[/b���u�%����w�~N3�n�K�ך��w����uj��Z;[�=��q�omWO,�u>���w�f��O��tA�,�'Zs��9�e�ڄ�ȳ��C�0/h�S$���ݲ�S�m�ˬH8x���Y��u��^n���}��*ϖ�u�I9����AR�.�*J�+֕�5�������uN����՝�g�#|���� ^�%]�nȻ��QЧ���A�����.v�g���#ܒI�gۉ���p�����Z��A��>{�Ɗ��N���l�x�(m���|P�C�˵M�T���BB�\�/�#������E����w�5::ӊg)�u$ƮYi�C7�_��,�L�sM̙�6���R윱�������`�Z�va��{l�k�'+n�kE����I	�h$uB}%��oj^n������8`d���0��"����i����������ѯY�9�w#FgHl:��9�@0W^1,� ]��W�Itc�����c��7C�N������ߒ���,��e~G2,������r����K��g[߿�3��m��?J`��V~�6�r��&��`��d�6L͵�`W�uz��j�F�G�ر���O���teU>m���.8�H�{�,3���*��:�h�cè�q�ٳ���s��1-��)�44�r#�����<	���f���9m�3Y��Ϯkɨ���-�V8���tLJDެq��wj��C��f��5O�Z�d��#|�M	WI-�`-sһ�\W6��>.�v��Xs���7�̞j����r��oT �Yg���3��ϊ"��m�q�j�JBoƊ���=�����6"}I!�5�3+ QH�3%3M
܂�R����:��i$��8gh���{6yX3�*�4���r�1Y�a����JֆAk2��n��n���ƒ ��U��'V��Z1����u��`����o)��*�McϢ�}�g�ago�|�G ����a�5�I��,rx�ȸ���t��:�xd�j�tؒ�qې�9Ui��pU��mĪ(�����[u��(U���rs����+=�մ�����Y�S	�e�%UMG�&UJ9�$x��t�O����T�T��P���m���m#��w]|�጑%��v��ru�~�f֧'_[m�g�6�?ďh�n�Jwbm���q�M� �k�Y�/�i����!I�!�����O�	9����!~8��|P����yΐte�j�{ۯL�W}���I�s���׶�a�B$�F ��o��a�R�:���7C!c�#��+�v��Qh˛G��9!���`�l'����3��w�Ļ��W�D��{.ҭ��U�0���������]�B�6�H-k_���2>���R��`�/s���s����s~Չ9X�~�U!I�"/����.��%�M���wV�E�m��s��(��+�J�8���EI�B�=��o���ӖT�ҵ�:ǿ:���f�;��W��ϋ&�0�#c�߹㔍�{I�ߩ�?Լ��-_a�P��f���w��N2I������ɐ�A����)�\�L爏4�L��+��͊���iLt?�V�Ir1�I��W�Wt���W�d�VS��Ȭhi+B���-3��[��s��=�[�(��ےăK"Q�^�a�M�D���ޠ�>~V4�BlT��w3"���
}���2?���u�:d���X�=����e�w�xS
�7	��/����O�2�!��$H'�ɨ�rm�͗{P�������A�d�d2�a��!�n��A�"?�R�q�{!ie���u���s���Fho[�c�.}�5l��6�^W�GkVf~>8/$���]������_l�lg�~ ��`�a�으LR�VB��SŚoG����Tjh�b_l�fέ6��[ҪMW�CUU:��Q�0,ո�ǜU\����U{9Cƿ=\������Q�i��l&!a?��c>'�z�{]"a��V��ٻ=M���	�/FaP��Dp@��E�J��Z���o��?;�vU�����g����G�B���A)͡{��^K���oW��)�Lx����.͑ժ������WG�27]:a��9�!�Gשo�n�^ά����}�_�����G�n����+3�p/*�کݦ���w&�|0���2�-4ldxޭ^��Oxt7\2"    w,Q�9P�iӤ2�^�,������c#���Mv?굃�}X�Q;��ִ�A Z8��hrm~"�s=���Tl�w�V1{?8\9�!�JE�n��IMJ��V)�ƚI�js�V�����w��6��I�Nr��Dy6g�8�3>�����d����fn��k���w�ݰ���(!K�`�%m��R4o(����~�����U�m����B� ���H��.̼�˚2�����i���T��vze�n
m�������i�{�!���c:j�S�9 �\l�ˇ!�t�Ē˅�UF��[V����C�:�@yǼ@	�2Nܩ@��^��#���J��l�<�Q+ZI�!~orz �K��p_�2#r����L���Z~e�&�~M���yB�Z��!nۥ���AO��d��"�Gg��AN8*t3��Z>O2���h�a�#��������Ȫ��2Z٧N�����^���y\19U�;;�H)�c�Ӈ��~_�1��򂠰v
g���Mq��T��g�6��rzǨmn�����R�!��8�ֳ3���_�$��2�3/�k}z���;�W�yg[�q ;�����ݡ��X����,x5�����t�?�A�p0��6¶����Z� P��P��>�˓w�*�<�m�2�W�f]�wrX�]�)�n�T�oh:J�t�¢�R�7���Ðh��+�F��m���k=���A�-����^zm�OnT�K�@G�S]0/���8}ݝ�:����������!��E��E��@E��*+�J���^�O�a�vi�Z�{�0����N/K�@�U��\6����5l]b��H.g�F��P�0�hb�Y��LlӹC�2|z	3_g�������>;��bxiB��-��~x��0?��7d "�!E^��(��؛�|4�z�p���h�*���5t�U݄����~�f����qPL�LY����<�x+xA��?N5�F4��	�M���m�ދ�Fmi���/ t�07E0�nӧm�QA'�{��g���z-��ݍ?+��h᭻�oU�]Wg�z�2��j"�\HT�A��p��'�V0��ΐ�/�d5��Vyg�F��5ԴDn��=/�vx̙����e��|�$�-���럱5I�G�|��}蒚Ǩk*�}�ܥ��vf�"�4.��t�i��⋂�f�~8�2"�Tª��pS��F�@QW��m���eU�F�z���v���F@�H��N�3;��e�i�d�������N�U3�O�( m�a��ܞ����tÿ�ک�	KR �'1�s\�;���{0$�pO��e�پ�{��[�,���@o\�dq�|���&6�~�7|�Cm��=}[���t ���NW��TC ������m���׺q�ޑ�F�ފ����Sn������Tw�>)^�Wjc��f&�휬�/�۠���cʆ��0����i�)#=�>t�<��g��T�j���6l��y��{� ��܍�J�C�TMɝX�-�pU_�ԃQ�����q?�R��%�pN%N�r��
ⶠ>����n^2�c��%�ӣ]���Y��س��i]���;�NKZ�<�r8Q�l�}S��g����0�̂^\�AW��҄�)�	.�'<���f�X��&��U��/�9e<���8E�x�/h��H��+۶���#�6��c����A��2��$ w�{9��@�%��|��P�]��C��{:n��I-�Q4�*
���	r?TEA�
-pꤝu�O�� K2y�B���g1�'�ul��#F-mɩ����( ��ɉ{���c��1�y����l��2I�U�i��_�6밮Ӗ|z��U�'ǅ�7<��v�u�#�n��
ޮ|ͷ�
!"��q�m�z���k��(���i㸯p22FP�D�n�>��e��ɬ�k����C�jᇒ@�ws��v�rø���%���?z'\n��%y���^�{��Z��!ni�^޺A �A��^ʊ����nl.S���[�F�1��}��V`u�~�e.(ۈ'�H�q���M�O�Un{����竡�w�,�5[�$�#���Ni��8"Q��˪{�X��
�yF@��?G�+�+��'�$8{6a�!���D3��o�)Ȧ&.u�j�<J���3����xb����@����!n9�|ّ�ڱ�s�t�R:4�z���b��Ti���%5i�0W�>�����<ʇ�p������	�0�u�S�'��BK��K�캏���,'�h�~
��gM�5i�IRJ,Z���@��Y��w�V��L�F�k�V,7nmY��[��������{�σI�.�u]�5l���g��ה�Q�Cc�����1��۪x?�G�UA�����p��v��P��!�u1߰Xs�t�w�w�Mt�����;�!��E-M	��[�
�i����5�����C�=��sM�q�oʾ#��	n��|�R��F15c�V���G�v5N�*��Yd/��_i�	��1z�ۇ�]1�.�B��5bZ�R��ڨα[�}3t�y}�Z��Y�Ç��b�Bb�R4(��BT:ʪ�kg�=(s�\��۸��pǴ �����uMh�i.�e�zȝ�����Q7GK0��t�����xv�x~��U�E6���w�=��b�.
��|�Ę��G�mE��8x;d���;)��iЭ[:g-6��m ��kc�%eTH�d��b8�|;�3����r�Bym�������彃=�
q �d3!�"�pT�3��F��Z�&]�3��.�ubDm����w_��Ŭ�C,ƨ��fO5.��)	xP�"*�2���h��=�ۇ�����8@�C��0p+�p�Jgl9�u���T��7�������6�V�{�Og��Bޑ�X����$�,�����ς�m��Y�r�>��}��|0��J�SWY�*RM����8�����M�p����;�!Y�E	���I�;���t'��m>F��ΡDmҳ�t�]0���g���{9�[��4�|��d(ٴn�*t�w*�.�Y�~�2��&(�Px)���X�|�Qg���9�/�AY��Ĩ�����w��Ǆ !��A�aU���ku�*���>����ak�>����M��&⬖gǺ���7|!�4�m[8���J��e�-8���o��a2�f�����o4�w.|m�
oߕ��NE�t���X8��+�����
���f����0�m�Ü�]�%�;��̼��a��W�%!�yRi_dM��[�Ǻ?Vb�U��o��lm�
#1�ҌC�^A !��A�zq�4�$��y���}_����:���]ɭvA�[Z6�!~,���Km�ԅ��j�f�!Y�B�21t�����6������+1�-�V�q�c�.���b]��/,&<�sD`N������A�۫_:�]�ӵ����g��m�Oו��Q�ǜeM�~�Ux)+���D<?����`����-�q˰�9=��as���If�g*؄=���������O���%��:r{K�~���'��3�W�]�:�������A\V�V�)U��gޙܞ�����G@!�jY� �p���w&������ӻ֏W�t1դ�;�����2!�9��y{�5�p[g�\V��R��+Aꀯ������6����4�~H�=]�FT�Ryf�'��Lૌt��`�#���)]^Mc�9��>�9�
Ta���uA0��$�XP��S�8A#eNm�r�v�����t)V���'��{6�@g� +to\DPq�����Չ�W^]��e-?Z���qy�Z�;�a���~)��.eX��d�[��o/�7G���/Z����h��lVıo$��t�	����q�����XYGH�(r��؍}��0,���LMgD9���>�F.�z��T�sps��	�H�o����w�]0���i2�k�.�􂸫�9_�26�&���i�X�X�`���x7}����sx���~�h��>M?���<��,�����yI��4E��mJ�ueVkĬ��,o���L���9�~�Ew���	��)�e�RF.��qP|v�a|�^��g�d���<`,0��fq��N���t_� (  ������|hC�(�t���X�{�o��}['��߼�l���M�p��)�%�٬����{ͺ�8�Q�d1�#?g���,�}�\<�_+^�������;Ϭm�랃[���o���'�rT���@_*����䥓9NjZIQ4�>n���hE��m>~d�oX'�۠�;E7c�'�[W? ��dA�K�>�V6kV�l��raۓ6�w��׸�q�)�7]�~\ٷ���˧i]b�h$#�EF��0�Tf����SW�QQNb0�ĸ�!8�����-班�������>�      [   �  x�%��q�0��b2�g/鿎�2s��wk�pܣ���w9b�������י;6�+O^w޸����7��õZ?�e+���ճF��/kFy�Y+JDͬ%�V։T;�Fɪ�����AI�-;?�����ѳ��ֿ젤����>����WvP\ �UE~-<��*<��0�A��/T���A�7Ã�o�)��R>�lR�2Z1HCR�!e �������1c�B�X1�!e�Ґ2NiH7���l1�!eVLiH�<`iH�4�Fa�1����i �����ל;8�Q9���r���\-8?��3����Bm�g�'�~֌� �������c���:���g�X��[lI��[~63*?�g#?��x�r����W��S�͘K��>���g����sZi�99��ݗ<<}"��'"�rf����L�h�[��B�)�g"��L�܊� ��%����h�A�Ţ�\>+)wŕ����B�=qe!岿R����jlq���jn���mN�T�T��EO5o�;���&E���&�!��NS���,5�*��)f�����2E(��{����]�#O�����Id��ye��K#ä�qR�M$��Z/��k�T�F�ps����M��\�7���C>N�{Qo@�d���U��Z�*cm=1��!cm=|�$3���t`���	L�>���g��cm=�8�~�k?��������a.���0���a�|��0:�zZ����G�=�B�~�!��:Ad['��c���6�֧�N��t��*[�N9Kc��g� ���>�`�d�u^�Ēu^�$�u^넓u^��/����n�˄�n���o�˱�o�K7ހ�/��}ar�u��X�ˋ��X���d��W~��ޜg�U��4v^%�Uf�U�B�^%���d{gHP	���������?�%$�         U   x�3�,0���,*-O76̲�OI.)�11+���t�K��,�P�H���L��4202�54�5�T00�26�2��366&Y<���b���� ݐ�      1      x������ � �      S      x������ � �      /      x������ � �      7      x��]�r�6���y
��������+W6w�dR��$3e{.u5�R�$d1�H���8)W�k��ݓ���J�F�Am6�	�� ݿ��E��N�I\�5���<ʣkT��������hR���NOY����"+�d<M3t�װBu���������2���24<��%:�,5*�/��x�~Y��/�?��'����(ͿOQ�O�y4G��a���2�/����=��u����]|;|�4P%QQ�҄�%i�����"��Yt�2\�C\U�l��.H�mHI��*.��7�XdQ�fE�X�n�*Uj t�l�8a�"��9�[t���!6�,}pl���|ql�ER�6�}��K�z���`PP�ao���8�<�%i�E9��
bQ$��cC[ere��%�@;2��a��{�DFا3����?��)���>X�}x��i�y�������mYfk�s�1�>�-Jt����0Jjlj���-nSZ�+O�SI��P�n2�ɹZ�����Z!5�m��*�̿�Y�7l�~L�B��(�Qrj�&��|@W�"���
[$n^��^xU�w�W�D8�'nΫ.�Ӵ�j���v�o�M�N۠V���@t_,d��17�{<�!���c��w����t����p, o��y�W� ��D�4�V��@��:�g�X/�1�U��M�x�"n \p{o�,P�j�Z�5������R��'N<�!��0|8*�~Cq}�����Ϟl�������YGacO1�"y��{Y`��I&9��v�̧J#��,��hn5�hcS�?�H��ϣe(�P5�?�����Gá���>���{�%�3�,3�jr/+K}�k��,rp�eZ�*Ľ:���%�6�Sz�NA�k�%&5�,��-/|p�u����Z��m�	�SF0��W4i'$�S|cCG[T��:�^�h&�G���	����F��^���m��L�	�"��Z����,#��]7=:�z�m��V�{�v�uy�]/���	Ĵ���]P�����n.��hS��i������,{\K�
��L@6�8����j5�o�� j4- @�@���9��ƅ?��0��4�7�4lOdtW�7Ӭ����WX)ڋ�"����k����Ȟ����n����LK�\o�W� ��ȹ�fA�wĖ�i�=�˰"pC�>+"�&��~�������P.P@�1�e`��6ۄ_�F�a �@��� �YB?f�Q�:@ D�P����+�yŭ�r�V�k�CM�r�X�J��?��AL]���1��+;�f�
�7ԧ�{�b��5��W�b�PY���eB�Ėk��,��}p��?�����|��g��e�	Q�b��`G��`��M���<m��~�z�g$�Tn9� "���l�N:���
YD�<�)�����8,�,�Ҕ-(�ڼ��,��T�"mG�+�yM3x��%���+�̏���뢯��p�5�� �|��T�\�vBF�� N6:�^�Q����v+\�Tca���.�E���	���G����i��Ʊ�A��&�Y�g�!��Rľ�?s��&N6ͧ)\a �̢��B�ò(����{��}S�5��b!O$e4���D��3|�{��I�u�^-kfMb�C�M�gB}�ʂe�I%�"΋�y:,rtY��D,먼F5q�Iwc�!��łͧ�L̫!RNb��������4>�!`u
ޕ�ԧ���V��5�n��x_��`j	\�?�4��2-���%5�����M~��hv�����Y�%��|�g$��j�~���x�W���6-�e��¿���Ȗ󼙇Ä�M��.�am�Ddtf�c��jp�l�s�WQFU�0u��y���q�z�G'Ґ�7V����<�a���9%F����1����v1k��Ρ��ІM��ǌg��x�!a�REw��Q�d�*�E�$�1��<e�1�eb���t���,�eYq��!E�Xk��R�!7W�G�LR��@i�J����]s5�oQYq�⣡��P�5I)*#�/j�P�)����,K�����]�YZ�S��,����~��2�{w?�m���y�_S{s�7�?��#WF2�� ��*� A���:��Q������k�i]�lF����8��F"
pD���	-�R�U�ߐ6�L &�Z���P��yT/K4Ik4W*�cJ��߲�S�N�RPF�d��eTaX%/�Ȑ���`�Iw��D�$*���"��z����|V�8J�����տk=��z����s*�B$��X]�������7��w�i��2�6]�ު����!/H$���Ԗ)h�-�l#2�C��f�Buh�����K>��K��]떤��f)����J�s;�B���!�l���]-Sqy����'U��(��xz����+ ��0&�+�P�g��^ⷊJ��>�a�~��W�Ճ�����b�vf�����խ_���Z���uk���S��4�ߡ��r1���%NY�������)�	��+�������OO̮�`�����<�� Y���4��<��2�D��Mh�	��3�yْ���&*�$���i��2%�F����$�!rM�5.�jM�5��C�zQ v�@��l�!�v����&)���1����67ϵ$�j3~��6 ׀\r�u?��w�} �^2��b/�q�As�)[�������[hɠm��S.�^[���K9x@Iq��'��q�����q��N	��yP�xl���eR~kL���Go?=1���3�*��e��^y"<��F�"<�L
���وAi;�уw�;�Ll0��6�ވ��x���z���z���LM�>!^	B��5'*����g���=�,��G� �`���*���K��T[���S ���`�'/~�Z�� \Egi/4�'��}�����:_����5y���\W���RP�s���YX��f�x�ȡ>.gi��E��.l�&��`����i��Z������m�[Pǫ�Аeٌ|@U��pjƃ����a��VS|�R����e?x>����(X��,�/�RL�o��Ey��J��`�\�p��ɫJ�N��x����|�`�/�������Sx"62��0���B٢���Jy���P�\9ڧ����P�C��ơ�7Tg�}5�X��*��C2IcN:�,�Ba���o��̭�3W���cH��:�&�*u]�%�}�o?�B_�|P�%��UOQ8͊���Nt?�3lb]��K5;���3�{է��b�˭Q�5JYifku�vNS�ڮ���b^�l��X�V����lj�}[�#�� �C��7|_v(���dm\��:�#�Uw2>?"��ٹv����^�:����_=}����OT��h����c�8��?���GM����$�,wXNj�� �	��`'�G�w�������ڷ��O<0��/��GR��&�r1�_3�_k�*��2kro�֨����Ԯ%ۺ���8�ڂ�:��W�	ջ/@� ���j���E�����ܡu;c�(:姅�Vt\�ނ�,�/xІh�.Y+���������J�x6}���N)��WM�+G������j��6v�;-[	h�����?6�0?��mr�m�/=����K�a�&��7BL��^o\����A�P�w�#�!�zC�F�To�ޚU��g����g�ƺ)��X����lu�꓁��7!VJ'k8�R�8��F�y�+����"����T��'/<n�-Q��7��eq�|��ߝ������tO��ǚ��jN�bqg}
��*�Tr�1q��Zʬ�	�F�9�	�<��}�w���OA9c���i�V�4Iȯ&����F�NiI��oY�=�d�^�<!"A����a��#�Z����B>����!_/M�!;� R=4W��Λ]����i���~˞��b��D%n{�����ae��w����oxd7fRvpY��S(,y�p�$5q�z�޽WtX�[Q�l����+m��~��P������Q>Mב���D@=��������0����% }  Hu�	���p�����ta���]�p���%�Y�/�����'ŭ-	�+��������_(�uJ,���V�N�[u�;����]m��2X��^&�n=�����=�#Σ6^� �����U��?s�5P�Ѕ�2����n���}�d��P;��8\�G>�߳rb#�'@� �,@0_�i��3�N�5��vĞ��{�w�5��'�mV�^�؜�Zq�2vt����1� ���g�W츛��]��vpj�S�WN�ឲP턟ǡ����ߓ���X0W�\m�\�@X�I`�;�������40C�逹֬hhSC&��C%wد0vې��+\!��w�B�ć~����Ǩ�3"��e���8F�Z[Vu1'7\{����!I7a	����:�a�r�[�s(�;�]�ڑR>Ҷ�W�v1g|O�X�Ն���)��*lW�u�'���f�̬Z�ζ����؈
�Ah�;���n�B P��@��gҨ �=�8Y`j���ɳ7?0�1�>�<X_��B*A����n̥�i�(\P� N8�Cp::���V����#���;�=xKL��&�3t��X��
O��+�"�Ӆ��\~�Q�!Rz�-L��ۧ��]G�z5�\}:�M��R������I���Ha���O�w��dŃ���S1׾pޘ~. �&�k�vwR���|ʶQm��ޥ��}t���.�� /�^~,˖-�y��^�l�� я��#���Yi�G����ן�?��8b2�]<��0�m$u�T������󣿆�k��t(��ٍ�.�iV�R��n�s��9�H���<"�6ͿOQF�i\a����(kڟP�뒊����[�Q�����([)=3���f�-0��Yt��JRudsVa���T�qb��11��Ѭ`�L>Hyf�JJ-6w����l�ɟ��n���C��0�ˇ]N�<7���Sue���}xՠ��k���*��ʀ��_�y�^u�hNR���Vۡ��64�;m�Z��6���bYS-�h�c�FNjqV
��c��w�$hT U����'ED�{rT�G�Kq�x-Sava��t�̫��?��J�p@��)�����>�mh�t�~;�ɧ���y�N����,CѤ���Fޏ� o�	���M�>��7��D�\0P�X˧�i�����.�r��p��@UO7AU��^�m�����;�Rb?Ҝ��m�!N�K��ն�L������m5YT���T�� +�W�mӚ�뽪5�w-��/�n�\UB�O���t�ɧ�N���6�O�}��^�r ����R�@`E��N��.�0�ƳM����pc/����tqZ��f[��g��[S���/��ϚWC݇U=��UI�Y��ך�G���8�Mb}�R�%���֋p4���W@�a�#L݂Rc�	a�0R�� ZE5��ռU�B�βʫ��&>�r�π�_nc����e�]���b��/�������2h���q;2\�@y܊5��ͨh >�rH3��+R�o��hN�	bT_����zC�
q>�{4�����`c9eϰ�۔W ��XZ/�@��Ũ�܎�h��N�iq�0v��+����K'����`eT�����(;#S?���C(3MbO�����A&�"�6��	��'3TpH���e�s����܊�V8�
e	8��TȩPa���"�|ž���_)�(P��>�r�3���.'`�� �O�d�E���Fbl�B{=Ӝ@:c�6�*u�uR�2��5�|�l;^Ypvv���ڭ03����6�ϫ��˴>DF!��D�x\>r�+7���w=	k��y�9�gUvP��\���bAnIDy;~�A�D��ؾ����S��*h�P�8[�8�A���V�G�  �d?��]������u���`삱��������u�����i���c���&"��`"��&b�MD�M����J؉�"+�d"�;���<�1t�o�m.Q�(�
�Dߥs��a�-��u�b���&��Ǐ�JoSt�&\�n(HG�3����D���ei�ɋ|��ń�|4ĝvĮ"����!5��]Xc6�zSaC�-�
z��d蛛J�����6�,�(y�<ސ0�!�)ܦ���lfWQ|󶤆`�~��s���H&�b�-���H'���O����Q8�F��˨Dr$��,5|\�u�.���*gDVU�ֳ�Z5��aՔX5����ac��eQ�Z��.͓�ڐI��͘<K���Һf�p��e38���`O.�Ɠg���|۬>I���ɢ,0
E�ٷ���ٰ��U�Nz#���?l������S2Ȋ�ei~�mI��!?mƈ �RN��F�󱍘P��$)ɻ��i��u�օ�X�?	��UR����ߏ�㸘+,����Z�ܑ�rj�U�)Q¡���}*/�B���i�$�#����g�]:l��h�`�Vr#;D���11w�o��l�'�Z.��CO��G��DE�F�A�qj��u,�����]��1���x���pb�Z<׳y�����pp/X�:�&�z��F�0�Ftgz������1?/I�q�������Ǣw��<j�L˂�v��r�x�&�Q&��.i1*�"��v��8-�����F�෕�	+��9VQtgq���_�`�a~2�gQ=�P~��Q�2��EQ����
#}��o_����_s���O�5)������w$����	�Q>������Ȳ#��ѫ�����9�T1ɯ������W����䖛��/_���g�E��r�7՘|ʐ��k�:N@v9V��
��嘝�q�����6r��tĦE9`��}}p�H̢[D���c�N�p�5��P�+���f�[AF������FS��C:J߾��e� �3�{�E�mD������%z��_D�&��rI��$s��,���IZ"�*�r	'�EQSF�bL�4�?;1�9��XL��;�n��,bɒz�������������/4�[�c���'�_<}���W�?6kz~�]&4����0E<J�K�#�S=���fvN���WU�+��w�"<�Wk��\m]���Ӓy�c�#�ߋ����~��]�O!�>,�����˫|j��Ҿ��i�^���e��%U�_7�}w�t�Yb��U;��1�W0{a6����pP�L�e۰!�W���{/񴱵��brnʴ`��C�q1� ~W�&�rb�S[���Ҏ]M�{3�R*4,���0{;Y��N��D1*�A@9�HIB!=Y�J�,��(e��W�& �1?��T�u��M�͡i`����%�
���2OI!М��^$*Խ���etK+Xm{9H�P�:q�d������$����Z@��򉯉!����t��7p�-7I�g�L������
8ˁ�,륚�F�B��6|�l����w� �Ԭ���������Ʉg��?����|�           x��]Ks۶^'����ډ�8�:iwn����^A	5E*|�v:��|� � %*XıE�;x��;8���Y%h��xu��?� ��~�Eh��0�W�	\�,���6=� ��>����OAVxU]�W�?�"�_���'��JV��;@�F	-�y�uﱍۺ*AH���u�"<�W^a���_$զ�*��p���lp)r$p�G٠6�?7(E�0��8�����~���V�;i�I���y�d'/�����K�:�g(��9��eu�D)^Wґ/>�p]��O���� ���*���/E��zi�	����C~��j/��-q�`״��J��2���_�)�&��lJ�ۭǓ�ߗo5�1�[�����?����V�YѢ��5����*O�GS�>_�⠃�I��"fIy��Kt��fRDJD])�����@j�N��p,M8�z�ٕ��&}��FrdH��Q[y��j�U)�	;*�e
�ZVWmYS���.H���_Ӵ�}��4�I�����4
Hf
�
v:�g%BI^�[=�z��c��R%>�!����p��w�(Q�w�m`.gT^48kQk���}������A�%�вϺp�b�!�|~��
�XZ��h2�ݚ������L�l�ohV{|�ll��Ą���F_䄝$�<�p��$�&��K�2��S��'�&(=P�dZ���`c�(�CN�B:X��%���hw@~c�����@\��}����'�Lx"n���m8� �7�3� �������2�ϝ�g�U�)wWnW�_^j�j�|M�JjQ�Wko��qLfa��ډ�6��\�ց�c't��:���<2��n%�Jx������S��o��I�dau5��0%���TG�Zi\�4nC�a��eeK-[�Q�B���WȤ|�к�㘒�I탔�I�r�49+���o���������.������ l1&�p�Wv���'���]J�`����d�u����������j#zqf4(*d�K�S��|�/ O(���� �:��)�=?|RKz]
@��2� p�� ݚ]����+ڐG��X鹞]kC�q�v=�o�0�ԕ&�)^�&|:�U�t����d�AQ[���w���#�$����v�g{[��g{[0�����l�~w���o���+5�!5Q�xs@qհ���� 0()-�.ZYچ���6"���ߓ�Zh��*��"�n-̯��s� �P�E�Z��E���I>7h=�D��&�Oa:�q�T��$|İ��0�H��*Q�Yð�t6���m���FFW�ٛ�����DpݠID2=Ml#d5��6�Z^���@������u�(N7�-��h�F�oB`OP��K��$�1-ب�'*P�L��#�i�ì�_X�D��V�M���	t
�G�6�#t�i��Hv�r�4��O�:Xh��XP���(إhg����FC�?������o��l�waI�;j����%�~��LgU�:Zu�u,�p���q��ᵦ�ck���$Ï��q���t;mti
z%�1�v���yĠ_��噲�|fu��G���������#bV͆��c�m�66����F�KT5 #&#�M��Pq�eB176�Z�y+_V��G��� �3dϕ�,��D����Ԥ�� P��o��n����n�mdc#�+�l��������t2ht�;vS�bc#�m��f��|ⶥ���I�'	5�V5��/�`��'�̔$�9i�����˿���� � �ۺh7�~}>.uՂ?��s,�=F.���T��� +q��c��Iƹ/ΉZ�N�/<2�����G1��/�3a?���!��'����$�.bSH?��"
q�xQ�P�<vS`GA���2|����+�WTN�v]�Q�QK��=��Ц7{OEܣFEI�"wث7����?��k_o�<�U]YS.V%���Ad��L�N
Ӎ��RA%8�j�J�����a�
	����~Cj�|в�f��#�Wk�o�O1z|�x�d��umn�aZ��	.^���cgW�����s*���_���q�Y��-�"���Sz#=KhM�ض5/���ѕ�.���,��G�u�����&#���Y	�&�Z�p7�v���q	W��ړ}�챡3񗧭UgW.313X�N�{����b��;���*��K�po���9-�����f�2 � A Á�/>
�Bs<G��"���ձ߯��H�
Aw����^ƙ%���Yqq�wz����|IprƂ������FH�;��@��6��ך���M�p�� �4��72i�Q��2q\�-���z����JM� ��^]�ӏضu]�A��d���#%3�=������ԉ���őV��_U�<�fm��`�W���5%ٛ��)�[���@�תz"
+�E�[ԛ��S��u���_L����צ���I����K�F]�F'�x��ۑLN��Xiה/�.�A�W���&�����/4R�#����h�z��9����'887��'Hj�rMl\eC�ƣ
��Ѕ�q��㭆���r������N���v}��%;��zC�y���^Y�ʒw�H�921����d�y����R�ƻ��xki����*�<e
Ʒ�z=���d6���j�8����b�g�D��je
�Z�)�1���I��`���`���ސ~'�?�a�|�^���.~������GD
�At��o"vP�O
��h0qF�Z�HB���ri�I�e�,:(��9�G���B�nL!��C��[W/49�Z�<,B;C��\G�R�e�\2s,�|�v�I_�����~]�%y�>h���
z�<�ں�,�'��,���i{`��؜��e���@�8�[�8>�/Q0�k�,vf��_[8�� ~(�$�AF��jM���R��u��~���>�Mȡ ��Mʗ��Tc��Dǰ}������8�>�������on~�����������w?��������~xww����ۛ�Ow���[|�����޽��O�_��?(�J      ;      x������ � �            x������ � �         �   x�m�K� ��w��5�ö��
W%Ah �_�VG�����3t�g=�DAo��R(nv�2�JXVp�z
KY;θ�a@����$Ԥ���q4�t!�6�}���m3uq2q1����'���o��Z�.M&u:�6�f�/X�z��KG[rcgb�i�y�ѩ�Kz.���� �
�[)            x������ � �      C      x������ � �            x������ � �      5      x������ � �      U      x������ � �      3      x������ � �      9      x������ � �            x������ � �      E      x������ � �      !      x������ � �      I      x������ � �      G      x������ � �      #   n  x���ˎ�8��y�.��������dc�`6���2-%���J��%��Y�'�}l���.��|�Y6�E\x������Z��5z��� ����������H�!�/���+�W®,���<]��������!�8������E^*����A]
%l-��Ͻ+O�џ2���tC+Eɗ4�T2*�P&�.E{��~���u3�K4A��n[-�e��
>4���"�Ob@МUa�Z�,�U9�2��G��wu�~��8��e9y��ne����7͊G2'k�t����ی�#��>y�PE���ė��%N��,om�x�Y*��\>�I#t�Go+�{�|\���6�T3��f][%:Tԏp^���Oz��I�WCU�,��dyZe��A_�J���ߩ���χ�u?pr�)}�� ���EЮ1�	u���~��p𷕟`�@G�#�nn��pXęS��P8)�Y��@ �!��L�Ը��v�q�K��%ġ����r�i�РeIy�B�P�N�F�: U�i�
���i��е��]/���B�6�첛�DW�.��O�b8XeI#!� -��b|҄ޭ�=L)}p��	�tʤ��_t;�l��l��G/�ƨ9���a&�����`��[���y^K���@>
�$:wi�� {ڥj��ʉ�{�����|Eم����υ!�sc�~�N�l4O��:Btr����0�0f��l*7�/�J}�(��{���
yM�ΒmMC�	y�K �ߣ��t'P(�QһvJD�*�;�^ߣ��x'P��Ӧ�L�c��#�M��'��}y����\��[�B|%�J��3�s�ㆆ;�Q�m�*��<�����S��=O��m�-�/�T�-p�L�F���Mv?�9��0�b��K'��/ݢֆ񜾏y���0)P�U0�|�3��5+
[,��Ǽ���0��΀-�4�ep]떘�Z�r�>{"�䊳+K/IB��(�biWp�� lp�a�:5���Ĝ�A�v��s��b�����T55O%��1��`��?ԡg{��g1���Ĝ�!`��F��cig�UqwǱ�po�p���1�d�� ��̚�QnZLU�V�Y��vo��\���ɾ��RV̭n<�"�a�M�݃�����>;�
�c�T��հζ�f���8�#p��Q1Ǖ�c�f�^Ξ���w�?� dB
��6�0�&�\�����颫���N�d`R�+�����
ӆNв����&;�D!0"1M��c��yW�#���~���� ��B��}�ԕXf2��Q7�Dg&�(� n$ϸ�`�*���#ѝ��@xڍf4N�rV#��(������������Q�$��SI���:?�Cf�0H}�'E;��ޅa��>�xɫm ��`y�G�����L�._�|�FӒ8      K   �   x�-�ۑ�0B�Q1;F�_����X$g�'�����"KD��m_��[�v��/N;HQ�L/M��r�`�Mc��h������6X��x�J>����b�#UU���CU��5G=��=?T��P���0W��PE�Ӟ����;
��G�Z��|4!5-H��ؐ������e9��>��m��#���8���G9�~f��;      %   �   x�u�K
�0 �u<E.`�ט�
]������D��O߅ *�j��G�2	��o2�RY�~��� �����M���C7���b,�6�1ַe����8��B1�1!1UK̈́
�T=�S͘�	�.��cOD���IQ�M5k��x��|U�:p;3.���?݅@��kL4������PE_��a#      '   �   x���MO�0 ��s�����#�N3D��-��mV(�����K�7M�<���I~ئ?������^�\����%/9h�5%��J�������K���+а�#{�6h��Z��UҡQ�T_'��t�1%�yZ���d�u-( A��0���b���������!�si'Yj�)�&s+�j�#P���!�i�M�hs4�Ȳ���[Ŋ<z�	١�8��m��nc��£����xI)���=t���q9      M      x�3�4A.#N# m�����  ~         X   x�3�L5-1L463(+M�-2�2H*.(�2�+�t�T-��OL)�4��7�4202�54�5�T04�22�25�346!Qܔ3���b���� q]�      A      x������ � �      ]   �  x���ɮ�8@��WԺ��<��E��J*1c��`�׷�� ��*!"G�=w�/�Ӥۺ�j �Ѐ����ט�]�g?�w�!�o��∈��a������x�)�"�??���$����7���N+=���שR���:������ ��>sQ1���3o~�)h��"���9���6V7u�'������o�p�d@��Y�|��C��HC��3\�P0����Q�o�8���2����^�]8��Ln�i��ZJ$]�{gos���}<? �}.�).� K�ݵ�c3�YL�'��g� ��﫚�wqHD�1bO�]�0#ұGC�غ�t�b.��V��}=q�h���Ļ[�b����qC�)Zwۈ��d?���7<6��`4�$@���+���cfm�;���fjS[�7�}޻���i�x@B~�?!P��jи����%Nl�~}�����X8$=�1��C��ά�c}��R6r\����V�=�/���H��tu�e�
�TTf	���+�~�ݶw�|)(�<)=�;�6�9V�h����R@����w�X@�8ɟ�g��6��e�(�$Z��!b��{>%@>I��]+�i~$��Q��b�eɆ�3��ᶚjz��������i~$ @[VUf�Z��r�K�&�N������I�x�O����n�d�s�f�����0�:|��f�M";͏$��~p�~!�]�(l�ͥvڿ4~����Ϭߢ��|��.���q{      _   W   x���@�г��(�~zI�u�w��T��U�lR����Rz<���#�v�^ON�徴����f,�0J���=���#�q��      a   h   x�͹ �X*Ə��_��N�&��Bxjf��Fv�he��vv��d�i�9�A/�5Z�g�Қ���1�ʤ�X�a�pU`��a���a�Ǭ�=o���~l� (��     