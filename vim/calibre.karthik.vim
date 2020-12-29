" Vim syntax file
" Language: Calibre

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "calibre"

" Ignore case
syntax case ignore


"syntax keyword example SIZE EXTENT

" Comment
syntax region calibreComment start=/\v\/\*/ end=/\v\*\// contains=@Spell
syntax match calibreComment /\v\/\/.*/ contains=@Spell

highlight default link calibreComment Comment

" Constant
"   String
syntax match calibreStringConstant /\v"[^"$]*"/ contains=@Spell

highlight default link calibreStringConstant String

"   Character
"   Number
"   Boolean
"   Float
syntax match calibreFloatConstant /\v<\d*\.?\d+>/

highlight default link calibreFloatConstant Float


" Identifier
"   Function
syntax match calibreFunctionIdentifier /\v([cd]macro\s+)@<=\S+/

highlight default link calibreFunctionIdentifier MACRO
"Function

" Statement
"   Conditional
"   Repeat
"   Label
"   Operator
"   Keyword
syntax match calibreKeywordStatement /\v^\s*[cd]macro/ nextgroup=calibreFunctionIdentifier

highlight default link calibreKeywordStatement Keyword

"   Exception

" PreProc
"   Include
syntax match calibreIncludePreProc /\v^\s*include(\s+\S+){1}/

highlight default link calibreIncludePreProc Include

"   Define
syntax match calibreDefinePreproc /\v^\s*#define(\s+\S+){1,2}/ contains=calibreComment
syntax match calibreDefinePreproc /\v^\s*#undefine(\s+\S+){1}/ contains=calibreComment

highlight default link calibreDefinePreproc Define

"   Macro
"   Precondit
syntax match calibrePreconditPreProc /\v^\s*#ifdef(\s+\S+){1,2}/ contains=calibreComment
syntax match calibrePreconditPreProc /\v^\s*#else/
syntax match calibrePreconditPreProc /\v^\s*#endif/

highlight default link calibrePreconditPreProc Precondit

" Type
"   StorageClass
"syntax keyword calibreKeywordStatement variable SIZE EXTENT

"highlight default link calibreKeywordStatement StorageClass

"   Structure
"   Typedef

" Special
"   SpecialChar
"   Tag
"   Delimiter
"   SpecialComment
"   Debug

" Underlined

" Ignore

" Error

" Todo


syntax keyword calibreKeywordStatement  DEV[ICE] EXPAND EDGE OUT[SIDE] IN[SIDE] OR
syntax keyword calibreKeywordStatement  ENC[LOSURE] EXT[ERNAL] INT[ERNAL]
syntax keyword calibreKeywordStatement  LITHO PRECISION PSMGATE RECTANGLES RESOLUTION TEXT TITLE VARIABLE 
syntax keyword calibreKeywordStatement  AND ANGLE COPY CUT DENSITY DONUT ENCLOSE EXTENT FLATTEN GROUP 
syntax keyword calibreKeywordStatement  GROW HOLES INTERACT MERGE NOT OFFGRID POLYGON PUSH 
syntax keyword calibreKeywordStatement  RECTANGLE ROTATE SHRINK SIZE VERTEX XOR GROUP
syntax keyword calibreKeywordStatement  INIT[IALIZE] PROJ[ECTING] PARA[LLEL] PERP[ENDICULAR]
syntax keyword calibreKeywordStatement  BY CENTERS EXTENDED OFFSET STRIPE
syntax keyword calibreKeywordStatement  ABSOLUTE ABUT ACCUMULATE ADVANCED ALL ALLDEPTH ALSO ANALYZE ANGLED APPEND
syntax keyword calibreKeywordStatement  APPROX AREA_RATIO AREF AREF_PLACEMENT ARRAY_PITCH_ZERO ASCII ASPECT 
syntax keyword calibreKeywordStatement  AUTO AUTOREF AUTOROTATE BAD BASE BASIC BEFORECLEANUP BEVEL BINS 
syntax keyword calibreKeywordStatement  BIPOLAR BLACK BLOCK BOTTOM BOX_RECORD BREAKNAME BULKRESISTANCE CALIBREVIEW
syntax keyword calibreKeywordStatement  CAPACITOR CASE CBCLASSIFY CBLOCK CCI CELL CELLS CELLNAME_NSTRING CENTER 
syntax keyword calibreKeywordStatement  CENTERLINE CENTERMERGE CHECKNAME CIRCLE CIRCLE_RADIUS_ZERO CLEANSBLAYER 
syntax keyword calibreKeywordStatement  CLOSEREDGE CLOSERSYMMETRIC CNET COLINEARIZE COLUMNS COMBINE COMMENTS 
syntax keyword calibreKeywordStatement  CONNECTED CONNECTION CONTACT CONVERGENCE CONVOLUTION_GRID COORD 
syntax keyword calibreKeywordStatement  CORNER CORNERFILL COUNT COUNT_THRESHOLD COVERAGE CTRAPEZOID_AREA_ZERO 
syntax keyword calibreKeywordStatement  CTRAPEZOID_DEGENERATE DATABASE DATATYPE DATATYPE_MAP DATATYPE_MAP_SOURCE
syntax keyword calibreKeywordStatement  DATATYPE_MAP_TARGET DEFAULT DELAY_ERROR DELTA DETAIL DEVICES DIODE 
syntax keyword calibreKeywordStatement  DIRECT DISTANCE DSPF DUPLICATE_CELL DUPLICATES DV DX EFFORT ELDO ELSE 
syntax keyword calibreKeywordStatement  EMPTY EMPTY_LAYER ENABLE ENC2 ENDPOINT ENVIRONMENT ERROR EVEN EXCLUDE_CELL_NAME 
syntax keyword calibreKeywordStatement  EXTEND EXTENSION EXTENT_CELL FACTOR FILE FILE_OPEN FILE_READ 
syntax keyword calibreKeywordStatement  FILENAME FILL FILLEDONLY FILLMIN FILLSHAPE FLAGACUTE FLAGOFFGRID 
syntax keyword calibreKeywordStatement  FLAGSKEW FLAT FLIPX FLIPY FLOATING FRINGE FULL GANDP GDS GDS2 GDSII 
syntax keyword calibreKeywordStatement  GRADIENT GRID GROUND GROUNDED GROUNDNAME GWINDOW HDB HEIGHT HIER 
syntax keyword calibreKeywordStatement  HITACHI2DB HITACHI2HITACHI HSPICE ID IGNORE IGNORE_PORT_TEXT 
syntax keyword calibreKeywordStatement  IMPLICITBIAS IN INIT INJECTION INNER INSIDE_CELL INSTANCE INTERSECTING 
syntax keyword calibreKeywordStatement  INTERSECTION INTRINSIC ITERATIONS IXF JEOL2DB JEOL2HITACHI LABELNAME 
syntax keyword calibreKeywordStatement  LAYER_DIRECTORY LAYER_OVER_BUMP LAYOUT_POLYGON LAYOUT_TEXT LEFDEF LEFT 
syntax keyword calibreKeywordStatement  LENGTH1 LENGTH2 LIGHT LINEAR LINEENDMERGE LINEENDOFFSET LINEENDSPACE 
syntax keyword calibreKeywordStatement  LINEENDTOLONGSPACE LINK LOCAL LOCATE LOCATION LOWER MAG MAGNITUDE 
syntax keyword calibreKeywordStatement  MAPNUMBER MASK MAXAREA MAXIMUM MAXLENGTH MAXSBLENGTH MAXSBWIDTH 
syntax keyword calibreKeywordStatement  MEASURE MEBES2DB MEBES2JEOL MEBES2MEBES METRIC_INPUT_FILE 
syntax keyword calibreKeywordStatement  METRIC_RULE_FILE MICRONIC2DB MICRONIC2MICRONIC MIN MINBIASLENGTH 
syntax keyword calibreKeywordStatement  MINEDGELENGTH MINIMUM MINJOGWIDTH MINSBLENGTH MINSBOFFSET MINSBSPACE 
syntax keyword calibreKeywordStatement  MINSBWIDTH MISSEDONLY MULTI MY_ORC NAME NAMES NEGATIVE NETFILE 
syntax keyword calibreKeywordStatement  NETLIST NETS NO NOCLEANUP NOCONTACT NODAL NODE_RECORD NOEMPTY NOFILTERX 
syntax keyword calibreKeywordStatement  NOFLAT NOFLOAT NOHIER NOISE_ERROR NOLUMPED NOMINALT NONE NOPROBE 
syntax keyword calibreKeywordStatement  NOPSEUDO NOXANNOTATE NUMBER NUMWIN NXF OASIS OCCUPIED OFF 
syntax keyword calibreKeywordStatement  OFFSETLAYER OMN ON ONLY OPC OPEN OPENACCESS OPENT OPENVIA OPENWIRE 
syntax keyword calibreKeywordStatement  OPPOSITE OPTIMIZER OPTIONS ORC ORDERED ORIGINAL OTHER OUT OUTPUT 
syntax keyword calibreKeywordStatement  OUTPUT1 OUTPUT2 OUTPUT3 OVER OVERLAP OVERUNDER OVERWRITE PARALLEL 
syntax keyword calibreKeywordStatement  PARAM PATH_ACUTE PATH_ANGLED PATH_BIG PATH_CIRCULAR PATH_COINCIDENT 
syntax keyword calibreKeywordStatement  PATH_DEGENERATE PATH_ENDSEGMENT_SHORT PATH_EXTENSION PATH_NONORIENTABLE 
syntax keyword calibreKeywordStatement  PATH_NONSIMPLE PATH_SPIKE PATH_WIDTH_ABSOLUTE PATH_WIDTH_ZERO PE PHDB
syntax keyword calibreKeywordStatement  PINLOC PLACE PLACEMENT_ANGLE_ABSOLUTE PLACEMENT_MAGNIFICATION_ABSOLUTE 
syntax keyword calibreKeywordStatement  PLACEMENT_MAGNIFICATION_NONPOSITIVE PMOS POLYFILL POLYGON_DEGENERATE 
syntax keyword calibreKeywordStatement  POLYGON_IS_RECTANGLE POLYGON_NONORIENTABLE POLYGON_NONSIMPLE 
syntax keyword calibreKeywordStatement  POLYGON_NOT_CLOSED POLYGONAL POLYGONS PORT PORTMERGE POWERNAME PREC 
syntax keyword calibreKeywordStatement  PRECISION_INPUT_FILE PRECISION_LAYOUT PRECISION_RULE_FILE PREFIX 
syntax keyword calibreKeywordStatement  PRIMARY PRIMETIME PRINT PRINTIMAGE PROFILE PROJECTING PROPNAME_NSTRING 
syntax keyword calibreKeywordStatement  PROTECT PRUNE PSEUDO QUERY RADIUS RANGE RAREA RATIO RC RCNAMED 
syntax keyword calibreKeywordStatement  RDB RECTANGLE_SIDE_ZERO RECTFILL REDUCTION REDUNDANT REFERENCE 
syntax keyword calibreKeywordStatement  RELATIVE RENAME REPEAT REPLACE REPORT RESULTS REVISIONS RFI RIGHT 
syntax keyword calibreKeywordStatement  RINDEX RLAYER RLENGTH RLOCATION RONLY ROTATION RSCALE RTHICKNESS 
syntax keyword calibreKeywordStatement  RTYPE1 RULES RWIDTH SBLAYER SBOFFSET SBWIDTH SCALE SELECT SEPARATOR 
syntax keyword calibreKeywordStatement  SEQUENTIAL SERIES SHAPESPACE SHAPE_FACTOR SHIELDED SHORT SI SIGNATURE 
syntax keyword calibreKeywordStatement  SIMPLE SINGULAR SKEW SLPH SMALLOUTSIDETRAP SOURCE SPACE SPACING 
syntax keyword calibreKeywordStatement  SPARSIFY SPECTRE SPEF SPLINE SPLIT_NET SQUARE SQUARES STANDARD START 
syntax keyword calibreKeywordStatement  STEP STRETCHFILL STRICT STRICTCENTER STRING SUB SUBCKT SUBTYPES 
syntax keyword calibreKeywordStatement  SUPPRESS TABLE TC1 TC2 TCOEFF TEMPERATURE TEXT_BIG TEXT_DEGENERATE 
syntax keyword calibreKeywordStatement  TEXTSTRING_ASTRING TEXTTAG TEXTTYPE THRESHOLD TIE TO TOP TOP_CELL_CHOSEN
syntax keyword calibreKeywordStatement  TOP_CELL_EXCLUDED TOP_CELL_MISSING TOPLEVEL TRANSITION 
syntax keyword calibreKeywordStatement  TRAPEZOID_AREA_ZERO TRAPEZOID_DEGENERATE TRUNCATE TYPES UNCLASSIFIED 
syntax keyword calibreKeywordStatement  UNDEROVER UNIQUE UNMERGED UNUSED_DATA UPPER USER VALUES VARIATION 
syntax keyword calibreKeywordStatement  VBOASIS2HITACHI VBOASIS2JEOL VBOASIS2VBOASIS VERTICAL VIA VIALAYER WIDTH 
syntax keyword calibreKeywordStatement  WIDTH2 WINDOW WITHWIDTH WRAP XALSO XDB XELEMENT_UNSUPPORTED XFORM 
syntax keyword calibreKeywordStatement  XGEOMETRY_UNSUPPORTED XNAME_UNSUPPORTED XRC YES
