--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: validate_edge_creation_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_edge_creation_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
valid_connection INT;
is_hard_edge BOOLEAN;
BEGIN
SELECT "Hard" INTO is_hard_edge
FROM "EdgeType"
 WHERE "Id" = NEW."EdgeTypeId";
IF is_hard_edge = TRUE THEN
SELECT COUNT(*) INTO valid_connection
FROM "Restriction"
WHERE ("AllowedNodeType" = (SELECT "NodeTypeId" FROM "Node" WHERE "Id" = NEW."HeadNodeId")
AND "NodeTypeId" = (SELECT "NodeTypeId" FROM "Node" WHERE "Id" = NEW."TailNodeId"))
OR ("AllowedNodeType" = (SELECT "NodeTypeId" FROM "Node" WHERE "Id" = NEW."TailNodeId")
AND "NodeTypeId" = (SELECT "NodeTypeId" FROM "Node" WHERE "Id" = NEW."HeadNodeId"));
IF valid_connection = 0 THEN
RAISE EXCEPTION 'Restrictions do not allow this edge to be created';
END IF;
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_edge_creation_func() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: DataType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DataType" (
    "Id" bigint NOT NULL,
    "TypeName" character varying(30) NOT NULL,
    CONSTRAINT "DataType_TypeName_check" CHECK ((("TypeName")::text = ANY (ARRAY[('bigint'::character varying)::text, ('varchar'::character varying)::text, ('boolean'::character varying)::text, ('doubleprecision'::character varying)::text])))
);


ALTER TABLE public."DataType" OWNER TO postgres;

--
-- Name: DataType_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DataType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."DataType_Id_seq" OWNER TO postgres;

--
-- Name: DataType_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DataType_Id_seq" OWNED BY public."DataType"."Id";


--
-- Name: Edge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Edge" (
    "Id" bigint NOT NULL,
    "EdgeTypeId" bigint NOT NULL,
    "HeadNodeId" bigint NOT NULL,
    "TailNodeId" bigint NOT NULL
);


ALTER TABLE public."Edge" OWNER TO postgres;

--
-- Name: EdgeType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EdgeType" (
    "Id" bigint NOT NULL,
    "Name" character varying(64) NOT NULL,
    "Hard" boolean NOT NULL
);


ALTER TABLE public."EdgeType" OWNER TO postgres;

--
-- Name: EdgeType_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EdgeType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."EdgeType_Id_seq" OWNER TO postgres;

--
-- Name: EdgeType_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EdgeType_Id_seq" OWNED BY public."EdgeType"."Id";


--
-- Name: Edge_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Edge_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Edge_Id_seq" OWNER TO postgres;

--
-- Name: Edge_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Edge_Id_seq" OWNED BY public."Edge"."Id";


--
-- Name: Graph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Graph" (
    "Id" bigint NOT NULL,
    "GraphTypeId" bigint,
    "Name" character varying(64)
);


ALTER TABLE public."Graph" OWNER TO postgres;

--
-- Name: GraphType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GraphType" (
    "Id" bigint NOT NULL,
    "Name" character varying(64) NOT NULL,
    "TemplateRootNodeId" bigint
);


ALTER TABLE public."GraphType" OWNER TO postgres;

--
-- Name: GraphType_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GraphType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."GraphType_Id_seq" OWNER TO postgres;

--
-- Name: GraphType_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GraphType_Id_seq" OWNED BY public."GraphType"."Id";


--
-- Name: Graph_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Graph_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Graph_Id_seq" OWNER TO postgres;

--
-- Name: Graph_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Graph_Id_seq" OWNED BY public."Graph"."Id";


--
-- Name: Node; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Node" (
    "Id" bigint NOT NULL,
    "Name" character varying(64),
    "GraphId" bigint NOT NULL,
    "NodeTypeId" bigint,
    "Classification" smallint,
    "CopyrightOwner" character varying(64),
    "Version" character varying(32)
);


ALTER TABLE public."Node" OWNER TO postgres;

--
-- Name: NodeField; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NodeField" (
    "Id" bigint NOT NULL,
    "NodeId" bigint NOT NULL,
    "FieldTypeId" bigint NOT NULL,
    "StringValue" character varying,
    "IntValue" bigint,
    "BooleanValue" boolean,
    "FloatValue" double precision
);


ALTER TABLE public."NodeField" OWNER TO postgres;

--
-- Name: NodeField_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NodeField_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NodeField_Id_seq" OWNER TO postgres;

--
-- Name: NodeField_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NodeField_Id_seq" OWNED BY public."NodeField"."Id";


--
-- Name: NodeType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NodeType" (
    "Id" bigint NOT NULL,
    "Name" character varying(64) NOT NULL
);


ALTER TABLE public."NodeType" OWNER TO postgres;

--
-- Name: NodeTypeField; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NodeTypeField" (
    "NodeTypeId" bigint NOT NULL,
    "Id" bigint NOT NULL,
    "Name" character varying(64) NOT NULL,
    "DataTypeId" bigint NOT NULL,
    "Ranking" integer NOT NULL
);


ALTER TABLE public."NodeTypeField" OWNER TO postgres;

--
-- Name: NodeTypeField_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NodeTypeField_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NodeTypeField_Id_seq" OWNER TO postgres;

--
-- Name: NodeTypeField_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NodeTypeField_Id_seq" OWNED BY public."NodeTypeField"."Id";


--
-- Name: NodeType_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NodeType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."NodeType_Id_seq" OWNER TO postgres;

--
-- Name: NodeType_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NodeType_Id_seq" OWNED BY public."NodeType"."Id";


--
-- Name: Node_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Node_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Node_Id_seq" OWNER TO postgres;

--
-- Name: Node_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Node_Id_seq" OWNED BY public."Node"."Id";


--
-- Name: Restriction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Restriction" (
    "Id" bigint NOT NULL,
    "AllowedNodeType" bigint NOT NULL,
    "NodeTypeId" bigint NOT NULL
);


ALTER TABLE public."Restriction" OWNER TO postgres;

--
-- Name: Restriction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Restriction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Restriction_Id_seq" OWNER TO postgres;

--
-- Name: Restriction_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Restriction_Id_seq" OWNED BY public."Restriction"."Id";


--
-- Name: DataType Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataType" ALTER COLUMN "Id" SET DEFAULT nextval('public."DataType_Id_seq"'::regclass);


--
-- Name: Edge Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edge" ALTER COLUMN "Id" SET DEFAULT nextval('public."Edge_Id_seq"'::regclass);


--
-- Name: EdgeType Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EdgeType" ALTER COLUMN "Id" SET DEFAULT nextval('public."EdgeType_Id_seq"'::regclass);


--
-- Name: Graph Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Graph" ALTER COLUMN "Id" SET DEFAULT nextval('public."Graph_Id_seq"'::regclass);


--
-- Name: GraphType Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GraphType" ALTER COLUMN "Id" SET DEFAULT nextval('public."GraphType_Id_seq"'::regclass);


--
-- Name: Node Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Node" ALTER COLUMN "Id" SET DEFAULT nextval('public."Node_Id_seq"'::regclass);


--
-- Name: NodeField Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeField" ALTER COLUMN "Id" SET DEFAULT nextval('public."NodeField_Id_seq"'::regclass);


--
-- Name: NodeType Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeType" ALTER COLUMN "Id" SET DEFAULT nextval('public."NodeType_Id_seq"'::regclass);


--
-- Name: NodeTypeField Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeTypeField" ALTER COLUMN "Id" SET DEFAULT nextval('public."NodeTypeField_Id_seq"'::regclass);


--
-- Name: Restriction Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restriction" ALTER COLUMN "Id" SET DEFAULT nextval('public."Restriction_Id_seq"'::regclass);


--
-- Name: DataType DataType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataType"
    ADD CONSTRAINT "DataType_pkey" PRIMARY KEY ("Id");


--
-- Name: EdgeType EdgeType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EdgeType"
    ADD CONSTRAINT "EdgeType_pkey" PRIMARY KEY ("Id");


--
-- Name: Edge Edge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edge"
    ADD CONSTRAINT "Edge_pkey" PRIMARY KEY ("Id");


--
-- Name: GraphType GraphType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GraphType"
    ADD CONSTRAINT "GraphType_pkey" PRIMARY KEY ("Id");


--
-- Name: Graph Graph_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Graph"
    ADD CONSTRAINT "Graph_pkey" PRIMARY KEY ("Id");


--
-- Name: NodeField NodeField_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeField"
    ADD CONSTRAINT "NodeField_pkey" PRIMARY KEY ("Id");


--
-- Name: NodeTypeField NodeTypeField_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeTypeField"
    ADD CONSTRAINT "NodeTypeField_pkey" PRIMARY KEY ("Id");


--
-- Name: NodeType NodeType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeType"
    ADD CONSTRAINT "NodeType_pkey" PRIMARY KEY ("Id");


--
-- Name: Node Node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Node"
    ADD CONSTRAINT "Node_pkey" PRIMARY KEY ("Id");


--
-- Name: Restriction Restriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restriction"
    ADD CONSTRAINT "Restriction_pkey" PRIMARY KEY ("Id");


--
-- Name: DataType datatype_typename_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DataType"
    ADD CONSTRAINT datatype_typename_unique UNIQUE ("TypeName");


--
-- Name: EdgeType edgetype_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EdgeType"
    ADD CONSTRAINT edgetype_name_unique UNIQUE ("Name");


--
-- Name: GraphType graphtype_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GraphType"
    ADD CONSTRAINT graphtype_name_unique UNIQUE ("Name");


--
-- Name: NodeType nodetype_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeType"
    ADD CONSTRAINT nodetype_name_unique UNIQUE ("Name");


--
-- Name: Edge validate_edge_creation; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_edge_creation BEFORE INSERT ON public."Edge" FOR EACH ROW EXECUTE FUNCTION public.validate_edge_creation_func();


--
-- Name: Edge edge_edgetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edge"
    ADD CONSTRAINT edge_edgetypeid_foreign FOREIGN KEY ("EdgeTypeId") REFERENCES public."EdgeType"("Id");


--
-- Name: Edge edge_headnodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edge"
    ADD CONSTRAINT edge_headnodeid_foreign FOREIGN KEY ("HeadNodeId") REFERENCES public."Node"("Id");


--
-- Name: Edge edge_tailnodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Edge"
    ADD CONSTRAINT edge_tailnodeid_foreign FOREIGN KEY ("TailNodeId") REFERENCES public."Node"("Id");


--
-- Name: Graph graph_graphtypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Graph"
    ADD CONSTRAINT graph_graphtypeid_foreign FOREIGN KEY ("GraphTypeId") REFERENCES public."GraphType"("Id");


--
-- Name: GraphType graphtype_templaterootnodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GraphType"
    ADD CONSTRAINT graphtype_templaterootnodeid_foreign FOREIGN KEY ("TemplateRootNodeId") REFERENCES public."Node"("Id");


--
-- Name: Node node_graphid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Node"
    ADD CONSTRAINT node_graphid_foreign FOREIGN KEY ("GraphId") REFERENCES public."Graph"("Id");


--
-- Name: Node node_nodetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Node"
    ADD CONSTRAINT node_nodetypeid_foreign FOREIGN KEY ("NodeTypeId") REFERENCES public."NodeType"("Id");


--
-- Name: NodeField nodefield_fieldtypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeField"
    ADD CONSTRAINT nodefield_fieldtypeid_foreign FOREIGN KEY ("FieldTypeId") REFERENCES public."NodeTypeField"("Id");


--
-- Name: NodeField nodefield_nodeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeField"
    ADD CONSTRAINT nodefield_nodeid_foreign FOREIGN KEY ("NodeId") REFERENCES public."Node"("Id");


--
-- Name: NodeTypeField nodetypefield_datatypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeTypeField"
    ADD CONSTRAINT nodetypefield_datatypeid_foreign FOREIGN KEY ("DataTypeId") REFERENCES public."DataType"("Id");


--
-- Name: NodeTypeField nodetypefield_nodetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NodeTypeField"
    ADD CONSTRAINT nodetypefield_nodetypeid_foreign FOREIGN KEY ("NodeTypeId") REFERENCES public."NodeType"("Id");


--
-- Name: Restriction restriction_allowednodetype_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restriction"
    ADD CONSTRAINT restriction_allowednodetype_foreign FOREIGN KEY ("AllowedNodeType") REFERENCES public."NodeType"("Id");


--
-- Name: Restriction restriction_nodetypeid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restriction"
    ADD CONSTRAINT restriction_nodetypeid_foreign FOREIGN KEY ("NodeTypeId") REFERENCES public."NodeType"("Id");


--
-- PostgreSQL database dump complete
--

