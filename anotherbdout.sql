--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: edge; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.edge (
    edgeid integer NOT NULL,
    edgetypeid bigint NOT NULL,
    headnodeid bigint NOT NULL,
    tailnodeid bigint NOT NULL
);


ALTER TABLE public.edge OWNER TO "pi-003";

--
-- Name: edges_edgeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.edges_edgeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.edges_edgeid_seq OWNER TO "pi-003";

--
-- Name: edges_edgeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.edges_edgeid_seq OWNED BY public.edge.edgeid;


--
-- Name: edgetype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.edgetype (
    edgetypeid integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.edgetype OWNER TO "pi-003";

--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.edgetype_edgetypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.edgetype_edgetypeid_seq OWNER TO "pi-003";

--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.edgetype_edgetypeid_seq OWNED BY public.edgetype.edgetypeid;


--
-- Name: graph; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.graph (
    graphid integer NOT NULL,
    name character varying(64) NOT NULL,
    graphtypeid bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.graph OWNER TO "pi-003";

--
-- Name: graph_graphid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.graph_graphid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.graph_graphid_seq OWNER TO "pi-003";

--
-- Name: graph_graphid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.graph_graphid_seq OWNED BY public.graph.graphid;


--
-- Name: graphtype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.graphtype (
    graphtypeid integer NOT NULL,
    name character varying(128),
    template jsonb
);


ALTER TABLE public.graphtype OWNER TO "pi-003";

--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.graphtype_graphtypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.graphtype_graphtypeid_seq OWNER TO "pi-003";

--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.graphtype_graphtypeid_seq OWNED BY public.graphtype.graphtypeid;


--
-- Name: node; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.node (
    nodeid integer NOT NULL,
    name character varying(64) NOT NULL,
    graphid bigint NOT NULL,
    nodetypeid bigint NOT NULL,
    classification bigint NOT NULL,
    copyrightowner character varying(128) NOT NULL,
    version character varying(32) NOT NULL,
    payload jsonb NOT NULL
);


ALTER TABLE public.node OWNER TO "pi-003";

--
-- Name: nodes_nodeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.nodes_nodeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nodes_nodeid_seq OWNER TO "pi-003";

--
-- Name: nodes_nodeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.nodes_nodeid_seq OWNED BY public.node.nodeid;


--
-- Name: nodetype; Type: TABLE; Schema: public; Owner: pi-003
--

CREATE TABLE public.nodetype (
    nodetypeid integer NOT NULL,
    name character varying(64) NOT NULL,
    fields jsonb NOT NULL,
    settings jsonb NOT NULL
);


ALTER TABLE public.nodetype OWNER TO "pi-003";

--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE; Schema: public; Owner: pi-003
--

CREATE SEQUENCE public.nodetype_nodetypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nodetype_nodetypeid_seq OWNER TO "pi-003";

--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi-003
--

ALTER SEQUENCE public.nodetype_nodetypeid_seq OWNED BY public.nodetype.nodetypeid;


--
-- Name: edge edgeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge ALTER COLUMN edgeid SET DEFAULT nextval('public.edges_edgeid_seq'::regclass);


--
-- Name: edgetype edgetypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype ALTER COLUMN edgetypeid SET DEFAULT nextval('public.edgetype_edgetypeid_seq'::regclass);


--
-- Name: graph graphid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph ALTER COLUMN graphid SET DEFAULT nextval('public.graph_graphid_seq'::regclass);


--
-- Name: graphtype graphtypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype ALTER COLUMN graphtypeid SET DEFAULT nextval('public.graphtype_graphtypeid_seq'::regclass);


--
-- Name: node nodeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node ALTER COLUMN nodeid SET DEFAULT nextval('public.nodes_nodeid_seq'::regclass);


--
-- Name: nodetype nodetypeid; Type: DEFAULT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype ALTER COLUMN nodetypeid SET DEFAULT nextval('public.nodetype_nodetypeid_seq'::regclass);


--
-- Name: edge edges_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_pkey PRIMARY KEY (edgeid);


--
-- Name: edgetype edgetype_name_unique; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype
    ADD CONSTRAINT edgetype_name_unique UNIQUE (name);


--
-- Name: edgetype edgetype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edgetype
    ADD CONSTRAINT edgetype_pkey PRIMARY KEY (edgetypeid);


--
-- Name: graph graph_pkey1; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph
    ADD CONSTRAINT graph_pkey1 PRIMARY KEY (graphid);


--
-- Name: graphtype graphtype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype
    ADD CONSTRAINT graphtype_pkey PRIMARY KEY (graphtypeid);


--
-- Name: node nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (nodeid);


--
-- Name: nodetype nodetype_pkey; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype
    ADD CONSTRAINT nodetype_pkey PRIMARY KEY (nodetypeid);


--
-- Name: graph unique_graph_name; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graph
    ADD CONSTRAINT unique_graph_name UNIQUE (name);


--
-- Name: nodetype unique_nodetype_name; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.nodetype
    ADD CONSTRAINT unique_nodetype_name UNIQUE (name);


--
-- Name: graphtype uniquename; Type: CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.graphtype
    ADD CONSTRAINT uniquename UNIQUE (name);


--
-- Name: edge edges_edgetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_edgetypeid_foreign FOREIGN KEY (edgetypeid) REFERENCES public.edgetype(edgetypeid);


--
-- Name: edge edges_head_nodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_head_nodeid_foreign FOREIGN KEY (headnodeid) REFERENCES public.node(nodeid);


--
-- Name: edge edges_tail_nodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edges_tail_nodeid_foreign FOREIGN KEY (tailnodeid) REFERENCES public.node(nodeid);


--
-- Name: node nodes_graphid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_graphid_foreign FOREIGN KEY (graphid) REFERENCES public.graph(graphid);


--
-- Name: node nodes_nodetype_foreign; Type: FK CONSTRAINT; Schema: public; Owner: pi-003
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT nodes_nodetype_foreign FOREIGN KEY (nodetypeid) REFERENCES public.nodetype(nodetypeid);


--
-- PostgreSQL database dump complete
--

