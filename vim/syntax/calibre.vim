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
syntax region calibreComment  start=/\/\*/ end=/\*\// contains=@Spell
syntax region calibreComment2 start=/\/\*\*/ end=/\*\// contains=@Spell
syntax match  calibreComment3 /\v\/\/.*/ contains=@Spell

highlight default link calibreComment  Comment
highlight default link calibreComment2 Comment
highlight default link calibreComment3 Comment3

" Constant
"   String
syntax match calibreStringConstant /\v['"][^"']*["']/ contains=@Spell

"highlight default link calibreStringConstant Comment
highlight default link calibreStringConstant Comment3

syntax match brackets /\v[\{\}\[\]\(\)]/
highlight default link brackets Special

"   Character
"   Number
"   Boolean
"   Float
syntax match calibreFloatConstant /\v<\d*\.?\d+>/

highlight default link calibreFloatConstant Float


" Identifier
"   Function
syntax match calibreFunctionIdentifier /\v([cd]macro\s+)@<=\S+/

highlight default link calibreFunctionIdentifier Macro
"Function

" Statement
"   Conditional
"   Repeat
"   Label
"   Operator
"   Keyword

syntax match calPrimaryKeywords /\v\s*[cd]macro/ nextgroup=calibreFunctionIdentifier

highlight default link calPrimaryKeywords Keyword
highlight default link calSecondaryKeywords Keyword

"   Exception

" PreProc
"   Include
syntax match calibreIncludePreProc /\v^\s*include\s+\S+/
highlight default link calibreIncludePreProc Include


"   Define
syntax match calibreDefinePreproc /\v^\s*#define/ contains=calibreComment
syntax match calibreDefinePreproc /\v^\s*#undefine/ contains=calibreComment
syntax match calibreDefineParamIdentifier /\v(#define\s+)@<=\S+/

"highlight default link calibreDefinePreproc Define
highlight default link calibreDefinePreproc Ifdef
highlight default link calibreDefineParamIdentifier Special

"syntax match comparison /\v[\=\<\>]/
"highlight default link comparison Type


"   Macro
"   Precondit
syntax match calibrePreconditPreProc /\v^\s*#ifdef@<=\S+/ contains=calibreComment

syntax match calibreIfdefParamIdentifier /\v(#ifdef\s+)@<=\S+/
syntax match calibreIfdefParamValueIdentifier /\v(#ifdef\s+\S+\s+)@<=\S+/

syntax match calibrePreconditPreProc /\v^\s*#ifdef/ contains=calibreComment
syntax match calibrePreconditPreProc /\v^\s*#ifndef(\s+\S+){1,2}/ contains=calibreComment
syntax match calibrePreconditPreProc /\v^\s*#elif/
syntax match calibrePreconditPreProc /\v^\s*#else/
syntax match calibrePreconditPreProc /\v^\s*#endif/

highlight default link calibrePreconditPreProc Ifdef
highlight default link calibreIfdefParamIdentifier Special
highlight default link calibreIfdefParamValueIdentifier Float

" Type
"   StorageClass
"syntax keyword calPrimaryKeywords variable SIZE EXTENT

"highlight default link calPrimaryKeywords StorageClass

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


syntax keyword calPrimaryKeywords  BUMP BUMP2 DEV[ICE] EXPAND EDGE OUT[SIDE] IN[SIDE] OR
syntax keyword calPrimaryKeywords  ENC[LOSURE] EXT[ERNAL] INT[ERNAL]
syntax keyword calPrimaryKeywords  LITHO PRECISION PSMGATE RECTANGLES RESOLUTION TEXT TITLE VARIABLE 
syntax keyword calPrimaryKeywords  AND ANGLE AREA COPY CUT DENSITY DONUT ENCLOSE EXTENT FLATTEN GROUP 
syntax keyword calPrimaryKeywords  GROW HOLES INTERACT MERGE NOT OFFGRID POLYGON PUSH 
syntax keyword calPrimaryKeywords  RECTANGLE ROTATE SHRINK SIZE VERTEX XOR GROUP
syntax keyword calPrimaryKeywords  PROJ[ECTING] PARA[LLEL] PERP[ENDICULAR]
syntax keyword calPrimaryKeywords  CENTERS EXTENDED OFFSET 
syntax keyword calPrimaryKeywords  ABSOLUTE ABUT ACCUMULATE ADVANCED ALLDEPTH ALSO ANALYZE ANGLED APPEND
syntax keyword calPrimaryKeywords  APPROX AREA_RATIO AREF AREF_PLACEMENT ARRAY_PITCH_ZERO ASCII ASPECT 
syntax keyword calPrimaryKeywords  AUTOREF AUTOROTATE BAD BASE BASIC BEFORECLEANUP BEVEL BINS 
syntax keyword calPrimaryKeywords  BIPOLAR BLACK BLOCK BOTTOM BOX_RECORD BREAKNAME BULKRESISTANCE CALIBREVIEW
syntax keyword calPrimaryKeywords  CAPACITOR CASE CBCLASSIFY CBLOCK CCI CELL CELLS CELLNAME_NSTRING CENTER 
syntax keyword calPrimaryKeywords  CENTERMERGE CHECK CHECKNAME CIRCLE CIRCLE_RADIUS_ZERO CLEANSBLAYER 
syntax keyword calPrimaryKeywords  CLOSEREDGE CLOSERSYMMETRIC CNET COIN[CIDENT] COLINEARIZE COLUMNS COMBINE COMMENTS 
syntax keyword calPrimaryKeywords  CONNECTED CONNECTION CONTACT CONVERGENCE CONVEX CONVOLUTION_GRID COORD 
syntax keyword calPrimaryKeywords  CORNER CORNERFILL COUNT COUNT_THRESHOLD COVERAGE CTRAPEZOID_AREA_ZERO 
syntax keyword calPrimaryKeywords  CTRAPEZOID_DEGENERATE DATABASE DATATYPE_MAP DATATYPE_MAP_SOURCE
syntax keyword calPrimaryKeywords  DATATYPE_MAP_TARGET DEFAULT DELAY_ERROR DELTA DETAIL DEVICES DFM DIODE 
syntax keyword calPrimaryKeywords  DIRECT DISTANCE DRC DSPF DUPLICATE_CELL DUPLICATES DV DX EFFORT ELDO ELSE 
syntax keyword calPrimaryKeywords  EMPTY EMPTY_LAYER ENABLE ENC2 ENDPOINT ENVIRONMENT ERROR EVEN EW EXCEPTION EXCLUDE_CELL_NAME 
syntax keyword calPrimaryKeywords  EXTEND EXTENSION EXTENTS EXTENT_CELL FACTOR FILE FILE_OPEN FILE_READ 
syntax keyword calPrimaryKeywords  FILENAME FILL FILLEDONLY FILLMIN FILLSHAPE FLAG FLAGACUTE FLAGOFFGRID 
syntax keyword calPrimaryKeywords  FLAGSKEW FLAT FLEX FLIPX FLIPY FLOATING FLOOR FRINGE FULL GANDP GDS GDS2 GDSII 
syntax keyword calPrimaryKeywords  GRADIENT GRID GROUND GROUNDED GROUNDNAME GWINDOW HDB HEIGHT HIER 
syntax keyword calPrimaryKeywords  HITACHI2DB HITACHI2HITACHI HSPICE ID IGNORE IGNORE_PORT_TEXT 
syntax keyword calPrimaryKeywords  IMPLICITBIAS IN INIT INJECTION INNER INPUT INSIDE_CELL INSTANCE INTERSECTING 
syntax keyword calPrimaryKeywords  INTERSECTION INTRINSIC ITERATIONS IXF JEOL2DB JEOL2HITACHI KEEP LABELNAME 
syntax keyword calPrimaryKeywords  LAYER LAYER_DIRECTORY LAYER_OVER_BUMP LAYOUT LAYOUT_POLYGON LAYOUT_TEXT LEFDEF LEFT 
syntax keyword calPrimaryKeywords  LENGTH LENGTH1 LENGTH2 LIGHT LINEAR LINEENDMERGE LINEENDOFFSET LINEENDSPACE 
syntax keyword calPrimaryKeywords  LINEENDTOLONGSPACE LINK LOCAL LOCATION LOWER MAG[NIFY] MAGNITUDE 
syntax keyword calPrimaryKeywords  MAP MAPNUMBER MASK MAXAREA MAXIMUM MAXLENGTH MAXSBLENGTH MAXSBWIDTH 
syntax keyword calPrimaryKeywords  MEASURE MEBES2DB MEBES2JEOL MEBES2MEBES MESSAGE METRIC_INPUT_FILE 
syntax keyword calPrimaryKeywords  METRIC_RULE_FILE MICRONIC2DB MICRONIC2MICRONIC MIN MINBIASLENGTH 
syntax keyword calPrimaryKeywords  MINEDGELENGTH MINIMUM MINJOGWIDTH MINSBLENGTH MINSBOFFSET MINSBSPACE 
syntax keyword calPrimaryKeywords  MINSBWIDTH MISSEDONLY MULTI MY_ORC NAME NAMES NEGATIVE NEIGHBOR NETFILE 
syntax keyword calPrimaryKeywords  NETLIST NETS NOCLEANUP NOCONTACT NODAL NODE_RECORD NOEMPTY NOFILTERX 
syntax keyword calPrimaryKeywords  NOFLAT NOFLOAT NOHIER NOISE_ERROR NOLUMPED NOMINALT NONE NONSIMPLE NOPROBE 
syntax keyword calPrimaryKeywords  NOXANNOTATE NUMBER NUMWIN NXF OCCUPIED OFF 
syntax keyword calPrimaryKeywords  OFFSETLAYER OMN ON OPC OPEN OPENACCESS OPENT OPENVIA OPENWIRE 
syntax keyword calPrimaryKeywords  OPTIMIZER OPTIONS ORC ORDERED ORIGINAL ORTHOGONAL OTHER OUT OUTPUT 
syntax keyword calPrimaryKeywords  OUTPUT1 OUTPUT2 OUTPUT3 OVER OVERLAP OVERUNDER OVERWRITE
syntax keyword calPrimaryKeywords  PARAM PATH PATH2 PATH_ACUTE PATH_ANGLED PATH_BIG PATH_CIRCULAR PATH_COINCIDENT 
syntax keyword calPrimaryKeywords  PATH_DEGENERATE PATH_ENDSEGMENT_SHORT PATH_EXTENSION PATH_NONORIENTABLE 
syntax keyword calPrimaryKeywords  PATH_NONSIMPLE PATH_SPIKE PATH_WIDTH_ABSOLUTE PATH_WIDTH_ZERO PE PHDB
syntax keyword calPrimaryKeywords  PINLOC PLACE PLACEMENT_ANGLE_ABSOLUTE PLACEMENT_MAGNIFICATION_ABSOLUTE 
syntax keyword calPrimaryKeywords  PLACEMENT_MAGNIFICATION_NONPOSITIVE PMOS POLYFILL POLYGON_DEGENERATE 
syntax keyword calPrimaryKeywords  POLYGON_IS_RECTANGLE POLYGON_NONORIENTABLE POLYGON_NONSIMPLE 
syntax keyword calPrimaryKeywords  POLYGON_NOT_CLOSED POLYGONAL POLYGONS PORT PORTMERGE POWERNAME PREC 
syntax keyword calPrimaryKeywords  PRECISION_INPUT_FILE PRECISION_LAYOUT PRECISION_RULE_FILE PREFIX 
syntax keyword calPrimaryKeywords  PRIMARY PRIMARY2 PRIMETIME PRINT PRINTIMAGE PROFILE PROJECTING PROPNAME_NSTRING PROPERTY
syntax keyword calPrimaryKeywords  PROTECT PRUNE QUERY RADIUS RANGE RAREA RATIO RC RCNAMED 
syntax keyword calPrimaryKeywords  RDB RECTANGLE_SIDE_ZERO RECTFILL REDUCTION REDUNDANT REFERENCE 
syntax keyword calPrimaryKeywords  RELATIVE RENAME REPEAT REPLACE REPORT RESULTS REVISIONS RFI RIGHT 
syntax keyword calPrimaryKeywords  RINDEX RLAYER RLENGTH RLOCATION RONLY ROTATED ROTATION RSCALE RTHICKNESS 
syntax keyword calPrimaryKeywords  RTYPE1 RULES RWIDTH SBLAYER SBOFFSET SBWIDTH SCALE SELECT SEPARATOR 
syntax keyword calPrimaryKeywords  SEQUENTIAL SERIES SEVERITY SHAPESPACE SHAPE_FACTOR SHIFT SHORT SI SIGNATURE 
syntax keyword calPrimaryKeywords  SIMPLE SINGULAR SKEW SLPH SMALLOUTSIDETRAP SOURCE SPACE SPACING 
syntax keyword calPrimaryKeywords  SPARSIFY SPEC SPECTRE SPEF SPLINE SPLIT_NET SQUARE SQUARES STANDARD START 
syntax keyword calPrimaryKeywords  STEP STRETCHFILL STRICT STRICTCENTER STRING SUB SUBCKT SUBTYPES SUMMARY
syntax keyword calPrimaryKeywords  SUPPRESS SVRF SYSTEM SYSTEM2 TABLE TC1 TC2 TCOEFF TEMPERATURE TEXT_BIG TEXT_DEGENERATE 
syntax keyword calPrimaryKeywords  TEXTSTRING_ASTRING TEXTTAG TEXTTYPE THRESHOLD TIE TO TOLERANCE TOP TOP_CELL_CHOSEN
syntax keyword calPrimaryKeywords  TOP_CELL_EXCLUDED TOP_CELL_MISSING TOPLEVEL TOUCH TRANSITION 
syntax keyword calPrimaryKeywords  TRAPEZOID_AREA_ZERO TRAPEZOID_DEGENERATE TRUNCATE TURBO TYPES UNCLASSIFIED 
syntax keyword calPrimaryKeywords  UNDEROVER UNIQUE UNMERGED UNUSED_DATA UPPER USER VALUES VARIATION 
syntax keyword calPrimaryKeywords  VBOASIS2HITACHI VBOASIS2JEOL VBOASIS2VBOASIS VERTICAL VIA VIALAYER WIDTH 
syntax keyword calPrimaryKeywords  WIDTH2 WINDOW WITH WITHWIDTH WRAP XALSO XDB XELEMENT_UNSUPPORTED  
syntax keyword calPrimaryKeywords  XGEOMETRY_UNSUPPORTED XNAME_UNSUPPORTED XRC


syntax keyword calSecondaryKeywords ALL ALLOW AUTO
syntax keyword calSecondaryKeywords BOUND BY 
syntax keyword calSecondaryKeywords CENTERLINE CLONE
syntax keyword calSecondaryKeywords DATATYPE DUPLICATE
syntax keyword calSecondaryKeywords EXCLUDE
syntax keyword calSecondaryKeywords FILLREGION
syntax keyword calSecondaryKeywords HORIZONTAL
syntax keyword calSecondaryKeywords INSIDE INIT[IALIZE] 
syntax keyword calSecondaryKeywords LOCATE
syntax keyword calSecondaryKeywords NO NOPSEUDO
syntax keyword calSecondaryKeywords OASIS OF ONLY OPPOSITE OUTSIDE
syntax keyword calSecondaryKeywords PARALLEL PERIMETERX PERIMETERY PLACEMENTS PSEUDO
syntax keyword calSecondaryKeywords REGION
syntax keyword calSecondaryKeywords SHIELDED STRIPE
syntax keyword calSecondaryKeywords TRANSFORMED
syntax keyword calSecondaryKeywords VERTICAL
syntax keyword calSecondaryKeywords XFORM
syntax keyword calSecondaryKeywords YES

