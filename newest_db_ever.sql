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
-- Data for Name: edge; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.edge (edgeid, edgetypeid, headnodeid, tailnodeid) FROM stdin;
1	10	1	4
2	10	4	7
3	10	2	5
4	10	5	8
5	10	3	6
6	10	6	9
160	12	312	221
161	12	313	222
162	12	314	223
163	12	315	224
164	12	316	225
165	12	317	226
166	12	318	227
167	12	319	219
168	12	320	175
169	12	321	176
170	12	322	177
171	12	323	178
172	12	324	179
173	12	325	180
174	12	326	181
10	10	6	12
175	12	327	295
176	12	328	183
177	12	329	184
178	12	330	185
179	12	331	186
180	12	332	187
181	12	333	189
182	12	334	190
183	12	335	191
184	12	336	192
185	12	337	193
186	13	472	473
187	13	472	474
188	13	472	475
189	14	1	17
190	14	1	17
191	14	1	17
192	14	1	17
193	14	1	17
194	14	1	17
195	14	1	17
196	14	1	17
197	14	1	17
198	14	1	17
199	14	1	17
200	14	1	17
201	14	1	17
202	14	1	17
203	14	1	17
204	14	2	221
205	14	2	222
206	14	2	223
207	14	2	224
208	14	2	225
209	14	2	226
210	14	2	227
211	14	2	27
212	14	2	28
213	14	2	29
214	14	2	30
215	14	2	31
216	14	2	32
217	14	2	33
218	14	2	34
219	14	3	222
220	14	3	224
221	14	3	226
222	14	3	27
223	14	3	29
224	14	3	31
225	14	3	33
226	14	3	35
227	14	3	37
228	14	3	39
229	14	3	41
230	14	3	43
231	14	3	45
232	14	3	47
233	14	3	49
234	14	4	223
235	14	4	226
236	14	4	28
237	14	4	31
238	14	4	34
239	14	4	37
240	14	4	40
241	14	4	43
242	14	4	46
243	14	4	49
244	14	4	52
245	14	4	55
246	14	4	58
247	14	4	61
248	14	4	64
249	14	5	224
250	14	5	27
251	14	5	31
252	14	5	35
253	14	5	39
254	14	5	43
255	14	5	47
256	14	5	51
257	14	5	55
258	14	5	59
259	14	5	63
260	14	5	67
261	14	5	71
262	14	5	75
263	14	5	79
264	14	6	225
265	14	6	29
266	14	6	34
267	14	6	39
268	14	6	44
269	14	6	49
270	14	6	54
271	14	6	59
272	14	6	64
273	14	6	69
274	14	6	74
275	14	6	79
276	14	6	84
277	14	6	89
278	14	6	94
279	14	7	226
280	14	7	31
281	14	7	37
282	14	7	43
283	14	7	49
284	14	7	55
285	14	7	61
286	14	7	67
287	14	7	73
288	14	7	79
289	14	7	85
290	14	7	91
291	14	7	97
292	14	7	103
293	14	7	109
294	14	8	227
295	14	8	33
296	14	8	40
297	14	8	47
298	14	8	54
299	14	8	61
300	14	8	68
301	14	8	75
302	14	8	82
303	14	8	89
304	14	8	96
305	14	8	103
306	14	8	110
307	14	8	117
308	14	8	124
309	14	9	27
310	14	9	35
311	14	9	43
312	14	9	51
313	14	9	59
314	14	9	67
315	14	9	75
316	14	9	83
317	14	9	91
318	14	9	99
319	14	9	107
320	14	9	115
321	14	9	123
322	14	9	130
323	14	9	138
324	14	12	28
325	14	12	37
326	14	12	46
327	14	12	55
328	14	12	64
329	14	12	73
330	14	12	82
331	14	12	91
332	14	12	100
333	14	12	109
334	14	12	118
335	14	12	127
336	14	12	135
337	14	12	144
338	14	12	153
341	16	312	340
342	16	313	338
343	16	313	340
344	16	312	358
345	12	312	180
346	12	312	244
\.


--
-- Data for Name: edgetype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.edgetype (edgetypeid, name) FROM stdin;
10	link
11	SFIA Edge
12	KSB Edge
13	Agent Response
14	testedge
16	Technique to Technology
17	Technology to Tools
\.


--
-- Data for Name: graph; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.graph (graphid, name, graphtypeid) FROM stdin;
3	DO-178C	1
9	DEV-787	1
11	DEV-786	1
12	DEV-785	1
17	API Test Graph	1
20	test2	1
19	SFIA Graph	1
21	Agent Graph	3
22	Technique Graph	5
23	Technology Graph	6
24	Tool Graph	7
25	KSB Graph	8
\.


--
-- Data for Name: graphtype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.graphtype (graphtypeid, name, template) FROM stdin;
1	Basic	{}
3	Agent Template	{"Avaliable Nodes": {"18": "KSB"}}
4	test	{}
2	SFIA Template	{"Allowed Nodes": {"SFIA_concern": "1", "SFIA_response": "MENY", "SFIA_framework": "1", "SFIA_skill_node": "MENY"}}
5	Technique Template	{"Allowed Nodes": {"technique_node": "MENY", "experience_concern": "1", "technique_response": "MENY", "technique_framework": "1"}}
6	Technology Template	{"Allowed Nodes": {"technology_node": "MENY", "experience_concern": "1", "technology_response": "MENY", "technology_framework": "1"}}
7	Tool Template	{"Allowed Nodes": {"tool_node": "MENY", "tool_response": "MENY", "tool_framework": "1", "experience_concern": "1"}}
8	KSB Template	{"Allowed Nodes": {"KSB_node": "MENY"}}
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.node (nodeid, name, graphid, nodetypeid, classification, copyrightowner, version, payload) FROM stdin;
1	Test Result 1	3	1	10	Bob	v1	{}
2	Test Result 2	3	1	10	Jim	v1	{}
3	Test Result 3	3	1	10	Foo	v1	{}
4	Test Procedure 1	3	2	10	Bob	v1	{}
5	Test Procedure 2	3	2	10	Jim	v1	{}
6	Test Procedure 3	3	2	10	Foo	v1	{}
7	Test Case 1	3	4	10	Bob	v1	{}
8	Test Case 2	3	4	10	Jim	v1	{}
9	Test Case 3	3	4	10	Foo	v1	{}
12	Test Case 4	3	4	10	Kim	v1	{}
17	testttt	3	1	0	string	string	"string"
221	KSB K49	25	18	1	KSB	v1	{"K49": "Approaches to incident response and management including escalation and investigation of cyber security breaches and their root cause."}
222	KSB K50	25	18	1	KSB	v1	{"K50": "Ethical principles and codes of good practice of at least one significant cyber security professional body and the ethical responsibilities of a cyber security professional."}
223	KSB K51	25	18	1	KSB	v1	{"K51": "Principles of common security architectures and methodologies."}
224	KSB K52	25	18	1	KSB	v1	{"K52": "Approaches to deployment of cyber security technology components in digital systems to provide security functionality. For example hardware and software to implement security controls."}
225	KSB K53	25	18	1	KSB	v1	{"K53": "The barriers that exist to effective data analysis between analysts and their stakeholders and how to avoid or resolve these."}
226	KSB K54	25	18	1	KSB	v1	{"K54": "How to critically analyse, interpret and evaluate complex information from diverse datasets."}
227	KSB K55	25	18	1	KSB	v1	{"K55": "Data formats, structures, architectures and data delivery methods including “unstructured” data."}
27	ITSP	19	17	1	SFIA	v1	{"Skill": "Strategic planning ITSP", "Levels": [4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
28	ISCO	19	17	1	SFIA	v1	{"Skill": "Information systems coordination ISCO", "Levels": [6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
29	IRMG	19	17	1	SFIA	v1	{"Skill": "Information management IRMG", "Levels": [3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
30	STPL	19	17	1	SFIA	v1	{"Skill": "Enterprise and business architecture STPL", "Levels": [5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
31	ARCH	19	17	1	SFIA	v1	{"Skill": "Solution architecture ARCH", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
32	INOV	19	17	1	SFIA	v1	{"Skill": "Innovation management INOV", "Levels": [5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
33	EMRG	19	17	1	SFIA	v1	{"Skill": "Emerging technology monitoring EMRG", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
34	RSCH	19	17	1	SFIA	v1	{"Skill": "Formal research RSCH", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
35	SUST	19	17	1	SFIA	v1	{"Skill": "Sustainability SUST", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Strategy and planning"}
36	FMIT	19	17	1	SFIA	v1	{"Skill": "Financial management FMIT", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
37	INVA	19	17	1	SFIA	v1	{"Skill": "Investment appraisal INVA", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
38	BENM	19	17	1	SFIA	v1	{"Skill": "Benefits management BENM", "Levels": [3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
39	BUDF	19	17	1	SFIA	v1	{"Skill": "Budgeting and forecasting BUDF", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
40	FIAN	19	17	1	SFIA	v1	{"Skill": "Financial analysis FIAN", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
41	COMG	19	17	1	SFIA	v1	{"Skill": "Cost management COMG", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
42	DEMM	19	17	1	SFIA	v1	{"Skill": "Demand management DEMM", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
43	MEAS	19	17	1	SFIA	v1	{"Skill": "Measurement MEAS", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Financial and value management"}
44	SCTY	19	17	1	SFIA	v1	{"Skill": "Information security SCTY", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
45	INAS	19	17	1	SFIA	v1	{"Skill": "Information assurance INAS", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
46	PEDP	19	17	1	SFIA	v1	{"Skill": "Information and data compliance PEDP", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
47	VURE	19	17	1	SFIA	v1	{"Skill": "Vulnerability research VURE", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
48	THIN	19	17	1	SFIA	v1	{"Skill": "Threat intelligence THIN", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Security and privacy"}
49	BURM	19	17	1	SFIA	v1	{"Skill": "Risk management BURM", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
50	AIDE	19	17	1	SFIA	v1	{"Skill": "Artificial intelligence (AI) and data ethics AIDE", "Levels": [3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
51	AUDT	19	17	1	SFIA	v1	{"Skill": "Audit AUDT", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
52	QUMG	19	17	1	SFIA	v1	{"Skill": "Quality management QUMG", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
53	QUAS	19	17	1	SFIA	v1	{"Skill": "Quality assurance QUAS", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Governance, risk and compliance"}
54	CNSL	19	17	1	SFIA	v1	{"Skill": "Consultancy CNSL", "Levels": [4, 5, 6, 7], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
55	TECH	19	17	1	SFIA	v1	{"Skill": "Specialist advice TECH", "Levels": [4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
56	METL	19	17	1	SFIA	v1	{"Skill": "Methods and tools METL", "Levels": [2, 3, 4, 5, 6], "Category": "Strategy and architecture", "Subcatagory": "Advice and guidance"}
57	POMG	19	17	1	SFIA	v1	{"Skill": "Portfolio management POMG", "Levels": [5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
58	PGMG	19	17	1	SFIA	v1	{"Skill": "Programme management PGMG", "Levels": [6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
59	PRMG	19	17	1	SFIA	v1	{"Skill": "Project management PRMG", "Levels": [4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
60	PROF	19	17	1	SFIA	v1	{"Skill": "Portfolio, programme and project support PROF", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
61	DEMG	19	17	1	SFIA	v1	{"Skill": "Delivery management DEMG", "Levels": [3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change implementation"}
62	BUSA	19	17	1	SFIA	v1	{"Skill": "Business situation analysis BUSA", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
63	FEAS	19	17	1	SFIA	v1	{"Skill": "Feasibility assessment FEAS", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
64	REQM	19	17	1	SFIA	v1	{"Skill": "Requirements definition and management REQM", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
65	BSMO	19	17	1	SFIA	v1	{"Skill": "Business modelling BSMO", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
66	BPTS	19	17	1	SFIA	v1	{"Skill": "User acceptance testing BPTS", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change analysis"}
67	BPRE	19	17	1	SFIA	v1	{"Skill": "Business process improvement BPRE", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
68	OCDV	19	17	1	SFIA	v1	{"Skill": "Organisational capability development OCDV", "Levels": [5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
69	ORDI	19	17	1	SFIA	v1	{"Skill": "Organisation design and implementation ORDI", "Levels": [3, 4, 5, 6, 7], "Category": "Change and transformation", "Subcatagory": "Change planning"}
70	CIPM	19	17	1	SFIA	v1	{"Skill": "Organisational change management CIPM", "Levels": [2, 3, 4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change planning"}
71	JADN	19	17	1	SFIA	v1	{"Skill": "Job analysis and design JADN", "Levels": [3, 4, 5], "Category": "Change and transformation", "Subcatagory": "Change planning"}
72	OCEN	19	17	1	SFIA	v1	{"Skill": "Organisational change enablement OCEN", "Levels": [4, 5, 6], "Category": "Change and transformation", "Subcatagory": "Change planning"}
73	PROD	19	17	1	SFIA	v1	{"Skill": "Product management PROD", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
74	DLMG	19	17	1	SFIA	v1	{"Skill": "Systems development management DLMG", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Systems development"}
75	SLEN	19	17	1	SFIA	v1	{"Skill": "Systems and software lifecycle engineering SLEN", "Levels": [3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Systems development"}
76	DESN	19	17	1	SFIA	v1	{"Skill": "Systems design DESN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
77	SWDN	19	17	1	SFIA	v1	{"Skill": "Software design SWDN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
78	NTDS	19	17	1	SFIA	v1	{"Skill": "Network design NTDS", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
79	IFDN	19	17	1	SFIA	v1	{"Skill": "Infrastructure design IFDN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
80	HWDE	19	17	1	SFIA	v1	{"Skill": "Hardware design HWDE", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
81	PROG	19	17	1	SFIA	v1	{"Skill": "Programming/software development PROG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
82	SINT	19	17	1	SFIA	v1	{"Skill": "Systems integration and build SINT", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
83	TEST	19	17	1	SFIA	v1	{"Skill": "Functional testing TEST", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
84	NFTS	19	17	1	SFIA	v1	{"Skill": "Non-functional testing NFTS", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
85	PRTS	19	17	1	SFIA	v1	{"Skill": "Process testing PRTS", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
86	PORT	19	17	1	SFIA	v1	{"Skill": "Software configuration PORT", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
87	RESD	19	17	1	SFIA	v1	{"Skill": "Real-time/embedded systems development RESD", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
88	SFEN	19	17	1	SFIA	v1	{"Skill": "Safety engineering SFEN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
89	SFAS	19	17	1	SFIA	v1	{"Skill": "Safety assessment SFAS", "Levels": [4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
90	RFEN	19	17	1	SFIA	v1	{"Skill": "Radio frequency engineering RFEN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
91	ADEV	19	17	1	SFIA	v1	{"Skill": "Animation development ADEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Systems development"}
92	DATM	19	17	1	SFIA	v1	{"Skill": "Data management DATM", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
93	DTAN	19	17	1	SFIA	v1	{"Skill": "Data modelling and design DTAN", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
94	DBDS	19	17	1	SFIA	v1	{"Skill": "Database design DBDS", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
95	DAAN	19	17	1	SFIA	v1	{"Skill": "Data analytics DAAN", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
96	DATS	19	17	1	SFIA	v1	{"Skill": "Data science DATS", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
97	MLNG	19	17	1	SFIA	v1	{"Skill": "Machine learning MLNG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
98	BINT	19	17	1	SFIA	v1	{"Skill": "Business intelligence BINT", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
99	DENG	19	17	1	SFIA	v1	{"Skill": "Data engineering DENG", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
100	VISL	19	17	1	SFIA	v1	{"Skill": "Data visualisation VISL", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Data and analytics"}
101	URCH	19	17	1	SFIA	v1	{"Skill": "User research URCH", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
102	CEXP	19	17	1	SFIA	v1	{"Skill": "Customer experience CEXP", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
103	ACIN	19	17	1	SFIA	v1	{"Skill": "Accessibility and inclusion ACIN", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
104	UNAN	19	17	1	SFIA	v1	{"Skill": "User experience analysis UNAN", "Levels": [2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "User centred design"}
105	HCEV	19	17	1	SFIA	v1	{"Skill": "User experience design HCEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
106	USEV	19	17	1	SFIA	v1	{"Skill": "User experience evaluation USEV", "Levels": [2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "User centred design"}
107	INCA	19	17	1	SFIA	v1	{"Skill": "Content design and authoring INCA", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Content management"}
108	ICPM	19	17	1	SFIA	v1	{"Skill": "Content publishing ICPM", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Development and implementation", "Subcatagory": "Content management"}
109	KNOW	19	17	1	SFIA	v1	{"Skill": "Knowledge management KNOW", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Content management"}
110	GRDN	19	17	1	SFIA	v1	{"Skill": "Graphic design GRDN", "Levels": [1, 2, 3, 4, 5], "Category": "Development and implementation", "Subcatagory": "Content management"}
111	SCMO	19	17	1	SFIA	v1	{"Skill": "Scientific modelling SCMO", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
112	NUAN	19	17	1	SFIA	v1	{"Skill": "Numerical analysis NUAN", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
113	HPCC	19	17	1	SFIA	v1	{"Skill": "High-performance computing HPCC", "Levels": [4, 5, 6, 7], "Category": "Development and implementation", "Subcatagory": "Computational science"}
114	ITMG	19	17	1	SFIA	v1	{"Skill": "Technology service management ITMG", "Levels": [5, 6, 7], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
115	ASUP	19	17	1	SFIA	v1	{"Skill": "Application support ASUP", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
116	ITOP	19	17	1	SFIA	v1	{"Skill": "Infrastructure operations ITOP", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
117	SYSP	19	17	1	SFIA	v1	{"Skill": "System software administration SYSP", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
118	NTAS	19	17	1	SFIA	v1	{"Skill": "Network support NTAS", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
119	HSIN	19	17	1	SFIA	v1	{"Skill": "Systems installation and removal HSIN", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
120	CFMG	19	17	1	SFIA	v1	{"Skill": "Configuration management CFMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
121	RELM	19	17	1	SFIA	v1	{"Skill": "Release management RELM", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
122	DEPL	19	17	1	SFIA	v1	{"Skill": "Deployment DEPL", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
123	STMG	19	17	1	SFIA	v1	{"Skill": "Storage management STMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
124	DCMA	19	17	1	SFIA	v1	{"Skill": "Facilities management DCMA", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Technology management"}
125	SLMO	19	17	1	SFIA	v1	{"Skill": "Service level management SLMO", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Delivery and operation", "Subcatagory": "Service management"}
126	SCMG	19	17	1	SFIA	v1	{"Skill": "Service catalogue management SCMG", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Service management"}
127	AVMT	19	17	1	SFIA	v1	{"Skill": "Availability management AVMT", "Levels": [3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
128	COPL	19	17	1	SFIA	v1	{"Skill": "Continuity management COPL", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
219	KSB K47	25	18	1	KSB	v1	{"K47": "Concepts and approaches to cyber security assurance."}
129	CPMG	19	17	1	SFIA	v1	{"Skill": "Capacity management CPMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
130	USUP	19	17	1	SFIA	v1	{"Skill": "Incident management USUP", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
131	PBMG	19	17	1	SFIA	v1	{"Skill": "Problem management PBMG", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Service management"}
132	CHMG	19	17	1	SFIA	v1	{"Skill": "Change control CHMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
133	ASMG	19	17	1	SFIA	v1	{"Skill": "Asset management ASMG", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
134	SEAC	19	17	1	SFIA	v1	{"Skill": "Service acceptance SEAC", "Levels": [3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Service management"}
135	IAMT	19	17	1	SFIA	v1	{"Skill": "Identity and access management IAMT", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
136	SCAD	19	17	1	SFIA	v1	{"Skill": "Security operations SCAD", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
137	VUAS	19	17	1	SFIA	v1	{"Skill": "Vulnerability assessment VUAS", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Security services"}
138	DGFS	19	17	1	SFIA	v1	{"Skill": "Digital forensics DGFS", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
139	CRIM	19	17	1	SFIA	v1	{"Skill": "Cybercrime investigation CRIM", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
140	OCOP	19	17	1	SFIA	v1	{"Skill": "Offensive cyber operations OCOP", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
141	PENT	19	17	1	SFIA	v1	{"Skill": "Penetration testing PENT", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Security services"}
142	RMGT	19	17	1	SFIA	v1	{"Skill": "Records management RMGT", "Levels": [1, 2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
143	ANCC	19	17	1	SFIA	v1	{"Skill": "Analytical classification and coding ANCC", "Levels": [2, 3, 4, 5, 6], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
144	DBAD	19	17	1	SFIA	v1	{"Skill": "Database administration DBAD", "Levels": [2, 3, 4, 5], "Category": "Delivery and operation", "Subcatagory": "Data and records operations"}
145	PEMT	19	17	1	SFIA	v1	{"Skill": "Performance management PEMT", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
146	EEXP	19	17	1	SFIA	v1	{"Skill": "Employee experience EEXP", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
147	OFCL	19	17	1	SFIA	v1	{"Skill": "Organisational facilitation OFCL", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
148	PDSV	19	17	1	SFIA	v1	{"Skill": "Professional development PDSV", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
149	WFPL	19	17	1	SFIA	v1	{"Skill": "Workforce planning WFPL", "Levels": [4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
150	RESC	19	17	1	SFIA	v1	{"Skill": "Resourcing RESC", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "People management"}
151	ETMG	19	17	1	SFIA	v1	{"Skill": "Learning and development management ETMG", "Levels": [2, 3, 4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
152	TMCR	19	17	1	SFIA	v1	{"Skill": "Learning design and development TMCR", "Levels": [2, 3, 4, 5], "Category": "People and skills", "Subcatagory": "Skills management"}
153	ETDL	19	17	1	SFIA	v1	{"Skill": "Learning delivery ETDL", "Levels": [2, 3, 4, 5], "Category": "People and skills", "Subcatagory": "Skills management"}
154	LEDA	19	17	1	SFIA	v1	{"Skill": "Competency assessment LEDA", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "Skills management"}
155	CSOP	19	17	1	SFIA	v1	{"Skill": "Certification scheme operation CSOP", "Levels": [2, 3, 4, 5, 6], "Category": "People and skills", "Subcatagory": "Skills management"}
156	TEAC	19	17	1	SFIA	v1	{"Skill": "Teaching TEAC", "Levels": [2, 3, 4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
157	SUBF	19	17	1	SFIA	v1	{"Skill": "Subject formation SUBF", "Levels": [4, 5, 6, 7], "Category": "People and skills", "Subcatagory": "Skills management"}
158	SORC	19	17	1	SFIA	v1	{"Skill": "Sourcing SORC", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
159	SUPP	19	17	1	SFIA	v1	{"Skill": "Supplier management SUPP", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
160	ITCM	19	17	1	SFIA	v1	{"Skill": "Contract management ITCM", "Levels": [2, 3, 4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
161	RLMT	19	17	1	SFIA	v1	{"Skill": "Stakeholder relationship management RLMT", "Levels": [4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
162	CSMG	19	17	1	SFIA	v1	{"Skill": "Customer service support CSMG", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
163	ADMN	19	17	1	SFIA	v1	{"Skill": "Business administration ADMN", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Stakeholder management"}
164	BIDM	19	17	1	SFIA	v1	{"Skill": "Bid/proposal management BIDM", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
165	SALE	19	17	1	SFIA	v1	{"Skill": "Selling SALE", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
166	SSUP	19	17	1	SFIA	v1	{"Skill": "Sales support SSUP", "Levels": [1, 2, 3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Sales and bid management"}
167	MKTG	19	17	1	SFIA	v1	{"Skill": "Marketing management MKTG", "Levels": [4, 5, 6, 7], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
168	MRCH	19	17	1	SFIA	v1	{"Skill": "Market research MRCH", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
169	BRMG	19	17	1	SFIA	v1	{"Skill": "Brand management BRMG", "Levels": [4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
170	CELO	19	17	1	SFIA	v1	{"Skill": "Customer engagement and loyalty CELO", "Levels": [3, 4, 5, 6], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
171	MKCM	19	17	1	SFIA	v1	{"Skill": "Marketing campaign management MKCM", "Levels": [3, 4, 5], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
172	DIGM	19	17	1	SFIA	v1	{"Skill": "Digital marketing DIGM", "Levels": [2, 3, 4, 5], "Category": "Relationships and engagement", "Subcatagory": "Marketing"}
175	KSB K3	25	18	1	KSB	v1	{"K3": "Principles of estimating the risks and opportunities of digital and technology solutions."}
176	KSB K4	25	18	1	KSB	v1	{"K4": "Techniques and approaches involved in creating a business case for new digital and technology solutions. For example journey, product and capability mapping and value chains."}
177	KSB K5	25	18	1	KSB	v1	{"K5": "A range of digital technology solution development techniques and tools."}
178	KSB K6	25	18	1	KSB	v1	{"K6": "The approaches and techniques used throughout the digital and technology solution lifecycle and their applicability to an organisation’s standards and pre-existing tools."}
179	KSB K7	25	18	1	KSB	v1	{"K7": "The roles, functions and activities within digital technology solutions within an organisation."}
180	KSB K8	25	18	1	KSB	v1	{"K8": "How teams work effectively to produce digital and technology solutions."}
181	KSB K9	25	18	1	KSB	v1	{"K9": "The concepts and principles of leadership."}
295	KSB S55	25	18	1	KSB	v1	{"S55": "Analyse in detail large data sets, using a range of industry standard tools and data analysis methods."}
183	KSB K11	25	18	1	KSB	v1	{"K11": "The nature and scope of common vulnerabilities in digital and technology solutions. For example, the risks of unsecure coding and unprotected networks. Back to Duty"}
184	KSB K12	25	18	1	KSB	v1	{"K12": "The role of data management systems within Digital and Technology Solutions."}
185	KSB K13	25	18	1	KSB	v1	{"K13": "Principles of data analysis for digital and technology solutions."}
186	KSB K14	25	18	1	KSB	v1	{"K14": "A range of quantitative and qualitative data gathering methods and how to appraise and select the appropriate method."}
187	KSB K15	25	18	1	KSB	v1	{"K15": "Principles of estimating cost, and time resource constraints within digital and technology solutions activities."}
189	KSB K17	25	18	1	KSB	v1	{"K17": "Reporting techniques, including how to synthesise information and present concisely, as appropriate to the target audience."}
190	KSB K18	25	18	1	KSB	v1	{"K18": "Techniques of robust research and evaluation for the justification of digital and technology solutions."}
191	KSB K19	25	18	1	KSB	v1	{"K19": "Relevant legal, ethical, social and professional standards to a digital and technology solution. For example, Diversity, Accessibility, Intellectual Property, Data Protection Acts, Codes of Practice, Regulatory and Compliance frameworks."}
192	KSB K20	25	18	1	KSB	v1	{"K20": "Sustainable development approaches as applied to digital and technology solutions such as green computing."}
193	KSB K21	25	18	1	KSB	v1	{"K21": "How to operate at all stages of the software development life cycle and how each stage is applied in a range of contexts. For example, requirements analysis, design, development, testing, implementation."}
194	KSB K22	25	18	1	KSB	v1	{"K22": "Principles of a range of development techniques, for each stage of the software development cycle that produce artefacts and the contexts in which they can be applied. For example UML, unit testing, programming, debugging, frameworks, architectures."}
195	KSB K23	25	18	1	KSB	v1	{"K23": "Principles of a range of development methods and approaches and the contexts in which they can be applied. For example Scrum, Extreme Programming, Waterfall, Prince2, TDD."}
196	KSB K24	25	18	1	KSB	v1	{"K24": "How to interpret and implement a design, compliant with functional, non-functional and security requirements including principles and approaches to addressing legacy software development issues from a technical and socio-technical perspective. For example architectures, languages, operating systems, hardware, business change."}
197	KSB K25	25	18	1	KSB	v1	{"K25": "The factors affecting product quality and approaches for how to control them throughout the development process. For example security, code quality, coding standards."}
198	KSB K26	25	18	1	KSB	v1	{"K26": "How to select and apply a range of software tools used in Software Engineering."}
199	KSB K27	25	18	1	KSB	v1	{"K27": "Approaches to the interpretation and use of artefacts. For example UML, unit tests, architecture."}
200	KSB K28	25	18	1	KSB	v1	{"K28": "Approaches to effective team work and the range of software development tools supporting effective teamwork. For example, configuration management, version control and release management."}
201	KSB K29	25	18	1	KSB	v1	{"K29": "Principles of different consulting methodologies. For example issue-based, and hypothesis based."}
202	KSB K30	25	18	1	KSB	v1	{"K30": "How consulting interfaces with project management, business analysis and business management."}
203	KSB K31	25	18	1	KSB	v1	{"K31": "Principles of change management within organisations."}
204	KSB K32	25	18	1	KSB	v1	{"K32": "The barriers to solving digital and technology problems or maximising opportunities."}
205	KSB K33	25	18	1	KSB	v1	{"K33": "Approaches to presenting recommendations to stakeholders and influencing action."}
206	KSB K34	25	18	1	KSB	v1	{"K34": "Approaches to analytical and critical thinking to define business problems objectively and create value for the client."}
207	KSB K35	25	18	1	KSB	v1	{"K35": "Questioning strategies and active listening to ensure all requirements are gathered."}
208	KSB K36	25	18	1	KSB	v1	{"K36": "The ethical and legal requirements in client and provider relationships."}
209	KSB K37	25	18	1	KSB	v1	{"K37": "Elicitation and Collaboration approaches, including how to prepare for and conduct elicitation activities and confirm the results."}
210	KSB K38	25	18	1	KSB	v1	{"K38": "Approaches to Requirements Life Cycle Management including how to manage and maintain requirements and design information from inception to retirement of a product."}
211	KSB K39	25	18	1	KSB	v1	{"K39": "Principles of Strategy Analysis, including how to identify the business need, address that need, and align the change strategy within the organisation."}
212	KSB K40	25	18	1	KSB	v1	{"K40": "Solution Evaluation, including how to assess the performance of and value delivered by a solution and to recommend improvements on increasing values."}
213	KSB K41	25	18	1	KSB	v1	{"K41": "Legislation and industry standards relevant to Business Analysis in the organisation and sector."}
214	KSB K42	25	18	1	KSB	v1	{"K42": "The purpose and value of quality assurance techniques."}
215	KSB K43	25	18	1	KSB	v1	{"K43": "A range of Business Analysis investigative techniques."}
216	KSB K44	25	18	1	KSB	v1	{"K44": "Approaches to change control and requirements management."}
217	KSB K45	25	18	1	KSB	v1	{"K45": "Principles of cyber security tools and techniques."}
218	KSB K46	25	18	1	KSB	v1	{"K46": "Principles of quantitative and qualitative risk management theory including the role of risk stakeholders."}
230	KSB K58	25	18	1	KSB	v1	{"K58": "How Data Analytics operates within the context of data governance, data security, and communications."}
231	KSB K59	25	18	1	KSB	v1	{"K59": "How Data Analytics can be applied to improve an organisation’s processes, operations and outputs."}
232	KSB K60	25	18	1	KSB	v1	{"K60": "How data and analysis may exhibit biases and prejudice. How ethics and compliance affect Data Analytics work, and the impact of international regulations. For example, General Data Protection Regulation, Data Protection Act 2018."}
233	KSB K61	25	18	1	KSB	v1	{"K61": "The role and function of virtual or physical network components and functions and typical topologies and service architectures."}
234	KSB K62	25	18	1	KSB	v1	{"K62": "The main network protocols in use, their purpose, features and relationship to each other. For example, Ethernet, IP (Internet Protocol), TCP (Transmission Control Protocol), OSPF (Open Shortest Path First)."}
235	KSB K63	25	18	1	KSB	v1	{"K63": "The benefits and risks of cloud computing and the common integration deployments (private, public, hybrid). Including the benefits and risks of virtualisation as a concept; key features of virtualisation and current cloud platforms available."}
237	KSB K65	25	18	1	KSB	v1	{"K65": "Principles of failure modes in protocols. For example, why a protocol may ‘hang’ and the effect of data communication errors and approaches to addressing failures to optimise network performance."}
238	KSB K66	25	18	1	KSB	v1	{"K66": "Key security concepts. For example threats, vulnerabilities, exploits, detection and mitigation techniques, and security program elements such as user awareness, physical access control, multi-layer defence models."}
239	KSB K67	25	18	1	KSB	v1	{"K67": "SDN (Software Defined Networking) and Network Function Virtualisation Core Principles. For example, Control Plane Separation, flexibility, overlay networks, disassociation of software and hardware layers."}
240	KSB K68	25	18	1	KSB	v1	{"K68": "Key elements of mobile networks. For example RAN (Radio Access Network), EPC (Evolved Packet Core), IMS (IP Multimedia Subsystem) including some specific key functions such as S/P/U-Gateways and the concepts in communicating over free-space media such as interference, ground bounce, encryption and in mobile endpoint platforms such as tracking user location and roaming."}
241	KSB S1	25	18	1	KSB	v1	{"S1": "Analyse a business problem to identify the role of digital and technology solutions."}
242	KSB S2	25	18	1	KSB	v1	{"S2": "Identify risks, determine mitigation strategies and opportunities for improvement in a digital and technology solutions project."}
243	KSB S3	25	18	1	KSB	v1	{"S3": "Analyse a business problem in order to specify an appropriate digital and technology solution."}
244	KSB S4	25	18	1	KSB	v1	{"S4": "Initiate, design, code, test and debug a software component for a digital and technology solution."}
245	KSB S5	25	18	1	KSB	v1	{"S5": "Apply relevant standard processes, methods, techniques and tools. For example, ISO Standards, Waterfall, Agile in a digital and technology solution project."}
246	KSB S6	25	18	1	KSB	v1	{"S6": "Manage digital and technology solutions projects. For example, identifying and resolving deviations from specification, applying appropriate Project Management methodologies."}
247	KSB S7	25	18	1	KSB	v1	{"S7": "Work effectively within teams, leading on appropriate digital technology solution activities."}
248	KSB S8	25	18	1	KSB	v1	{"S8": "Apply relevant organisational theories. For example, change management principles, marketing approaches, strategic practice, and IT service management to a digital and technology solutions project."}
249	KSB S9	25	18	1	KSB	v1	{"S9": "Apply relevant security and resilience techniques to a digital and technology solution. For example, risk assessments, mitigation strategies."}
250	KSB S10	25	18	1	KSB	v1	{"S10": "Initiate, design, implement and debug a data product for a digital and technology solution."}
251	KSB S11	25	18	1	KSB	v1	{"S11": "Determine and use appropriate data analysis techniques. For example, Text, Statistical, Diagnostic or Predictive Analysis to assess a digital and technology solutions."}
252	KSB S12	25	18	1	KSB	v1	{"S12": "Plan, design and manage simple computer networks with an overall focus on the services and capabilities that network infrastructure solutions enable in an organisational context."}
253	KSB S13	25	18	1	KSB	v1	{"S13": "Report effectively to colleagues and stakeholders using the appropriate language and style, to meet the needs of the audience concerned."}
254	KSB S14	25	18	1	KSB	v1	{"S14": "Research, investigate, and evaluate innovative technologies or approaches in the development of a digital and technology solution."}
255	KSB S15	25	18	1	KSB	v1	{"S15": "Apply relevant legal, ethical, social and professional standards to a digital and technology solution."}
256	KSB S16	25	18	1	KSB	v1	{"S16": "Identify and define software engineering problems that are non-routine and incompletely specified."}
257	KSB S17	25	18	1	KSB	v1	{"S17": "Provide recommendations as to the most appropriate software engineering solution."}
258	KSB S18	25	18	1	KSB	v1	{"S18": "Use appropriate analysis methods, approaches and techniques in software engineering projects to deliver an outcome that meets requirements."}
259	KSB S19	25	18	1	KSB	v1	{"S19": "Implement software engineering projects using appropriate software engineering methods, approaches and techniques."}
296	KSB S56	25	18	1	KSB	v1	{"S56": "Identify and collate stakeholder needs in relation to computer network requirements, plans and designs."}
261	KSB S21	25	18	1	KSB	v1	{"S21": "Determine, refine, adapt and use appropriate software engineering methods, approaches and techniques to evaluate software engineering project outcomes."}
262	KSB S22	25	18	1	KSB	v1	{"S22": "Evaluate learning points arising from software engineering work undertaken on a project including use of methods, analysis undertaken, selection of approach and the outcome achieved, in order to identify both lessons learnt and recommendations for improvements to future projects."}
263	KSB S23	25	18	1	KSB	v1	{"S23": "Extend and update software development knowledge with evidence from professional and academic sources by undertaking appropriate research to inform best practice and lead improvements in the organisation."}
264	KSB S24	25	18	1	KSB	v1	{"S24": "Analyse client needs and determine how to advise them strategically through improved business processes, new ideas, or technology solutions."}
265	KSB S25	25	18	1	KSB	v1	{"S25": "Effectively communicate value add to the client through a variety of media. For example, presentations, written reports, Storytelling in a professional setting through performing socio-technical process improvements in a range of environments."}
266	KSB S26	25	18	1	KSB	v1	{"S26": "Make evidence based recommendations taking into account risks, costs, and benefits."}
267	KSB S27	25	18	1	KSB	v1	{"S27": "Participate in walk-throughs for Information Technologies, to identify, document and evaluate key risks within a client’s organisation."}
268	KSB S28	25	18	1	KSB	v1	{"S28": "Perform stakeholder analysis to identify, determine and deepen understanding of system requirements and develop client relationships."}
269	KSB S29	25	18	1	KSB	v1	{"S29": "Effect change within an organisation through evaluation of a new system, process or initiative."}
270	KSB S30	25	18	1	KSB	v1	{"S30": "Ensure legal and ethical requirements are accommodated in the development of digital and technology solutions."}
271	KSB S31	25	18	1	KSB	v1	{"S31": "Evaluate the success of new systems, processes, or initiatives."}
272	KSB S32	25	18	1	KSB	v1	{"S32": "Use requirements elicitation, analysis and documentation to produce an acceptable solution for business problems or further opportunities."}
273	KSB S33	25	18	1	KSB	v1	{"S33": "Conduct Process Analysis, Definition, Mapping and Modelling within a business situation without supervision."}
274	KSB S34	25	18	1	KSB	v1	{"S34": "Produce Use Cases which are of value to all stakeholders of a system."}
275	KSB S35	25	18	1	KSB	v1	{"S35": "Use tools and benchmarking to support modelling and requirements gathering and recommend approaches to team members as required."}
276	KSB S36	25	18	1	KSB	v1	{"S36": "Produce a business case to scope a proposed project including business benefits and recommendations."}
277	KSB S37	25	18	1	KSB	v1	{"S37": "Use products of analysis in the design and development of a system."}
278	KSB S38	25	18	1	KSB	v1	{"S38": "Evaluate the impacts of model selection and how they inter-relate with each other when generating business analytics."}
279	KSB S39	25	18	1	KSB	v1	{"S39": "Recommend and use appropriate software tools to implement Business Analysis tasks and outcomes."}
280	KSB S40	25	18	1	KSB	v1	{"S40": "Discover, identify and analyse security threats, attack techniques and vulnerabilities and recommend mitigation and security controls."}
281	KSB S41	25	18	1	KSB	v1	{"S41": "Undertake security risk assessments for complex systems without direct supervision and propose a remediation strategy relevant to the context of the organisation."}
282	KSB S42	25	18	1	KSB	v1	{"S42": "Recommend improvements to the cyber security approaches of an organisation based on research into future potential cyber threats and considering threat trends."}
283	KSB S43	25	18	1	KSB	v1	{"S43": "Manage cyber security risk."}
284	KSB S44	25	18	1	KSB	v1	{"S44": "Use appropriate cyber security technology, tools and techniques in relation to the risks identified."}
285	KSB S45	25	18	1	KSB	v1	{"S45": "Lead cyber security awareness campaigns and evaluate their effectiveness."}
286	KSB S46	25	18	1	KSB	v1	{"S46": "Analyse cyber security requirements against other design requirements for systems or products, identify conflicting requirements and recommend appropriate solutions with clear explanation of costs and benefits."}
287	KSB S47	25	18	1	KSB	v1	{"S47": "Lead the design and build of systems in accordance with a security case to address organisational challenges."}
288	KSB S48	25	18	1	KSB	v1	{"S48": "Define Data Requirements and perform Data Collection, Data Processing and Data Cleansing."}
289	KSB S49	25	18	1	KSB	v1	{"S49": "Apply different types of Data Analysis, as appropriate, to drive improvements for specific business problems."}
291	KSB S51	25	18	1	KSB	v1	{"S51": "Identify barriers to effective analysis encountered both by analysts and their stakeholders within data analysis projects."}
292	KSB S52	25	18	1	KSB	v1	{"S52": "Apply a range of techniques for analysing quantitative data such as data mining, time series forecasting, algorithms, statistics and modelling techniques to identify and predict trends and patterns in data."}
293	KSB S53	25	18	1	KSB	v1	{"S53": "Apply exploratory or confirmatory approaches to analysing data. Validate and and test stability of the results."}
294	KSB S54	25	18	1	KSB	v1	{"S54": "Extract data from a range of sources. For example, databases, web services, open data."}
220	KSB K48	25	18	1	KSB	v1	{"K48": "Key legislative frameworks and the regulatory landscape for cyber security including Data Protection Act 2018 , Network Information System Directive 2018, Regulation of Investigatory Powers Act 2000, ISO 27001."}
228	KSB K56	25	18	1	KSB	v1	{"K56": "Sources of data such as files, operational systems, databases, web services, open data, government data, news and social media."}
173	KSB K1	25	18	1	KSB	v1	{"K1": "How organisations adapt and exploit digital technology solutions to gain a competitive advantage."}
174	KSB K2	25	18	1	KSB	v1	{"K2": "The principles of strategic decision making concerning the acquisition or development of digital and technology solutions. For example business architecture approaches such as capability models and target operating models."}
182	KSB K10	25	18	1	KSB	v1	{"K10": "Management techniques and theories. For example, effective decision making, delegation and planning methods, time management and change management."}
188	KSB K16	25	18	1	KSB	v1	{"K16": "Fundamental computer networking concepts in relation to digital and technology solutions. For example, structure, cloud architecture, components, quality of service."}
229	KSB K57	25	18	1	KSB	v1	{"K57": "Approaches to data processing and storage, database systems, data warehousing and online analytical processing, data-driven decision making and the good use of evidence and analytics in making choices and decisions."}
236	KSB K64	25	18	1	KSB	v1	{"K64": "The main factors that affect network performance, and how to mitigate these on network performance by implementing changes to QoS. For example, Traffic Shaping, Policing, Queuing, Topology (physical and logical), and Network Policy (Traffic Analysis, DPI (Deep Packet Inspection)."}
260	KSB S20	25	18	1	KSB	v1	{"S20": "Respond to changing priorities and problems arising within software engineering projects by making revised recommendations, and adapting plans as necessary, to fit the scenario being investigated."}
290	KSB S50	25	18	1	KSB	v1	{"S50": "Find, present, communicate and disseminate data analysis outputs effectively and with high impact through creative storytelling, tailoring the message for the audience. Visualise data to tell compelling and actionable narratives by using the best medium for each audience, such as charts, graphs and dashboards."}
297	KSB S57	25	18	1	KSB	v1	{"S57": "Plan, design, document, and develop the relevant elements of a computer network within an organisation or between organisations, taking into account customer requirements (performance, scale), constraints (budget, equipment availability), and define policies for their use."}
298	KSB S58	25	18	1	KSB	v1	{"S58": "Monitor performance and ensure networks are configured correctly and perform as expected by designers or architects. Undertake capacity management and audit of IP addressing and hosted devices."}
299	KSB S59	25	18	1	KSB	v1	{"S59": "Investigate, troubleshoot and resolve data network faults in local and wide area environments, using information from multiple sources, Physically or Remotely by console connection. Recommend and implement short term fixes to restore service and, or, quality of experience and recommend longer term changes to prevent recurrence or reduce impact of future occurrences."}
300	KSB S60	25	18	1	KSB	v1	{"S60": "Implement computer networks from a design including testing and validation. This includes populating variables in configurations, for example, IP addresses and subsequent application of configuration to equipment such as routers, switches, firewalls."}
301	KSB S61	25	18	1	KSB	v1	{"S61": "Secure network systems by establishing and enforcing policies, and defining and monitoring access. Support and administer firewall environments in line with IT security policy."}
302	KSB S62	25	18	1	KSB	v1	{"S62": "Research and evaluate emerging network technologies and assess relevance to current network requirements. Provide an objective opinion on how new features and technologies may be incorporated as required by the organisation."}
303	KSB S63	25	18	1	KSB	v1	{"S63": "Investigate security concerns or attacks. For example, Distributed Denial of Service (DDOS), port scanning, assessing key metrics and indicators, evidencing the chosen steps to mitigate."}
304	KSB B1	25	18	1	KSB	v1	{"B1": "Has a strong work ethic and commitment in order to meet the standards required."}
305	KSB B2	25	18	1	KSB	v1	{"B2": "Reliable, objective and capable of both independent and team working."}
306	KSB B3	25	18	1	KSB	v1	{"B3": "Acts with integrity with respect to ethical, legal and regulatory requirements ensuring the protection of personal data, safety and security."}
307	KSB B4	25	18	1	KSB	v1	{"B4": "Commits to continuous professional development; maintaining their knowledge and skills in relation to developments in digital and technology solutions that influence their work."}
308	KSB B5	25	18	1	KSB	v1	{"B5": "Interacts professionally with people from technical and non-technical backgrounds. Presents data and conclusions in an evidently truthful, concise and appropriate manner."}
309	KSB B6	25	18	1	KSB	v1	{"B6": "Participates in and shares best practice in their organisation, and the wider community for aspects relevant to digital and technology solutions."}
310	KSB B7	25	18	1	KSB	v1	{"B7": "Maintains awareness of trends and innovations in the subject area, utilising a range of academic literature, online sources, community interaction, conference attendance and other methods which can deliver business value."}
311	KSB B8	25	18	1	KSB	v1	{"B8": "Champions diversity and inclusion in their work ensuring that digital technology solutions are accessible."}
312	Requirements Elicitation	22	20	1	Leonardo	v1	{"Technique": "Requirements Elicitation"}
313	Timing/Scheduling Analysis	22	20	1	Leonardo	v1	{"Technique": "Timing/Scheduling Analysis"}
314	Network Analysis	22	20	1	Leonardo	v1	{"Technique": "Network Analysis"}
315	Modelling & Synthetic Environment	22	20	1	Leonardo	v1	{"Technique": "Modelling & Synthetic Environment"}
316	Static Analysis	22	20	1	Leonardo	v1	{"Technique": "Static Analysis"}
317	Peer Review	22	20	1	Leonardo	v1	{"Technique": "Peer Review"}
318	Measurement, Inspection & Test	22	20	1	Leonardo	v1	{"Technique": "Measurement, Inspection & Test"}
319	Value Management	22	20	1	Leonardo	v1	{"Technique": "Value Management"}
320	Design Review	22	20	1	Leonardo	v1	{"Technique": "Design Review"}
321	FMEA	22	20	1	Leonardo	v1	{"Technique": "FMEA"}
322	Prototyping	22	20	1	Leonardo	v1	{"Technique": "Prototyping"}
323	Problem Investigation/Debug	22	20	1	Leonardo	v1	{"Technique": "Problem Investigation/Debug"}
324	Robotics	22	20	1	Leonardo	v1	{"Technique": "Robotics"}
325	Digital Signal Processing	22	20	1	Leonardo	v1	{"Technique": "Digital Signal Processing"}
326	Data Modelling	22	20	1	Leonardo	v1	{"Technique": "Data Modelling"}
327	Customer/Stakeholder Interaction	22	20	1	Leonardo	v1	{"Technique": "Customer/Stakeholder Interaction"}
328	Software Lifecycle	22	20	1	Leonardo	v1	{"Technique": "Software Lifecycle"}
329	Integration of Software Elements	22	20	1	Leonardo	v1	{"Technique": "Integration of Software Elements"}
330	Unit Test	22	20	1	Leonardo	v1	{"Technique": "Unit Test"}
331	Module Test	22	20	1	Leonardo	v1	{"Technique": "Module Test"}
332	Integration Test (SIL)	22	20	1	Leonardo	v1	{"Technique": "Integration Test (SIL)"}
333	System Integration Test	22	20	1	Leonardo	v1	{"Technique": "System Integration Test"}
334	Containerisation	22	20	1	Leonardo	v1	{"Technique": "Containerisation"}
335	Ontological Definition	22	20	1	Leonardo	v1	{"Technique": "Ontological Definition"}
336	Integration Test (HIL)	22	20	1	Leonardo	v1	{"Technique": "Integration Test (HIL)"}
337	Component Functional Test	22	20	1	Leonardo	v1	{"Technique": "Component Functional Test"}
338	UML	23	24	1	Leonardo	v1	{"Technology": "UML"}
339	Ladder Logic	23	24	1	Leonardo	v1	{"Technology": "Ladder Logic"}
340	C	23	24	1	Leonardo	v1	{"Technology": "C"}
341	C++	23	24	1	Leonardo	v1	{"Technology": "C++"}
342	C#	23	24	1	Leonardo	v1	{"Technology": "C#"}
343	LCA	23	24	1	Leonardo	v1	{"Technology": "LCA"}
344	LSAF	23	24	1	Leonardo	v1	{"Technology": "LSAF"}
345	Javascript	23	24	1	Leonardo	v1	{"Technology": "Javascript"}
346	PICs	23	24	1	Leonardo	v1	{"Technology": "PICs"}
347	Object Pascal/Pascal	23	24	1	Leonardo	v1	{"Technology": "Object Pascal/Pascal"}
348	Linux	23	24	1	Leonardo	v1	{"Technology": "Linux"}
349	Windows	23	24	1	Leonardo	v1	{"Technology": "Windows"}
350	Java	23	24	1	Leonardo	v1	{"Technology": "Java"}
351	ARM	23	24	1	Leonardo	v1	{"Technology": "ARM"}
352	Microblaze	23	24	1	Leonardo	v1	{"Technology": "Microblaze"}
353	Relational Database	23	24	1	Leonardo	v1	{"Technology": "Relational Database"}
354	DEV-OPS	23	24	1	Leonardo	v1	{"Technology": "DEV-OPS"}
355	Oracle	23	24	1	Leonardo	v1	{"Technology": "Oracle"}
356	Graph Database	23	24	1	Leonardo	v1	{"Technology": "Graph Database"}
357	Assembler	23	24	1	Leonardo	v1	{"Technology": "Assembler"}
358	Python	23	24	1	Leonardo	v1	{"Technology": "Python"}
359	Raspberry Pi	23	24	1	Leonardo	v1	{"Technology": "Raspberry Pi"}
360	Docker	23	24	1	Leonardo	v1	{"Technology": "Docker"}
361	TCP	23	24	1	Leonardo	v1	{"Technology": "TCP"}
362	UDP	23	24	1	Leonardo	v1	{"Technology": "UDP"}
363	8D	23	24	1	Leonardo	v1	{"Technology": "8D"}
364	5 Whys	23	24	1	Leonardo	v1	{"Technology": "5 Whys"}
365	Break/Test Point	23	24	1	Leonardo	v1	{"Technology": "Break/Test Point"}
366	Fishbone	23	24	1	Leonardo	v1	{"Technology": "Fishbone"}
367	Generic Vehicle Architecture (GVA)	23	24	1	Leonardo	v1	{"Technology": "Generic Vehicle Architecture (GVA)"}
368	00-82	23	24	1	Leonardo	v1	{"Technology": "00-82"}
369	Land CEMA Architecture(LCA)	23	24	1	Leonardo	v1	{"Technology": "Land CEMA Architecture(LCA)"}
370	Ada	23	24	1	Leonardo	v1	{"Technology": "Ada"}
371	80x86/Intel	23	24	1	Leonardo	v1	{"Technology": "80x86/Intel"}
372	Matlab/Simulink (Code Gen)	23	24	1	Leonardo	v1	{"Technology": "Matlab/Simulink (Code Gen)"}
373	OPCUA	23	24	1	Leonardo	v1	{"Technology": "OPCUA"}
374	1553	23	24	1	Leonardo	v1	{"Technology": "1553"}
375	ARINC 429	23	24	1	Leonardo	v1	{"Technology": "ARINC 429"}
376	FireWire	23	24	1	Leonardo	v1	{"Technology": "FireWire"}
377	FTP	23	24	1	Leonardo	v1	{"Technology": "FTP"}
378	RTP	23	24	1	Leonardo	v1	{"Technology": "RTP"}
379	Modem	23	24	1	Leonardo	v1	{"Technology": "Modem"}
380	Global Navigation Systems (GNSS)	23	24	1	Leonardo	v1	{"Technology": "Global Navigation Systems (GNSS)"}
381	Celular Technologies	23	24	1	Leonardo	v1	{"Technology": "Celular Technologies"}
382	OpenCPI	23	24	1	Leonardo	v1	{"Technology": "OpenCPI"}
383	Z80	23	24	1	Leonardo	v1	{"Technology": "Z80"}
384	Vx Works	23	24	1	Leonardo	v1	{"Technology": "Vx Works"}
385	Free RTOS	23	24	1	Leonardo	v1	{"Technology": "Free RTOS"}
386	Time Sensitive Networking (TSN)	23	24	1	Leonardo	v1	{"Technology": "Time Sensitive Networking (TSN)"}
387	Data Distribution Service (DDS)	23	24	1	Leonardo	v1	{"Technology": "Data Distribution Service (DDS)"}
388	Message Queueing Teleetry Transport (MQTT)	23	24	1	Leonardo	v1	{"Technology": "Message Queueing Teleetry Transport (MQTT)"}
389	Textual Definition	23	24	1	Leonardo	v1	{"Technology": "Textual Definition"}
390	Use Case Definition	23	24	1	Leonardo	v1	{"Technology": "Use Case Definition"}
391	Model Based Requirement	23	24	1	Leonardo	v1	{"Technology": "Model Based Requirement"}
392	RS422	23	24	1	Leonardo	v1	{"Technology": "RS422"}
393	SPI	23	24	1	Leonardo	v1	{"Technology": "SPI"}
394	SysML	23	24	1	Leonardo	v1	{"Technology": "SysML"}
395	RS232	23	24	1	Leonardo	v1	{"Technology": "RS232"}
396	RS485	23	24	1	Leonardo	v1	{"Technology": "RS485"}
397	One Wire Serial	23	24	1	Leonardo	v1	{"Technology": "One Wire Serial"}
398	Xilinx Vivado	23	24	1	Leonardo	v1	{"Technology": "Xilinx Vivado"}
399	Xilinx SDK/Vitis	23	24	1	Leonardo	v1	{"Technology": "Xilinx SDK/Vitis"}
400	VHDL	23	24	1	Leonardo	v1	{"Technology": "VHDL"}
401	Virtual Battlefield Simulation (VBS)	23	24	1	Leonardo	v1	{"Technology": "Virtual Battlefield Simulation (VBS)"}
402	Visual Studio	24	28	1	Leonardo	v1	{"Tool": "Visual Studio"}
403	Rhapsody	24	28	1	Leonardo	v1	{"Tool": "Rhapsody"}
404	Dimentions	24	28	1	Leonardo	v1	{"Tool": "Dimentions"}
405	Wireshark	24	28	1	Leonardo	v1	{"Tool": "Wireshark"}
406	Rational Rose	24	28	1	Leonardo	v1	{"Tool": "Rational Rose"}
407	Rational Rose RT	24	28	1	Leonardo	v1	{"Tool": "Rational Rose RT"}
408	GIT	24	28	1	Leonardo	v1	{"Tool": "GIT"}
409	Microsft Azure DevOps	24	28	1	Leonardo	v1	{"Tool": "Microsft Azure DevOps"}
410	System Composer	24	28	1	Leonardo	v1	{"Tool": "System Composer"}
411	OpenCaesar	24	28	1	Leonardo	v1	{"Tool": "OpenCaesar"}
412	Docker	24	28	1	Leonardo	v1	{"Tool": "Docker"}
413	Virtual Box	24	28	1	Leonardo	v1	{"Tool": "Virtual Box"}
414	Cameo Systems Modeller/Magic Draw	24	28	1	Leonardo	v1	{"Tool": "Cameo Systems Modeller/Magic Draw"}
415	Atlassion Stack	24	28	1	Leonardo	v1	{"Tool": "Atlassion Stack"}
416	Artifactory	24	28	1	Leonardo	v1	{"Tool": "Artifactory"}
417	TCU	24	28	1	Leonardo	v1	{"Tool": "TCU"}
418	SAP	24	28	1	Leonardo	v1	{"Tool": "SAP"}
419	Microsoft Project	24	28	1	Leonardo	v1	{"Tool": "Microsoft Project"}
420	Excel	24	28	1	Leonardo	v1	{"Tool": "Excel"}
421	Word	24	28	1	Leonardo	v1	{"Tool": "Word"}
422	Viseo	24	28	1	Leonardo	v1	{"Tool": "Viseo"}
423	Draw.io	24	28	1	Leonardo	v1	{"Tool": "Draw.io"}
424	DOORS	24	28	1	Leonardo	v1	{"Tool": "DOORS"}
425	PlantUML	24	28	1	Leonardo	v1	{"Tool": "PlantUML"}
426	Delphi	24	28	1	Leonardo	v1	{"Tool": "Delphi"}
427	Rhapsody Test	24	28	1	Leonardo	v1	{"Tool": "Rhapsody Test"}
428	Rhapsody Requirements Management	24	28	1	Leonardo	v1	{"Tool": "Rhapsody Requirements Management"}
429	WinRiver Workbench	24	28	1	Leonardo	v1	{"Tool": "WinRiver Workbench"}
430	Polyspace	24	28	1	Leonardo	v1	{"Tool": "Polyspace"}
431	CMAKE	24	28	1	Leonardo	v1	{"Tool": "CMAKE"}
432	RTI DDS Professional	24	28	1	Leonardo	v1	{"Tool": "RTI DDS Professional"}
433	Catch2	24	28	1	Leonardo	v1	{"Tool": "Catch2"}
434	Rhapsody Test Conductor	24	28	1	Leonardo	v1	{"Tool": "Rhapsody Test Conductor"}
435	Rhapsody Gateway add-on	24	28	1	Leonardo	v1	{"Tool": "Rhapsody Gateway add-on"}
436	Rhapsody Commandline	24	28	1	Leonardo	v1	{"Tool": "Rhapsody Commandline"}
437	GITLab	24	28	1	Leonardo	v1	{"Tool": "GITLab"}
438	Mathworks Matlab	24	28	1	Leonardo	v1	{"Tool": "Mathworks Matlab"}
439	Mathworks Simulink	24	28	1	Leonardo	v1	{"Tool": "Mathworks Simulink"}
440	QEMU	24	28	1	Leonardo	v1	{"Tool": "QEMU"}
441	Jira	24	28	1	Leonardo	v1	{"Tool": "Jira"}
442	Powerpoint	24	28	1	Leonardo	v1	{"Tool": "Powerpoint"}
443	Technique Framework	22	21	1	Leonardo	v1	{"Techniques": ["Requirements Elicitation", "Timing/Scheduling Analysis", "Network Analysis", "Modelling & Synthetic Environment", "Static Analysis", "Peer Review", "Measurement, Inspection & Test", "Value Management", "Design Review", "FMEA", "Prototyping", "Problem Investigation/Debug", "Robotics", "Digital Signal Processing", "Data Modelling", "Customer/Stakeholder Interaction", "Software Lifecycle", "Integration of Software Elements", "Unit Test", "Module Test", "Integration Test (SIL)", "System Integration Test", "Containerisation", "Ontological Definition", "Integration Test (HIL)", "Component Functional Test"]}
444	Technology Framework	23	25	1	Leonardo	v1	{"Technologies": ["UML", "Ladder Logic", "C", "C++", "C#", "LCA", "LSAF", "Javascript", "PICs", "Object Pascal/Pascal", "Linux", "Windows", "Java", "ARM", "Microblaze", "Relational Database", "DEV-OPS", "Oracle", "Graph Database", "Assembler", "Python", "Raspberry Pi", "Docker", "TCP", "UDP", "8D", "5 Whys", "Break/Test Point", "Fishbone", "Generic Vehicle Architecture (GVA)", "00-82", "Land CEMA Architecture(LCA)", "Ada", "80x86/Intel", "Matlab/Simulink (Code Gen)", "OPCUA", "1553", "ARINC 429", "FireWire", "FTP", "RTP", "Modem", "Global Navigation Systems (GNSS)", "Celular Technologies", "OpenCPI", "Z80", "Vx Works", "Free RTOS", "Time Sensitive Networking (TSN)", "Data Distribution Service (DDS)", "Message Queueing Teleetry Transport (MQTT)", "Textual Definition", "Use Case Definition", "Model Based Requirement", "RS422", "SPI", "SysML", "RS232", "RS485", "One Wire Serial", "Xilinx Vivado", "Xilinx SDK/Vitis", "VHDL", "Virtual Battlefield Simulation (VBS)"]}
445	Tools Framework	24	29	1	Leonardo	v1	{"Tools": ["Visual Studio", "Rhapsody", "Dimentions", "Wireshark", "Rational Rose", "Rational Rose RT", "GIT", "Microsft Azure DevOps", "System Composer", "OpenCaesar", "Docker", "Virtual Box", "Cameo Systems Modeller/Magic Draw", "Atlassion Stack", "Artifactory", "TCU", "SAP", "Microsoft Project", "Excel", "Word", "Viseo", "Draw.io", "DOORS", "PlantUML", "Delphi", "Rhapsody Test", "Rhapsody Requirements Management", "WinRiver Workbench", "Polyspace", "CMAKE", "RTI DDS Professional", "Catch2", "Rhapsody Test Conductor", "Rhapsody Gateway add-on", "Rhapsody Commandline", "GITLab", "Mathworks Matlab", "Mathworks Simulink", "QEMU", "Jira", "Powerpoint"]}
446	SFIA Framework	19	14	1	Leonardo	v1	{"ACIN": ["Development and implementation", "User centred design", "Accessibility and inclusion ACIN", [2, 3, 4, 5, 6]], "ADEV": ["Development and implementation", "Systems development", "Animation development ADEV", [2, 3, 4, 5, 6]], "ADMN": ["Relationships and engagement", "Stakeholder management", "Business administration ADMN", [1, 2, 3, 4, 5, 6]], "AIDE": ["Strategy and architecture", "Governance, risk and compliance", "Artificial intelligence (AI) and data ethics AIDE", [3, 4, 5, 6]], "ANCC": ["Delivery and operation", "Data and records operations", "Analytical classification and coding ANCC", [2, 3, 4, 5, 6]], "ARCH": ["Strategy and architecture", "Strategy and planning", "Solution architecture ARCH", [4, 5, 6]], "ASMG": ["Delivery and operation", "Service management", "Asset management ASMG", [2, 3, 4, 5, 6]], "ASUP": ["Delivery and operation", "Technology management", "Application support ASUP", [2, 3, 4, 5]], "AUDT": ["Strategy and architecture", "Governance, risk and compliance", "Audit AUDT", [2, 3, 4, 5, 6, 7]], "AVMT": ["Delivery and operation", "Service management", "Availability management AVMT", [3, 4, 5, 6]], "BENM": ["Strategy and architecture", "Financial and value management", "Benefits management BENM", [3, 4, 5, 6]], "BIDM": ["Relationships and engagement", "Sales and bid management", "Bid/proposal management BIDM", [3, 4, 5, 6]], "BINT": ["Development and implementation", "Data and analytics", "Business intelligence BINT", [2, 3, 4, 5]], "BPRE": ["Change and transformation", "Change planning", "Business process improvement BPRE", [2, 3, 4, 5, 6, 7]], "BPTS": ["Change and transformation", "Change analysis", "User acceptance testing BPTS", [2, 3, 4, 5, 6]], "BRMG": ["Relationships and engagement", "Marketing", "Brand management BRMG", [4, 5, 6]], "BSMO": ["Change and transformation", "Change analysis", "Business modelling BSMO", [2, 3, 4, 5, 6]], "BUDF": ["Strategy and architecture", "Financial and value management", "Budgeting and forecasting BUDF", [2, 3, 4, 5, 6]], "BURM": ["Strategy and architecture", "Governance, risk and compliance", "Risk management BURM", [2, 3, 4, 5, 6, 7]], "BUSA": ["Change and transformation", "Change analysis", "Business situation analysis BUSA", [2, 3, 4, 5, 6]], "CELO": ["Relationships and engagement", "Marketing", "Customer engagement and loyalty CELO", [3, 4, 5, 6]], "CEXP": ["Development and implementation", "User centred design", "Customer experience CEXP", [2, 3, 4, 5, 6]], "CFMG": ["Delivery and operation", "Technology management", "Configuration management CFMG", [2, 3, 4, 5, 6]], "CHMG": ["Delivery and operation", "Service management", "Change control CHMG", [2, 3, 4, 5, 6]], "CIPM": ["Change and transformation", "Change planning", "Organisational change management CIPM", [2, 3, 4, 5, 6]], "CNSL": ["Strategy and architecture", "Advice and guidance", "Consultancy CNSL", [4, 5, 6, 7]], "COMG": ["Strategy and architecture", "Financial and value management", "Cost management COMG", [2, 3, 4, 5, 6]], "COPL": ["Delivery and operation", "Service management", "Continuity management COPL", [2, 3, 4, 5, 6]], "CPMG": ["Delivery and operation", "Service management", "Capacity management CPMG", [2, 3, 4, 5, 6]], "CRIM": ["Delivery and operation", "Security services", "Cybercrime investigation CRIM", [2, 3, 4, 5, 6]], "CSMG": ["Relationships and engagement", "Stakeholder management", "Customer service support CSMG", [1, 2, 3, 4, 5, 6]], "CSOP": ["People and skills", "Skills management", "Certification scheme operation CSOP", [2, 3, 4, 5, 6]], "DAAN": ["Development and implementation", "Data and analytics", "Data analytics DAAN", [2, 3, 4, 5, 6, 7]], "DATM": ["Development and implementation", "Data and analytics", "Data management DATM", [2, 3, 4, 5, 6]], "DATS": ["Development and implementation", "Data and analytics", "Data science DATS", [2, 3, 4, 5, 6]], "DBAD": ["Delivery and operation", "Data and records operations", "Database administration DBAD", [2, 3, 4, 5]], "DBDS": ["Development and implementation", "Data and analytics", "Database design DBDS", [2, 3, 4, 5]], "DCMA": ["Delivery and operation", "Technology management", "Facilities management DCMA", [2, 3, 4, 5, 6]], "DEMG": ["Change and transformation", "Change implementation", "Delivery management DEMG", [3, 4, 5, 6]], "DEMM": ["Strategy and architecture", "Financial and value management", "Demand management DEMM", [4, 5, 6]], "DENG": ["Development and implementation", "Data and analytics", "Data engineering DENG", [2, 3, 4, 5, 6]], "DEPL": ["Delivery and operation", "Technology management", "Deployment DEPL", [2, 3, 4, 5, 6]], "DESN": ["Development and implementation", "Systems development", "Systems design DESN", [2, 3, 4, 5, 6]], "DGFS": ["Delivery and operation", "Security services", "Digital forensics DGFS", [2, 3, 4, 5, 6]], "DLMG": ["Development and implementation", "Systems development", "Systems development management DLMG", [4, 5, 6, 7]], "DTAN": ["Development and implementation", "Data and analytics", "Data modelling and design DTAN", [2, 3, 4, 5]], "EEXP": ["People and skills", "People management", "Employee experience EEXP", [4, 5, 6]], "EMRG": ["Strategy and architecture", "Strategy and planning", "Emerging technology monitoring EMRG", [4, 5, 6]], "ETDL": ["People and skills", "Skills management", "Learning delivery ETDL", [2, 3, 4, 5]], "ETMG": ["People and skills", "Skills management", "Learning and development management ETMG", [2, 3, 4, 5, 6, 7]], "FEAS": ["Change and transformation", "Change analysis", "Feasibility assessment FEAS", [2, 3, 4, 5, 6]], "FIAN": ["Strategy and architecture", "Financial and value management", "Financial analysis FIAN", [2, 3, 4, 5, 6]], "FMIT": ["Strategy and architecture", "Financial and value management", "Financial management FMIT", [4, 5, 6]], "GRDN": ["Development and implementation", "Content management", "Graphic design GRDN", [1, 2, 3, 4, 5]], "HCEV": ["Development and implementation", "User centred design", "User experience design HCEV", [2, 3, 4, 5, 6]], "HPCC": ["Development and implementation", "Computational science", "High-performance computing HPCC", [4, 5, 6, 7]], "HSIN": ["Delivery and operation", "Technology management", "Systems installation and removal HSIN", [1, 2, 3, 4, 5]], "HWDE": ["Development and implementation", "Systems development", "Hardware design HWDE", [2, 3, 4, 5, 6]], "IAMT": ["Delivery and operation", "Security services", "Identity and access management IAMT", [1, 2, 3, 4, 5, 6]], "ICPM": ["Development and implementation", "Content management", "Content publishing ICPM", [1, 2, 3, 4, 5, 6]], "IFDN": ["Development and implementation", "Systems development", "Infrastructure design IFDN", [2, 3, 4, 5, 6]], "INAS": ["Strategy and architecture", "Security and privacy", "Information assurance INAS", [2, 3, 4, 5, 6, 7]], "INCA": ["Development and implementation", "Content management", "Content design and authoring INCA", [1, 2, 3, 4, 5, 6]], "INOV": ["Strategy and architecture", "Strategy and planning", "Innovation management INOV", [5, 6, 7]], "INVA": ["Strategy and architecture", "Financial and value management", "Investment appraisal INVA", [4, 5, 6]], "IRMG": ["Strategy and architecture", "Strategy and planning", "Information management IRMG", [3, 4, 5, 6, 7]], "ISCO": ["Strategy and architecture", "Strategy and planning", "Information systems coordination ISCO", [6, 7]], "ITCM": ["Relationships and engagement", "Stakeholder management", "Contract management ITCM", [2, 3, 4, 5, 6, 7]], "ITMG": ["Delivery and operation", "Technology management", "Technology service management ITMG", [5, 6, 7]], "ITOP": ["Delivery and operation", "Technology management", "Infrastructure operations ITOP", [1, 2, 3, 4, 5]], "ITSP": ["Strategy and architecture", "Strategy and planning", "Strategic planning ITSP", [4, 5, 6, 7]], "JADN": ["Change and transformation", "Change planning", "Job analysis and design JADN", [3, 4, 5]], "KNOW": ["Development and implementation", "Content management", "Knowledge management KNOW", [2, 3, 4, 5, 6, 7]], "LEDA": ["People and skills", "Skills management", "Competency assessment LEDA", [2, 3, 4, 5, 6]], "MEAS": ["Strategy and architecture", "Financial and value management", "Measurement MEAS", [2, 3, 4, 5, 6]], "METL": ["Strategy and architecture", "Advice and guidance", "Methods and tools METL", [2, 3, 4, 5, 6]], "MKCM": ["Relationships and engagement", "Marketing", "Marketing campaign management MKCM", [3, 4, 5]], "MKTG": ["Relationships and engagement", "Marketing", "Marketing management MKTG", [4, 5, 6, 7]], "MLNG": ["Development and implementation", "Data and analytics", "Machine learning MLNG", [2, 3, 4, 5, 6]], "MRCH": ["Relationships and engagement", "Marketing", "Market research MRCH", [3, 4, 5, 6]], "NFTS": ["Development and implementation", "Systems development", "Non-functional testing NFTS", [1, 2, 3, 4, 5, 6]], "NTAS": ["Delivery and operation", "Technology management", "Network support NTAS", [1, 2, 3, 4, 5]], "NTDS": ["Development and implementation", "Systems development", "Network design NTDS", [2, 3, 4, 5, 6]], "NUAN": ["Development and implementation", "Computational science", "Numerical analysis NUAN", [4, 5, 6, 7]], "OCDV": ["Change and transformation", "Change planning", "Organisational capability development OCDV", [5, 6, 7]], "OCEN": ["Change and transformation", "Change planning", "Organisational change enablement OCEN", [4, 5, 6]], "OCOP": ["Delivery and operation", "Security services", "Offensive cyber operations OCOP", [2, 3, 4, 5, 6]], "OFCL": ["People and skills", "People management", "Organisational facilitation OFCL", [4, 5, 6]], "ORDI": ["Change and transformation", "Change planning", "Organisation design and implementation ORDI", [3, 4, 5, 6, 7]], "PBMG": ["Delivery and operation", "Service management", "Problem management PBMG", [2, 3, 4, 5]], "PDSV": ["People and skills", "People management", "Professional development PDSV", [4, 5, 6]], "PEDP": ["Strategy and architecture", "Security and privacy", "Information and data compliance PEDP", [4, 5, 6]], "PEMT": ["People and skills", "People management", "Performance management PEMT", [4, 5, 6]], "PENT": ["Delivery and operation", "Security services", "Penetration testing PENT", [2, 3, 4, 5, 6]], "PGMG": ["Change and transformation", "Change implementation", "Programme management PGMG", [6, 7]], "POMG": ["Change and transformation", "Change implementation", "Portfolio management POMG", [5, 6, 7]], "PORT": ["Development and implementation", "Systems development", "Software configuration PORT", [2, 3, 4, 5, 6]], "PRMG": ["Change and transformation", "Change implementation", "Project management PRMG", [4, 5, 6, 7]], "PROD": ["Development and implementation", "Systems development", "Product management PROD", [2, 3, 4, 5, 6]], "PROF": ["Change and transformation", "Change implementation", "Portfolio, programme and project support PROF", [2, 3, 4, 5, 6]], "PROG": ["Development and implementation", "Systems development", "Programming/software development PROG", [2, 3, 4, 5, 6]], "PRTS": ["Development and implementation", "Systems development", "Process testing PRTS", [1, 2, 3, 4, 5, 6]], "QUAS": ["Strategy and architecture", "Governance, risk and compliance", "Quality assurance QUAS", [2, 3, 4, 5, 6]], "QUMG": ["Strategy and architecture", "Governance, risk and compliance", "Quality management QUMG", [2, 3, 4, 5, 6, 7]], "RELM": ["Delivery and operation", "Technology management", "Release management RELM", [2, 3, 4, 5, 6]], "REQM": ["Change and transformation", "Change analysis", "Requirements definition and management REQM", [2, 3, 4, 5, 6]], "RESC": ["People and skills", "People management", "Resourcing RESC", [2, 3, 4, 5, 6]], "RESD": ["Development and implementation", "Systems development", "Real-time/embedded systems development RESD", [2, 3, 4, 5, 6]], "RFEN": ["Development and implementation", "Systems development", "Radio frequency engineering RFEN", [2, 3, 4, 5, 6]], "RLMT": ["Relationships and engagement", "Stakeholder management", "Stakeholder relationship management RLMT", [4, 5, 6, 7]], "RMGT": ["Delivery and operation", "Data and records operations", "Records management RMGT", [1, 2, 3, 4, 5]], "RSCH": ["Strategy and architecture", "Strategy and planning", "Formal research RSCH", [2, 3, 4, 5, 6]], "SALE": ["Relationships and engagement", "Sales and bid management", "Selling SALE", [3, 4, 5, 6]], "SCAD": ["Delivery and operation", "Security services", "Security operations SCAD", [1, 2, 3, 4, 5, 6]], "SCMG": ["Delivery and operation", "Service management", "Service catalogue management SCMG", [2, 3, 4, 5]], "SCMO": ["Development and implementation", "Computational science", "Scientific modelling SCMO", [4, 5, 6, 7]], "SCTY": ["Strategy and architecture", "Security and privacy", "Information security SCTY", [2, 3, 4, 5, 6, 7]], "SEAC": ["Delivery and operation", "Service management", "Service acceptance SEAC", [3, 4, 5, 6]], "SFAS": ["Development and implementation", "Systems development", "Safety assessment SFAS", [4, 5, 6]], "SFEN": ["Development and implementation", "Systems development", "Safety engineering SFEN", [2, 3, 4, 5, 6]], "SINT": ["Development and implementation", "Systems development", "Systems integration and build SINT", [2, 3, 4, 5, 6]], "SLEN": ["Development and implementation", "Systems development", "Systems and software lifecycle engineering SLEN", [3, 4, 5, 6, 7]], "SLMO": ["Delivery and operation", "Service management", "Service level management SLMO", [2, 3, 4, 5, 6, 7]], "SORC": ["Relationships and engagement", "Stakeholder management", "Sourcing SORC", [2, 3, 4, 5, 6, 7]], "SSUP": ["Relationships and engagement", "Sales and bid management", "Sales support SSUP", [1, 2, 3, 4, 5, 6]], "STMG": ["Delivery and operation", "Technology management", "Storage management STMG", [2, 3, 4, 5, 6]], "STPL": ["Strategy and architecture", "Strategy and planning", "Enterprise and business architecture STPL", [5, 6, 7]], "SUBF": ["People and skills", "Skills management", "Subject formation SUBF", [4, 5, 6, 7]], "SUPP": ["Relationships and engagement", "Stakeholder management", "Supplier management SUPP", [2, 3, 4, 5, 6, 7]], "SUST": ["Strategy and architecture", "Strategy and planning", "Sustainability SUST", [4, 5, 6]], "SWDN": ["Development and implementation", "Systems development", "Software design SWDN", [2, 3, 4, 5, 6]], "SYSP": ["Delivery and operation", "Technology management", "System software administration SYSP", [2, 3, 4, 5]], "TEAC": ["People and skills", "Skills management", "Teaching TEAC", [2, 3, 4, 5, 6, 7]], "TECH": ["Strategy and architecture", "Advice and guidance", "Specialist advice TECH", [4, 5, 6]], "TEST": ["Development and implementation", "Systems development", "Functional testing TEST", [1, 2, 3, 4, 5, 6]], "THIN": ["Strategy and architecture", "Security and privacy", "Threat intelligence THIN", [2, 3, 4, 5, 6]], "TMCR": ["People and skills", "Skills management", "Learning design and development TMCR", [2, 3, 4, 5]], "UNAN": ["Development and implementation", "User centred design", "User experience analysis UNAN", [2, 3, 4, 5]], "URCH": ["Development and implementation", "User centred design", "User research URCH", [2, 3, 4, 5, 6]], "USEV": ["Development and implementation", "User centred design", "User experience evaluation USEV", [2, 3, 4, 5, 6]], "USUP": ["Delivery and operation", "Service management", "Incident management USUP", [1, 2, 3, 4, 5, 6]], "VISL": ["Development and implementation", "Data and analytics", "Data visualisation VISL", [2, 3, 4, 5]], "VUAS": ["Delivery and operation", "Security services", "Vulnerability assessment VUAS", [2, 3, 4, 5]], "VURE": ["Strategy and architecture", "Security and privacy", "Vulnerability research VURE", [2, 3, 4, 5, 6]], "WFPL": ["People and skills", "People management", "Workforce planning WFPL", [4, 5, 6]]}
472	Agent 00000001	21	31	1	Agent Subject	v1	{"Email": "a@a", "Location": "a", "Last Name": "a", "First Name": "a", "Phone Number": "7", "Employee Number": "00000001", "Security Classification": "a"}
474	Technologies 00000001	21	30	1	Leonardo	v1	{"C": 0, "8D": 0, "C#": 0, "ARM": 0, "Ada": 0, "C++": 0, "FTP": 0, "LCA": 0, "RTP": 0, "SPI": 0, "TCP": 0, "UDP": 0, "UML": 0, "Z80": 0, "1553": 0, "Java": 0, "LSAF": 0, "PICs": 0, "VHDL": 0, "00-82": 0, "Linux": 0, "Modem": 0, "OPCUA": 0, "RS232": 0, "RS422": 0, "RS485": 0, "SysML": 0, "5 Whys": 0, "Docker": 0, "Oracle": 0, "Python": 0, "DEV-OPS": 0, "OpenCPI": 0, "Windows": 0, "FireWire": 0, "Fishbone": 0, "Vx Works": 0, "ARINC 429": 0, "Assembler": 0, "Free RTOS": 0, "Javascript": 0, "Microblaze": 0, "80x86/Intel": 0, "Ladder Logic": 0, "Raspberry Pi": 0, "Xilinx Vivado": 0, "Graph Database": 0, "One Wire Serial": 0, "Break/Test Point": 0, "Xilinx SDK/Vitis": 0, "Textual Definition": 0, "Relational Database": 0, "Use Case Definition": 0, "Celular Technologies": 0, "Object Pascal/Pascal": 0, "Model Based Requirement": 0, "Matlab/Simulink (Code Gen)": 0, "Land CEMA Architecture(LCA)": 0, "Data Distribution Service (DDS)": 0, "Time Sensitive Networking (TSN)": 0, "Global Navigation Systems (GNSS)": 0, "Generic Vehicle Architecture (GVA)": 0, "Virtual Battlefield Simulation (VBS)": 0, "Message Queueing Teleetry Transport (MQTT)": 0}
475	Tools 00000001	21	30	1	Leonardo	v1	{"GIT": 0, "SAP": 0, "TCU": 0, "Jira": 0, "QEMU": 0, "Word": 0, "CMAKE": 0, "DOORS": 0, "Excel": 0, "Viseo": 0, "Catch2": 0, "Delphi": 0, "Docker": 0, "GITLab": 0, "Draw.io": 0, "PlantUML": 0, "Rhapsody": 0, "Polyspace": 0, "Wireshark": 0, "Dimentions": 0, "OpenCaesar": 0, "Powerpoint": 0, "Artifactory": 0, "Virtual Box": 0, "Rational Rose": 0, "Rhapsody Test": 0, "Visual Studio": 0, "Atlassion Stack": 0, "System Composer": 0, "Mathworks Matlab": 0, "Rational Rose RT": 0, "Microsoft Project": 0, "Mathworks Simulink": 0, "WinRiver Workbench": 0, "RTI DDS Professional": 0, "Rhapsody Commandline": 0, "Microsft Azure DevOps": 0, "Rhapsody Gateway add-on": 0, "Rhapsody Test Conductor": 0, "Rhapsody Requirements Management": 0, "Cameo Systems Modeller/Magic Draw": 0}
476	SFIA 00000001	19	15	1	Leonardo	v1	{"ACIN": 0, "ADEV": 0, "ADMN": 0, "AIDE": 0, "ANCC": 0, "ARCH": 0, "ASMG": 0, "ASUP": 0, "AUDT": 0, "AVMT": 0, "BENM": 0, "BIDM": 0, "BINT": 0, "BPRE": 0, "BPTS": 0, "BRMG": 0, "BSMO": 0, "BUDF": 0, "BURM": 0, "BUSA": 0, "CELO": 0, "CEXP": 0, "CFMG": 0, "CHMG": 0, "CIPM": 0, "CNSL": 0, "COMG": 0, "COPL": 0, "CPMG": 0, "CRIM": 0, "CSMG": 0, "CSOP": 0, "DAAN": 0, "DATM": 0, "DATS": 0, "DBAD": 0, "DBDS": 0, "DCMA": 0, "DEMG": 0, "DEMM": 0, "DENG": 0, "DEPL": 0, "DESN": 0, "DGFS": 0, "DLMG": 0, "DTAN": 0, "EEXP": 0, "EMRG": 0, "ETDL": 0, "ETMG": 0, "FEAS": 0, "FIAN": 0, "FMIT": 0, "GRDN": 0, "HCEV": 0, "HPCC": 0, "HSIN": 0, "HWDE": 0, "IAMT": 0, "ICPM": 0, "IFDN": 0, "INAS": 0, "INCA": 0, "INOV": 0, "INVA": 0, "IRMG": 0, "ISCO": 0, "ITCM": 0, "ITMG": 0, "ITOP": 0, "ITSP": 0, "JADN": 0, "KNOW": 0, "LEDA": 0, "MEAS": 0, "METL": 0, "MKCM": 0, "MKTG": 0, "MLNG": 0, "MRCH": 0, "NFTS": 0, "NTAS": 0, "NTDS": 0, "NUAN": 0, "OCDV": 0, "OCEN": 0, "OCOP": 0, "OFCL": 0, "ORDI": 0, "PBMG": 0, "PDSV": 0, "PEDP": 0, "PEMT": 0, "PENT": 0, "PGMG": 0, "POMG": 0, "PORT": 0, "PRMG": 0, "PROD": 0, "PROF": 0, "PROG": 0, "PRTS": 0, "QUAS": 0, "QUMG": 0, "RELM": 0, "REQM": 0, "RESC": 0, "RESD": 0, "RFEN": 0, "RLMT": 0, "RMGT": 0, "RSCH": 0, "SALE": 0, "SCAD": 0, "SCMG": 0, "SCMO": 0, "SCTY": 0, "SEAC": 0, "SFAS": 0, "SFEN": 0, "SINT": 0, "SLEN": 0, "SLMO": 0, "SORC": 0, "SSUP": 0, "STMG": 0, "STPL": 0, "SUBF": 0, "SUPP": 0, "SUST": 0, "SWDN": 0, "SYSP": 0, "TEAC": 0, "TECH": 0, "TEST": 0, "THIN": 0, "TMCR": 0, "UNAN": 0, "URCH": 0, "USEV": 0, "USUP": 0, "VISL": 0, "VUAS": 0, "VURE": 0, "WFPL": 0}
473	Techniques 00000001	21	30	1	Leonardo	v1	{"FMEA": 3, "Robotics": 0, "Unit Test": 0, "Module Test": 3, "Peer Review": 0, "Prototyping": 0, "Design Review": 2, "Data Modelling": 3, "Static Analysis": 0, "Containerisation": 3, "Network Analysis": 2, "Value Management": 0, "Software Lifecycle": 0, "Integration Test (HIL)": 4, "Integration Test (SIL)": 2, "Ontological Definition": 0, "System Integration Test": 0, "Requirements Elicitation": 3, "Component Functional Test": 4, "Digital Signal Processing": 3, "Timing/Scheduling Analysis": 0, "Problem Investigation/Debug": 0, "Measurement, Inspection & Test": 3, "Customer/Stakeholder Interaction": 3, "Integration of Software Elements": 2, "Modelling & Synthetic Environment": 3}
\.


--
-- Data for Name: nodetype; Type: TABLE DATA; Schema: public; Owner: pi-003
--

COPY public.nodetype (nodetypeid, name, fields, settings) FROM stdin;
1	Test Results	{}	{}
2	Test Procedures	{}	{}
4	Test Cases	{}	{}
5	Source Code	{}	{}
7	System Requirments Allocated to Software	{}	{}
8	Software High Level Requirments	{}	{}
9	Software Low Level Requirments	{}	{}
10	Software Architecture	{}	{}
11	Executable Object Code	{}	{}
12	Jira Ticket	{}	{}
13	API Test Nodetype 1	{"1": "Test"}	{"1": "Test"}
18	KSB_node	{}	{}
17	SFIA_skill_node	{}	{}
14	SFIA_framework	{}	{}
15	SFIA_response	{}	{}
19	SFIA_concern	{}	{}
20	technique_node	{}	{}
21	technique_framework	{}	{}
23	technique_response	{}	{}
24	technolodgy_node	{}	{}
25	technolodgy_framework	{}	{}
26	technolodgy_response	{}	{}
27	experience_concern	{}	{}
28	tool_node	{}	{}
29	tool_framework	{}	{}
30	tool_response	{}	{}
31	subject_node	{}	{}
\.


--
-- Name: edges_edgeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.edges_edgeid_seq', 346, true);


--
-- Name: edgetype_edgetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.edgetype_edgetypeid_seq', 17, true);


--
-- Name: graph_graphid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.graph_graphid_seq', 25, true);


--
-- Name: graphtype_graphtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.graphtype_graphtypeid_seq', 9, true);


--
-- Name: nodes_nodeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.nodes_nodeid_seq', 476, true);


--
-- Name: nodetype_nodetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: pi-003
--

SELECT pg_catalog.setval('public.nodetype_nodetypeid_seq', 31, true);


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

