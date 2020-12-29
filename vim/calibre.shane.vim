" Vim syntax file
" Language:	Calibre
" Maintainer:	Shane Squires <shane.a.squires@intel.com>
" Last change:  Thu Apr 2 2015
" Extensions:   .drc, .hdr (for particular TTD files)

" This file was created by mining the Calibre SVRF manual for calcommand- and caloption-like 
" strings.  Unfortunately I did this from an old version of the manual which was formatted 
" as a PDF (which was difficult to mine for text).  So many commands are probably incomplete 
" or incorrect, but this file is more complete than any other Calibre syntax file of which I 
" am aware.  Please let me know if you have corrections or suggestions for features to add.  

" Note that this file is based in roughly equal parts on Calibre syntax and my personal coding 
" conventions.  Some features (like case sensitivity, variable name conventions, and the 
" highlighting types) are highly customized to my own preferences and would almost certainly 
" need to be modified by other users.  Also, a number of commands that I will likely never use 
" are commented out with the phrase "Currently off".

" TO DO: Clusters, etc.
"        Make Calibre syntax highlighting totally independent of other software; do not link to standard types.  Customize those for C++/Python/"regular" languages.
"        Disallow ending in _
"        Make Calibre highlight groups, move to color file, so that works when multiple file types open
"        MAKE REGION FOR MACRO DECLARATION; REMOVE HACKY CODE FOR HANDLING BRACES
"        Can I save the pattern \l\(\l\|\d\|_\)* somehow?  GOOGLE, TEST IDEAS
"        ADD \v EVERYWHERE AND SIMPLIFY
"        SEPARATE CUSTOM (my conventions) AND STANDARD MATERIAL
"        in DFM expressions: colors for , and DFM variables (e.g. [n = ...]).
"        Apparently 'LAYOUT CLONE' is a command and ROTATED PLACEMENTS etc. is a specification...?
"        LOOK AT RUSS'S DOCS: /p/ret/rettools/RetDocs/indexes/

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "calibre"

" Ignore case
syntax case ignore


" (1) Comments and related types.
" (1a) C-style comments.
  syntax region calcomment  start="//"   skip="\\$"  end="$"    contains=caltodo,callater
  syntax region calcomment  start="/\*"              end="\*/"  contains=caltodo,callater
" (1b) To do.  If the capitalized 'todo' is not followed by a colon, it will not be highlighted, 
"      but the rest of the to-do message will be.
  syntax match caltodo    "\<\(TODO\|FINISH\).*" contained contains=calignore
  syntax match calignore  "TODO[^:]\s*" contained
" (1c) Return to this code later (like todo, but cannot be addressed now).
  syntax match callater  "LATER" contained

" (2) Layer, rule check, and variable names.  The definition order here means that by default, words
"     in this_format will be assumed to be layers, unless they end with '_sizing' or the other 
"     endings listed below.  The priority between layers, rule checks, and variables is also 
"     controlled by the nextgroup for syntax matching of calcommand and caloption.
" (2a) General form (same for layers, edge layers, edge clusters, variables, and rule checks).
  syntax match calrulecheck  "\<[a-z][a-z0-9_]*\>"
  syntax match calvariable   "\<[a-z][a-z0-9_]*\>"
  syntax match calcluster    "\<[a-z][a-z0-9_]*\>"
  syntax match caledge       "\<[a-z][a-z0-9_]*\>"
  syntax match callayer      "\<[a-z][a-z0-9_]*\>"
" (2b) Edge clusters.
  "syntax match calcluster  "\<\(cluster_[a-z0-9_]*\|[a-z][a-z0-9_]*_cluster[a-z0-9_]*\)\>"
  syntax match calcluster  "\<\(edge_pairs_[a-z0-9_]*\|[a-z][a-z0-9_]*_edge_pairs[a-z0-9_]*\)\>"
" (2c) Edge layers.
  syntax match caledge  "\<\(\(edges\|ends\|segments\|sides\)\(\>\|_\)[a-z0-9_]*\|[a-z][a-z0-9_]*_\(edges\|ends\|segments\|sides\)[a-z0-9_]*\)\>"
  syntax match caledge  "\<\(segments_[a-z0-9_]*\|[a-z][a-z0-9_]*_segments[a-z0-9_]*\)\>"
" (2d) Specific variable suffixes.
  syntax match calvariable  "\<[a-z][a-z0-9_]*_angle\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)\?count\(_[a-z0-9]\+\)*\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_cutout\(_[a-z0-9]\+\)*\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_dbu\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)*dist\(_[a-z0-9]\+\)*\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_height\>"
  syntax match calvariable  "\(\<[a-z][a-z0-9_]*_\)*keep_away\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)*length\(_[a-z][a-z0-9_]*\)*\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_negative\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_nm\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_sizing\(_[a-z0-9_]\+\)\?\>"
  syntax match calvariable  "\<[a-z][a-z0-9_]*_size\(_[a-z0-9_]\+\)\?\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)\?space\(_[a-z0-9_]*\)\?\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)\?threshold\>"
  syntax match calvariable  "\<\([a-z][a-z0-9_]*_\)\?width\(_[a-z0-9_]*\)\?\>"
" (2e) Rule checks are assumed to either begin on start of line, or be preceded by a command that 
"      uses a rule check as a nextgroup.  This is largely to prevent conflicts with the use of
"      braces by DMACRO. 
" TODO NOTE changed to up to 7 spaces -- hack!
  syntax match  calrulecheck  "^\s*[a-z][a-z0-9_]*" contained
  syntax region calrulecheck  start="^\s\{0,7}[a-z][a-z0-9_]*\s\+{"  end="}"
                           \  contains=ALLBUT,calcombraces
" (2f) Environment variables (can be contained in strings).  Count $ but not \$ as the beginning of 
"      an environment variable.  Capital-letter variables used in SVRF ERROR strings are assumed to 
"      be from the environment.
  syntax match calenvvar  "\\\@<!\$\w\+\>"
  syntax match calenvvar  "\^[A-Z_]\+" contained 

" (3) Preprocessor and include statements.
" (3a) Preprocessor, including variables defined from environment.
  syntax match calpreproc  "#IFDEF\s\+[^ /]\+\(\s\+[^ /]\+\)\?"
  syntax match calpreproc  "#IFNDEF\s\+[^ /]\+\(\s\+[^ /]\+\)\?"
  syntax match calpreproc  "\(#ELSE\|#ENDIF\)"
  syntax match calpreproc  "#DEFINE\s\+[^ /]\+\(\s\+[^ /]\+\)\?"
  syntax match calpreproc  "#UNDEFINE\s\+[^ /]\+\(\s\+[^ /]\+\)\?"
  syntax match calpreproc  "\(VARIABLE \+\)\@<=[A-Z][A-Z0-9_]*\(\s\+ENVIRONMENT\)\@="
" (3b) Included files.
  syntax match calinclude  "\<INCLUDE [A-Za-z0-9_./]\+\>"

" (4) Constant types.
" (4a) Strings.
  syntax region calstring  start=/"/  end=/"/  contains=calenvvar
  syntax region calstring  start=/'/  end=/'/  contains=calenvvar
" (4b) Numbers and constraints.
  syntax match calnumber  "\<[0-9\.][0-9\.]*\>"
"      Match either one or two names following VARIABLE.
"STOPPED HERE
"CONSIDER CHANGING THIS TO A REGION AND USING CONTAINS
  syntax match calnumber  "\(VARIABLE\s\+\)\@<=[a-z][a-z_0-9]*\>\(\s\+[a-z][a-z0-9_]*\)\?"
"      Match all combinations of <=> of length 1-2 (except plain =), optionally followed by name.
  syntax match calconstraint  "\([<>]=\?\|==\)\(\s*[a-z][a-z0-9_]*\>\)\?"

" (5) Commands.
" (5a) Special regex for commands that suffer from syntax issues (command-option confusion, 
"      keyword/phrase confusion, abbreviation within phrases, etc.).  This handling is ad-hoc 
"      and imperfect in many cases.
"      (1) Miscellaneous.
  syntax keyword calcommand  DEV[ICE] 
  syntax match   calcommand  "\<CHE\(CK\)\? DRC\?\>"
  syntax match   calcommand  "\(DFM\s\+\)\@<!\<SHIFT"
  syntax match   calcommand  "\<FLAG NONSIMPLE\( PATH\)\?\>"
"          Match macro names as well as CMACRO/DMACRO.
  syntax match   calcommand  "\(\<CMACRO \+\w*\|\<DMACRO \w*\)"
"          Equality, parentheses, brackets, etc.  Match only plain =, not constraints.
"          Braces are treated separately to handle brace usage between rulechecks and DMACRO.
  syntax match   calcommand    "[<=>]\@<!==\@!"  " match only plain =, not constraints
  syntax match   calcommand    "[)(\]\[]"
  syntax match   calcombraces  "[{}]"
"      (2) Commands that will be followed by a layer.
  syntax keyword calcommand  ENC[LOSURE] EXT[ERNAL] INT[ERNAL] nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<AREA(\@!" nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<LENGTH(\@!" nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<\(NOT \)\?TOUCH\( INSIDE\| OUTSIDE\)\?\( EDGE\)\?\>" 
                           \nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<\(NOT \)\?COIN\(CIDENT\)\?\( INSIDE\| OUTSIDE\)\?\( EDGE\)\?\>" 
                           \nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<\(NOT \)\?\(INSIDE\|OUTSIDE\)\( OF\)\@!\( CELL\| EDGE\)\?\>" 
                           \nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<\(OF \)\@<!LAYER\( MAP\)\?\>" nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "\<OR\( EDGE\)\@!" nextgroup=callayer,caledge skipwhite
  syntax match   calcommand  "^\s*PERIMETER" nextgroup=callayer skipwhite
  syntax match   calcommand  "\(REGION \)\@<!EXTENTS" nextgroup=callayer skipwhite
  syntax match   calcommand  "\<EXPAND EDGE\>" nextgroup=callayer,caledge skipwhite
" (5b) Command keywords. 
"      (1) Miscellaneous (some may actually fall into other categories).  VARIABLE is something of a
"          special case, handled above.
  syntax keyword calcommand  LITHO PRECISION PSMGATE RECTANGLES RESOLUTION TEXT TITLE VARIABLE 
"            Currently off:  HCELL MDPMERGE MDPSTAT MDPVERIFY PATHCHK 
"      (2) Keywords that are followed by layer.
" TODO: UPDATE THIS AND SIMILAR
  syntax keyword calcommand  AND ANGLE COPY CUT DENSITY DONUT ENCLOSE EXTENT FLATTEN GROUP 
                          \  GROW HOLES INTERACT MERGE NOT OFFGRID POLYGON PUSH 
                          \  RECTANGLE ROTATE SHRINK SIZE VERTEX XOR 
                          \  nextgroup=callayer,caledge skipwhite
"            Currently off:  ATTACH CONNECT DEANGLE DISCONNECT NET OPCBIAS OPCLINEEND 
"                            OPCSBAR ORNET PINS PORTS SCONNECT SNAP STAMP TDDRC TOPEX 
"      (3) Keywords that are followed by a rule check.
  syntax keyword calcommand  GROUP nextgroup=calrulecheck skipwhite
"      (4) Keywords that are followed by numerical expressions.
" (5c) Command phrases.
  syntax match calcommand  "\<DRC CHECK MAP\>" nextgroup=calrulecheck skipwhite
  syntax match calcommand  "\<DRC \(UN\)\?SELECT CHECK\( BY LAYER\)\?\>" 
                           \nextgroup=calrulecheck skipwhite 
                           "TODO: can actually be followed by many rulechecks
"STOPPED EDITING HERE
"      (1)
syntax match calcommand  "\(\<CAPACITANCE ALIAS\>\|\<CAPACITANCE IGNORE\>\|\<CAPACITANCE ORDER\>\)"
syntax match calcommand  "\(\<CONVEX EDGE\>\|\<DENSITY CONVOLVE\>\|\<DEVICE LAYER\>\)"
syntax match calcommand  "\(\<DFM ANALYZE\>\|\<DFM CONNECTIVITY REDUNDANT\>\|\<DFM COPY\>\)"
syntax match calcommand  "\(\<DFM CREATE LAYER\>\|\<DFM CRITICAL AREA\>\|\<DFM DATABASE\>\)"
syntax match calcommand  "\(\<DFM EXPAND EDGE\>\|\<DFM EXPAND ENCLOSURE\>\|\<DFM FILL\>\)"
syntax match calcommand  "\(\<DFM FUNCTION\>\|\<DFM GROW\>\|\<DFM HISTOGRAM\>\|\<DFM MEASURE\>\)"
syntax match calcommand  "\(\<DFM PROPERTY\>\|\<DFM RDB\>\|\<DFM SELECT CHECK\>\)"
syntax match calcommand  "\<DFM SHIFT EDGE\>"
syntax match calcommand  "\(\<DFM SIZE\>\|\<DFM SPEC FILL\>\|\<DFM SPEC FILL OPTIMIZER\>\)"
syntax match calcommand  "\(\<DFM SPEC FILL SHAPE\>\|\<DFM SPEC SPATIAL SAMPLE\>\)"
syntax match calcommand  "\(\<DFM TRANSFORM\>\|\<DFM TRANSITION\>\|\<DRAWN ACUTE\>\)"
syntax match calcommand  "\(\<DRAWN ANGLED\>\|\<DRAWN OFFGRID\>\|\<DRAWN SKEW\>\)"
syntax match calcommand  "\(\<DRC CELL NAME\>\|\<DRC CELL TEXT\>\)"
syntax match calcommand  "\(\<DRC CHECK TEXT\>\|\<DRC EXCLUDE FALSE NOTCH\>\)"
syntax match calcommand  "\(\<DRC INCREMENTAL CONNECT\>\|\<DRC INCREMENTAL CONNECT WARNING\>\)"
syntax match calcommand  "\(\<DRC KEEP EMPTY\>\|\<DRC MAGNIFY RESULTS\>\|\<DRC MAP TEXT\>\)"
syntax match calcommand  "\(\<DRC MAP TEXT DEPTH\>\|\<DRC MAP TEXT LAYER\>\)"
syntax match calcommand  "\(\<DRC MAXIMUM CELL NAME LENGTH\>\|\<DRC MAXIMUM RESULTS\>\)"
syntax match calcommand  "\(\<DRC MAXIMUM VERTEX\>\|\<DRC PRINT AREA\>\|\<DRC PRINT PERIMETER\>\)"
syntax match calcommand  "\(\<DRC RESULTS DATABASE\>\|\<DRC RESULTS DATABASE LIBNAME\>\)"
syntax match calcommand  "\(\<DRC RESULTS DATABASE PRECISION\>\|\<DRC SUMMARY REPORT\>\)"
syntax match calcommand  "\(\<DRC TOLERANCE FACTOR\>\|\<DRC TOLERANCE FACTOR NAR\>\)"
syntax match calcommand  "\(\<ENCLOSE RECTANGLE\>\|\<ERC CELL NAME\>\|\<ERC CHECK TEXT\>\)"
syntax match calcommand  "\(\<ERC KEEP EMPTY\>\|\<ERC MAXIMUM RESULTS\>\|\<ERC MAXIMUM VERTEX\>\)"
syntax match calcommand  "\(\<ERC PATH ALSO\>\|\<ERC PATHCHK\>\|\<ERC RESULTS DATABASE\>\)"
syntax match calcommand  "\(\<ERC SELECT CHECK\>\|\<ERC SUMMARY REPORT\>\|\<ERC UNSELECT CHECK\>\)"
syntax match calcommand  "\(\<EXCLUDE ACUTE\>\|\<EXCLUDE ANGLED\>\|\<EXCLUDE CELL\>\)"
syntax match calcommand  "\(\<EXCLUDE OFFGRID\>\|\<EXCLUDE SKEW\>\|\<EXPAND CELL\>\)"
syntax match calcommand  "\(\<EXPAND CELL TEXT\>\|\<EXPAND TEXT\>\)"
syntax match calcommand  "\(\<EXTENT CELL\>\|\<EXTENT DRAWN\>\|\<FLAG ACUTE\>\|\<FLAG ANGLED\>\)"
syntax match calcommand  "\(\<FLAG OFFGRID\>\|\<FLAG SKEW\>\|\<FLATTEN CELL\>\)"
syntax match calcommand  "\(\<FLATTEN INSIDE CELL\>\|\<FRACTURE HITACHI\>\|\<FRACTURE JEOL\>\)"
syntax match calcommand  "\(\<FRACTURE MEBES\>\|\<FRACTURE MICRONIC\>\|\<FRACTURE NUFLARE\>\)"
syntax match calcommand  "\(\<FRACTURE VBOASIS\>\|\<INDUCTANCE MICHECK\>\|\<INDUCTANCE WIRE\>\)"
syntax match calcommand  "\(\<LABEL ORDER\>\|\<LAYER DIRECTORY\>\|\<LAYER RESOLUTION\>\)"
syntax match calcommand  "\(\<LAYOUT ALLOW DUPLICATE CELL\>\|\<LAYOUT BASE CELL\>\)"
syntax match calcommand  "\(\<LAYOUT BASE LAYER\>\|\<LAYOUT BUMP2\>\|\<LAYOUT CASE\>\)"
syntax match calcommand  "\(\<LAYOUT CELL LIST\>\|\<LAYOUT CLONE ROTATED PLACEMENTS\>\)"
syntax match calcommand  "\(\<LAYOUT CLONE TRANSFORMED PLACEMENTS\>\)"
syntax match calcommand  "\(\<LAYOUT DEPTH\>\|\<LAYOUT ERROR ON INPUT\>\|\<LAYOUT IGNORE TEXT\>\)"
syntax match calcommand  "\(\<LAYOUT INPUT EXCEPTION RDB\>\|\<LAYOUT INPUT EXCEPTION SEVERITY\>\)"
syntax match calcommand  "\(\<LAYOUT MAGNIFY\>\|\<LAYOUT MERGE ON INPUT\>\|\<LAYOUT PATH\>\)"
syntax match calcommand  "\(\<LAYOUT PATH2\>\|\<LAYOUT PLACE CELL\>\|\<LAYOUT POLYGON\>\)"
syntax match calcommand  "\(\<LAYOUT PRECISION\>\|\<LAYOUT PRESERVE CASE\>\)"
syntax match calcommand  "\(\<LAYOUT PRESERVE CELL LIST\>\|\<LAYOUT PRIMARY\>\)"
syntax match calcommand  "\(\<LAYOUT PRIMARY2\>\|\<LAYOUT PROCESS BOX RECORD\>\)"
syntax match calcommand  "\(\<LAYOUT PROCESS NODE RECORD\>\|\<LAYOUT PROPERTY AUDIT\>\)"
syntax match calcommand  "\(\<LAYOUT PROPERTY TEXT\>\|\<LAYOUT RENAME CELL\>\)"
syntax match calcommand  "\(\<LAYOUT RENAME TEXT\>\|\<LAYOUT SYSTEM\>\|\<LAYOUT SYSTEM2\>\)"
syntax match calcommand  "\(\<LAYOUT TEXT\>\|\<LAYOUT TOP LAYER\>\)"
syntax match calcommand  "\(\<LAYOUT USE DATABASE PRECISION\>\|\<LAYOUT WINDEL\>\)"
syntax match calcommand  "\(\<LAYOUT WINDEL CELL\>\|\<LAYOUT WINDEL LAYER\>\|\<LAYOUT WINDOW\>\)"
syntax match calcommand  "\(\<LAYOUT WINDOW CELL\>\|\<LAYOUT WINDOW CLIP\>\)"
syntax match calcommand  "\(\<LAYOUT WINDOW LAYER\>\|\<LITHO FILE\>\)"
"syntax match calcommand  "\<LVS ABORT ON ERC ERROR\>"
"syntax match calcommand  "\(\<LVS ABORT ON SOFTCHK\>\|\<LVS ABORT ON SUPPLY ERROR\>\)"
"syntax match calcommand  "\(\<LVS ALL CAPACITOR PINS SWAPPABLE\>\|\<LVS BOX\>\)"
"syntax match calcommand  "\(\<LVS BUILTIN DEVICE PIN SWAP\>\|\<LVS CELL LIST\>\)"
"syntax match calcommand  "\(\<LVS CELL SUPPLY\>\|\<LVS CHECK PORT NAMES\>\|\<LVS COMPARE CASE\>\)"
"syntax match calcommand  "\(\<LVS COMPONENT SUBTYPE PROPERTY\>\|\<LVS COMPONENT TYPE PROPERTY\>\)"
"syntax match calcommand  "\(\<LVS CPOINT\>\|\<LVS DEVICE TYPE\>\|\<LVS DISCARD PINS BY DEVICE\>\)"
"syntax match calcommand  "\(\<LVS DOWNCASE DEVICE\>\|\<LVS EXACT SUBTYPES\>\)"
"syntax match calcommand  "\(\<LVS EXCLUDE HCELL\>\|\<LVS EXECUTE ERC\>\)"
"syntax match calcommand  "\(\<LVS EXPAND SEED PROMOTIONS\>\|\<LVS EXPAND UNBALANCED CELLS\>\)"
"syntax match calcommand  "\(\<LVS FILTER\>\|\<LVS FILTER UNUSED BIPOLAR\>\)"
"syntax match calcommand  "\(\<LVS FILTER UNUSED CAPACITORS\>\|\<LVS FILTER UNUSED DIODES\>\)"
"syntax match calcommand  "\(\<LVS FILTER UNUSED MOS\>\|\<LVS FILTER UNUSED OPTION\>\)"
"syntax match calcommand  "\(\<LVS FILTER UNUSED RESISTORS\>\|\<LVS GLOBAL LAYOUT NAME\>\)"
"syntax match calcommand  "\(\<LVS GLOBALS ARE PORTS\>\|\<LVS GROUND NAME\>\)"
"syntax match calcommand  "\(\<LVS HEAP DIRECTORY\>\|\<LVS IGNORE PORTS\>\)"
"syntax match calcommand  "\(\<LVS IGNORE TRIVIAL NAMED PORTS\>\|\<LVS INJECT LOGIC\>\)"
"syntax match calcommand  "\(\<LVS ISOLATE SHORTS\>\|\<LVS MAP DEVICE\>\)"
"syntax match calcommand  "\(\<LVS NETLIST ALL TEXTED PINS\>\)"
"syntax match calcommand  "\(\<LVS NETLIST ALLOW INCONSISTENT MODEL\>\)"
"syntax match calcommand  "\(\<LVS NETLIST BOX CONTENTS\>\|\<LVS NETLIST COMMENT CODED SUBSTRATE\>\)"
"syntax match calcommand  "\(\<LVS NETLIST UNNAMED BOX PINS\>\|\<LVS NL PIN LOCATIONS\>\)"
"syntax match calcommand  "\(\<LVS NON USER NAME\>\|\<LVS OUT OF RANGE EXCLUDE ZERO\>\)"
"syntax match calcommand  "\(\<LVS PERC LOAD\>\|\<LVS PERC NETLIST\>\|\<LVS PERC PROPERTY\>\)"
"syntax match calcommand  "\(\<LVS PERC REPORT\>\|\<LVS PIN NAME PROPERTY\>\|\<LVS POWER NAME\>\)"
"syntax match calcommand  "\(\<LVS PRECISE INTERACTION\>\|\<LVS PRESERVE FLOATING TOP NETS\>\)"
"syntax match calcommand  "\(\<LVS PRESERVE PARAMETERIZED CELLS\>\|\<LVS PROPERTY INITIALIZE\>\)"
"syntax match calcommand  "\(\<LVS PROPERTY MAP\>\|\<LVS PROPERTY RESOLUTION MAXIMUM\>\)"
"syntax match calcommand  "\(\<LVS PUSH DEVICES\>\|\<LVS RECOGNIZE GATES\>\)"
"syntax match calcommand  "\(\<LVS RECOGNIZE GATES TOLERANCE\>\|\<LVS REDUCE\>\)"
"syntax match calcommand  "\(\<LVS REDUCE PARALLEL BIPOLAR\>\|\<LVS REDUCE PARALLEL CAPACITORS\>\)"
"syntax match calcommand  "\(\<LVS REDUCE PARALLEL DIODES\>\|\<LVS REDUCE PARALLEL MOS\>\)"
"syntax match calcommand  "\(\<LVS REDUCE PARALLEL RESISTORS\>\|\<LVS REDUCE SEMI SERIES MOS\>\)"
"syntax match calcommand  "\(\<LVS REDUCE SERIES CAPACITORS\>\|\<LVS REDUCE SERIES MOS\>\)"
"syntax match calcommand  "\(\<LVS REDUCE SERIES RESISTORS\>\|\<LVS REDUCE SPLIT GATES\>\)"
"syntax match calcommand  "\(\<LVS REDUCTION PRIORITY\>\|\<LVS REPORT\>\|\<LVS REPORT MAXIMUM\>\)"
"syntax match calcommand  "\(\<LVS REPORT OPTION\>\|\<LVS REPORT UNITS\>\)"
"syntax match calcommand  "\(\<LVS REPORT WARNINGS HCELL ONLY\>\|\<LVS REPORT WARNINGS TOP ONLY\>\)"
"syntax match calcommand  "\(\<LVS REVERSE WL\>\|\<LVS SHOW SEED PROMOTIONS\>\)"
"syntax match calcommand  "\(\<LVS SHOW SEED PROMOTIONS MAXIMUM\>\|\<LVS SIGNATURE MAXIMUM\>\)"
"syntax match calcommand  "\(\<LVS SOFT SUBSTRATE PINS\>\|\<LVS SOFTCHK\>\)"
"syntax match calcommand  "\(\<LVS SPICE ALLOW DUPLICATE SUBCIRCUIT NAMES\>\)"
"syntax match calcommand  "\(\<LVS SPICE ALLOW FLOATING PINS\>\)"
"syntax match calcommand  "\(\<LVS SPICE ALLOW INLINE PARAMETERS\>\)"
"syntax match calcommand  "\(\<LVS SPICE ALLOW UNQUOTED STRINGS\>\|\<LVS SPICE CONDITIONAL LDD\>\)"
"syntax match calcommand  "\(\<LVS SPICE CULL PRIMITIVE SUBCIRCUITS\>\)"
"syntax match calcommand  "\(\<LVS SPICE IMPLIED MOS AREA\>\|\<LVS SPICE MULTIPLIER NAME\>\)"
"syntax match calcommand  "\(\<LVS SPICE OPTION\>\|\<LVS SPICE OVERRIDE GLOBALS\>\)"
"syntax match calcommand  "\(\<LVS SPICE PREFER PINS\>\|\<LVS SPICE REDEFINE PARAM\>\)"
"syntax match calcommand  "\(\<LVS SPICE RENAME PARAMETER\>\|\<LVS SPICE REPLICATE DEVICES\>\)"
"syntax match calcommand  "\(\<LVS SPICE SLASH IS SPACE\>\|\<LVS SPICE STRICT WL\>\)"
"syntax match calcommand  "\(\<LVS SPLIT GATE RATIO\>\|\<LVS STRICT SUBTYPES\>\)"
"syntax match calcommand  "\(\<LVS WRITE INJECTED LAYOUT NETLIST\>\)"
"syntax match calcommand  "\(\<LVS WRITE INJECTED SOURCE NETLIST\>\|\<LVS WRITE LAYOUT NETLIST\>\)"
"syntax match calcommand  "\<LVS WRITE SOURCE NETLIST\>"
syntax match calcommand  "\<MASK RESULTS DATABASE\>"
syntax match calcommand  "\(\<MASK SVDB DIRECTORY\>\|\<MDP CHECKMAP\>\|\<MDP EMBED\>\)"
syntax match calcommand  "\(\<MDP MAPSIZE\>\|\<NET AREA\>\|\<NET AREA RATIO\>\)"
syntax match calcommand  "\(\<NET AREA RATIO PRINT\>\|\<NOT ANGLE\>\|\<NOT AREA\>\|\<NOT CUT\>\)"
syntax match calcommand  "\(\<NOT DONUT\>\|\<NOT ENCLOSE\>\|\<NOT ENCLOSE RECTANGLE\>\)"
syntax match calcommand  "\(\<NOT INTERACT\>\|\<NOT LENGTH\>\|\<NOT NET\>\|\<NOT RECTANGLE\>\)"
syntax match calcommand  "\(\<NOT WITH EDGE\>\|\<NOT WITH NEIGHBOR\>\|\<NOT WITH TEXT\>\)"
syntax match calcommand  "\(\<NOT WITH WIDTH\>\|\<OR EDGE\>\|\<PARASITIC VARIATION\>\)"
syntax match calcommand  "\<PATH LENGTH\>"
"syntax match calcommand  "\<PEX ALIAS\>\|\<PEX BA MAPFILE\>"
"syntax match calcommand  "\(\<PEX BULK LAYER\>\|\<PEX CONTACT CAPACITANCE\>\|\<PEX CORNER\>\)"
"syntax match calcommand  "\(\<PEX CORNER CUSTOM\>\|\<PEX DEF EXTRACT CELL OBSTRUCTIONS\>\)"
"syntax match calcommand  "\(\<PEX DENSITY ESTIMATE\>\|\<PEX DENSITY WINDOW\>\|\<PEX DRIVER FILE\>\)"
"syntax match calcommand  "\(\<PEX ELAYER\>\|\<PEX EXCLUDE DISTRIBUTED\>\|\<PEX EXCLUDE LUMPED\>\)"
"syntax match calcommand  "\(\<PEX EXTRACT FLOATING NETS\>\|\<PEX EXTRACT TEMPERATURE\>\)"
"syntax match calcommand  "\(\<PEX FILL HANDLING\>\|\<PEX GENERATE DRIVER_FILE TAG\>\)"
"syntax match calcommand  "\(\<PEX GROUND\>\|\<PEX GROUND LAYER\>\|\<PEX IDEAL XCELL\>\)"
"syntax match calcommand  "\(\<PEX IGNORE CAPACITANCE\>\|\<PEX IGNORE RESISTANCE\>\)"
"syntax match calcommand  "\(\<PEX INCLUDE DISTRIBUTED\>\|\<PEX INCLUDE LUMPED\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE DEFAULT PI\>\|\<PEX INDUCTANCE DIFFERENTIAL PAIR\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE DOPROCESS\>\|\<PEX INDUCTANCE FILTER\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE FREQUENCY\>\|\<PEX INDUCTANCE FREQUENCY\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE PARAMETERS\>\|\<PEX INDUCTANCE RANGE\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE RETURNPATH\>\|\<PEX INDUCTANCE SELF\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE SWITCH_TIME\>\|\<PEX INDUCTANCE SWITCH_TIME\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE VICTIM\>\|\<PEX INDUCTANCE VICTIM_PATH\>\)"
"syntax match calcommand  "\(\<PEX INDUCTANCE VICTIM_FILE\>\|\<PEX MAGNIFY\>\|\<PEX NETLIST ADMS\>\)"
"syntax match calcommand  "\(\<PEX NETLIST CHARACTER MAP\>\|\<PEX NETLIST CONNECTION SECTION\>\)"
"syntax match calcommand  "\(\<PEX NETLIST DISTRIBUTED\>\|\<PEX NETLIST LUMPED\>\)"
"syntax match calcommand  "\(\<PEX NETLIST POSITION FILE\>\)"
"syntax match calcommand  "\(\<PEX NETLIST REPLICATED_DEVICE DELIMITER\>\)"
"syntax match calcommand  "\(\<PEX NETLIST SCHEMATICONLY\>\|\<PEX NETLIST SIMPLE\>\)"
"syntax match calcommand  "\(\<PEX NETLIST SMASHED_DEVICE DELIMITER\>\)"
"syntax match calcommand  "\(\<PEX NETLIST SUBNODE SECTION\>\|\<PEX PIN ORDER\>\|\<PEX POWER\>\)"
"syntax match calcommand  "\(\<PEX PROBE FILE\>\|\<PEX PROFILE\>\|\<PEX REDUCE ANALOG\>\)"
"syntax match calcommand  "\(\<PEX REDUCE CC\>\|\<PEX REDUCE DIGITAL\>\|\<PEX REDUCE DISTRIBUTED\>\)"
"syntax match calcommand  "\(\<PEX REDUCE MINCAP\>\|\<PEX REDUCE MINRES\>\|\<PEX REDUCE RONLY\>\)"
"syntax match calcommand  "\(\<PEX REDUCE TICER\>\|\<PEX REDUCE VIA RESISTANCE\>\)"
"syntax match calcommand  "\(\<PEX REPORT COUPLING CAPACITANCE\>\|\<PEX REPORT DISTRIBUTED\>\)"
"syntax match calcommand  "\(\<PEX REPORT LUMPED\>\|\<PEX REPORT NETSUMMARY\>\)"
"syntax match calcommand  "\(\<PEX REPORT POINT2POINT\>\|\<PEX RESISTANCE PARAMETERS\>\)"
"syntax match calcommand  "\(\<PEX SENSITIVITY\>\|\<PEX SKIN INCLUDE\>\|\<PEX SLOTS HANDLING\>\)"
"syntax match calcommand  "\(\<PEX TEMPERATURE\>\|\<PEX THICKNESS EQN\>\|\<PEX THICKNESS NOMINAL\>\)"
"syntax match calcommand  "\(\<PEX THRESHOLD\>\|\<PEX TOLERANCE DISTRIBUTED\>\)"
"syntax match calcommand  "\(\<PEX VIA CAPACITANCE\>\|\<PEX VIA REDUCTION RESISTANCE\>\)"
"syntax match calcommand  "\<PEX XCELL EXTRACT MODE\>"
syntax match calcommand  "\(\<PORT DEPTH\>\|\<PORT LAYER POLYGON\>\)"
syntax match calcommand  "\(\<PORT LAYER TEXT\>\|\<PUSH CELL\>\|\<RECTANGLE ENCLOSURE\>\)"
syntax match calcommand  "\(\<RESISTANCE CONNECTION\>\|\<RESISTANCE DEVICE_SEED\>\)"
syntax match calcommand  "\(\<RESISTANCE RHO\>\|\<RESISTANCE SHEET\>\|\<SNAP OFFGRID\>\)"
syntax match calcommand  "\(\<SOURCE CASE\>\|\<SOURCE PATH\>\|\<SOURCE PRIMARY\>\)"
syntax match calcommand  "\(\<SOURCE SYSTEM\>\|\<SVRF ERROR\>\|\<SVRF MESSAGE\>\)"
syntax match calcommand  "\(\<SQUARE ORTHOGONAL\|\<SVRF VERSION\>\|\<TEXT DEPTH\>\|\<TEXT LAYER\>\)"
syntax match calcommand  "\(\<TEXT PRINT MAXIMUM\>\|\<TOUCH EDGE\>\|\<TRACE PROPERTY\>\)"
syntax match calcommand  "\(\<UNIT CAPACITANCE\>\|\<UNIT INDUCTANCE\>\|\<UNIT LENGTH\>\)"
syntax match calcommand  "\(\<UNIT RESISTANCE\>\|\<UNIT TIME\>\|\<VIRTUAL CONNECT BOX COLON\>\)"
syntax match calcommand  "\(\<VIRTUAL CONNECT BOX NAME\>\|\<VIRTUAL CONNECT COLON\>\)"
syntax match calcommand  "\(\<VIRTUAL CONNECT DEPTH\>\|\<VIRTUAL CONNECT NAME\>\)"
syntax match calcommand  "\(\<VIRTUAL CONNECT REPORT\>\|\<VIRTUAL CONNECT SEMICOLON AS COLON\>\)"
syntax match calcommand  "\(\<WITH EDGE\>\|\<WITH NEIGHBOR\>\|\<WITH TEXT\>\|\<WITH WIDTH\>\)"

" (6) Options.
" (6a) Special regex for options that suffer from syntax issues (command-option confusion, 
"      keyword/phrase confusion, etc.).
syntax keyword caloption  INIT[IALIZE] PROJ[ECTING] PARA[LLEL] PERP[ENDICULAR]
syntax match   caloption  "\<MEASURE COIN\(CIDENT\)\?\>"
syntax match   caloption  "\<\(LAYER \)\@<!MAP\>"
syntax match   caloption  "\<INSIDE OF\( LAYER\| EXTENT\)\?\>"
syntax match   caloption  "\(^ *\)\@<!LAYOUT"
syntax match   caloption  "\(^ *\)\@<!TOL"
syntax match   caloption  "\<\(NONSIMPLE \)\@<!PATH\>"
syntax match   caloption  "\<SVRF\( MESSAGE\| ERROR\| VERSION\)\@!\>"
syntax match   caloption  "\<TOL\(ERANCE\)\?\( STR\(ING\)\?\)\?\>"
syntax match   caloption  "\<WITH\( EDGE\| NEIGHBOR\| TEXT\| WIDTH\)\@!"
syntax match   caloption  "\<\(DFM \)\@<!PROP\(ERTY\)\?\>"
syntax match   caloption  "\(^\s*\)\@<!\<PERIM\(ETER\)\?(\@<!\>"
syntax match   caloption  "\<REGION\( EXTENTS\| CENTERLINE\)\?\>"
syntax match   caloption  "\<EDGE\>"
" (6b) Option keywords.
syntax keyword caloption  BY CENTERS EXTENDED OFFSET STRIPE nextgroup=calvariable skipwhite
"SWITCH ALL TO THIS METHOD
"SHOULD 'BY' BE A KEYWORD?  THERE ARE OTHER BY COMBINATIONS THAT DO NOT FIT THIS USAGE.  CHECK nextgroup documentation.
"ELIMINATE ALL PHRASES THAT ARE COMBINATIONS OF KEYWORDS.
"SEPARATE AND COMMENT OUT ONES THAT ARE USELESS FOR US
syntax keyword caloption  ABSOLUTE ABUT ACCUMULATE ADVANCED ALL ALLDEPTH ALSO ANALYZE ANGLED APPEND
syntax keyword caloption  APPROX AREA_RATIO AREF AREF_PLACEMENT ARRAY_PITCH_ZERO ASCII ASPECT 
syntax keyword caloption  AUTO AUTOREF AUTOROTATE BAD BASE BASIC BEFORECLEANUP BEVEL BINS 
syntax keyword caloption  BIPOLAR BLACK BLOCK BOTTOM BOX_RECORD BREAKNAME BULKRESISTANCE CALIBREVIEW
syntax keyword caloption  CAPACITOR CASE CBCLASSIFY CBLOCK CCI CELL CELLS CELLNAME_NSTRING CENTER 
syntax keyword caloption  CENTERLINE CENTERMERGE CHECKNAME CIRCLE CIRCLE_RADIUS_ZERO CLEANSBLAYER 
syntax keyword caloption  CLOSEREDGE CLOSERSYMMETRIC CNET COLINEARIZE COLUMNS COMBINE COMMENTS 
syntax keyword caloption  CONNECTED CONNECTION CONTACT CONVERGENCE CONVOLUTION_GRID COORD 
syntax keyword caloption  CORNER CORNERFILL COUNT COUNT_THRESHOLD COVERAGE CTRAPEZOID_AREA_ZERO 
syntax keyword caloption  CTRAPEZOID_DEGENERATE DATABASE DATATYPE DATATYPE_MAP DATATYPE_MAP_SOURCE
syntax keyword caloption  DATATYPE_MAP_TARGET DEFAULT DELAY_ERROR DELTA DETAIL DEVICES DIODE 
syntax keyword caloption  DIRECT DISTANCE DSPF DUPLICATE_CELL DUPLICATES DV DX EFFORT ELDO ELSE 
syntax keyword caloption  EMPTY EMPTY_LAYER ENABLE ENC2 ENDPOINT ENVIRONMENT ERROR EVEN EXCLUDE_CELL_NAME 
syntax keyword caloption  EXTEND EXTENSION EXTENT_CELL FACTOR FILE FILE_OPEN FILE_READ 
syntax keyword caloption  FILENAME FILL FILLEDONLY FILLMIN FILLSHAPE FLAGACUTE FLAGOFFGRID 
syntax keyword caloption  FLAGSKEW FLAT FLIPX FLIPY FLOATING FRINGE FULL GANDP GDS GDS2 GDSII 
syntax keyword caloption  GRADIENT GRID GROUND GROUNDED GROUNDNAME GWINDOW HDB HEIGHT HIER 
syntax keyword caloption  HITACHI2DB HITACHI2HITACHI HSPICE ID IGNORE IGNORE_PORT_TEXT 
syntax keyword caloption  IMPLICITBIAS IN INIT INJECTION INNER INSIDE_CELL INSTANCE INTERSECTING 
syntax keyword caloption  INTERSECTION INTRINSIC ITERATIONS IXF JEOL2DB JEOL2HITACHI LABELNAME 
syntax keyword caloption  LAYER_DIRECTORY LAYER_OVER_BUMP LAYOUT_POLYGON LAYOUT_TEXT LEFDEF LEFT 
syntax keyword caloption  LENGTH1 LENGTH2 LIGHT LINEAR LINEENDMERGE LINEENDOFFSET LINEENDSPACE 
syntax keyword caloption  LINEENDTOLONGSPACE LINK LOCAL LOCATE LOCATION LOWER MAG MAGNITUDE 
syntax keyword caloption  MAPNUMBER MASK MAXAREA MAXIMUM MAXLENGTH MAXSBLENGTH MAXSBWIDTH 
syntax keyword caloption  MEASURE MEBES2DB MEBES2JEOL MEBES2MEBES METRIC_INPUT_FILE 
syntax keyword caloption  METRIC_RULE_FILE MICRONIC2DB MICRONIC2MICRONIC MIN MINBIASLENGTH 
syntax keyword caloption  MINEDGELENGTH MINIMUM MINJOGWIDTH MINSBLENGTH MINSBOFFSET MINSBSPACE 
syntax keyword caloption  MINSBWIDTH MISSEDONLY MULTI MY_ORC NAME NAMES NEGATIVE NETFILE 
syntax keyword caloption  NETLIST NETS NO NOCLEANUP NOCONTACT NODAL NODE_RECORD NOEMPTY NOFILTERX 
syntax keyword caloption  NOFLAT NOFLOAT NOHIER NOISE_ERROR NOLUMPED NOMINALT NONE NOPROBE 
syntax keyword caloption  NOPSEUDO NOXANNOTATE NUMBER NUMWIN NXF OASIS OCCUPIED OFF 
syntax keyword caloption  OFFSETLAYER OMN ON ONLY OPC OPEN OPENACCESS OPENT OPENVIA OPENWIRE 
syntax keyword caloption  OPPOSITE OPTIMIZER OPTIONS ORC ORDERED ORIGINAL OTHER OUT OUTPUT 
  syntax keyword caloption  OUTPUT1 OUTPUT2 OUTPUT3 OVER OVERLAP OVERUNDER OVERWRITE PARALLEL 
  syntax keyword caloption  PARAM PATH_ACUTE PATH_ANGLED PATH_BIG PATH_CIRCULAR PATH_COINCIDENT 
  syntax keyword caloption  PATH_DEGENERATE PATH_ENDSEGMENT_SHORT PATH_EXTENSION PATH_NONORIENTABLE 
  syntax keyword caloption  PATH_NONSIMPLE PATH_SPIKE PATH_WIDTH_ABSOLUTE PATH_WIDTH_ZERO PE PHDB
  syntax keyword caloption  PINLOC PLACE PLACEMENT_ANGLE_ABSOLUTE PLACEMENT_MAGNIFICATION_ABSOLUTE 
  syntax keyword caloption  PLACEMENT_MAGNIFICATION_NONPOSITIVE PMOS POLYFILL POLYGON_DEGENERATE 
  syntax keyword caloption  POLYGON_IS_RECTANGLE POLYGON_NONORIENTABLE POLYGON_NONSIMPLE 
  syntax keyword caloption  POLYGON_NOT_CLOSED POLYGONAL POLYGONS PORT PORTMERGE POWERNAME PREC 
  syntax keyword caloption  PRECISION_INPUT_FILE PRECISION_LAYOUT PRECISION_RULE_FILE PREFIX 
  syntax keyword caloption  PRIMARY PRIMETIME PRINT PRINTIMAGE PROFILE PROJECTING PROPNAME_NSTRING 
  syntax keyword caloption  PROTECT PRUNE PSEUDO QUERY RADIUS RANGE RAREA RATIO RC RCNAMED 
  syntax keyword caloption  RDB RECTANGLE_SIDE_ZERO RECTFILL REDUCTION REDUNDANT REFERENCE 
  syntax keyword caloption  RELATIVE RENAME REPEAT REPLACE REPORT RESULTS REVISIONS RFI RIGHT 
  syntax keyword caloption  RINDEX RLAYER RLENGTH RLOCATION RONLY ROTATION RSCALE RTHICKNESS 
  syntax keyword caloption  RTYPE1 RULES RWIDTH SBLAYER SBOFFSET SBWIDTH SCALE SELECT SEPARATOR 
  syntax keyword caloption  SEQUENTIAL SERIES SHAPESPACE SHAPE_FACTOR SHIELDED SHORT SI SIGNATURE 
  syntax keyword caloption  SIMPLE SINGULAR SKEW SLPH SMALLOUTSIDETRAP SOURCE SPACE SPACING 
syntax keyword caloption  SPARSIFY SPECTRE SPEF SPLINE SPLIT_NET SQUARE SQUARES STANDARD START 
syntax keyword caloption  STEP STRETCHFILL STRICT STRICTCENTER STRING SUB SUBCKT SUBTYPES 
syntax keyword caloption  SUPPRESS TABLE TC1 TC2 TCOEFF TEMPERATURE TEXT_BIG TEXT_DEGENERATE 
syntax keyword caloption  TEXTSTRING_ASTRING TEXTTAG TEXTTYPE THRESHOLD TIE TO TOP TOP_CELL_CHOSEN
syntax keyword caloption  TOP_CELL_EXCLUDED TOP_CELL_MISSING TOPLEVEL TRANSITION 
syntax keyword caloption  TRAPEZOID_AREA_ZERO TRAPEZOID_DEGENERATE TRUNCATE TYPES UNCLASSIFIED 
syntax keyword caloption  UNDEROVER UNIQUE UNMERGED UNUSED_DATA UPPER USER VALUES VARIATION 
syntax keyword caloption  VBOASIS2HITACHI VBOASIS2JEOL VBOASIS2VBOASIS VERTICAL VIA VIALAYER WIDTH 
syntax keyword caloption  WIDTH2 WINDOW WITHWIDTH WRAP XALSO XDB XELEMENT_UNSUPPORTED XFORM 
syntax keyword caloption  XGEOMETRY_UNSUPPORTED XNAME_UNSUPPORTED XRC YES
" (6c) Option phrases.
syntax match caloption  "\(\<ABORT LVS\>\|\<ANNOTATE DEVICES\>\)"
syntax match caloption  "\(\<BY CELL\>\|\<BY EXCEPTION\>\|\<BY EXTENT\>\)"
syntax match caloption  "\(\<BY GATE\>\|\<BY LAYER\>\|\<BY NET\>\|\<BY POLYGON\>\)"
syntax match caloption  "\(\<BY RECTANGLE\>\|\<CASE SENSITIVE\>\|\<CELL LIST\>\|\<CELL SPACE\>\)"
syntax match caloption  "\(\<CELL UNIQUE ERROR NUMBER CUTOFF\>\|\<COPY DUPL_SUPPRESSED\>\)"
syntax match caloption  "\(\<CORNER FILL\>\|\<COUNT ONLY\>\|\<DATABASE RULES\>\|\<EXCLUDE EDGE\>\)"
syntax match caloption  "\(\<EXCLUDE FALSE\>\|\<EXCLUDE SHIELDED\>\|\<EXCLUDE SUPPLY\>\)"
syntax match caloption  "\(\<EXCLUDE UNUSED\>\|\<EXIT NONEMPTY\>\|\<EXTEND BY\>\|\<FILE TAG\>\)"
syntax match caloption  "\(\<FRACTURE MICRONIC POLY FILE\>\|\<IGNORE PRIMARY\>\|\<INSIDE BY\>\)"
syntax match caloption  "\(\<JOG FILL\>\|\<LEFT RIGHT\>\|\<LOCALE CONTEXT1 CONTEXT2\>\)"
syntax match caloption  "\(\<MAINTAIN SPACING\>\|\<MASK DIRECT\>\)"
syntax match caloption  "\(\<MATCH REFLECTIONS ROTATIONS\>\|\<MAXIMUM ERROR NUMBER\>\)"
syntax match caloption  "\(\<MAXIMUM RESULTS\>\|\<MAXIMUM VERTICES\>\|\<MAXIMUM WARNINGS\>\)"
syntax match caloption  "\(\<MEASURE ALL\>\|\<METRIC SQUARE\>\|\<MIX SUBTYPES\>\|\<MIX TYPES\>\)"
syntax match caloption  "\(\<NETLIST ELEMENT\>\|\<NETLIST MODEL\>\|\<NO CONTACTS\>\)"
syntax match caloption  "\(\<OCTAGONAL ONLY\>\)"
syntax match caloption  "\(\<OPTION ACUTE_ANGLE_ABUT\>\|\<OPTION IMPLICIT_METRIC\>\)"
syntax match caloption  "\(\<ORTHOGONAL ONLY\>\|\<OPPOSITE SYMMETRIC\>\)"
syntax match caloption  "\(\<OPPOSITE EXTENDED SYMMETRIC\>\|\<OPPOSITE EXTENDED FSYMMETRIC\>\)"
syntax match caloption  "\(\<OPPOSITE EXTENDED1\>\|\<OPPOSITE EXTENDED2\>\|\<OUTSIDE ALSO\>\)"
syntax match caloption  "\(\<OUTSIDE BY\>\|\<OVERLAP ONLY\>\|\<PERIMETER ONLY\>\)"
syntax match caloption  "\(\<POLYGONS NETS\>\|\<PORTS ALSO\>\|\<PRIMARY ONLY\>\|\<PRINT NETS\>\)"
syntax match caloption  "\(\<PRINT POLYGONS\>\|\<PRIORITIZE BY LAYER\>\|\<REGION OCTAGONAL\>\)"
syntax match caloption  "\(\<SAME CELL\>\|\<SAME ORDER\>\|\<SCALE BY\>\)"
syntax match caloption  "\(\<SEMI ALSO\>\|\<SEPARATE PROPERTIES\>\|\<SOURCE LAYOUT\>\)"
syntax match caloption  "\(\<SP ALSO\>\|\<SPATIAL SAMPLE\>\|\<TEXT MODEL LAYER\>\)"
syntax match caloption  "\(\<TEXT PROPERTY LAYER\>\|\<TOLERANCE FACTOR\>\)"
syntax match caloption  "\(\<USER MERGED\>\|\<WITH LAYER\>\|\<WITH LENGTH\>\)"
syntax match caloption  "\(\<WITH MATCH\>\|\<WITHIN TOLERANCE\>\)"

" (7) Functions.
syntax region calfunction  start="\<AREA("             end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<COUNT("            end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<EC("               end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<ECMAX("            end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<ECMIN("            end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<EW("               end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<FLOOR("            end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<FMAX("             end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<FMIN("             end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<FMOD("             end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<LENGTH("           end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<MAX("              end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<MIN("              end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<PERIMETER[XY]\?("  end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<PROPERTY("         end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<PROPERTY_REF"      end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<REMAINDER("        end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<SQRT("             end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<SUM("              end=")"  contains=calfunction  keepend
syntax region calfunction  start="\<VECTOR("           end=")"  contains=calfunction  keepend
"     Match arithmetical operators (+-*/), but exclude //, /*, and */.
syntax match  calfunction  "\([-+\*^]\|[/\*]\@<!/[/\*]\@!\)" contains=calfunction
"     Match any parenthetical expression with no caps and containing [+-*/^] (but not //).
syntax match  calfunction  "([^)A-Z]*\([-+\*^]\|/\@<!//\@!\)[^)A-Z]*)" contains=calfunction
"TODO: THIS NEEDS TO BE A REGION TO NEST PROPERLY.
"TODO: IF SO, HOW GUARANTEE THAT CONTAINS +- ETC.?
"     Currently not used.
"syntax region calfunction  start="\<CONCAT("                         end=")"  contains=calfunction
"syntax region calfunction  start="\<COS("                            end=")"  contains=calfunction
"syntax region calfunction  start="\<DFM_NUM\(ERIC\)\?_ARR\(AY\)\?("  end=")"  contains=calfunction
"syntax region calfunction  start="\<DFM_NUM\(ERIC\)\?_VAL\(UE\)\?("  end=")"  contains=calfunction
"syntax region calfunction  start="\<DFM_VEC\(TOR\)\?_ARR\(AY\)\?("   end=")"  contains=calfunction
"syntax region calfunction  start="\<DFM_VEC\(TOR\)\?_VAL\(UE\)\?("   end=")"  contains=calfunction
"syntax region calfunction  start="\<EXP("                            end=")"  contains=calfunction
"syntax region calfunction  start="\<LOG("                            end=")"  contains=calfunction
"syntax region calfunction  start="\<SIN("                            end=")"  contains=calfunction
"syntax region calfunction  start="\<SORT_MERGE_XXY("                 end=")"  contains=calfunction
"syntax region calfunction  start="\<TAN("                            end=")"  contains=calfunction

" (8) Highlight > 100 columns.
if ((@% !~ '\(^\|.*/\)input_.*') && (@% !~ '\(^\|.*/\)output_.*')) 
 \ || (@% =~ '\(^\|.*/\)input_proc.drc')
  match Error "\%>100v."
endif

" (9) Highlighting groups.  Note: All numerical expressions (including functions and constraints)
"     match Number, but this can be modified by user.  Also, I treat INCLUDE as part of the 
"     preprocessor (which I believe is more technically correct than the Calibre notation implies).
"     (1) Groups from section 1.
highlight calcomment     cterm=NONE  ctermfg=251
highlight caltodo        cterm=NONE  ctermfg=Black  ctermbg=Yellow
highlight calignore      cterm=NONE  ctermfg=232
highlight callater       cterm=NONE  ctermfg=White  ctermbg=DarkGray
"     (2) Groups from section 2.
highlight callayer       cterm=NONE  ctermfg=228
highlight caledge        cterm=NONE  ctermfg=179
highlight calcluster     cterm=NONE  ctermfg=174
highlight calvariable    cterm=NONE  ctermfg=LightGreen
highlight calrulecheck   cterm=NONE  ctermfg=251
highlight calenvvar      cterm=NONE  ctermfg=027
"     (3) Groups from section 3.
highlight calpreproc     cterm=NONE  ctermfg=027
highlight calinclude     cterm=NONE  ctermfg=027
"     (4) Groups from section 4.
highlight calstring      cterm=NONE  ctermfg=LightGreen
highlight calnumber      cterm=NONE  ctermfg=LightGreen
highlight calconstraint  cterm=NONE  ctermfg=LightGreen
"     (5) Groups from sections 5-7.
highlight calcommand     cterm=NONE  ctermfg=Cyan
highlight calcombraces   cterm=NONE  ctermfg=Cyan
highlight caloption      cterm=NONE  ctermfg=147
highlight calfunction    cterm=NONE  ctermfg=LightGreen
"     (6) Miscellaneous highlighting instructions.
syntax sync lines=50
let b:current_syntax = "calibre"

" Old code:
" Matches all arithmetic expressions after VARIABLE name: syntax match calnumber
   "\(VARIABLE\s\+\)\@<=[a-z][a-z_0-9]\+\s\+\([a-z)(\-]\([a-z0-9_+\-\*/ )(.]\|/\@<!//\@!\)*\)\?"
" syntax match calnumber "\(\(BY\|OFFSET\)\s\+\)\@<=[a-z)(\-]\([a-z0-9_+\-\* ]\|/\@<!//\@!\)\+"
