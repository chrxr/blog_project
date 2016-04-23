--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE public.blog_blogindexpage OWNER TO postgres;

--
-- Name: blog_blogindexrelatedlink; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogindexrelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE public.blog_blogindexrelatedlink OWNER TO postgres;

--
-- Name: blog_blogindexrelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_blogindexrelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogindexrelatedlink_id_seq OWNER TO postgres;

--
-- Name: blog_blogindexrelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_blogindexrelatedlink_id_seq OWNED BY blog_blogindexrelatedlink.id;


--
-- Name: blog_blogpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogpage (
    page_ptr_id integer NOT NULL,
    date date,
    intro character varying(250),
    body text,
    main_image_id integer,
    subtitle character varying(255),
    listing_image_id integer,
    listing_intro text
);


ALTER TABLE public.blog_blogpage OWNER TO postgres;

--
-- Name: blog_blogpagetag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_blogpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.blog_blogpagetag OWNER TO postgres;

--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_blogpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogpagetag_id_seq OWNER TO postgres;

--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_blogpagetag_id_seq OWNED BY blog_blogpagetag.id;


--
-- Name: blog_bookmark; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    notes text,
    date_read date NOT NULL
);


ALTER TABLE public.blog_bookmark OWNER TO postgres;

--
-- Name: blog_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_bookmark_id_seq OWNER TO postgres;

--
-- Name: blog_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_bookmark_id_seq OWNED BY blog_bookmark.id;


--
-- Name: blog_bookmarkpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_bookmarkpage (
    page_ptr_id integer NOT NULL,
    intro character varying(250)
);


ALTER TABLE public.blog_bookmarkpage OWNER TO postgres;

--
-- Name: blog_bookmarkplacement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_bookmarkplacement (
    id integer NOT NULL,
    page_id integer NOT NULL,
    quote_id integer NOT NULL
);


ALTER TABLE public.blog_bookmarkplacement OWNER TO postgres;

--
-- Name: blog_bookmarkplacement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_bookmarkplacement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_bookmarkplacement_id_seq OWNER TO postgres;

--
-- Name: blog_bookmarkplacement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_bookmarkplacement_id_seq OWNED BY blog_bookmarkplacement.id;


--
-- Name: blog_bookmarktag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_bookmarktag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.blog_bookmarktag OWNER TO postgres;

--
-- Name: blog_bookmarktag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_bookmarktag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_bookmarktag_id_seq OWNER TO postgres;

--
-- Name: blog_bookmarktag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_bookmarktag_id_seq OWNED BY blog_bookmarktag.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE home_homepage (
    page_ptr_id integer NOT NULL,
    subtitle character varying(255)
);


ALTER TABLE public.home_homepage OWNER TO postgres;

--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO postgres;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_collection_id_seq OWNED BY wagtailcore_collection.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO postgres;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_groupcollectionpermission_id_seq OWNED BY wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtaildocs_document OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


ALTER TABLE public.wagtailimages_filter OWNER TO postgres;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_filter_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(255) NOT NULL,
    filter_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearchpromotions_searchpromotion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearchpromotions_searchpromotion (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearchpromotions_searchpromotion OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearchpromotions_searchpromotion.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogindexrelatedlink ALTER COLUMN id SET DEFAULT nextval('blog_blogindexrelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpagetag ALTER COLUMN id SET DEFAULT nextval('blog_blogpagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmark ALTER COLUMN id SET DEFAULT nextval('blog_bookmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarkplacement ALTER COLUMN id SET DEFAULT nextval('blog_bookmarkplacement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarktag ALTER COLUMN id SET DEFAULT nextval('blog_bookmarktag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can access Wagtail admin	4	access_admin
5	Can add document	5	add_document
6	Can change document	5	change_document
7	Can delete document	5	delete_document
8	Can add log entry	6	add_logentry
9	Can change log entry	6	change_logentry
10	Can delete log entry	6	delete_logentry
11	Can add permission	7	add_permission
12	Can change permission	7	change_permission
13	Can delete permission	7	delete_permission
14	Can add group	8	add_group
15	Can change group	8	change_group
16	Can delete group	8	delete_group
17	Can add user	9	add_user
18	Can change user	9	change_user
19	Can delete user	9	delete_user
20	Can add content type	10	add_contenttype
21	Can change content type	10	change_contenttype
22	Can delete content type	10	delete_contenttype
23	Can add session	11	add_session
24	Can change session	11	change_session
25	Can delete session	11	delete_session
26	Can add Tag	12	add_tag
27	Can change Tag	12	change_tag
28	Can delete Tag	12	delete_tag
29	Can add Tagged Item	13	add_taggeditem
30	Can change Tagged Item	13	change_taggeditem
31	Can delete Tagged Item	13	delete_taggeditem
32	Can add Site	14	add_site
33	Can change Site	14	change_site
34	Can delete Site	14	delete_site
35	Can add page	1	add_page
36	Can change page	1	change_page
37	Can delete page	1	delete_page
38	Can add Page Revision	15	add_pagerevision
39	Can change Page Revision	15	change_pagerevision
40	Can delete Page Revision	15	delete_pagerevision
41	Can add Group Page Permission	16	add_grouppagepermission
42	Can change Group Page Permission	16	change_grouppagepermission
43	Can delete Group Page Permission	16	delete_grouppagepermission
44	Can add Page View Restriction	17	add_pageviewrestriction
45	Can change Page View Restriction	17	change_pageviewrestriction
46	Can delete Page View Restriction	17	delete_pageviewrestriction
47	Can add query	18	add_query
48	Can change query	18	change_query
49	Can delete query	18	delete_query
50	Can add Query Daily Hits	19	add_querydailyhits
51	Can change Query Daily Hits	19	change_querydailyhits
52	Can delete Query Daily Hits	19	delete_querydailyhits
56	Can add filter	21	add_filter
57	Can change filter	21	change_filter
58	Can delete filter	21	delete_filter
59	Can add rendition	22	add_rendition
60	Can change rendition	22	change_rendition
61	Can delete rendition	22	delete_rendition
62	Can add User Profile	23	add_userprofile
63	Can change User Profile	23	change_userprofile
64	Can delete User Profile	23	delete_userprofile
65	Can add Embed	24	add_embed
66	Can change Embed	24	change_embed
67	Can delete Embed	24	delete_embed
68	Can add Redirect	25	add_redirect
69	Can change Redirect	25	change_redirect
70	Can delete Redirect	25	delete_redirect
71	Can add Form Submission	26	add_formsubmission
72	Can change Form Submission	26	change_formsubmission
73	Can delete Form Submission	26	delete_formsubmission
74	Can add home page	3	add_homepage
75	Can change home page	3	change_homepage
76	Can delete home page	3	delete_homepage
77	Can add blog page	27	add_blogpage
78	Can change blog page	27	change_blogpage
79	Can delete blog page	27	delete_blogpage
80	Can add blog index related link	28	add_blogindexrelatedlink
81	Can change blog index related link	28	change_blogindexrelatedlink
82	Can delete blog index related link	28	delete_blogindexrelatedlink
83	Can add blog index page	29	add_blogindexpage
84	Can change blog index page	29	change_blogindexpage
85	Can delete blog index page	29	delete_blogindexpage
86	Can add blog page tag	30	add_blogpagetag
87	Can change blog page tag	30	change_blogpagetag
88	Can delete blog page tag	30	delete_blogpagetag
89	Can add Search promotion	31	add_searchpromotion
90	Can change Search promotion	31	change_searchpromotion
91	Can delete Search promotion	31	delete_searchpromotion
92	Can add bookmark tag	32	add_bookmarktag
93	Can change bookmark tag	32	change_bookmarktag
94	Can delete bookmark tag	32	delete_bookmarktag
95	Can add bookmark	33	add_bookmark
96	Can change bookmark	33	change_bookmark
97	Can delete bookmark	33	delete_bookmark
98	Can add bookmark placement	34	add_bookmarkplacement
99	Can change bookmark placement	34	change_bookmarkplacement
100	Can delete bookmark placement	34	delete_bookmarkplacement
101	Can add bookmark page	35	add_bookmarkpage
102	Can change bookmark page	35	change_bookmarkpage
103	Can delete bookmark page	35	delete_bookmarkpage
104	Can add collection	36	add_collection
105	Can change collection	36	change_collection
106	Can delete collection	36	delete_collection
107	Can add group collection permission	37	add_groupcollectionpermission
108	Can change group collection permission	37	change_groupcollectionpermission
109	Can delete group collection permission	37	delete_groupcollectionpermission
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 109, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$20000$ZZxIXgJGM80F$Pc9c/EMFYJoVejylVJSy16aLbMaZl7T3a60FVk0IB00=	2015-06-26 07:44:07.710834-04	f	editor	test	editor	fsdf@afsf.com	f	t	2015-06-26 07:43:59.876257-04
3	pbkdf2_sha256$20000$Mw4ozEWJU94V$ca0EErN9oUJr7m+RRZ4nui5iF964t/S5uXns0VaGnts=	2015-06-26 07:44:46.119709-04	f	moderator	test	moderator	fsd@fsdf.com	f	t	2015-06-26 07:44:38.283923-04
1	pbkdf2_sha256$20000$XqXDHLkwHbJf$qHo9k5yAaWd2RzYF94C9hQmladbpCn5c1xaCq2fKNbE=	2016-04-06 04:36:10.933525-04	t	chrxr			chrxr@wefwe.com	t	t	2015-06-22 08:22:38.61379-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	2
2	3	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogindexpage (page_ptr_id, intro) FROM stdin;
\.


--
-- Data for Name: blog_blogindexrelatedlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogindexrelatedlink (id, sort_order, link_external, title, link_page_id, page_id) FROM stdin;
\.


--
-- Name: blog_blogindexrelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_blogindexrelatedlink_id_seq', 1, false);


--
-- Data for Name: blog_blogpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogpage (page_ptr_id, date, intro, body, main_image_id, subtitle, listing_image_id, listing_intro) FROM stdin;
5	\N		[{"type": "paragraph", "value": "<embed embedtype=\\"media\\" url=\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;amp;amp;feature=youtu.be&amp;amp;amp;amp;amp;autoplay=1\\"/>\\n\\n\\n\\n<p><br/></p>"}]	\N		\N	
6	2015-06-24	My name is Chris Rogers and I'm currently working as a project manager at Torchbox, a digital agency based in Oxford, England.	[{"type": "paragraph", "value": "<ul><li>Previously worked in digital publishing for 5 years, at Oxford University Press and Penguin Books.</li><li>Now a hands on project manager at Torchbox, developing websites and digital strategies for large multi-national charities.</li><li>Like to get my hands dirty helping with development where necessary.</li><li>Main experience is with Python, Django, JavaScript, CSS and putting these all together into Wagtail</li></ul>"}]	\N	A brief history of me	\N	
4	2015-06-22		[{"type": "paragraph", "value": "<p></p><ul><li>This site is built using the <a href=\\"http://www.github.com/torchbox/wagtail\\">Wagtail CMS (v1.3.1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\"http://wiki.nginx.org/Main\\">Nginx</a> with <a href=\\"https://uwsgi-docs.readthedocs.org/en/latest/\\">uWSGI</a>.</li><li>The site is cached using <a href=\\"http://memcached.org/\\">Memcached</a>.</li><li>For the styling I've tried to stick to the<a href=\\"https://smacss.com/\\">\\u00a0SMACSS\\u00a0</a>methodology.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\">Wagtail docs</a> and <a href=\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\"http://www.github.com/chrxr/blog_project\\">Github here</a>.</li></ul><p></p>"}]	\N	How this site was made, and what it was made with	\N	<p>How this site was made, and what it was made with</p>
8	\N		[{"type": "paragraph", "value": "<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>"}]	\N	When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track	\N	
7	2015-06-29		[{"type": "paragraph", "value": "<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>"}, {"type": "real_codeblock", "value": {"code": "LOGGING = {\\r\\n    'version': 1,\\r\\n    'disable_existing_loggers': False,\\r\\n    'handlers': {\\r\\n        'console': {\\r\\n            'class': 'logging.StreamHandler',\\r\\n        },\\r\\n    },\\r\\n    'loggers': {\\r\\n        'django': {\\r\\n            'handlers': ['console'],\\r\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\r\\n        },\\r\\n    },\\r\\n}", "language": "python"}}, {"type": "paragraph", "value": "<p>Then run the following Heroku command to display application messages in real time:</p>"}, {"type": "real_codeblock", "value": {"code": "heroku logs --source app --tail", "language": "bash"}}, {"type": "paragraph", "value": "<h3><hr/></h3><h3>What's going on here?</h3><p>We'll break this down into each individual section:</p>"}, {"type": "real_codeblock", "value": {"code": "'version': 1", "language": "python"}}, {"type": "paragraph", "value": "<p>Identifies the format of the logging dictionary. Currently there is only 1 version available, but there could be more in the future.</p>"}, {"type": "real_codeblock", "value": {"code": "'disable_existing_loggers': False,", "language": "python"}}, {"type": "paragraph", "value": "<p>This indicates that we shouldn't disable the default logging configuration. The default is 'True', but it's not recommended to do this, as the default logs can be useful. Instead we will keep the default logs and redefine certain elements of them to output logs to the console.</p>"}, {"type": "real_codeblock", "value": {"code": "    'handlers': {\\r\\n        'console': {\\r\\n            'class': 'logging.StreamHandler',\\r\\n        },\\r\\n    },", "language": "python"}}, {"type": "paragraph", "value": "<p>There are four elements of a logging configuration:</p><p></p><ul><li>Loggers</li><li>Handlers</li><li>Filters</li><li>Formatters</li></ul><p>For our configuration we are only interested in the first two. The code above sets up our logging handler. We are declaring the console as a logging stream handler.</p><p></p>"}, {"type": "real_codeblock", "value": {"code": "    'loggers': {\\r\\n        'django': {\\r\\n            'handlers': ['console'],\\r\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\r\\n        },\\r\\n    },", "language": "python"}}, {"type": "paragraph", "value": "<p>Then finally we set up the logger itself, instruct it to utilise the 'console' handler, and set the minimum level of logging to 'ERROR'. This way we only see when things are actually wrong with our application, rather than logging all messages coming out of Django (the 'DEBUG' logging level).</p>"}, {"type": "paragraph", "value": "<p>For more information on Django logging\\u00a0<a href=\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\">see the documentation</a>.</p><p>For more information on Heroku logging\\u00a0<a href=\\"https://devcenter.heroku.com/articles/logging\\">see their support centre</a>.</p>"}]	\N		\N	<p>A simple code block to output Django error messages to the console</p>
9	2015-07-29		[{"type": "paragraph", "value": "<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>"}, {"type": "real_codeblock", "value": {"code": "import dj_database_url\\r\\nDATABASES['default'] =  dj_database_url.config()\\r\\n", "language": "python"}}, {"type": "paragraph", "value": "<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>"}, {"type": "real_codeblock", "value": {"code": "raise ImproperlyConfigured(\\"settings.DATABASES is improperly configured. \\"\\r\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\r\\nis improperly configured. \\r\\nPlease supply the ENGINE value. Check settings documentation for more details.\\r\\n", "language": "bash"}}, {"type": "paragraph", "value": "<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\"DATABASE_URL\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>"}, {"type": "real_codeblock", "value": {"code": "env = os.environ.copy()\\r\\ndb_url = env.get('DATABASE_URL', False)\\r\\n\\r\\nif db_url != False:\\r\\n    import dj_database_url\\r\\n    DATABASES['default'] =  dj_database_url.config()", "language": "python"}}, {"type": "paragraph", "value": "<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\"https://wiki.python.org/moin/KeyError\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\u00e0! My app now runs on both my local machine and Heroku.</p>"}]	\N	For when Heroku settings break your local build	\N	<p>For when Heroku settings break your local build</p>
17	2016-02-25		[]	\N	Make Google happy with you by serving news content quickly	\N	
18	2016-03-01		[{"type": "paragraph", "value": "<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across <a href=\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\">this article</a> by designer, Joshua Taylor, on Medium.</p>"}]	\N	It's not the designer's job to know what business objectives are, it's yours	\N	
14	2015-12-14	I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.	[{"type": "paragraph", "value": "<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p>"}, {"type": "image", "value": 2}, {"type": "paragraph", "value": "<p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p>"}, {"type": "image", "value": 3}, {"type": "paragraph", "value": "<p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>"}]	\N		\N	<p>Organise your day and manage your reading list better using Evernote</p>
19	2016-03-04		[{"type": "paragraph", "value": "<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>"}, {"type": "real_codeblock", "value": {"code": "from django.db import models\\r\\nfrom django.contrib.syndication.views import Feed\\r\\nfrom blog.models import BlogPage\\r\\n\\r\\nclass BlogsFeed(Feed):\\r\\n    title = \\"My blog articles\\"\\r\\n    link = \\"/blogs-feed/\\"\\r\\n    description = \\"All of my blogs as they are published\\"\\r\\n\\r\\n    def items(self):\\r\\n        return BlogPage.objects.live().order_by('-date')\\r\\n\\r\\n    def item_title(self, item):\\r\\n        return item.title\\r\\n\\r\\n    def item_description(self, item):\\r\\n        return item.intro", "language": "python"}}, {"type": "paragraph", "value": "<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>"}, {"type": "real_codeblock", "value": {"code": "class BlogsFeed(Feed):", "language": "python"}}, {"type": "paragraph", "value": "<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\"http://chrxr.com/blog-feed\\">chrxr.com/blog-feed</a>. These are required!</p>"}, {"type": "real_codeblock", "value": {"code": "<title>My blog articles</title>\\r\\n<link>https://chrxr.com/blogs-feed/</link>\\r\\n<description>All of my blogs as they are published</description>", "language": "html"}}, {"type": "paragraph", "value": "<p>Following that we define three standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>"}, {"type": "real_codeblock", "value": {"code": "    def items(self):\\r\\n        return BlogPage.objects.live().order_by('-date')", "language": "python"}}, {"type": "paragraph", "value": "<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>"}, {"type": "real_codeblock", "value": {"code": "    def item_title(self, item):\\r\\n        return item.title\\r\\n\\r\\n    def item_description(self, item):\\r\\n        return item.intro", "language": "python"}}, {"type": "paragraph", "value": "<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>"}, {"type": "real_codeblock", "value": {"code": "    def get_absolute_url(self):\\r\\n        return self.full_url", "language": "python"}}, {"type": "paragraph", "value": "<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\u00a0<b>urls.py </b>file,\\u00a0\\u00a0then\\u00a0add the line below to the urlpatterns section.</p>"}, {"type": "real_codeblock", "value": {"code": "from blog_feed.feeds import BlogsFeed\\r\\n\\r\\nurlpatterns = [\\r\\n    #.... lots of URLs\\r\\n\\r\\n    url(r'blog-feed/$', BlogsFeed()),\\r\\n\\r\\n   # .... more URLs\\r\\n]", "language": "python"}}, {"type": "paragraph", "value": "<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>"}, {"type": "image", "value": 6}, {"type": "paragraph", "value": "<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\"http://github.com/chrxr/blog_project\\">be found there</a>.</p><p></p><ul><li><a href=\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\">feed.py file</a><br/></li><li><a href=\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\">URL configuration</a></li></ul><p></p>"}]	\N		\N	<p>Add an RSS feed to Wagtail using Django's out-of-the-box functionality</p>
16	2016-02-22		[{"type": "paragraph", "value": "<p>I've been collating links as part of my <a id=\\"14\\" linktype=\\"page\\">reading list</a>\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\">quick python script</a> to import the bookmarks from a <a href=\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p><p>By the way, you can now\\u00a0<a id=\\"15\\" linktype=\\"page\\">follow my reading list here</a>!</p>"}]	\N	I wanted to import some bookmarks, so I wrote a little script	\N	<p>A short script that imports content from a CSV file into Django / Wagtail CMS</p>
20	2016-03-09		[{"type": "paragraph", "value": "<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\u00a0Whilst discipline is something that can be enforced with training and checklists \\u2014 open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>"}]	\N	To Prince2 or not to Prince2	\N	<p>To Prince2 or not to Prince2</p>
21	2015-10-01		[{"type": "paragraph", "value": "<p>I'm currently working at the Bodleian Library, part of Oxford University as the Digital Projects Manager. Previously I've worked as a project manager for the digital agency <a href=\\"http://torchbox.com\\">Torchbox</a>, as the ebook technical lead at Penguin, and for Oxford University Press in a variety of digital roles.</p><p>Previous website projects as a PM include:</p><p></p><ul><li><a href=\\"http://rca.ac.uk\\">The Royal College of Art</a></li><li><a href=\\"http://royaldrawingschool.org\\">The Royal Drawing School</a></li><li><a href=\\"http://globalwitness.org.uk\\">Global Witness</a></li><li><a href=\\"http://plan-international.org.uk\\">Plan International</a></li><li><a href=\\"http://events.burton.com/\\">Burton Snowboards</a></li><li><a href=\\"http://election.kingsfund.org.uk/\\">The King's Fund</a></li></ul><p>In my spare time I'm a regular contributor to the <a href=\\"https://wagtail.io\\">Wagtail CMS</a> open source project.\\u00a0I'm also a skateboarder of 16+ years, and a runner of 5.</p><p></p>"}]	\N	Chris Rogers	\N	
\.


--
-- Data for Name: blog_blogpagetag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_blogpagetag (id, content_object_id, tag_id) FROM stdin;
64	16	2
65	16	47
66	16	7
77	20	46
18	5	8
46	9	9
47	9	5
48	9	7
49	7	5
50	7	6
51	7	7
\.


--
-- Name: blog_blogpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_blogpagetag_id_seq', 77, true);


--
-- Data for Name: blog_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_bookmark (id, url, title, notes, date_read) FROM stdin;
17	https://studio.uxpin.com/blog/what-all-ceos-should-know-about-design/?mkt_tok=3RkMMJWWfF9wsRolvarJZKXonjHpfsXw6uwvWqWylMI%2F0ER3fOvrPUfGjI4DRcRkI%2BSLDwEYGJlv6SgFS7PGMbJiz7gFXxI%3D	What CEOs Should Know About Design	<p>Originally from Medium, posted on UX-Pin. Article written by Irene Au, former head of design at Google. </p><p></p><ol><li>Design with empathy.</li><li>Keep your values, strategy and principles in mind.</li><li>"There is only careless design or thoughtful design."</li></ol><p></p>	2016-02-29
12	https://moz.com/blog/content-audit-tutorial	How to do a content audit	<p>From Moz. Super useful instructional blog on how to do a content audit from Everett Sizemore at <a href="http://www.goinflow.com">Inflow</a>. Very in-depth, well worth reading.</p>	2015-11-27
9	https://medium.com/the-job-to-be-done/replacing-the-user-story-with-the-job-story-af7cdee10c27#.cz8h59k79	Replacing the user story with the job story	<p>Via Medium. Changes the semantics around a user story to try to get a more realistic and helpful description of a user task. A useful approach.</p>	2015-11-26
23	http://awealthofcommonsense.com/2016/02/bogle-vs-golitath/	Bogle vs Goliath	<p>Major US college endowment investment funds did no better than the Vanguard Three Fund Portfolio.</p>	2016-03-01
13	http://www.gallup.com/opinion/chairman/171302/employee-satisfaction-doesn-matter.aspx	Employee satisfaction doesn't matter	<p>via <a href="https://news.ycombinator.com/">HackerNews</a>. Don't just give your employees free lunch and barbecues on a Friday. Engage them with interesting work and invest in their development.</p>	2016-02-24
8	http://www.uxbooth.com/articles/overcoming-the-agile-ux-divide/	Overcoming the Agile / UCD divide	<p>From UXBooth. A really good introduction to implementing agile methodologies whilst still maintaining a user centred design approach. Light on detail with regards costing such a project, but full of good tips.</p>	2015-11-26
6	https://24ways.org/2015/get-expressive-with-your-typography/	Get expressive with your typography	<p>From 24 Ways. A bit of an inspiration piece, rather than an informative piece. Explains, briefly, the difference between workhorse typefaces and display typefaces.</p>	2015-11-27
7	https://studio.uxpin.com/blog/communicating-with-designers-means-speaking-their-language	How to Quickly Explain Your Website Vision to Designers	<p>From UX Pin. TL;DR: Design brief is a conversation, not instruction. Create prioritised list of content on page, then build basic wireframes to stimulate the conversation.</p>	2015-11-26
18	https://medium.com/@userfocus/the-7-deadly-sins-of-user-research-22857c5a971b#.ntcjy467x	The 7 deadly sins of user research	<p>Credulity, Dogmatism, Bias, Obscurantism, Laziness, Vagueness, Hubris<br/></p><p>"People don’t have reliable insight into their mental processes, so there is no point asking them what they want."<br/></p>	2016-02-29
14	http://www.themacro.com/articles/2016/01/minimum-viable-product-process/	A Minimum Viable Product Is Not a Product, It’s a Process	<p>Via <a href="http://www.themacro.com">The Macro</a>. An excellent summary of the MVP process.</p><p></p><ol><li>What's my riskiest assumption?</li><li>What's the smallest experiment I can do to test this assumption? </li></ol><p></p>	2016-02-24
15	http://www.infoworld.com/article/2825890/application-development/why-redis-beats-memcached-for-caching.html	Why Redis beats Memcached for caching	<p>Use Memcached if you're caching small stuff, like static HTML snippets. Use Redis for everything else.</p>	2016-02-26
16	https://www.nginx.com/blog/nginx-caching-guide/	A guide to caching with NGINX	<p>Easy to follow guide to the implementation of caching using NGINX's built-in features.</p>	2016-02-26
5	http://www.kaushik.net/avinash/digital-marketing-and-measurement-model/	Digital marketing and measurement tools	<p>Avinash Kaushik is an analytics expert who has had a profound effect on the world of digital marketing and tracking success. This post from his blog "<a href="http://www.kaushik.net/">Occam's Razor</a>" describes the "Digital Marketing &amp; Measurement Model". This model provides a framework for defining the goals for a website, based on business objectives. It encourages you to think specifically about KPIs for these goals, and allows you to plan how these will be measured.</p>	2015-11-27
19	http://tech.trivago.com/2016/02/02/large-scale-css-refactoring-at-trivago/	Large scale CSS refactoring at Trivago	<p>A case study documenting what can be gained by refactoring a large CSS codebase. It takes a lot of effort, but you save huge amounts of time, energy and money in the long run, and enable possibilities and options that would have been impossible in the past.</p>	2016-02-29
20	http://www.secnetix.de/olli/Python/lambda_functions.hawk	Lambda functions in Python (with lots of examples)	<p>A really good, but quite old, tutorial.</p>	2016-02-29
21	http://developerblog.redhat.com/2016/02/24/10-things-to-avoid-in-docker-containers/	10 things to avoid in docker containers	<p>Clue's in the name. I'm just starting on my explorations of Docker, but this looks like a useful list to keep in mind.</p>	2016-03-01
22	http://introjs.com/	Intro.js	<p> A library to easily add instructional tooltips to your website. Thinking about trying this on Wagtail.</p>	2016-03-01
2	http://www.newyorker.com/magazine/2016/02/29/mr-money-mustache-the-frugal-guru	The Scold: Mr. Money Mustache’s retirement (sort of) plan	<p>I'd never heard of Mr MM before, and although his level of frugality doesn't appeal to me (sometimes I just like to buy stuff), his ideas on saving and limited consumption are very interesting.</p>	2016-02-22
10	https://getflywheel.com/layout/your-homepage/	Your homepage is not your site's lobby	<p>From Flywheel. Use data to work out where people actually want to be on your website. Instead of using your homepage to showcase content, move people quickly to where they want to go.</p><p>Also, recognise that your homepage will often not be the key landing page. Make sure these other landing pages are frequently updated, and sprinkle some design magic on them as well.</p>	2015-11-27
11	https://www.linkedin.com/pulse/pursuit-perfect-ux-portfolio-andy-fitzgerald-phd	In Pursuit of the Perfect UX Portfolio	<p>Via LinkedIn. This is something I've struggled with for ages, and blogs like this come up on my reading list quite often. UX designer Andy Fitzgerald provides an excellent three-point list for how to make a good portfolio site:</p><p></p><ol><li>Make it user centred.</li><li>Make it navigable</li><li>Fill it with stories!</li></ol><p></p>	2015-11-27
24	https://zachholman.com/posts/deploying-software#goals	Deploying software	<p>A long post outlining major things to consider when developing a deployment workflow. Very useful.</p>	2016-03-02
25	http://www.creativebloq.com/web-design/manage-large-css-projects-itcss-101517528	What is ITCSS?	<p>ITCSS = Inverted Triangle CSS</p><p>This is a model developed by the consultant Harry Roberts. It's based on the idea that your CSS should be structured by defined metrics (specificity, reach, explicitness) rather than thematic groups.</p><p>I can see how this would work for a single site, or family of sites that share the same theme, but I can imagine it getting much more complicated when you have multiple sites or sections of a site with quite different themes sharing the same settings, tools, generic and element layers. Would be interesting to know if anyone has tried to combine this with Atomic design.</p>	2016-03-03
26	http://codingvc.com/startups-are-risk-bundles/	Startups are risk bundles	<p>Description of how investors may assess the risks associated with a start-up when doing a valuation.</p>	2016-03-03
27	https://articles.uie.com/three_hund_million_button/	The $300 Million Button	<p>A case study describing how changing a button on a page resulted in a $300m increase in annual profit. The lesson is, don't assume you know how your customers think. Test, test, test.</p>	2016-03-07
28	http://www.darrenmothersele.com/blog/2015/11/16/surviving-open-source-gentrification/	How to survive gentrification of the Drupal community	<p>Something to think about in all OSS communities. How do we keep participation up.</p>	2016-03-08
4	http://conversionxl.com/how-to-use-priming-to-improve-ux	How to use priming to improve UX	<p>More of a review of the effectiveness of priming, with some interesting case studies, rather than a how-to guide. Useful background on some criticisms of priming. </p><p>TL;DR: Priming is a 'nudge' towards a desired behaviour, rather than a concrete cause/effect stimulus.<br/></p>	2016-02-22
29	https://www.upguard.com/articles/ansible-puppet	Ansible vs Puppet	<p>A brief introduction to two of the most popular configuration management and remote execution tools. Provides basic pros and cons. Not in-depth. <br/></p>	2016-03-10
30	https://tech.scrunch.com/blog/lessons-learned-from-a-year-of-running-elasticsearch-in-production/	Lessons learned from a year of running elasticsearch in production	<p>Highly technical, but good advise for running elasticsearch at scale.</p>	2016-03-14
31	http://www.howtogeek.com/168147/add-public-ssh-key-to-remote-server-in-a-single-command/	Add public key to remote server with a single command	<p>Very useful one-liner to remember.</p>	2016-03-14
32	http://blogs.adobe.com/creativecloud/experts-weigh-in-what-are-your-non-negotiables-when-it-comes-to-designing-great-user-experiences/?utm_content=bufferd92cf&utm_medium=social&utm_source=twitter.com&	Great user experiences: non-negotiables	<p>A good list of things that should always be taken into consideration when designing.</p>	2016-03-14
33	http://jvns.ca/blog/2016/03/16/tcpdump-is-amazing/	tcpdump is amazing	<p>Article from Julia Evans' blog. I'v never used tcpdump before, and tbh this blog doesn't get enough traffic to warrant it :) but this article gives a good, simple introduction to its use.</p>	2016-03-17
34	https://medium.com/@letsworkshop/david-ogilvy-s-20-unconventional-rules-for-getting-clients-319f9abed7d5#.rp6m0zf82	David Ogilvy’s 20 unconventional rules for getting clients	<p>I'm not sure how 'unconventional' these are, but there's some excellent advice here. I think the personality point (18) is particularly important. You don't always win clients on your results. You need to sell your services effectively.</p>	2016-03-21
35	http://www.yourcoach.be/blog/wp-content/uploads/2014/02/Dale-Carnegie-How-to-win-friends-and-influence-people.pdf	How to win friends and influence people	<p>A decent PDF version of the classic 1930s book by Dale Carnegie.</p>	2016-03-21
36	https://code.facebook.com/posts/1737605303120405/dragon-a-distributed-graph-query-engine/	Dragon: A distributed graph query engine	<p>Information regarding Dragon, Facebook's new engine for for querying the social graph. The new engine significantly reduces latency on complex queries.</p>	2016-03-22
37	https://www.smashingmagazine.com/2016/04/web-developer-guide-color/	Web developer color guide	<p>An easy to follow guide to picking great colours for websites, without having to delve into the science of colour theory.</p>	2016-04-05
38	http://www.joelonsoftware.com/items/2007/10/26.html	Evidence based scheduling	<p>Joel Spolsky's original, ground-breaking article on how to get a realistic schedule based on estimates, and how to help developers get better at estimating in general. </p>	2016-04-05
39	https://samphippen.com/agile-etc/	Agile, etc	<p>A long, but well written write-up of a talk on developing applications for clients.</p>	2016-04-05
40	http://stevehanov.ca/blog/index.php?id=132	The multi-armed bandit	<p>A description of the algorithm behind effective multi-variant testing, and why it works.</p>	2016-04-06
\.


--
-- Name: blog_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_bookmark_id_seq', 40, true);


--
-- Data for Name: blog_bookmarkpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_bookmarkpage (page_ptr_id, intro) FROM stdin;
15	
\.


--
-- Data for Name: blog_bookmarkplacement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_bookmarkplacement (id, page_id, quote_id) FROM stdin;
\.


--
-- Name: blog_bookmarkplacement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_bookmarkplacement_id_seq', 1, false);


--
-- Data for Name: blog_bookmarktag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_bookmarktag (id, content_object_id, tag_id) FROM stdin;
122	10	40
123	10	44
124	10	66
125	10	19
126	10	28
127	12	40
128	12	66
129	12	44
130	12	46
131	11	66
132	11	19
133	23	15
134	24	54
135	24	63
136	25	67
137	25	60
138	25	61
139	26	68
140	27	19
141	28	71
142	4	19
143	4	20
144	29	63
145	30	72
146	31	54
147	32	19
148	33	54
149	34	68
150	35	68
151	36	9
152	37	19
35	6	25
36	6	26
153	37	28
154	38	46
155	39	49
156	39	46
41	7	27
42	7	19
43	7	28
44	7	31
157	40	19
81	9	35
82	9	19
83	9	36
84	9	46
85	9	38
90	13	50
91	14	51
92	14	52
93	14	53
94	15	56
95	15	54
96	15	55
97	16	1
98	16	54
99	16	57
100	5	24
101	5	40
102	5	21
103	5	22
104	17	58
105	17	28
106	18	59
107	18	19
108	19	19
109	19	60
110	19	61
111	20	47
112	21	62
113	21	63
114	22	64
115	22	65
116	2	16
117	8	33
118	8	19
119	8	49
\.


--
-- Name: blog_bookmarktag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_bookmarktag_id_seq', 157, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	home	homepage
4	wagtailadmin	admin
5	wagtaildocs	document
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
12	taggit	tag
13	taggit	taggeditem
14	wagtailcore	site
15	wagtailcore	pagerevision
16	wagtailcore	grouppagepermission
17	wagtailcore	pageviewrestriction
18	wagtailsearch	query
19	wagtailsearch	querydailyhits
21	wagtailimages	filter
22	wagtailimages	rendition
23	wagtailusers	userprofile
24	wagtailembeds	embed
25	wagtailredirects	redirect
26	wagtailforms	formsubmission
27	blog	blogpage
28	blog	blogindexrelatedlink
29	blog	blogindexpage
30	blog	blogpagetag
31	wagtailsearchpromotions	searchpromotion
32	blog	bookmarktag
33	blog	bookmark
34	blog	bookmarkplacement
35	blog	bookmarkpage
36	wagtailcore	collection
37	wagtailcore	groupcollectionpermission
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 37, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-06-22 08:09:58.602686-04
2	auth	0001_initial	2015-06-22 08:09:58.82727-04
3	admin	0001_initial	2015-06-22 08:09:58.907559-04
4	contenttypes	0002_remove_content_type_name	2015-06-22 08:09:59.043245-04
5	auth	0002_alter_permission_name_max_length	2015-06-22 08:09:59.100998-04
6	auth	0003_alter_user_email_max_length	2015-06-22 08:09:59.147698-04
7	auth	0004_alter_user_username_opts	2015-06-22 08:09:59.190058-04
8	auth	0005_alter_user_last_login_null	2015-06-22 08:09:59.236258-04
9	auth	0006_require_contenttypes_0002	2015-06-22 08:09:59.240648-04
10	taggit	0001_initial	2015-06-22 08:09:59.365278-04
11	wagtailimages	0001_initial	2015-06-22 08:09:59.636347-04
12	wagtailcore	0001_initial	2015-06-22 08:10:00.752719-04
13	wagtailcore	0002_initial_data	2015-06-22 08:10:00.756567-04
14	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2015-06-22 08:10:00.76006-04
15	wagtailcore	0004_page_locked	2015-06-22 08:10:00.763789-04
16	wagtailcore	0005_add_page_lock_permission_to_moderators	2015-06-22 08:10:00.767682-04
17	wagtailcore	0006_add_lock_page_permission	2015-06-22 08:10:00.770359-04
18	wagtailcore	0007_page_latest_revision_created_at	2015-06-22 08:10:00.772416-04
19	wagtailcore	0008_populate_latest_revision_created_at	2015-06-22 08:10:00.774412-04
20	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2015-06-22 08:10:00.776298-04
21	wagtailcore	0010_change_page_owner_to_null_on_delete	2015-06-22 08:10:00.77811-04
22	wagtailcore	0011_page_first_published_at	2015-06-22 08:10:00.780006-04
23	wagtailcore	0012_extend_page_slug_field	2015-06-22 08:10:00.782012-04
24	wagtailcore	0013_update_golive_expire_help_text	2015-06-22 08:10:00.783949-04
25	wagtailcore	0014_add_verbose_name	2015-06-22 08:10:00.785942-04
26	wagtailcore	0015_add_more_verbose_names	2015-06-22 08:10:00.788525-04
27	wagtailcore	0016_change_page_url_path_to_text_field	2015-06-22 08:10:00.791725-04
28	wagtailimages	0002_initial_data	2015-06-22 08:10:00.825165-04
29	wagtailimages	0003_fix_focal_point_fields	2015-06-22 08:10:01.226604-04
30	wagtailimages	0004_make_focal_point_key_not_nullable	2015-06-22 08:10:01.372388-04
31	wagtailimages	0005_make_filter_spec_unique	2015-06-22 08:10:01.478854-04
32	wagtailimages	0006_add_verbose_names	2015-06-22 08:10:01.958722-04
33	blog	0001_initial	2015-06-22 08:10:02.008631-04
34	blog	0002_blogpage_main_image	2015-06-22 08:10:02.059909-04
35	blog	0003_blogindexpage_blogindexrelatedlink	2015-06-22 08:10:02.181692-04
36	blog	0004_auto_20150613_1908	2015-06-22 08:10:02.237153-04
37	blog	0005_auto_20150613_1920	2015-06-22 08:10:02.395017-04
38	blog	0006_auto_20150621_1957	2015-06-22 08:10:02.447501-04
39	blog	0007_auto_20150621_2048	2015-06-22 08:10:02.700176-04
40	home	0001_initial	2015-06-22 08:10:02.751632-04
41	home	0002_create_homepage	2015-06-22 08:10:02.778974-04
42	home	0003_homepage_body	2015-06-22 08:10:02.841139-04
43	sessions	0001_initial	2015-06-22 08:10:02.860737-04
44	wagtailadmin	0001_create_admin_access_permissions	2015-06-22 08:10:02.876649-04
45	wagtaildocs	0001_initial	2015-06-22 08:10:02.935824-04
46	wagtaildocs	0002_initial_data	2015-06-22 08:10:02.959365-04
47	wagtaildocs	0003_add_verbose_names	2015-06-22 08:10:03.14392-04
48	wagtailembeds	0001_initial	2015-06-22 08:10:03.183785-04
49	wagtailembeds	0002_add_verbose_names	2015-06-22 08:10:03.19551-04
50	wagtailforms	0001_initial	2015-06-22 08:10:03.26866-04
51	wagtailforms	0002_add_verbose_names	2015-06-22 08:10:03.374826-04
52	wagtailredirects	0001_initial	2015-06-22 08:10:03.453342-04
53	wagtailredirects	0002_add_verbose_names	2015-06-22 08:10:03.742741-04
54	wagtailsearch	0001_initial	2015-06-22 08:10:04.171133-04
55	wagtailsearch	0002_add_verbose_names	2015-06-22 08:10:04.934461-04
56	wagtailusers	0001_initial	2015-06-22 08:10:05.103543-04
57	wagtailusers	0002_add_verbose_name_on_userprofile	2015-06-22 08:10:05.57202-04
58	wagtailusers	0003_add_verbose_names	2015-06-22 08:10:05.729976-04
59	blog	0008_auto_20150624_1226	2015-06-25 08:09:38.20533-04
60	blog	0009_auto_20150630_0644	2015-06-30 02:54:31.195862-04
61	blog	0010_auto_20150707_2114	2015-07-07 17:33:39.682266-04
62	wagtailcore	0017_change_edit_page_permission_description	2015-09-27 12:02:21.137205-04
63	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2015-09-27 12:02:21.21893-04
64	wagtailcore	0019_verbose_names_cleanup	2015-09-27 12:02:21.435581-04
65	wagtailimages	0007_image_file_size	2015-09-27 12:02:21.498842-04
66	wagtailimages	0008_image_created_at_index	2015-09-27 12:02:21.55866-04
67	wagtailsearch	0003_remove_editors_pick	2015-09-27 12:02:21.626505-04
68	wagtailsearchpromotions	0001_initial	2015-09-27 12:02:22.179642-04
69	wagtailcore	0020_add_index_on_page_first_published_at	2016-02-18 16:08:34.385842-05
70	wagtailcore	0021_capitalizeverbose	2016-02-18 16:08:36.319065-05
71	wagtailcore	0022_add_site_name	2016-02-18 16:08:36.357671-05
72	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2016-02-18 16:08:36.409003-05
73	blog	0011_auto_20160218_2034	2016-02-18 16:08:36.721781-05
74	blog	0012_auto_20160218_2036	2016-02-18 16:08:36.793653-05
75	blog	0013_bookmarkpage	2016-02-18 16:08:36.904438-05
76	wagtaildocs	0004_capitalizeverbose	2016-02-18 16:08:37.57246-05
77	wagtailembeds	0003_capitalizeverbose	2016-02-18 16:08:37.597194-05
78	wagtailforms	0003_capitalizeverbose	2016-02-18 16:08:37.949558-05
79	wagtailimages	0009_capitalizeverbose	2016-02-18 16:08:38.456938-05
80	wagtailimages	0010_change_on_delete_behaviour	2016-02-18 16:08:38.545931-05
81	wagtailredirects	0003_make_site_field_editable	2016-02-18 16:08:38.70582-05
82	wagtailredirects	0004_set_unique_on_path_and_site	2016-02-18 16:08:39.001436-05
83	wagtailredirects	0005_capitalizeverbose	2016-02-18 16:08:39.795168-05
84	wagtailsearchpromotions	0002_capitalizeverbose	2016-02-18 16:08:40.218237-05
85	wagtailusers	0004_capitalizeverbose	2016-02-18 16:08:40.765641-05
86	blog	0014_auto_20160220_1133	2016-02-20 06:39:39.243869-05
87	taggit	0002_auto_20150616_2121	2016-02-25 08:04:53.404898-05
88	home	0004_auto_20160228_1927	2016-02-28 14:29:27.35929-05
89	wagtailcore	0024_collection	2016-03-09 12:05:49.063853-05
90	wagtailcore	0025_collection_initial_data	2016-03-09 12:05:49.116465-05
91	wagtailcore	0026_group_collection_permission	2016-03-09 12:05:49.386741-05
92	wagtailcore	0027_fix_collection_path_collation	2016-03-09 12:05:49.414174-05
93	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2016-03-09 12:05:49.576145-05
94	wagtailcore	0028_merge	2016-03-09 12:05:49.579203-05
95	wagtaildocs	0005_document_collection	2016-03-09 12:05:49.679706-05
96	wagtaildocs	0006_copy_document_permissions_to_collections	2016-03-09 12:05:49.721457-05
97	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2016-03-09 12:05:49.939196-05
98	wagtaildocs	0007_merge	2016-03-09 12:05:49.943921-05
99	wagtailimages	0011_image_collection	2016-03-09 12:05:50.116687-05
100	wagtailimages	0012_copy_image_permissions_to_collections	2016-03-09 12:05:50.158232-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 100, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
4qq5ri52u343863b38qf1cqpc2y4pyzy	NjM4MjA0NmY3NjIxMWE5OGQyYjYyZDFjYTIwY2FjMmJiZDU5NDhjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiMTIxY2U4MDY5YWI3NjJiNmQ5MWIwOWMzMjIwMTZiODc0NDBjNDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-07-09 18:01:38.38156-04
brtynyi84lwg9eoyzwco6pqt0p3htmmo	NjM4MjA0NmY3NjIxMWE5OGQyYjYyZDFjYTIwY2FjMmJiZDU5NDhjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiMTIxY2U4MDY5YWI3NjJiNmQ5MWIwOWMzMjIwMTZiODc0NDBjNDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-07-13 08:29:48.973515-04
6glv7nqd6ec1vksulrfy4z7lezpoyt3m	NjM4MjA0NmY3NjIxMWE5OGQyYjYyZDFjYTIwY2FjMmJiZDU5NDhjZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiMTIxY2U4MDY5YWI3NjJiNmQ5MWIwOWMzMjIwMTZiODc0NDBjNDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-07-13 15:57:41.762869-04
1ypcg9agh2kg74kr3ci85stowbc4t277	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-07-15 12:06:59.885673-04
xtthhauyc5pyn8n2zgj9zzoejoy0wsfr	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-07-21 17:27:39.052411-04
e9t8zhrtmixeoyewqi6tk8fw0ynwtfjb	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-12 17:34:20.559136-04
fhsd5l17vftuauk4kcex5ygion73ve8j	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-29 11:20:19.980853-04
cwyc3tzdple4o262edz9xdjfol0cewz0	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-10-11 12:12:43.10736-04
oobup1iey7qhggxeaiftqqtxq3fd33lg	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-21 17:07:00.828749-05
5une7zvmzoawmz3wd28isqzbgyiowxyw	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-21 17:08:36.202329-05
lkwn0e3nhlbxwiunhr4uca09s60dw00e	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-11 15:03:36.811113-05
eo67s01qkstov7eh7o6okrihoe2scoaz	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-06 10:54:49.891103-05
qvhm7brcl1afei5u7p4ozhzsgjl7y8mm	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-08 07:06:26.04362-05
hnvu06w185gnndl2oztmbles1rgpo0wn	M2QwZjY3NTUxNDc0MzA5NjM4ODc5NTY0NTBmM2M3NmNjZjk2ZDM3ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMTRjMmE0MzdmOGJlOTU5NzYzYzM2NGIyMmZlZjZlYTdkZjIwMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-03 16:08:58.358537-05
en843i6ba4188o5zqtugzi29ym5vw8u3	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-07 05:30:28.057923-05
tg9k3v1e8py0vc7gje4g5mw4pv3mhcgu	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-10 09:02:05.325702-05
xxnsu7k3ll0nq7r7punz5d9jwiebdcst	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-13 15:31:03.518364-04
qsjv7jl5odbv1cyxuyfhxxroxub9lhgo	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-16 06:03:44.286734-04
1hye459opxmu39847voh48ogst87tp0l	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-20 06:51:12.765212-04
1bgipml5of7kli5c3yhdatiov6y9lsjb	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-29 17:49:50.884468-04
zgspeq546pfxz7ftrvrxt8hh11e1rnh6	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-31 05:33:17.899774-04
3cx5s4w3yn6szwziumgypi5kz7okj78f	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-20 04:31:08.266812-04
y5r5vig0hakvgobj9r4rbj84pb8jo4o2	MDRhY2E3OTUxOGZlMzY4MDNhNTNkYjFiYWNkZjJjOTU3YjdmMjA1Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0NWZkMmVhMWQyZDQyZGE3NDJkMjhjYTkzMDFiMDg2MTBkZDExMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-20 04:36:10.936366-04
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY home_homepage (page_ptr_id, subtitle) FROM stdin;
3	Explorations and ramblings of Chris Rogers, a digital project manager and hobbyist developer
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	nginx	nginx
2	wagtail	wagtail
3	uwsgi	uwsgi
4	digital ocean	digital-ocean
5	Heroku	heroku
6	logging	logging
7	django	django
8	Tag!	tag
9	database	database
10	evernote	evernote
11	productivity	productivity
13	tag	tag_1
14	tag2	tag2
15	money	money
16	lifestyle	lifestyle
17	saving	saving
18	priming	priming
19	UX	ux
20	research	research
21	success tracking	success-tracking
22	KPIs	kpis
23	analtyics	analtyics
24	measurement	measurement
25	typography	typography
26	inspiration	inspiration
27	prototypes	prototypes
28	design	design
30	ux	ux_1
31	wireframes	wireframes
32	Agile	agile
33	User centred design	user-centred-design
34	UCD	ucd
35	job stories	job-stories
36	planning	planning
37	Project management	project-management
38	user stories	user-stories
39	IA	ia
40	analytics	analytics
41	Content strategy	content-strategy
42	portfolio	portfolio
44	content strategy	content-strategy_1
46	project management	project-management_1
47	python	python
49	agile	agile_1
50	management	management
51	MVP	mvp
52	process	process
53	startup	startup
54	sysadmin	sysadmin
55	memcached	memcached
56	redis	redis
57	caching	caching
58	strategy	strategy
59	user research	user-research
60	ITCSS	itcss
61	CSS	css
62	docker	docker
63	devops	devops
64	tool	tool
65	javascript	javascript
66	information architecture	information-architecture
67	methodology	methodology
68	business	business
69	screenshot	screenshot
70	RSS	rss
71	drupal	drupal
72	elasticsearch	elasticsearch
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 72, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	6	2	69
2	6	2	70
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 2, true);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	5
2	1	2	5
3	1	1	6
4	1	2	6
5	1	1	1
6	1	2	1
7	1	1	2
8	1	2	2
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at) FROM stdin;
7	000100010003	3	0	Super simple Django error logging configuration, good for Heroku	django-error-logging-configuration-heroku	t	f	/home/django-error-logging-configuration-heroku/	Simple Django error logging configuration for Heroku	f	A simple code block to output Django error messages to the console	\N	\N	f	27	1	f	2016-02-28 14:44:13.497154-05	2015-06-29 15:56:08.690001-04
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N
18	00010001000B	3	0	PMs: Know your business objectives	pms-know-your-business-objectives	f	t	/home/pms-know-your-business-objectives/		f		\N	\N	f	27	1	f	2016-03-02 08:17:39.68081-05	\N
15	000100010008	3	0	Bookmarks	bookmarks	t	f	/home/bookmarks/		f		\N	\N	f	35	1	f	2016-02-23 08:40:25.715336-05	2016-02-23 08:40:25.770556-05
3	00010001	2	13	chrxr.com	home	t	f	/home/	chrxr.com | Digital project management and web development	f	Explorations and ramblings of Chris Rogers, a digital project manager and hobbyist developer	\N	\N	f	3	\N	f	2016-04-01 08:22:13.404802-04	2015-06-25 08:11:06.703575-04
17	00010001000A	3	0	Serving AMP content with Wagtail and RoutablePage	serving-amp-content-wagtail-and-routablepage	f	t	/home/serving-amp-content-wagtail-and-routablepage/		f		\N	\N	f	27	1	f	2016-02-26 03:58:36.923591-05	\N
4	000100010001	3	1	What is this place?	what-place	t	f	/home/what-place/		f	How this site was made, and what it was made with	\N	\N	f	27	1	f	2016-03-04 08:19:02.055723-05	2015-06-22 08:48:56.803159-04
20	00010001000D	3	0	What's a project management qualification good for?	what-project-management-qualification-good-for	t	f	/home/what-project-management-qualification-good-for/	What's a project management qualification good for?	f	To Prince2 or not to Prince2	\N	\N	f	27	1	f	2016-03-09 11:09:00.435096-05	2016-03-09 09:09:21.243725-05
5	0001000100010001	4	0	Video test	video-test	f	t	/home/what-place/video-test/		f		\N	\N	f	27	1	f	2015-06-30 14:01:27.748034-04	2015-06-22 10:24:19.692088-04
6	000100010002	3	0	Who am I?	who-am-i	f	t	/home/who-am-i/		f		\N	\N	f	27	1	f	2015-06-24 08:20:37.39919-04	2015-06-24 08:20:37.428604-04
9	000100010005	3	0	Separating local and Heroku database settings for Django	separating-local-and-heroku-database-settings-django	t	f	/home/separating-local-and-heroku-database-settings-django/		f	Stop Heroku database settings from breaking your local Django build	\N	\N	f	27	1	f	2016-02-28 14:43:37.946682-05	2015-07-29 17:46:27.84229-04
16	000100010009	3	0	Simple content import script for Django / Wagtail	simple-content-import-script-django-wagtail	t	f	/home/simple-content-import-script-django-wagtail/		f	A short script that imports content from a CSV file into Django / Wagtail CMS	\N	\N	f	27	1	f	2016-03-04 08:21:18.12479-05	2016-02-22 08:41:14.867862-05
8	000100010004	3	0	Some essential Bash commands	some-essential-bash-commands	f	t	/home/some-essential-bash-commands/		f		\N	\N	f	27	1	f	2016-01-25 10:43:48.473409-05	2015-07-11 06:15:37.20209-04
14	000100010007	3	0	Using Evernote as a to-do list	using-evernote-as-a-to-do-list	t	f	/home/using-evernote-as-a-to-do-list/		f	Organise your day and manage your reading list better using Evernote	\N	\N	f	27	1	f	2016-03-04 08:22:01.671171-05	2015-12-15 17:15:02.212241-05
19	00010001000C	3	0	Adding an RSS feed to a Wagtail site	adding-rss-feed-wagtail-site	t	f	/home/adding-rss-feed-wagtail-site/		f	Add an RSS feed to Wagtail using Django's out-of-the-box functionality	\N	\N	f	27	1	f	2016-03-09 09:18:05.2226-05	2016-03-04 08:16:09.072213-05
21	00010001000E	3	0	About me	chris-rogers	t	f	/home/chris-rogers/		f		\N	\N	f	27	1	f	2016-04-01 07:53:07.991172-04	2016-04-01 07:52:47.21496-04
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 21, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2015-06-22 08:48:56.774984-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "", "slug": "what-place", "live": true, "has_unpublished_changes": false, "body": "[]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "00010002", "url_path": "/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 2, "first_published_at": null, "expire_at": null}	\N	4	1
80	f	2016-02-28 14:49:28.553925-05	{"subtitle": "Explorations and ramblings of a digital project manager and hobbyist developer", "search_description": "Explorations and ramblings of a digital project manager and hobbyist developer", "owner": null, "latest_revision_created_at": "2016-02-28T19:35:04.388Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Wagtail CMS and Digital project management", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 9, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
71	f	2016-02-25 12:31:15.960468-05	{"subtitle": "Make Google happy with you by serving news content quickly", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-25T07:55:55.486Z", "go_live_at": null, "title": "Serving AMP content with Wagtail and RoutablePage", "seo_title": "", "listing_intro": "", "slug": "serving-amp-content-wagtail-and-routablepage", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The Accelerated Mobile Pages project is an open-source initiative to enable super-fast loading of content on mobile devices. Google are spearheading the effort, but many global news organisations are in on it as well.\\\\u00a0I decided to see if I could get Wagtail to output AMP pages as part of a general content creation workflow.</p><p>First of all, some general info/requirements for building an AMP page:</p><p></p><ul><li>AMP pages use mostly vanilla HTML with a couple of custom elements (see &lt;amp-img&gt; below)<br/></li><li>Only AMP-verified external resources are allowed to be included. So no additional JavaScript or CSS files.</li><li>There are a number of specific elements that are required on an AMP page, without which it won't be valid. <a href=\\\\\\"https://www.ampproject.org/docs/get_started/create/basic_markup.html\\\\\\">See this page for more info on this.</a></li><li>Additional CSS can be added in a singly &lt;style&gt; element, but it must be in the &lt;head&gt;</li></ul><p><br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-25", "path": "00010001000A", "url_path": "/home/serving-amp-content-wagtail-and-routablepage/", "expired": false, "pk": 17, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	17	1
34	f	2015-07-11 06:10:58.430184-04	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": false, "tagged_items": [], "body": "[]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	8	1
64	f	2016-01-25 07:09:35.606664-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-25T12:09:32.351Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
52	f	2015-12-15 17:15:58.430237-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.", "latest_revision_created_at": "2015-12-15T22:15:02.044Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-as-a-to-do-list", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p><p><embed alt=\\\\\\"Lunchtime_reads.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"2\\\\\\"/><br/></p><p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p><p><embed alt=\\\\\\"Tasks_and_archive.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"3\\\\\\"/><br/></p><p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-07", "path": "000100010007", "url_path": "/home/using-evernote-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-12-15T22:15:02.212Z", "expire_at": null}	\N	14	1
38	f	2015-07-29 17:46:00.173097-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": false, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES is improperly configured. Please supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	9	1
113	f	2016-03-04 10:59:28.350037-05	{"subtitle": "", "search_description": "Add an RSS feed to Wagtail using Django's out-of-the-box functionality", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:20:31.469Z", "go_live_at": null, "title": "Adding an RSS feed to a Wagtail site", "seo_title": "", "listing_intro": "<p>Add an RSS feed to Wagtail using Django's out-of-the-box functionality</p>", "slug": "adding-rss-feed-wagtail-site", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define three standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p></p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-04", "path": "00010001000C", "url_path": "/home/adding-rss-feed-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-04T13:16:09.072Z", "expire_at": null}	\N	19	1
126	f	2016-03-09 09:57:30.733257-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:56:08.018Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>\\\\u00a0A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>\\\\u00a0Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
128	f	2016-03-09 09:59:07.815217-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:58:58.108Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
130	f	2016-03-09 10:47:34.913839-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T15:47:07.317Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists -- open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
65	f	2016-01-25 10:21:55.086647-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-25T12:09:35.606Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
35	f	2015-07-11 06:15:25.538459-04	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:10:58.430Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	8	1
3	f	2015-06-22 08:55:37.571517-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T12:53:21.068Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "", "slug": "what-place", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a></li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
36	f	2015-07-11 06:15:26.124028-04	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:25.538Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	8	1
69	f	2016-02-23 08:40:25.715336-05	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-22T10:35:52.279Z", "go_live_at": null, "title": "Bookmarks", "seo_title": "", "slug": "bookmarks", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "000100010008", "url_path": "/home/bookmarks/", "expired": false, "pk": 15, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	15	1
53	f	2015-12-15 17:16:35.933408-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.", "latest_revision_created_at": "2015-12-15T22:15:58.430Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-as-a-to-do-list", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p><p><embed alt=\\\\\\"Lunchtime_reads.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"2\\\\\\"/><br/></p><p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p><p><embed alt=\\\\\\"Tasks_and_archive.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"3\\\\\\"/><br/></p><p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-14", "path": "000100010007", "url_path": "/home/using-evernote-as-a-to-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-12-15T22:15:02.212Z", "expire_at": null}	\N	14	1
127	f	2016-03-09 09:58:58.10871-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:57:30.733Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
131	f	2016-03-09 10:49:09.570904-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T15:47:34.913Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists \\\\u2013 open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
81	f	2016-02-28 14:49:52.824654-05	{"subtitle": "Explorations and ramblings of a digital project manager and hobbyist developer", "search_description": "Explorations and ramblings of a digital project manager and hobbyist developer", "owner": null, "latest_revision_created_at": "2016-02-28T19:49:28.553Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Digital project management and web development", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 9, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
18	f	2015-06-26 15:31:35.414935-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-26T19:31:18.066Z", "go_live_at": null, "title": "Video test", "seo_title": "", "listing_intro": "", "slug": "video-test", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<embed embedtype=\\\\\\"media\\\\\\" url=\\\\\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;feature=youtu.be&amp;amp;amp;autoplay=1\\\\\\"/>\\\\n\\\\n<p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "0001000100010001", "url_path": "/home/what-place/video-test/", "expired": false, "pk": 5, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-06-22T14:24:19.692Z", "expire_at": null}	\N	5	1
40	f	2015-07-29 17:46:55.989491-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:46:27.821Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. Please supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
82	f	2016-02-28 14:55:49.468326-05	{"subtitle": "", "search_description": "Organise your day and manage your reading list better using Evernote", "owner": 1, "intro": "I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.", "latest_revision_created_at": "2016-02-28T19:41:16.053Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-as-a-to-do-list", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 2}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 3}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-14", "path": "000100010007", "url_path": "/home/using-evernote-as-a-to-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-12-15T22:15:02.212Z", "expire_at": null}	\N	14	1
27	f	2015-06-30 08:20:01.273588-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T22:03:03.321Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 8, "content_object": 4}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	3
115	f	2016-03-09 08:11:46.487836-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T12:47:41.560Z", "go_live_at": null, "title": "Is it worth doing a PM qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-pm-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working officially as a project manager for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always successfully delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of the four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skill and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them on a PM training course if necessary.</p><p><br/></p><p>* More about these in another post.<br/></p><p></p><ol><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ol><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-pm-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
117	f	2016-03-09 08:16:41.216863-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:16:21.118Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager' for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always successfully delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of the four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skill and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty to the organisation, resulting in a lower rate of staff turnover.</p><p>* My four pillars of good project management are:<br/></p><p></p><ol><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ol><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-pm-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
119	f	2016-03-09 08:19:51.231651-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:17:09.398Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager' for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty to the organisation, resulting in a lower rate of staff turnover.</p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
132	f	2016-03-09 10:49:47.095892-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T15:49:09.570Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists \\\\u2014 open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
129	f	2016-03-09 10:47:07.317553-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:59:07.815Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists \\\\u00a0open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
8	f	2015-06-25 08:11:06.670882-04	{"body": "", "locked": false, "title": "chrxr.com", "numchild": 1, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "latest_revision_created_at": null, "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "first_published_at": null, "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
41	f	2015-07-29 17:47:13.818221-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:46:55.989Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
7	f	2015-06-24 08:20:37.39919-04	{"subtitle": "A brief history of me", "search_description": "", "owner": 1, "intro": "My name is Chris Rogers and I'm currently working as a project manager at Torchbox, a digital agency based in Oxford, England.", "latest_revision_created_at": null, "go_live_at": null, "title": "Who am I?", "seo_title": "", "listing_intro": "", "slug": "who-am-i", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<ul><li>Previously worked in digital publishing for 5 years, at Oxford University Press and Penguin Books.</li><li>Now a hands on project manager at Torchbox, developing websites and digital strategies for large multi-national charities.</li><li>Like to get my hands dirty helping with development where necessary.</li><li>Main experience is with Python, Django, JavaScript, CSS and putting these all together into Wagtail</li></ul>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-24", "path": "0001000100010002", "url_path": "/home/what-place/who-am-i/", "expired": false, "pk": 6, "main_image": null, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	6	1
6	f	2015-06-22 10:24:19.666832-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Video test", "seo_title": "", "listing_intro": "", "slug": "video-test", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<embed embedtype=\\\\\\"media\\\\\\" url=\\\\\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;feature=youtu.be&amp;autoplay=1\\\\\\"/><p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010002", "url_path": "/home/video-test/", "expired": false, "pk": 5, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	5	1
116	f	2016-03-09 08:16:21.118099-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:11:46.487Z", "go_live_at": null, "title": "Is it worth doing a PM qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-pm-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager' for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always successfully delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of the four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skill and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty to the organisation, resulting in a lower rate of staff turnover.</p><p>* My four pillars of good project management are:<br/></p><p></p><ol><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ol><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-pm-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
118	f	2016-03-09 08:17:09.398139-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:16:41.216Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager' for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of the four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skill and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty to the organisation, resulting in a lower rate of staff turnover.</p><p>* My four pillars of good project management are:<br/></p><p></p><ol><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ol><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
133	f	2016-03-09 11:08:21.473356-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T15:49:47.095Z", "go_live_at": null, "title": "What's a project management qualification good for?", "seo_title": "What's a project management qualification good for?", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists \\\\u2014 open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
43	f	2015-07-29 17:52:51.70012-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:47:52.483Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
39	f	2015-07-29 17:46:27.821253-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:46:00.173Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES is improperly configured. Please supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	9	1
120	f	2016-03-09 08:24:07.120899-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:19:51.231Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager' for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes with a lack of discipline. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to DO Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum an effective framework is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h3>A note for employers</h3><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB!</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty to the organisation, resulting in a lower rate of staff turnover.</p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
134	f	2016-03-09 11:09:00.435096-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T16:08:21.473Z", "go_live_at": null, "title": "What's a project management qualification good for?", "seo_title": "What's a project management qualification good for?", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "what-project-management-qualification-good-for", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing:<b> I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</b></p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: <b>discipline</b>.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists \\\\u2014 open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in a future post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
10	f	2015-06-25 08:14:14.316016-04	{"body": "", "locked": false, "title": "chrxr.com", "numchild": 2, "show_in_menus": false, "live": true, "seo_title": "chrxr.com | A blog written by Chris Rogers", "search_description": "", "depth": 2, "latest_revision_created_at": "2015-06-25T12:11:06.670Z", "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "first_published_at": "2015-06-25T12:11:06.703Z", "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
42	f	2015-07-29 17:47:52.483543-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:47:13.818Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
13	f	2015-06-25 08:17:54.907981-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T12:16:55.004Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
109	f	2016-03-04 08:20:31.469427-05	{"subtitle": "", "search_description": "Add an RSS feed to Wagtail using Django's out-of-the-box functionality", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:16:09.033Z", "go_live_at": null, "title": "Adding an RSS feed to a Wagtail site", "seo_title": "", "listing_intro": "<p>Add an RSS feed to Wagtail using Django's out-of-the-box functionality</p>", "slug": "adding-rss-feed-wagtail-site", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p></p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-04", "path": "00010001000C", "url_path": "/home/adding-rss-feed-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-04T13:16:09.072Z", "expire_at": null}	\N	19	1
121	f	2016-03-09 09:00:59.587553-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T13:24:07.120Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen . Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing: I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>\\\\u00a0A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>\\\\u00a0Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
66	f	2016-01-25 10:43:48.473409-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-25T15:21:55.086Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
72	f	2016-02-26 03:58:36.923591-05	{"subtitle": "Make Google happy with you by serving news content quickly", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-25T17:31:15.960Z", "go_live_at": null, "title": "Serving AMP content with Wagtail and RoutablePage", "seo_title": "", "listing_intro": "", "slug": "serving-amp-content-wagtail-and-routablepage", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The Accelerated Mobile Pages project is an open-source initiative to enable super-fast loading of content on mobile devices. Google are spearheading the effort, but many global news organisations are in on it as well.\\\\u00a0I decided to see if I could get Wagtail to output AMP pages as part of a general content creation workflow.</p><p>First of all, some general info/requirements for building an AMP page:</p><p></p><ul><li>AMP pages use mostly vanilla HTML with a couple of custom elements (see &lt;amp-img&gt; below)<br/></li><li>Only AMP-verified external resources are allowed to be included. So no additional JavaScript or CSS files.</li><li>There are a number of specific elements that are required on an AMP page, without which it won't be valid. <a href=\\\\\\"https://www.ampproject.org/docs/get_started/create/basic_markup.html\\\\\\">See this page for more info on this.</a></li><li>Additional CSS can be added in a single &lt;style&gt; element, but it must be in the &lt;head&gt;</li></ul><p><br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-25", "path": "00010001000A", "url_path": "/home/serving-amp-content-wagtail-and-routablepage/", "expired": false, "pk": 17, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	17	1
70	f	2016-02-25 02:55:55.486024-05	{"subtitle": "Make Google happy with you by serving news content quickly", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Serving AMP content with Wagtail and RoutablePage", "seo_title": "", "listing_intro": "", "slug": "serving-amp-content-wagtail-and-routablepage", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-25", "path": "00010001000A", "url_path": "/home/serving-amp-content-wagtail-and-routablepage/", "expired": false, "pk": 17, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	17	1
122	f	2016-03-09 09:09:21.220048-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:00:59.587Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen . Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing: I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>\\\\u00a0A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>\\\\u00a0Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
55	f	2016-01-23 10:55:21.10312-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:37.181Z", "go_live_at": "2016-01-30T15:55:00Z", "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
57	f	2016-01-23 10:56:20.691715-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:37.181Z", "go_live_at": "2016-01-30T15:55:00Z", "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
76	f	2016-02-28 14:41:16.053895-05	{"subtitle": "", "search_description": "Organise your day and manage your reading list better using Evernote", "owner": 1, "intro": "I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.", "latest_revision_created_at": "2015-12-15T22:16:35.933Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-as-a-to-do-list", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p><p><embed alt=\\\\\\"Lunchtime_reads.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"2\\\\\\"/><br/></p><p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p><p><embed alt=\\\\\\"Tasks_and_archive.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"3\\\\\\"/><br/></p><p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-14", "path": "000100010007", "url_path": "/home/using-evernote-as-a-to-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-12-15T22:15:02.212Z", "expire_at": null}	\N	14	1
67	f	2016-02-22 05:35:52.279984-05	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Bookmarks", "seo_title": "", "slug": "bookmarks", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "000100010008", "url_path": "/home/bookmarks/", "expired": false, "pk": 15, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	15	1
123	f	2016-03-09 09:16:46.869441-05	{"subtitle": "", "search_description": "Add an RSS feed to Wagtail using Django's out-of-the-box functionality", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T15:59:28.350Z", "go_live_at": null, "title": "Adding an RSS feed to a Wagtail site", "seo_title": "", "listing_intro": "<p>Add an RSS feed to Wagtail using Django's out-of-the-box functionality</p>", "slug": "adding-rss-feed-wagtail-site", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at chrxr.com/blog-feed. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define three standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p></p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-04", "path": "00010001000C", "url_path": "/home/adding-rss-feed-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-04T13:16:09.072Z", "expire_at": null}	\N	19	1
95	f	2016-03-03 14:24:23.282864-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>The Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view. You can see the class for my blog RSS feed below:</p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
68	f	2016-02-22 08:41:14.842485-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": 40, "tag": 2, "content_object": 16}, {"pk": 41, "tag": 47, "content_object": 16}, {"pk": 42, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that find individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	16	1
58	f	2016-01-23 10:56:35.903968-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:37.181Z", "go_live_at": "2016-01-30T15:55:00Z", "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
56	f	2016-01-23 10:56:17.536898-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:37.181Z", "go_live_at": "2016-01-30T15:55:00Z", "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
9	f	2015-06-25 08:12:49.628817-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T12:59:46.704Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
99	f	2016-03-03 14:48:28.177131-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:43:52.800Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
124	f	2016-03-09 09:18:05.2226-05	{"subtitle": "", "search_description": "Add an RSS feed to Wagtail using Django's out-of-the-box functionality", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:16:46.869Z", "go_live_at": null, "title": "Adding an RSS feed to a Wagtail site", "seo_title": "", "listing_intro": "<p>Add an RSS feed to Wagtail using Django's out-of-the-box functionality</p>", "slug": "adding-rss-feed-wagtail-site", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define three standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p></p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-04", "path": "00010001000C", "url_path": "/home/adding-rss-feed-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-04T13:16:09.072Z", "expire_at": null}	\N	19	1
85	f	2016-03-01 07:47:53.210906-05	{"subtitle": "It's not the designer's job to know what business objectives are, it's yours", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across <a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">this article</a> by designer, Joshua Taylor, on Medium.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
100	f	2016-03-03 14:51:34.176468-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:48:28.177Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title><link>https://chrxr.com/blogs-feed/</link><description>All of my blogs as they are published</description><atom:link href=\\\\\\"https://chrxr.com/blog-feed/\\\\\\" rel=\\\\\\"self\\\\\\"></atom:link>\\", \\"language\\": \\"html\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
97	f	2016-03-03 14:31:12.737185-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:25:04.021Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty __init__.py file</li><li>A file called forms.py, which will contain our code</li></ul><p></p><p>\\\\u00a0You can see the class for my blog RSS feed below:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that. We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
125	f	2016-03-09 09:56:08.018544-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "To Prince2 or not to Prince2", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-09T14:09:21.220Z", "go_live_at": null, "title": "Is it worth doing a project management qualification?", "seo_title": "", "listing_intro": "<p>To Prince2 or not to Prince2</p>", "slug": "is-it-worth-doing-project-management-qualification", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 46, "content_object": 20}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working with the job title of 'project manager\\\\u2019 for over three years, and running projects in other roles for over five years. In that time I've always delivered on my projects. Very occasionally they have been late, or over budget; these things sometimes happen. Still, somehow I\\\\u2019ve managed to not just get by, but actually progress to more senior project manager roles, all without a printed certificate framed on my desk.</p><p>But here's the thing: I'm sure I would have done better if I had done some kind of project management qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p>Over time I've learned discipline through experiencing the pain that comes when that vital skill is lacking. This pain usually manifests itself as stress, as you react to situations for which you had not adequately planned.</p><p>You can learn how to do Scrum, or any of the other brands of PM, without being a certified practitioner. \\\\u00a0Let's face it: It's not that hard!</p><p>But having the discipline to enforce the rules and ceremonies that make Scrum or Prince2 effective frameworks is not something that comes naturally to many people. Investing time in studying and learning, and having that knowledge tested, enshrines that core element of discipline as a central tenet of your practice.</p><h2>A note for employers</h2><p>\\\\u00a0A PM QUALIFICATION SHOULD NOT BE A REQUIREMENT FOR GETTING A PM JOB.</p><p>\\\\u00a0Not an entry level one anyway. Discipline is just one of my four pillars of good project management*. \\\\u00a0Whilst discipline is something that can be enforced with training and checklists, open-mindedness, communication skills and people management skills are much harder to develop from scratch. My advice to employers would be to find someone with these traits, then send them to do qualifications if necessary. You'll very likely find that this investment in an employees future will generate a sense of loyalty towards your organisation, resulting in retention of talented and skilled staff.</p><p><br/></p><p>* My four pillars of good project management are:<br/></p><p></p><ul><li>Discipline</li><li>Open-mindedness / willingness to learn</li><li>Customer relationship management / communication skills</li><li>People management skills</li></ul><p>More about these in another post.<br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-09", "path": "00010001000D", "url_path": "/home/is-it-worth-doing-project-management-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-03-09T14:09:21.243Z", "expire_at": null}	\N	20	1
114	f	2016-03-09 07:47:41.560404-05	{"subtitle": "To Prince2 or not to Prince2", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Is it worth doing a PM qualification?", "seo_title": "", "listing_intro": "", "slug": "it-worth-doing-pm-qualification", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I have no official project management qualifications. I have been working officially as a project manager for over three years, and have been running projects in other roles for over five years. In that time I've never had a project catastrophically fail, or be cancelled. I've had projects go over budget, I've delivered projects late, but I've always successfully delivered.</p><p>But here's the thing: I'm pretty sure I would have done better if I had done some kind of PM qualification at the beginning of my career.</p><p>I don't even think it matters what qualification or certification you gain. Prince2, Agile, Scrum; they all teach something that otherwise takes a long time to develop naturally: discipline.</p><p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "00010001000D", "url_path": "/home/it-worth-doing-pm-qualification/", "expired": false, "pk": 20, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	20	1
44	f	2015-07-29 17:53:49.255026-04	{"subtitle": "For when Heroku settings break your local build", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:52:51.700Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
59	f	2016-01-23 14:00:28.555099-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-23T15:56:35.903Z", "go_live_at": "2016-01-29T15:55:00Z", "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
86	f	2016-03-01 07:51:11.402093-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T12:47:53.210Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement, but I don't think it is the designers job to\\\\u00a0</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
19	f	2015-06-29 08:30:40.681003-04	{"body": "", "locked": false, "title": "chrxr.com", "numchild": 2, "show_in_menus": false, "live": true, "seo_title": "chrxr.com | Digital project management, Wagtail and skateboarding", "search_description": "A blog mostly about Wagtail development, but also the occasional bit of skateboarding.", "depth": 2, "latest_revision_created_at": "2015-06-25T12:15:05.821Z", "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "first_published_at": "2015-06-25T12:11:06.703Z", "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
101	f	2016-03-03 14:59:21.050423-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:51:34.176Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p><p><br/></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
102	f	2016-03-03 15:07:02.414474-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:59:21.050Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a get_absolute_url() method.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
29	f	2015-06-30 14:01:09.265176-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-26T19:31:35.414Z", "go_live_at": null, "title": "Video test", "seo_title": "", "listing_intro": "", "slug": "video-test", "live": false, "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 8, "content_object": 5}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<embed embedtype=\\\\\\"media\\\\\\" url=\\\\\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;amp;feature=youtu.be&amp;amp;amp;amp;autoplay=1\\\\\\"/>\\\\n\\\\n\\\\n<p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "0001000100010001", "url_path": "/home/what-place/video-test/", "expired": false, "pk": 5, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-06-22T14:24:19.692Z", "expire_at": null}	\N	5	1
30	f	2015-06-30 14:01:27.748034-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-30T18:01:09.265Z", "go_live_at": null, "title": "Video test", "seo_title": "", "listing_intro": "", "slug": "video-test", "live": false, "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 8, "content_object": 5}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<embed embedtype=\\\\\\"media\\\\\\" url=\\\\\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;amp;amp;feature=youtu.be&amp;amp;amp;amp;amp;autoplay=1\\\\\\"/>\\\\n\\\\n\\\\n\\\\n<p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "0001000100010001", "url_path": "/home/what-place/video-test/", "expired": false, "pk": 5, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-06-22T14:24:19.692Z", "expire_at": null}	\N	5	1
45	f	2015-07-29 17:54:06.896783-04	{"subtitle": "For when Heroku settings break your local build", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:53:49.255Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "<p>For when Heroku settings break your local build</p>", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
17	f	2015-06-26 15:31:18.066463-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T14:24:19.666Z", "go_live_at": null, "title": "Video test", "seo_title": "", "listing_intro": "", "slug": "video-test", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<embed embedtype=\\\\\\"media\\\\\\" url=\\\\\\"https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;feature=youtu.be&amp;amp;autoplay=1\\\\\\"/>\\\\n<p><br/></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "0001000100010001", "url_path": "/home/what-place/video-test/", "expired": false, "pk": 5, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-06-22T14:24:19.692Z", "expire_at": null}	\N	5	1
87	f	2016-03-01 08:01:15.074391-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T12:51:11.402Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. Now often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
37	f	2015-07-11 06:15:37.18144-04	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:15:26.124Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	8	1
103	f	2016-03-04 07:57:14.132366-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T20:07:02.414Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
89	f	2016-03-01 08:04:05.772853-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T13:03:10.028Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. \\\\u00a0Often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them. For example, a campaigning charity would want to communicate their campaign messages effectively and elicit donations. But their are nuances and priorities that are almost always missed when business objectives are not explicitly defined with the client.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
23	f	2015-06-29 15:56:08.632577-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:54:00.577Z", "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "", "slug": "django-error-logging-configuration-heroku", "live": false, "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging <a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging <a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	7	1
74	f	2016-02-28 14:35:04.38815-05	{"subtitle": "A blog dealing mostly with Wagtail CMS and digital project management", "search_description": "A blog dealing mostly with Wagtail CMS and digital project management", "owner": null, "latest_revision_created_at": "2016-02-28T19:31:50.325Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Wagtail CMS and Digital project management", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 9, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
88	f	2016-03-01 08:03:10.028031-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T13:01:15.074Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. Now often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them. For example, a campaigning charity would want to communicate their campaign messages effectively and elicit donations. But their are nuances and priorities that are almost always missed when business objectives are not explicitly defined with the client.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
60	f	2016-01-25 07:06:39.592121-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-23T19:00:28.555Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
104	f	2016-03-04 08:02:17.428348-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T12:57:14.132Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply add the line below to the urlpatterns section of the\\\\u00a0<b>urls.py </b>file.\\\\u00a0</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    url(r'blog-feed/$', BlogsFeed()),\\", \\"language\\": \\"python\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
105	f	2016-03-04 08:05:07.922495-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:02:17.428Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed, BlogsFeedAmp\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail\\\\u00a0</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
31	f	2015-07-07 17:38:41.045281-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:58:23.849Z", "go_live_at": null, "title": "Super simple Django error logging configuration, good for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"LOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"heroku logs --source app --tail\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging <a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging <a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
61	f	2016-01-25 07:08:51.45414-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-23T19:00:28.555Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
90	f	2016-03-01 09:38:14.547373-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T13:04:05.772Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. \\\\u00a0Often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them. For example, a campaigning charity would want to communicate their campaign messages effectively and elicit donations. But their are nuances and priorities that are almost always missed when business objectives are not explicitly defined with the client.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
73	f	2016-02-28 14:31:50.325242-05	{"subtitle": "A blog dealing mostly with Wagtail CMS and digital project management", "search_description": "A blog mostly about Wagtail development, but also the occasional bit of skateboarding.", "owner": null, "latest_revision_created_at": "2015-06-29T12:30:40.681Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Digital project management, Wagtail and skateboarding", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 9, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
106	f	2016-03-04 08:14:19.357305-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:05:07.922Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
91	f	2016-03-02 07:16:25.328682-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-01T14:38:14.547Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. \\\\u00a0Often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them. For example, a campaigning charity would want to communicate their campaign messages effectively and elicit donations. But their are nuances and priorities that are almost always missed when business objectives are not explicitly defined with the client.</p><h4>Good example:</h4><p></p><ul><li>Project begins with discussions regarding KPIs</li><li>Quickly uncover a lack of quality business objectives</li><li>Client confers with management to define objectives, resulting in buy-in from management and a clear direction for the project</li><li>This is communicated effectively to UX specialist, designers and developers, so everyone is working from the same playbook.</li></ul><h4>Bad example:</h4><p><br/></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
107	f	2016-03-04 08:16:09.033998-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:14:19.357Z", "go_live_at": null, "title": "Adding an RSS feed to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feed-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented an RSS feed on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty<b> __init__.py</b> file</li><li>A file called<b> forms.py</b>, which will contain our code</li></ul><p>I then added the app 'blog_feed' to the INSTALLED_APPS section of my <b>base.py </b>settings file.</p><p></p><p>With that done, back to the <b>forms.py</b> file. Below you can see the final code for my first RSS feed:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that.\\\\u00a0</p><p>We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p><p>Then we create the class itself. As you can see in the first line, we subclass\\\\u00a0django.contrib.syndication.views.Feed by including it in the class definition.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"class BlogsFeed(Feed):\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next three lines define the standard <b>title, link </b>and <b>description</b>\\\\u00a0values that begin all RSS feeds. You can see them in the output at <a href=\\\\\\"http://chrxr.com/blog-feed\\\\\\">chrxr.com/blog-feed</a>. These are required!</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"<title>My blog articles</title>\\\\r\\\\n<link>https://chrxr.com/blogs-feed/</link>\\\\r\\\\n<description>All of my blogs as they are published</description>\\", \\"language\\": \\"html\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Following that we define four standard methods for our Feed class. Again, all four of these are required to provide all the information necessary to build the feed.</p><p>The first method, <b>items</b>, gets the objects (pages) which we're going to list in the RSS feed from the database.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The next two methods retrieve specific field information from each individual object. The first is populating the title for the link in the RSS feed. Usually this will be <b>self.title</b>, but it might be <b>self.seo_title</b>, or you may have another field on your blog model that you want to use.</p><p>The second method gets the description to go along with the link. This is more open to interpretation. I've used the <b>self.intro</b> field as it is often populated.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>Defining the links</h3><p>There's one final ingredient missing from this RSS pie, the actual links to the articles. Django's Feeds module has the power to extract these links itself, but only if the model listed in the RSS feed has a <b>get_absolute_url()</b> method.</p><p>This isn't a big problem though. I simply added the following line to my BlogPost model:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    def get_absolute_url(self):\\\\r\\\\n        return self.full_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>And that's it! The code for generating the feed is complete. Now onto the task of defining a URL to access the feed.</p><h3>Adding the RSS feed URL</h3><p>This bit is easy. You simply import your Feed class into the\\\\u00a0<b>urls.py </b>file,\\\\u00a0\\\\u00a0then\\\\u00a0add the line below to the urlpatterns section.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from blog_feed.feeds import BlogsFeed\\\\r\\\\n\\\\r\\\\nurlpatterns = [\\\\r\\\\n    #.... lots of URLs\\\\r\\\\n\\\\r\\\\n    url(r'blog-feed/$', BlogsFeed()),\\\\r\\\\n\\\\r\\\\n   # .... more URLs\\\\r\\\\n]\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>So, when someone visits the URL http://chrxr.com/blog-feed, Wagtail initialises a new instance of the class BlogFeed, which responds to the browser with the feed of links defined in the class methods.</p><p>If you have an RSS browser extension installed (like me), this might display the links in the feed as a nice list. If not you'll likely just see a load of XML. Generally though, as long as you don't see an error, then it's working!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 6}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>See it on GitHub</h3><p>This blog uses GitHub for version control, so the source code for anything I mention can generally <a href=\\\\\\"http://github.com/chrxr/blog_project\\\\\\">be found there</a>.</p><p></p><ul><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_feed/feeds.py#L25\\\\\\">feed.py file</a><br/></li><li><a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog_project/urls.py#L22\\\\\\">URL configuration</a></li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-04", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
25	f	2015-06-29 15:57:52.657357-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:56:27.083Z", "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging <a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging <a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
33	f	2015-07-11 06:09:28.015411-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:08:31.992Z", "go_live_at": null, "title": "Super simple Django error logging configuration, good for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"LOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"heroku logs --source app --tail\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3><hr/></h3><h3>What's going on here?</h3><p>We'll break this down into each individual section:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'version': 1\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Identifies the format of the logging dictionary. Currently there is only 1 version available, but there could be more in the future.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'disable_existing_loggers': False,\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>This indicates that we shouldn't disable the default logging configuration. The default is 'True', but it's not recommended to do this, as the default logs can be useful. Instead we will keep the default logs and redefine certain elements of them to output logs to the console.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>There are four elements of a logging configuration:</p><p></p><ul><li>Loggers</li><li>Handlers</li><li>Filters</li><li>Formatters</li></ul><p>For our configuration we are only interested in the first two. The code above sets up our logging handler. We are declaring the console as a logging stream handler.</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then finally we set up the logger itself, instruct it to utilise the 'console' handler, and set the minimum level of logging to 'ERROR'. This way we only see when things are actually wrong with our application, rather than logging all messages coming out of Django (the 'DEBUG' logging level).</p>\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging\\\\u00a0<a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging\\\\u00a0<a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
32	f	2015-07-11 06:08:31.992423-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-07T21:38:41.045Z", "go_live_at": null, "title": "Super simple Django error logging configuration, good for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"LOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"heroku logs --source app --tail\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3>What's going on here?</h3><p>We'll break this down into each individual line:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'version': 1\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Identifies the format of the logging dictionary. Currently there is only 1 version available, but there could be more in the future.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'disable_existing_loggers': False,\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>This indicates that we shouldn't disable the default logging configuration. The default is 'True', but it's not recommended to do this, as the default logs can be useful. Instead we will keep the default logs and redefine certain elements of them to output logs to the console.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>There are four elements of a logging configuration:</p><p></p><ul><li>Loggers</li><li>Handlers</li><li>Filters</li><li>Formatters</li></ul><p>For our configuration we are only interested in the first two. The code above sets up our logging handler. We are declaring the console as a logging stream handler.</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then finally we set up the logger itself, instruct it to utilise the 'console' handler, and set the minimum level of logging to 'ERROR'. This way we only see when things are actually wrong with our application, rather than logging all messages coming out of Django (the 'DEBUG' logging level).</p>\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging\\\\u00a0<a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging\\\\u00a0<a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
92	f	2016-03-02 08:17:39.68081-05	{"subtitle": "... and communicate them to your team", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-02T12:16:25.328Z", "go_live_at": null, "title": "PMs: Know your business objectives", "seo_title": "", "listing_intro": "", "slug": "pms-know-your-business-objectives", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Whilst doing my daily rounds of the various UX feeds / blogs / newsletters that I follow, I came across an article\\\\u00a0by designer Joshua Taylor, on Medium, title \\\\\\"<a href=\\\\\\"https://medium.com/@joshuantaylor/designers-shouldn-t-code-they-should-study-business-dc3e7e203d39#.dr0mdq20v\\\\\\">Designers shouldn\\\\u2019t code. They should study business.</a>\\\\\\"\\\\u00a0</p><p>The basic premise is a designer's time is better spent considering how best to translate business aims into designs, rather than designs into production ready code. Now I agree with this as a general statement. Everyone on a project team should know what the business aims are for their company / client. I don't think, though, it is the job of the designer or the developer to find these out for themselves.</p><h2>Step 0: What are the business objectives?</h2><p>A project cannot hope to fully succeed without some kind of influence and direction from the company / client's business objectives. \\\\u00a0Often I've found in projects that some of the business objectives are obvious, and so make their way into the project without explicitly having to discover or define them. For example, a campaigning charity would want to communicate their campaign messages effectively and elicit donations. But their are nuances and priorities that are almost always missed when business objectives are not explicitly defined with the client.</p><h4>Good example:</h4><p></p><ul><li>Project begins with discussions regarding KPIs</li><li>Quickly uncover a lack of quality business objectives</li><li>Client confers with management to define objectives, resulting in buy-in from management and a clear direction for the project</li><li>This is communicated effectively to UX specialist, designers and developers, so everyone is working from the same playbook.</li></ul><h4>Bad example:</h4><p></p><ul><li>Project begins with assumed business objectives</li><li>KPIs are based on these</li><li>Not adequately communicated with the rest of team</li><li>Design direction starts off on the wrong path and continues to diverge away from goals</li><li>Client unhappy, more money needs to be spent on course correction.</li><li>Sad faces all round</li></ul><h2>How do you work out business objectives?</h2><p><ul><li>Existing documentation</li><li>Talk to the bosses (+ gets buy-in)</li><li>Specific exercises to draw out business objectives if they are not yet formally documented</li></ul></p><p></p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-01", "path": "00010001000B", "url_path": "/home/pms-know-your-business-objectives/", "expired": false, "pk": 18, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	18	1
21	f	2015-06-29 15:53:44.119689-04	{"subtitle": "", "search_description": "A simple script to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:52:20.351Z", "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "", "slug": "django-error-logging-configuration-heroku", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010003", "url_path": "/home/super-simple-django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	7	1
135	f	2016-04-01 07:52:15.10818-04	{"subtitle": "About me!", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Chris Rogers", "seo_title": "", "listing_intro": "", "slug": "chris-rogers", "live": false, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently working at the Bodleian Library, part of Oxford University as the Digital Projects Manager. Previously I've worked as a project manager for the digital agency <a href=\\\\\\"http://torchbox.com\\\\\\">Torchbox</a>, as the ebook technical lead at Penguin, and for Oxford University Press in a variety of digital roles.</p><p>Previous website projects as a PM include:</p><p></p><ul><li><a href=\\\\\\"http://rca.ac.uk\\\\\\">The Royal College of Art</a></li><li><a href=\\\\\\"http://royaldrawingschool.org\\\\\\">The Royal Drawing School</a></li><li><a href=\\\\\\"http://globalwitness.org.uk\\\\\\">Global Witness</a></li><li><a href=\\\\\\"http://plan-international.org.uk\\\\\\">Plan International</a></li><li><a href=\\\\\\"http://events.burton.com/\\\\\\">Burton Snowboards</a></li><li><a href=\\\\\\"http://election.kingsfund.org.uk/\\\\\\">The King's Fund</a></li></ul><p>In my spare time I'm a regular contributor to the <a href=\\\\\\"https://wagtail.io\\\\\\">Wagtail CMS</a> open source project.\\\\u00a0I'm also a skateboarder of 16+ years, and a runner of 5.</p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-10-01", "path": "00010001000E", "url_path": "/home/chris-rogers/", "expired": false, "pk": 21, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	21	1
136	f	2016-04-01 07:52:47.189216-04	{"subtitle": "About me!", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-04-01T11:52:15.108Z", "go_live_at": null, "title": "Chris Rogers", "seo_title": "", "listing_intro": "", "slug": "chris-rogers", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently working at the Bodleian Library, part of Oxford University as the Digital Projects Manager. Previously I've worked as a project manager for the digital agency <a href=\\\\\\"http://torchbox.com\\\\\\">Torchbox</a>, as the ebook technical lead at Penguin, and for Oxford University Press in a variety of digital roles.</p><p>Previous website projects as a PM include:</p><p></p><ul><li><a href=\\\\\\"http://rca.ac.uk\\\\\\">The Royal College of Art</a></li><li><a href=\\\\\\"http://royaldrawingschool.org\\\\\\">The Royal Drawing School</a></li><li><a href=\\\\\\"http://globalwitness.org.uk\\\\\\">Global Witness</a></li><li><a href=\\\\\\"http://plan-international.org.uk\\\\\\">Plan International</a></li><li><a href=\\\\\\"http://events.burton.com/\\\\\\">Burton Snowboards</a></li><li><a href=\\\\\\"http://election.kingsfund.org.uk/\\\\\\">The King's Fund</a></li></ul><p>In my spare time I'm a regular contributor to the <a href=\\\\\\"https://wagtail.io\\\\\\">Wagtail CMS</a> open source project.\\\\u00a0I'm also a skateboarder of 16+ years, and a runner of 5.</p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-10-01", "path": "00010001000E", "url_path": "/home/chris-rogers/", "expired": false, "pk": 21, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	21	1
50	f	2015-12-07 17:09:47.089604-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-do-list", "live": false, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.</p><p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.</p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p><p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p><p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-07", "path": "000100010007", "url_path": "/home/using-evernote-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	14	1
137	f	2016-04-01 07:53:07.991172-04	{"subtitle": "Chris Rogers", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-04-01T11:52:47.189Z", "go_live_at": null, "title": "About me", "seo_title": "", "listing_intro": "", "slug": "chris-rogers", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently working at the Bodleian Library, part of Oxford University as the Digital Projects Manager. Previously I've worked as a project manager for the digital agency <a href=\\\\\\"http://torchbox.com\\\\\\">Torchbox</a>, as the ebook technical lead at Penguin, and for Oxford University Press in a variety of digital roles.</p><p>Previous website projects as a PM include:</p><p></p><ul><li><a href=\\\\\\"http://rca.ac.uk\\\\\\">The Royal College of Art</a></li><li><a href=\\\\\\"http://royaldrawingschool.org\\\\\\">The Royal Drawing School</a></li><li><a href=\\\\\\"http://globalwitness.org.uk\\\\\\">Global Witness</a></li><li><a href=\\\\\\"http://plan-international.org.uk\\\\\\">Plan International</a></li><li><a href=\\\\\\"http://events.burton.com/\\\\\\">Burton Snowboards</a></li><li><a href=\\\\\\"http://election.kingsfund.org.uk/\\\\\\">The King's Fund</a></li></ul><p>In my spare time I'm a regular contributor to the <a href=\\\\\\"https://wagtail.io\\\\\\">Wagtail CMS</a> open source project.\\\\u00a0I'm also a skateboarder of 16+ years, and a runner of 5.</p><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-10-01", "path": "00010001000E", "url_path": "/home/chris-rogers/", "expired": false, "pk": 21, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-04-01T11:52:47.214Z", "expire_at": null}	\N	21	1
62	f	2016-01-25 07:09:21.10752-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-23T19:00:28.555Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
63	f	2016-01-25 07:09:32.351535-05	{"subtitle": "When I was first starting out in coding as a hobby, I found the command line interface learning curve pretty steep. Here's a few commands that should start you on the right track", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-01-25T12:09:21.107Z", "go_live_at": null, "title": "Some essential Bash commands", "seo_title": "", "listing_intro": "", "slug": "some-essential-bash-commands", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>cd</p><p>~</p><p>/</p><p>..</p><p>ls</p><p>mkdir<br/></p><p>rm</p><p>cat</p><p>vi</p><p>ln -s<br/></p><p>ssh</p><p>ping</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010004", "url_path": "/home/some-essential-bash-commands/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-11T10:15:37.202Z", "expire_at": null}	\N	8	1
51	f	2015-12-15 17:15:02.044079-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-12-07T22:09:47.089Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "", "slug": "using-evernote-do-list", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.</p><p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.</p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p><p><embed alt=\\\\\\"Lunchtime_reads.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"2\\\\\\"/><br/></p><p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p><p><embed alt=\\\\\\"Tasks_and_archive.png\\\\\\" embedtype=\\\\\\"image\\\\\\" format=\\\\\\"fullwidth\\\\\\" id=\\\\\\"3\\\\\\"/><br/></p><p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-07", "path": "000100010007", "url_path": "/home/using-evernote-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	14	1
83	f	2016-02-29 04:39:14.582726-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-28T19:40:47.067Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
138	f	2016-04-01 08:21:30.205154-04	{"subtitle": "Explorations and ramblings of Chris Rogers, a digital project manager and hobbyist developer", "search_description": "Explorations and ramblings of a digital project manager and hobbyist developer", "owner": null, "latest_revision_created_at": "2016-02-28T19:49:52.824Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Digital project management and web development", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 13, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
93	f	2016-03-03 08:06:25.833133-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-29T09:39:17.900Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p><p>By the way, you can now follow my reading <a id=\\\\\\"15\\\\\\" linktype=\\\\\\"page\\\\\\">list here</a>!</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
11	f	2015-06-25 08:15:05.821578-04	{"body": "", "locked": false, "title": "chrxr.com", "numchild": 2, "show_in_menus": false, "live": true, "seo_title": "chrxr.com | Digital project management, Wagtail and skateboarding", "search_description": "", "depth": 2, "latest_revision_created_at": "2015-06-25T12:14:14.316Z", "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "first_published_at": "2015-06-25T12:11:06.703Z", "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
77	f	2016-02-28 14:43:37.946682-05	{"subtitle": "For when Heroku settings break your local build", "search_description": "Stop Heroku database settings from breaking your local Django build", "owner": 1, "intro": "", "latest_revision_created_at": "2015-09-27T16:36:27.771Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "<p>For when Heroku settings break your local build</p>", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
49	f	2015-09-27 12:36:27.771893-04	{"subtitle": "For when Heroku settings break your local build", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-29T21:54:06.896Z", "go_live_at": null, "title": "Separating local and Heroku database settings for Django", "seo_title": "", "listing_intro": "<p>For when Heroku settings break your local build</p>", "slug": "separating-local-and-heroku-database-settings-django", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 9, "content_object": 9}, {"pk": null, "tag": 5, "content_object": 9}, {"pk": null, "tag": 7, "content_object": 9}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I'm currently building a small Django app, and I wanted to deploy it to Heroku. To do this, Heroku asks you to implement some specific database settings at the bottom of your settings.py file:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"import dj_database_url\\\\r\\\\nDATABASES['default'] =  dj_database_url.config()\\\\r\\\\n\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The problem with this was that although these settings worked when the project was deployed to Heroku, they broke my local build with the following error:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"raise ImproperlyConfigured(\\\\\\"settings.DATABASES is improperly configured. \\\\\\"\\\\r\\\\ndjango.core.exceptions.ImproperlyConfigured: settings.DATABASES \\\\r\\\\nis improperly configured. \\\\r\\\\nPlease supply the ENGINE value. Check settings documentation for more details.\\\\r\\\\n\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>The reason I was getting this on my local build is that dj_database expects an environment variable, \\\\\\"DATABASE_URL\\\\\\", to be present on the local system, like it is when running on Heroku.</p><p>The simple solution I came up with was to add a an IF statement in to settings.py to detect whether or not the environment variable was present:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"env = os.environ.copy()\\\\r\\\\ndb_url = env.get('DATABASE_URL', False)\\\\r\\\\n\\\\r\\\\nif db_url != False:\\\\r\\\\n    import dj_database_url\\\\r\\\\n    DATABASES['default'] =  dj_database_url.config()\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>You can't just say 'if env['DATABASE_URL']' as this raises a <a href=\\\\\\"https://wiki.python.org/moin/KeyError\\\\\\">KeyError</a>. So instead I've used the 'get' method to either assign the value of the environment variable if it exists, or the default, 'False', if it doesn't. And voil\\\\u00e0! My app now runs on both my local machine and Heroku.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-07-29", "path": "000100010005", "url_path": "/home/separating-local-and-heroku-database-settings-django/", "expired": false, "pk": 9, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-07-29T21:46:27.842Z", "expire_at": null}	\N	9	1
139	f	2016-04-01 08:22:13.404802-04	{"subtitle": "Explorations and ramblings of Chris Rogers, a digital project manager and hobbyist developer", "search_description": "Explorations and ramblings of Chris Rogers, a digital project manager and hobbyist developer", "owner": null, "latest_revision_created_at": "2016-04-01T12:21:30.205Z", "go_live_at": null, "title": "chrxr.com", "seo_title": "chrxr.com | Digital project management and web development", "slug": "home", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "numchild": 13, "content_type": 3, "show_in_menus": false, "path": "00010001", "url_path": "/home/", "expired": false, "pk": 3, "locked": false, "depth": 2, "first_published_at": "2015-06-25T12:11:06.703Z", "expire_at": null}	\N	3	1
24	f	2015-06-29 15:56:27.083102-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:56:08.632Z", "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging <a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging <a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
79	f	2016-02-28 14:44:13.497154-05	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-07-11T10:09:28.015Z", "go_live_at": null, "title": "Super simple Django error logging configuration, good for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"LOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"heroku logs --source app --tail\\", \\"language\\": \\"bash\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<h3><hr/></h3><h3>What's going on here?</h3><p>We'll break this down into each individual section:</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'version': 1\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Identifies the format of the logging dictionary. Currently there is only 1 version available, but there could be more in the future.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"'disable_existing_loggers': False,\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>This indicates that we shouldn't disable the default logging configuration. The default is 'True', but it's not recommended to do this, as the default logs can be useful. Instead we will keep the default logs and redefine certain elements of them to output logs to the console.</p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>There are four elements of a logging configuration:</p><p></p><ul><li>Loggers</li><li>Handlers</li><li>Filters</li><li>Formatters</li></ul><p>For our configuration we are only interested in the first two. The code above sets up our logging handler. We are declaring the console as a logging stream handler.</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then finally we set up the logger itself, instruct it to utilise the 'console' handler, and set the minimum level of logging to 'ERROR'. This way we only see when things are actually wrong with our application, rather than logging all messages coming out of Django (the 'DEBUG' logging level).</p>\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging\\\\u00a0<a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging\\\\u00a0<a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
94	f	2016-03-03 10:22:03.878964-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T13:06:25.833Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p><p>By the way, you can now\\\\u00a0<a id=\\\\\\"15\\\\\\" linktype=\\\\\\"page\\\\\\">follow my reading list here</a>!</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
96	f	2016-03-03 14:25:04.021058-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:24:23.282Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>The Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view. You can see the class for my blog RSS feed below:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
5	f	2015-06-22 08:59:46.704737-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T12:58:09.840Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "", "slug": "what-place", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
110	f	2016-03-04 08:21:03.248314-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T15:22:03.878Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "<h3>A short script that imports content from a CSV file into Django / Wagtail CMS</h3>", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p><p>By the way, you can now\\\\u00a0<a id=\\\\\\"15\\\\\\" linktype=\\\\\\"page\\\\\\">follow my reading list here</a>!</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
15	f	2015-06-25 18:02:56.512704-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T22:01:59.934Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
111	f	2016-03-04 08:21:18.12479-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-04T13:21:03.248Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "<p>A short script that imports content from a CSV file into Django / Wagtail CMS</p>", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p><p>By the way, you can now\\\\u00a0<a id=\\\\\\"15\\\\\\" linktype=\\\\\\"page\\\\\\">follow my reading list here</a>!</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
84	f	2016-02-29 04:39:17.900385-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-29T09:39:14.582Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that finding individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
20	f	2015-06-29 15:52:20.351772-04	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "", "listing_intro": "", "slug": "super-simple-django-error-logging-configuration-heroku", "live": false, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010003", "url_path": "/home/super-simple-django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	7	1
22	f	2015-06-29 15:54:00.57723-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:53:44.119Z", "go_live_at": null, "title": "Super simple Django error logging configuration for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "", "slug": "django-error-logging-configuration-heroku", "live": false, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": null, "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	7	1
26	f	2015-06-29 15:58:23.849112-04	{"subtitle": "", "search_description": "A simple code block to output Django error messages to the console", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-29T19:57:52.657Z", "go_live_at": null, "title": "Super simple Django error logging configuration, good for Heroku", "seo_title": "Simple Django error logging configuration for Heroku", "listing_intro": "<p>A simple code block to output Django error messages to the console</p>", "slug": "django-error-logging-configuration-heroku", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 5, "content_object": 7}, {"pk": null, "tag": 6, "content_object": 7}, {"pk": null, "tag": 7, "content_object": 7}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Here's a really simple logging configuration for Django to output anything of the level 'Error' and up to the console. Heroku's logging functionality allows you to monitor application messaging in real time in your production environment. Just put the code below in the bottom of your settings file.</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nLOGGING = {\\\\r\\\\n    'version': 1,\\\\r\\\\n    'disable_existing_loggers': False,\\\\r\\\\n    'handlers': {\\\\r\\\\n        'console': {\\\\r\\\\n            'class': 'logging.StreamHandler',\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n    'loggers': {\\\\r\\\\n        'django': {\\\\r\\\\n            'handlers': ['console'],\\\\r\\\\n            'level': os.getenv('DJANGO_LOG_LEVEL', 'ERROR'),\\\\r\\\\n        },\\\\r\\\\n    },\\\\r\\\\n}\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Then run the following Heroku command to display application messages in real time:</p>\\"}, {\\"type\\": \\"codeblock\\", \\"value\\": \\"\\\\r\\\\nheroku logs --source app --tail\\"}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>For more information on Django logging <a href=\\\\\\"https://docs.djangoproject.com/en/1.8/topics/logging/\\\\\\">see the documentation</a>.</p><p>For more information on Heroku logging <a href=\\\\\\"https://devcenter.heroku.com/articles/logging\\\\\\">see their support centre</a>.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-29", "path": "000100010003", "url_path": "/home/django-error-logging-configuration-heroku/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-29T19:56:08.690Z", "expire_at": null}	\N	7	1
112	f	2016-03-04 08:22:01.671171-05	{"subtitle": "", "search_description": "Organise your day and manage your reading list better using Evernote", "owner": 1, "intro": "I'm the type of person who really needs a to-do list but is rubbish at maintaining one. I've tried many different solutions: specific apps, pen and paper, spreadsheets. None of them have lasted for longer than a couple of weeks.", "latest_revision_created_at": "2016-02-28T19:55:49.468Z", "go_live_at": null, "title": "Using Evernote as a to-do list", "seo_title": "", "listing_intro": "<p>Organise your day and manage your reading list better using Evernote</p>", "slug": "using-evernote-as-a-to-do-list", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Now though I think I've settled on a system that really works for me. I use Evernote ALL THE TIME. It's an essential tool for me. So I thought, how can I use the tool that I already use to help me organise my time.<br/></p><p>The key was to format it in an appropriate way. At the top of my list I have the 'week beginning' date. Then I have my current list of to-dos, ordered roughly by priority. I add EVERYTHING work-related that I have to do that is a discrete task, even small tasks. If I do something work-related that's not on the to-do list, I add it to the list. I use the checkbox list type, as it soothes my OCD side to see each box ticked off. Once a task has been ticked off, I copy and paste it into another list below the main list, which has today's date as the heading. So as the days go by you end up with an archive of your completed tasks for each individual day.</p><p>Visibility of the list is key. One of the biggest pains in trying to use a specific tool was that it was one more thing to have open on the screen. With Evernote, I just add it to my 'Shortcuts' list. Then it's always there in the top-left of Evernote, a tool that I would have open all the time anyway!</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 2}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>At the end of the month, I'll archive that particular note in a separate notebook, take it out of my shortcuts, and create a new to-do note for the month.</p><p>I've now started to expand the format to include other types of to-dos. I often review relevant newsletters and blogs for content as soon as I get into work, but then I like to actually read them over lunch. So I've created a 'Lunchtime reading' list, again with tick-boxes, and a 'Reading archive' at the bottom of the to-do note.</p>\\"}, {\\"type\\": \\"image\\", \\"value\\": 3}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>Anyway, it's a very simple solution, that appeals to me for it's 'Collect the completed tasks!' nature.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-12-14", "path": "000100010007", "url_path": "/home/using-evernote-as-a-to-do-list/", "expired": false, "pk": 14, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-12-15T22:15:02.212Z", "expire_at": null}	\N	14	1
12	f	2015-06-25 08:16:55.00426-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T12:12:49.628Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 1, "content_object": 4}, {"pk": null, "tag": 2, "content_object": 4}, {"pk": null, "tag": 3, "content_object": 4}, {"pk": null, "tag": 4, "content_object": 4}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
4	f	2015-06-22 08:58:09.840588-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T12:55:37.571Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "", "slug": "what-place", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
2	f	2015-06-22 08:53:21.068832-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-22T12:48:56.774Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "", "slug": "what-place", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the Wagtail CMS (v1.0rc1).<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu</li><li>The server is Nginx with uWSGI</li><li>It was deployed over a lunchtime using a combination of the Wagtail docs and this tutorial from Digital Ocean</li></ul><p></p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
14	f	2015-06-25 18:01:59.934304-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T12:17:54.907Z", "go_live_at": null, "title": "What is this place??", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
78	f	2016-02-28 14:43:50.719094-05	{"subtitle": "How this site was made, and what it was made with", "search_description": "How this site was made, and what it was made with", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-30T12:25:25.886Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
108	f	2016-03-04 08:19:02.055723-05	{"subtitle": "How this site was made, and what it was made with", "search_description": "How this site was made, and what it was made with", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-28T19:43:50.719Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.3.1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>The site is cached using <a href=\\\\\\"http://memcached.org/\\\\\\">Memcached</a>.</li><li>For the styling I've tried to stick to the<a href=\\\\\\"https://smacss.com/\\\\\\">\\\\u00a0SMACSS\\\\u00a0</a>methodology.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
16	f	2015-06-25 18:03:03.321563-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-25T22:02:56.512Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	1
28	f	2015-06-30 08:25:25.886965-04	{"subtitle": "How this site was made, and what it was made with", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-06-30T12:20:01.273Z", "go_live_at": null, "title": "What is this place?", "seo_title": "", "listing_intro": "<p>How this site was made, and what it was made with</p>", "slug": "what-place", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><ul><li>This site is built using the <a href=\\\\\\"http://www.github.com/torchbox/wagtail\\\\\\">Wagtail CMS (v1.0rc1)</a>.<br/></li><li>It is hosted on a 512mb Digital Ocean box, running Ubuntu 14.04.</li><li>The server is <a href=\\\\\\"http://wiki.nginx.org/Main\\\\\\">Nginx</a> with <a href=\\\\\\"https://uwsgi-docs.readthedocs.org/en/latest/\\\\\\">uWSGI</a>.</li><li>It was deployed over a lunchtime using a combination of the <a href=\\\\\\"http://docs.wagtail.io/en/v0.8.7/getting_started/installation.html\\\\\\">Wagtail docs</a> and <a href=\\\\\\"https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-14-04\\\\\\">this tutorial from Digital Ocean</a>.</li><li>You can see the codebase on <a href=\\\\\\"http://www.github.com/chrxr/blog_project\\\\\\">Github here</a>.</li></ul><p></p>\\"}]", "numchild": 1, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2015-06-22", "path": "000100010001", "url_path": "/home/what-place/", "expired": false, "pk": 4, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2015-06-22T12:48:56.803Z", "expire_at": null}	\N	4	3
75	f	2016-02-28 14:40:47.067972-05	{"subtitle": "I wanted to import some bookmarks, so I wrote a little script", "search_description": "A short script that imports content from a CSV file into Django / Wagtail CMS", "owner": 1, "intro": "", "latest_revision_created_at": "2016-02-22T13:41:14.842Z", "go_live_at": null, "title": "Simple content import script for Django / Wagtail", "seo_title": "", "listing_intro": "", "slug": "simple-content-import-script-django-wagtail", "live": true, "bookmark_placements": [], "has_unpublished_changes": false, "tagged_items": [{"pk": null, "tag": 2, "content_object": 16}, {"pk": null, "tag": 47, "content_object": 16}, {"pk": null, "tag": 7, "content_object": 16}], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>I've been collating links as part of my <a id=\\\\\\"14\\\\\\" linktype=\\\\\\"page\\\\\\">reading list</a>\\\\u00a0for the last few months. Occasionally I like to look back through them to find something particularly interesting. However, I've got so many now that find individual ones has become difficult.</p><p>So! I created a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/blog/models.py#L31\\\\\\">Bookmark snippet in Wagtail</a>, then wrote a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/importer.py\\\\\\">quick python script</a> to import the bookmarks from a <a href=\\\\\\"https://github.com/chrxr/blog_project/blob/master/csvtest.csv\\\\\\">CSV file</a>. It took about 30 minutes in all. The hardest part was working out that I needed to initialise Django by setting the DJANGO_SETTINGS_MODULE environment variable.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-02-22", "path": "000100010009", "url_path": "/home/simple-content-import-script-django-wagtail/", "expired": false, "pk": 16, "main_image": null, "locked": false, "depth": 3, "first_published_at": "2016-02-22T13:41:14.867Z", "expire_at": null}	\N	16	1
98	f	2016-03-03 14:43:52.800595-05	{"subtitle": "", "search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2016-03-03T19:31:12.737Z", "go_live_at": null, "title": "Adding RSS feeds to a Wagtail site", "seo_title": "", "listing_intro": "", "slug": "adding-rss-feeds-wagtail-site", "live": false, "bookmark_placements": [], "has_unpublished_changes": true, "tagged_items": [], "body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>First of all, it's exactly how you would do it in a normal Django-powered site. The official docs for creating RSS or Atom feeds <a href=\\\\\\"https://docs.djangoproject.com/en/1.9/ref/contrib/syndication/\\\\\\">can be found here</a>. That's one of the beauties of Wagtail, it keeps hold of many of the great features of Django.</p><p>But if you're not too familiar with Django, or the commonalities between vanilla Django and Wagtail, then hopefully this description of how I implemented two RSS feeds on this site will help you.</p><p>There are two elements to an RSS feed in Django/Wagtail:</p><p></p><ol><li>The Feed class</li><li>The URL configuration</li></ol><h3>Writing the Feed class</h3><p>The Feed class gets all the relevant bits of data needed to serve the RSS feed to the client. It's essentially a class-based view.</p><p>The code for this can live anywhere within your codebase. I chose to create a new app for it. To do this I created a new folder in the root of my Wagtail project, called 'blog_feed' (it could be called whatever you want). Within this are two files:</p><p></p><ul><li>An empty __init__.py file</li><li>A file called forms.py, which will contain our code</li></ul><p></p><p>\\\\u00a0You can see the class for my blog RSS feed below:</p><p></p>\\"}, {\\"type\\": \\"real_codeblock\\", \\"value\\": {\\"code\\": \\"from django.db import models\\\\r\\\\nfrom django.contrib.syndication.views import Feed\\\\r\\\\nfrom blog.models import BlogPage\\\\r\\\\n\\\\r\\\\nclass BlogsFeed(Feed):\\\\r\\\\n    title = \\\\\\"My blog articles\\\\\\"\\\\r\\\\n    link = \\\\\\"/blogs-feed/\\\\\\"\\\\r\\\\n    description = \\\\\\"All of my blogs as they are published\\\\\\"\\\\r\\\\n\\\\r\\\\n    def items(self):\\\\r\\\\n        return BlogPage.objects.live().order_by('-date')\\\\r\\\\n\\\\r\\\\n    def item_title(self, item):\\\\r\\\\n        return item.title\\\\r\\\\n\\\\r\\\\n    def item_description(self, item):\\\\r\\\\n        return item.intro\\\\r\\\\n\\\\r\\\\n    def item_link(self, item):\\\\r\\\\n        base_url = item.get_absolute_url()\\\\r\\\\n        return base_url\\", \\"language\\": \\"python\\"}}, {\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>In our first three lines we import the essential elements needed to create our Feed class. It will inherit the functionality of the basic Django Feed class, so we import that. We also import the BlogPage model so that we can access the URLs, titles and descriptions that will make up the feed itself.</p>\\"}]", "numchild": 0, "listing_image": null, "content_type": 27, "show_in_menus": false, "date": "2016-03-03", "path": "00010001000C", "url_path": "/home/adding-rss-feeds-wagtail-site/", "expired": false, "pk": 19, "main_image": null, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	19	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 139, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pageviewrestriction (id, password, page_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	chrxr.com	80	t	3	\N
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 2, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
1	https://youtu.be/a57UIrhDkrI?autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/a57UIrhDkrI?feature=oembed" frameborder="0" allowfullscreen></iframe>	Trans-Tasman Cup 08	Rontek9	YouTube	https://i.ytimg.com/vi/a57UIrhDkrI/hqdefault.jpg	459	344	2015-06-22 10:12:17.402482-04
2	https://www.youtube.com/watch?v=oq0JR0t-zeo&feature=youtu.be&autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-22 10:23:52.984338-04
3	https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;feature=youtu.be&amp;autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-22 10:23:55.134338-04
4	https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;feature=youtu.be&amp;amp;autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-26 15:31:18.522256-04
5	https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;feature=youtu.be&amp;amp;amp;autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-26 15:31:36.876096-04
6	https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;amp;feature=youtu.be&amp;amp;amp;amp;autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-30 14:01:00.257591-04
7	https://www.youtube.com/watch?v=oq0JR0t-zeo&amp;amp;amp;amp;amp;feature=youtu.be&amp;amp;amp;amp;amp;autoplay=1	\N	video	<iframe width="459" height="344" src="https://www.youtube.com/embed/oq0JR0t-zeo?feature=oembed" frameborder="0" allowfullscreen></iframe>	Gloucester Cheese Rolling 2009	Rontek9	YouTube	https://i.ytimg.com/vi/oq0JR0t-zeo/hqdefault.jpg	459	344	2015-06-30 14:01:30.468281-04
8	https://soundcloud.com/chris-rogers-105244959/blue	\N	rich	<iframe width="100%" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F219370923&show_artwork=true"></iframe>	Blue by Chris Rogers	Chris Rogers	SoundCloud	http://a1.sndcdn.com/images/fb_placeholder.png?1439544637	\N	400	2015-08-15 11:20:51.992874-04
9	https://soundcloud.com/chris-rogers-105244959/blue&amp;color=ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false	\N	rich	<iframe width="100%" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F219370923&show_artwork=true&=&amp%3Bcolor=ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false"></iframe>	Blue by Chris Rogers	Chris Rogers	SoundCloud	http://a1.sndcdn.com/images/fb_placeholder.png?1439544637	\N	400	2015-08-15 11:24:32.539476-04
10	https://soundcloud.com/chris-rogers-105244959/blue&amp;amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false	\N	rich	<iframe width="100%" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=https%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F219370923&show_artwork=true&=&amp%3Bamp%3Bcolor=ff5500&amp%3Bauto_play=false&amp%3Bhide_related=false&amp%3Bshow_comments=true&amp%3Bshow_user=true&amp%3Bshow_reposts=false"></iframe>	Blue by Chris Rogers	Chris Rogers	SoundCloud	http://a1.sndcdn.com/images/fb_placeholder.png?1439544637	\N	400	2015-08-15 11:24:37.719231-04
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 10, true);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_filter (id, spec) FROM stdin;
1	max-165x165
2	max-800x600
3	width-800
4	original
5	fill-80x80
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 5, true);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id) FROM stdin;
1	Tasks_and_archive.png	original_images/Tasks_and_archive.png	675	552	2015-12-15 16:29:01.601245-05	\N	\N	\N	\N	1	109429	1
2	Lunchtime_reads.png	original_images/Lunchtime_reads.png	656	568	2015-12-15 16:29:02.812515-05	\N	\N	\N	\N	1	84519	1
3	Tasks_and_archive.png	original_images/Tasks_and_archive_SVY9T6r.png	675	552	2015-12-15 16:29:23.50118-05	\N	\N	\N	\N	1	109429	1
5	red-dragon-apparel.png	original_images/red-dragon-apparel.png	800	800	2016-02-28 13:03:19.946053-05	\N	\N	\N	\N	1	19401	1
6	Screenshot of RSS feed with Chrome extension	original_images/Screen_Shot_2016-03-04_at_13.08.00.png	789	455	2016-03-04 08:09:32.500567-05	\N	\N	\N	\N	1	\N	1
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 6, true);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, filter_id, image_id) FROM stdin;
1	images/Tasks_and_archive_SVY9T6r.max-165x165.png	165	134		1	3
2	images/Lunchtime_reads.max-165x165.png	165	142		1	2
3	images/Tasks_and_archive.max-165x165.png	165	134		1	1
4	images/Tasks_and_archive_SVY9T6r.max-800x600.png	675	552		2	3
5	images/Tasks_and_archive_SVY9T6r.width-800.png	675	552		3	3
6	images/Lunchtime_reads.max-800x600.png	656	568		2	2
7	images/Lunchtime_reads.width-800.png	656	568		3	2
8	images/red-dragon-apparel.max-165x165.png	165	165		1	5
9	images/Lunchtime_reads.original.png	656	568		4	2
10	images/Tasks_and_archive_SVY9T6r.original.png	675	552		4	3
11	images/Lunchtime_reads.2e16d0ba.fill-80x80.png	80	80	2e16d0ba	5	2
12	images/Tasks_and_archive_SVY9T6r.2e16d0ba.fill-80x80.png	80	80	2e16d0ba	5	3
13	images/red-dragon-apparel.original.png	800	800		4	5
14	images/red-dragon-apparel.max-800x600.png	600	600		2	5
15	images/Screen_Shot_2016-03-04_at_13.08.00.max-165x165.png	165	95		1	6
16	images/Screen_Shot_2016-03-04_at_13.08.00.original.png	789	455		4	6
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 16, true);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
1	blog
2	heroku
3	herok
4	bue
5	blue
6	django
7	erm
8	blurgh
9	boo
10	wagtail
11	html
12	evernote
13	dog
14	heroky
15	djano
16	bookmarks
17	home
18	content
19	rss
20	project
21	manage
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 21, true);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
1	2015-09-27	1	1
2	2015-09-27	1	2
3	2015-09-27	1	3
4	2015-09-27	1	4
5	2015-09-27	1	5
6	2015-12-28	1	6
7	2015-12-30	6	6
8	2015-12-31	1	6
9	2016-01-21	3	7
10	2016-01-21	1	8
11	2016-01-21	1	9
12	2016-01-21	1	10
13	2016-01-21	1	11
14	2016-01-21	1	2
15	2016-01-21	1	12
16	2016-01-22	1	13
18	2016-01-25	1	14
17	2016-01-25	3	2
19	2016-01-26	7	2
20	2016-02-22	1	15
21	2016-02-22	1	6
22	2016-02-26	4	12
23	2016-02-28	1	16
24	2016-02-28	1	17
26	2016-02-28	1	14
25	2016-02-28	3	2
27	2016-03-02	1	18
28	2016-03-06	1	19
29	2016-03-15	1	20
30	2016-03-29	1	7
31	2016-03-29	1	21
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 31, true);


--
-- Data for Name: wagtailsearchpromotions_searchpromotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearchpromotions_searchpromotion (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
1	t	t	t	3
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogindexrelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogindexrelatedlink
    ADD CONSTRAINT blog_blogindexrelatedlink_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_blogpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_pkey PRIMARY KEY (id);


--
-- Name: blog_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_bookmark
    ADD CONSTRAINT blog_bookmark_pkey PRIMARY KEY (id);


--
-- Name: blog_bookmarkpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_bookmarkpage
    ADD CONSTRAINT blog_bookmarkpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: blog_bookmarkplacement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_bookmarkplacement
    ADD CONSTRAINT blog_bookmarkplacement_pkey PRIMARY KEY (id);


--
-- Name: blog_bookmarktag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_bookmarktag
    ADD CONSTRAINT blog_bookmarktag_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermi_group_id_7bdcf8bfbcce5581_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermi_group_id_7bdcf8bfbcce5581_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_29d2c7f94ac026_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_29d2c7f94ac026_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_37a13a49926a4846_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_37a13a49926a4846_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_45e80ac840fed7f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_45e80ac840fed7f8_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_742f4fe4119535f1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_742f4fe4119535f1_uniq UNIQUE (image_id, filter_id, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_5e354102fcbf9c8b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_5e354102fcbf9c8b_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_4e12c633921cb0c9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_4e12c633921cb0c9_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogindexrelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogindexrelatedlink_1a63c800 ON blog_blogindexrelatedlink USING btree (page_id);


--
-- Name: blog_blogindexrelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogindexrelatedlink_5b76e141 ON blog_blogindexrelatedlink USING btree (link_page_id);


--
-- Name: blog_blogpage_36b62cbe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogpage_36b62cbe ON blog_blogpage USING btree (main_image_id);


--
-- Name: blog_blogpage_993b3523; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogpage_993b3523 ON blog_blogpage USING btree (listing_image_id);


--
-- Name: blog_blogpagetag_09a80f33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogpagetag_09a80f33 ON blog_blogpagetag USING btree (content_object_id);


--
-- Name: blog_blogpagetag_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_blogpagetag_76f094bc ON blog_blogpagetag USING btree (tag_id);


--
-- Name: blog_bookmarkplacement_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_bookmarkplacement_1a63c800 ON blog_bookmarkplacement USING btree (page_id);


--
-- Name: blog_bookmarkplacement_9c7b8123; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_bookmarkplacement_9c7b8123 ON blog_bookmarkplacement USING btree (quote_id);


--
-- Name: blog_bookmarktag_09a80f33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_bookmarktag_09a80f33 ON blog_bookmarktag USING btree (content_object_id);


--
-- Name: blog_bookmarktag_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_bookmarktag_76f094bc ON blog_bookmarktag USING btree (tag_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: taggit_tag_name_4ed9aad194b72af1_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_name_4ed9aad194b72af1_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_703438030cd922a7_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_slug_703438030cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id_3c99b32018cc9d40_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_collection_path_fb7af1cc8ed8c35_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_collection_path_fb7af1cc8ed8c35_like ON wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_groupcollectionpermission_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0a1a4dd8 ON wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0e939a4f ON wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_8373b171 ON wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_785096aa58388042_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_first_published_at_785096aa58388042_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_path_adbf7302a1ab75e_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_adbf7302a1ab75e_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_de66a236c47d916_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_de66a236c47d916_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_page_submitted_for_moderation_10bec949f0821f20_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_submitted_for_moderation_10bec949f0821f20_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_3649a8ca5c8e8730_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_3649a8ca5c8e8730_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtaildocs_document_0a1a4dd8 ON wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_filter_b979c293; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_filter_b979c293 ON wagtailimages_filter USING btree (spec);


--
-- Name: wagtailimages_filter_spec_45e80ac840fed7f8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_filter_spec_45e80ac840fed7f8_like ON wagtailimages_filter USING btree (spec varchar_pattern_ops);


--
-- Name: wagtailimages_image_0a1a4dd8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_0a1a4dd8 ON wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_1e91a237c16eaa71_uniq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_created_at_1e91a237c16eaa71_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_0a317463; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_0a317463 ON wagtailimages_rendition USING btree (filter_id);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_579ecadc1434daf4_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_old_path_579ecadc1434daf4_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearchpromotions_searchpromotion USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearchpromotions_searchpromotion USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_a78010a1796bb04_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_a78010a1796bb04_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: D59e4f8e70dc4c74113492e5e759a9c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT "D59e4f8e70dc4c74113492e5e759a9c3" FOREIGN KEY (content_object_id) REFERENCES blog_blogpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_b_main_image_id_49d1c76b352ea95a_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_b_main_image_id_49d1c76b352ea95a_fk_wagtailimages_image_id FOREIGN KEY (main_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogin_link_page_id_99d9f0c05b080ae_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogindexrelatedlink
    ADD CONSTRAINT blog_blogin_link_page_id_99d9f0c05b080ae_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogin_page_ptr_id_27bdacf7c3f57dce_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogindexpage
    ADD CONSTRAINT blog_blogin_page_ptr_id_27bdacf7c3f57dce_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpa_page_ptr_id_38b88b267130b8cf_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_blogpa_page_ptr_id_38b88b267130b8cf_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpagetag_tag_id_42cca3ea895c8183_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpagetag
    ADD CONSTRAINT blog_blogpagetag_tag_id_42cca3ea895c8183_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_boo_content_object_id_4a1162807d5666c2_fk_blog_bookmark_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarktag
    ADD CONSTRAINT blog_boo_content_object_id_4a1162807d5666c2_fk_blog_bookmark_id FOREIGN KEY (content_object_id) REFERENCES blog_bookmark(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_bookma_page_ptr_id_19a8f9da771c86b3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarkpage
    ADD CONSTRAINT blog_bookma_page_ptr_id_19a8f9da771c86b3_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_bookmarkpl_page_id_2126773b4fc1ae87_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarkplacement
    ADD CONSTRAINT blog_bookmarkpl_page_id_2126773b4fc1ae87_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_bookmarkplace_quote_id_5bd9f3da1dc2a91_fk_blog_bookmark_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarkplacement
    ADD CONSTRAINT blog_bookmarkplace_quote_id_5bd9f3da1dc2a91_fk_blog_bookmark_id FOREIGN KEY (quote_id) REFERENCES blog_bookmark(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_bookmarktag_tag_id_a95469015041494_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_bookmarktag
    ADD CONSTRAINT blog_bookmarktag_tag_id_a95469015041494_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_listing_image_id_c980dbd59b8ba1e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogpage
    ADD CONSTRAINT blog_listing_image_id_c980dbd59b8ba1e_fk_wagtailimages_image_id FOREIGN KEY (listing_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_page_id_1cf5bf9fa96f6eac_fk_blog_blogindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_blogindexrelatedlink
    ADD CONSTRAINT blog_page_id_1cf5bf9fa96f6eac_fk_blog_blogindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES blog_blogindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepa_page_ptr_id_1bb67742a6b3ac95_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepa_page_ptr_id_1bb67742a6b3ac95_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_collection_id_1b29a2a37e7d436c_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wag_collection_id_1b29a2a37e7d436c_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_collection_id_285e87239b035e6a_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wag_collection_id_285e87239b035e6a_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_collection_id_2b616eaa03011e90_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wag_collection_id_2b616eaa03011e90_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagt_content_type_id_7ae0ebb2acb1454e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagt_content_type_id_7ae0ebb2acb1454e_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtai_redirect_page_id_4fb5deae195b3223_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtai_redirect_page_id_4fb5deae195b3223_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcor_permission_id_48aff6f1dd268787_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcor_permission_id_48aff6f1dd268787_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcor_root_page_id_5c8b4b84e03f7f29_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcor_root_page_id_5c8b4b84e03f7f29_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_gro_page_id_70d2788c0579bb7c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_gro_page_id_70d2788c0579bb7c_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_group_id_6d27de27630f0e7a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_6d27de27630f0e7a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppage_group_id_2df9571b92fb26d_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppage_group_id_2df9571b92fb26d_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pag_page_id_1d5ab1303676feba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pag_page_id_1d5ab1303676feba_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pag_page_id_318895e696da7fed_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pag_page_id_318895e696da7fed_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_7a2f24f1767b30bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_7a2f24f1767b30bc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisi_user_id_3a9a8cf31a218402_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisi_user_id_3a9a8cf31a218402_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildoc_uploaded_by_user_id_62c5d96169f4ec20_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildoc_uploaded_by_user_id_62c5d96169f4ec20_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_fo_page_id_72bcec1db96e6d21_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_fo_page_id_72bcec1db96e6d21_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id FOREIGN KEY (filter_id) REFERENCES wagtailimages_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailima_uploaded_by_user_id_4941ddafe7e6985a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailima_uploaded_by_user_id_4941ddafe7e6985a_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirect_site_id_72075f3bbfcf92e7_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirect_site_id_72075f3bbfcf92e7_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsear_query_id_355494074ca8351a_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsear_query_id_355494074ca8351a_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsear_query_id_74051b390c9e69bd_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsear_query_id_74051b390c9e69bd_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearchpr_page_id_3462cbff9e5ac96d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearchpromotions_searchpromotion
    ADD CONSTRAINT wagtailsearchpr_page_id_3462cbff9e5ac96d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofi_user_id_755efda9998dba71_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofi_user_id_755efda9998dba71_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

