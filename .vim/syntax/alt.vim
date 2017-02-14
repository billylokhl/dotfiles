" Vim syntax file
" Language: ALT

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "alt"

" Ignore case
"syntax case ignore


"syntax keyword example SIZE EXTENT

" Comment
syntax match  altComment1 "\v--.*$"
syntax region altComment2 start=/\v--\[\[/ end=/\v--\]\]-*$/ contains=@Spell

highlight default link altComment1 Comment3
highlight default link altComment2 Comment2

" Constant
"   String
syntax region altStringConstant start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link altStringConstant Ifdef


syntax match brackets /\v[\{\}\[\]\(\)]/
highlight default link brackets Special

"   Character
"   Number
"   Boolean
"   Float
syntax match altFloatConstant /\v<\d*\.?\d+>/
syntax match altFloatConstant /\v\d*\.?\d+[Ee]-\d+/
highlight default link altFloatConstant Float

syntax match altOperator /\v[=?:]/
highlight default link altOperator Keyword

" Identifier
"Function

" Statement
"   Conditional
"   Repeat
"   Label
"   Operator
"   Keyword

highlight default link altFunctionList Function
highlight default link altFunctionArgumentList Comment
highlight default link altTableOptionList Comment
highlight default link altVariableList Special
highlight default link altLogicKeywordList Keyword
highlight default link altAppList Preproc
highlight default link altSpecialObjectList Ifdef
highlight default link altBooleanList Ifdef
highlight default link altObsoleteList Obsolete


"   Exception

" PreProc
"   Include
syntax match altIncludePreProc /\v^\s*include(\s+\S+){1}/

highlight default link altIncludePreProc Include

"   Define
syntax match altDefinePreproc /\v^\s*#define/ contains=altComment
syntax match altDefinePreproc /\v^\s*#undefine/ contains=altComment
syntax match altDefineParamIdentifier /\v(#define\s+)@<=\S+/

"highlight default link altDefinePreproc Define
highlight default link altDefinePreproc Ifdef
highlight default link altDefineParamIdentifier Special

"syntax match comparison /\v[\=\<\>]/
"highlight default link comparison Type


"   Macro
"   Precondit
syntax match altPreconditPreProc /\v^\s*#ifdef@<=\S+/ contains=altComment

syntax match altIfdefParamIdentifier /\v(#ifdef\s+)@<=\S+/
syntax match altIfdefParamValueIdentifier /\v(#ifdef\s+\S+\s+)@<=\S+/

syntax match altPreconditPreProc /\v^\s*#ifdef/ contains=altComment
syntax match altPreconditPreProc /\v^\s*#ifndef(\s+\S+){1,2}/ contains=altComment
syntax match altPreconditPreProc /\v^\s*#elif/
syntax match altPreconditPreProc /\v^\s*#else/
syntax match altPreconditPreProc /\v^\s*#endif/

highlight default link altPreconditPreProc Ifdef
highlight default link altIfdefParamIdentifier Special
highlight default link altIfdefParamValueIdentifier Float

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

"DRC Edge Property Table
syntax keyword altTableOptionList flag
syntax keyword altTableOptionList angle0
syntax keyword altTableOptionList angle1
syntax keyword altTableOptionList angle2
syntax keyword altTableOptionList jogsize
syntax keyword altTableOptionList tag
syntax keyword altTableOptionList length
syntax keyword altTableOptionList space
syntax keyword altTableOptionList width
syntax keyword altTableOptionList condition

"DRC Commands for Edge Selection
syntax keyword altFunctionList edgeset_create 
    syntax keyword altTableOptionList layer
    syntax keyword altTableOptionList set
    syntax keyword altTableOptionList polygon_property
        syntax keyword altTableOptionList perimeter
        syntax keyword altTableOptionList area
        syntax keyword altTableOptionList vertex
    syntax keyword altTableOptionList edge_property
        syntax keyword altTableOptionList current
        syntax keyword altTableOptionList previous
        syntax keyword altTableOptionList next
        syntax match   altTableOptionList /\vprevious[1-9]\d*/
        syntax match   altTableOptionList /\vnext[1-9]\d*/
    syntax keyword altTableOptionList asymmetry
    syntax keyword altTableOptionList inverse_rule
syntax keyword altFunctionList edgeset_select_by_sw
    syntax keyword altTableOptionList main
    syntax keyword altTableOptionList context
    syntax keyword altTableOptionList context_layer
    syntax keyword altTableOptionList query
    syntax keyword altTableOptionList flag
    syntax keyword altTableOptionList option
    syntax keyword altTableOptionList register
syntax keyword altFunctionList edgeset_select_by_relation
    syntax keyword altTableOptionList set
    syntax keyword altTableOptionList polygon
    syntax keyword altTableOptionList layer
    syntax keyword altTableOptionList polygon_property
    syntax keyword altTableOptionList perimeter
    syntax keyword altTableOptionList area
    syntax keyword altTableOptionList vertex
    syntax keyword altTableOptionList edge_property
    syntax keyword altTableOptionList asymmetry
    syntax keyword altTableOptionList strict
    syntax keyword altTableOptionList inverse_rule
    syntax keyword altTableOptionList relation
        syntax keyword altTableOptionList inside
        syntax keyword altTableOptionList pointtouch
        syntax keyword altTableOptionList coincide
        syntax keyword altTableOptionList outside
    syntax keyword altTableOptionList flag
syntax keyword altObsoleteList select_edge_by_layer
    syntax keyword altTableOptionList layerA
    syntax keyword altTableOptionList edgePropertyTable
    syntax keyword altTableOptionList layerB
    syntax keyword altTableOptionList flagTable
    syntax keyword altTableOptionList flagbit
syntax keyword altFunctionList select_n45_edge
    syntax keyword altTableOptionList layerA
    syntax keyword altTableOptionList flagbit
syntax keyword altObsoleteList select_edge_by_property 
    syntax keyword altTableOptionList layerHandle
    syntax keyword altTableOptionList listOfEdgePropertyTable
    syntax keyword altTableOptionList flagBit
    syntax keyword altTableOptionList not
    syntax keyword altTableOptionList asymmetry
syntax keyword altObsoleteList select_edge_by_sw 
    syntax keyword altTableOptionList layerA
    syntax keyword altTableOptionList edgePropertyTable1
    syntax keyword altTableOptionList layerB
    syntax keyword altTableOptionList edgePropertyTable2
    syntax keyword altTableOptionList space
    syntax keyword altTableOptionList width
    syntax match   altTableOptionList /\vflagbit[1-9]\d*/
    syntax keyword altTableOptionList sw_table

"DRC Commands for Edge Operation
syntax keyword altFunctionList edgeset_bias
    syntax keyword altTableOptionList option
    syntax keyword altTableOptionList clean
    syntax keyword altTableOptionList checksw
    syntax keyword altTableOptionList fill_corner
syntax keyword altFunctionList edgeset_expand
    syntax keyword altTableOptionList expand_inside
    syntax keyword altTableOptionList expand_outside
    syntax keyword altTableOptionList start_extension
    syntax keyword altTableOptionList end_extension
    syntax keyword altTableOptionList option
    syntax keyword altTableOptionList clean
    syntax keyword altTableOptionList separate_polygon
syntax keyword altFunctionList edgeset_dissect
    syntax keyword altTableOptionList main
    syntax keyword altTableOptionList context
    syntax keyword altTableOptionList option
    syntax keyword altTableOptionList flag
syntax keyword altObsoleteList set_edge_bias
syntax keyword altObsoleteList expand_edge
syntax keyword altObsoleteList dissect_edge
syntax keyword altFunctionList get_dissection_point
    syntax keyword altFunctionArgumentList copy_tag

"HScan-Related Lua Variables
syntax keyword altVariableList SKIP_MARK_VERTEX
syntax keyword altVariableList HSCAN_RANGEADJ
syntax keyword altVariableList HSCAN_RANGE
syntax keyword altVariableList HSCAN_CELLSIZE
syntax keyword altVariableList PATCH_TYPE
syntax keyword altVariableList HSCAN_SYMMETRY
syntax keyword altVariableList HSCAN_STAGE_OPTIONS

"HScan-Related Margin Parameters
syntax keyword altVariableList MAIN_MAXCV
syntax keyword altVariableList MAIN_MRC_MARGIN
syntax keyword altVariableList SBAR_MAXDIST
syntax keyword altVariableList SBAR_MRC_MARGIN
syntax keyword altVariableList RUNSEGLEN
syntax keyword altVariableList MIN_SEGMENT_LENGTH
syntax keyword altVariableList MAX_SEGMENT_LENGTH

"HScan-Related Parameters for Pass-Through Layer Handling
syntax keyword altVariableList HSCAN_HANDLE_PASS_THROUGH_LAYER

"Tachyon Lua Commands -- Commands for Both AppInit and AppMain
syntax keyword altFunctionList execute_function
syntax keyword altFunctionList get_option
syntax keyword altFunctionList get_memory
syntax keyword altFunctionList get_releasedir
syntax keyword altFunctionList get_job_id
syntax keyword altFunctionList get_job_dir
syntax keyword altFunctionList get_database
syntax keyword altFunctionList test_bug

"Tachyon Lua Commands -- Commands for AppInit
syntax keyword altFunctionList get_gdslayer
    syntax keyword altFunctionArgumentList includecell
    syntax keyword altFunctionArgumentList excludecell
    syntax keyword altFunctionArgumentList includecellwild
    syntax keyword altFunctionArgumentList excludecellwild
    syntax keyword altFunctionArgumentList bboxcell
    syntax keyword altFunctionArgumentList bboxcellwile
    syntax keyword altFunctionArgumentList optional
    syntax keyword altFunctionArgumentList layername
    syntax keyword altFunctionArgumentList dbu
    syntax keyword altFunctionArgumentList format
    syntax keyword altFunctionArgumentList topcell
    syntax keyword altFunctionArgumentList ref
    syntax keyword altFunctionArgumentList rotation
    syntax keyword altFunctionArgumentList scale
    syntax keyword altFunctionArgumentList cblock
    syntax keyword altFunctionArgumentList x
    syntax keyword altFunctionArgumentList y
    syntax keyword altFunctionArgumentList addcellprefix
    syntax keyword altFunctionArgumentList addcellpostfix
    syntax keyword altFunctionArgumentList writable
    " HScan arguments
    syntax keyword altFunctionArgumentList hscanrole
    syntax keyword altFunctionArgumentList passthrough
    syntax keyword altFunctionArgumentList cellnamemode
syntax keyword altFunctionList get_topcell_name
syntax keyword altFunctionList attach_oasis_comments
syntax keyword altFunctionList get_topcell_bbox
syntax keyword altFunctionList set_patchinfo
syntax keyword altFunctionList get_gdsdbu
syntax keyword altFunctionList get_gds
syntax keyword altFunctionList get_model
    "tnpmap keywords for single-exposure binary masks
    syntax keyword altFunctionArgumentList phase
    syntax keyword altFunctionArgumentList transmittance
    syntax keyword altFunctionArgumentList polarity
    "tnpmap keywords for altPSM masks
    syntax keyword altFunctionArgumentList phase0
    syntax keyword altFunctionArgumentList phase180
    syntax keyword altFunctionArgumentList trim
    syntax keyword altFunctionArgumentList target
syntax keyword altFunctionList load_module
syntax keyword altFunctionList load_file
syntax keyword altFunctionList set_mergeboundary_param
syntax keyword altFunctionList create_detector
syntax keyword altFunctionList add_detectorparam

"Tachyon Lua Commands -- Commands for AppMain or AppModel
syntax keyword altFunctionList apply_model
    "figuremap hard-coded keywords for double exposure attPSM models
    syntax keyword altFunctionArgumentList phase0
    syntax keyword altFunctionArgumentList phase180
    syntax keyword altFunctionArgumentList trim
    syntax keyword altFunctionArgumentList target
    "figuremap hard-coded keywords for implant layer models
    syntax keyword altFunctionArgumentList Planar
    syntax keyword altFunctionArgumentList Sub
    "figuremap hard-coded keywords for PME/SDX models
    syntax keyword altFunctionArgumentList Attenuator
    syntax keyword altFunctionArgumentList SRAFONLY
    syntax keyword altFunctionArgumentList main
syntax keyword altFunctionList set_deltadose
    syntax keyword altFunctionArgumentList model
    syntax keyword altFunctionArgumentList deltadose
    syntax keyword altFunctionArgumentList role
syntax keyword altFunctionList add_model_output
    syntax keyword altFunctionArgumentList model_output
    syntax keyword altFunctionArgumentList index
syntax keyword altFunctionList save_model_output
    syntax keyword altFunctionArgumentList model_output
    syntax keyword altFunctionArgumentList what
    syntax keyword altFunctionArgumentList darkfield
    syntax keyword altFunctionArgumentList resolution
    syntax keyword altFunctionArgumentList imageHandle
syntax keyword altFunctionList invalidate_model_output
    syntax keyword altFunctionArgumentList model_Index
    syntax keyword altFunctionArgumentList mode
syntax keyword altFunctionList in_layer
    syntax keyword altFunctionArgumentList gdslayer_hdl
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList datatype
    syntax keyword altFunctionArgumentList gds_hdl
syntax keyword altFunctionList new
    syntax keyword altFunctionArgumentList p
    syntax keyword altFunctionArgumentList xn yn
    syntax keyword altFunctionArgumentList hole
    syntax keyword altFunctionArgumentList groupid
    syntax keyword altFunctionArgumentList polygon_property_table
syntax keyword altFunctionList add
    syntax keyword altFunctionArgumentList layerObj
    syntax keyword altFunctionArgumentList xn yn
    syntax keyword altFunctionArgumentList hole
    syntax keyword altFunctionArgumentList groupid
    syntax keyword altFunctionArgumentList polygon_property_table
    syntax keyword altFunctionArgumentList clip
syntax keyword altFunctionList array
    syntax keyword altFunctionArgumentList field
    syntax keyword altFunctionArgumentList llx lly urx ury
    syntax keyword altFunctionArgumentList pattern
    syntax keyword altFunctionArgumentList dx1 dx2 dy1 dy2
syntax keyword altFunctionList get
    syntax keyword altFunctionArgumentList layer
syntax keyword altFunctionList add_figure
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList ftype
    syntax keyword altFunctionArgumentList level
    syntax keyword altFunctionArgumentList append
    syntax keyword altFunctionArgumentList skip_markvtx
    syntax keyword altFunctionArgumentList copy_attachment
    syntax keyword altFunctionArgumentList add_figure_table
    syntax keyword altFunctionArgumentList dissected
syntax keyword altFunctionList size
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList how_much
    syntax keyword altFunctionArgumentList operation
    syntax keyword altFunctionArgumentList size_option_table
        syntax keyword altFunctionArgumentList direction
        syntax keyword altFunctionArgumentList snapgrid
        syntax keyword altFunctionArgumentList prepcheck
        syntax keyword altFunctionArgumentList fixacuteangle
        syntax keyword altFunctionArgumentList fixacutelength
syntax keyword altFunctionList get_figure
    syntax keyword altFunctionArgumentList ftype
    syntax keyword altFunctionArgumentList level
    syntax keyword altFunctionArgumentList point
    syntax keyword altFunctionArgumentList group
    syntax keyword altFunctionArgumentList cleanfig
    syntax keyword altFunctionArgumentList copy_attachment
    syntax keyword altFunctionArgumentList marker_size
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList get_figure_table
    syntax keyword altVariableList SMALLSEG_LENGTH
syntax keyword altFunctionList out_layer
    syntax keyword altFunctionArgumentList layerHandle
    syntax keyword altFunctionArgumentList out_gds
    syntax keyword altFunctionArgumentList merge
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList datatype
    syntax keyword altFunctionArgumentList out_gds_hdl
    syntax keyword altFunctionArgumentList merge
    syntax keyword altFunctionArgumentList scale
    syntax keyword altFunctionArgumentList clip
    syntax keyword altFunctionArgumentList celldebug
    syntax keyword altFunctionArgumentList dilate
syntax keyword altFunctionList free_layer
    syntax keyword altFunctionArgumentList layerHandle
syntax keyword altFunctionList clone
    syntax keyword altFunctionArgumentList layerHandle_in
    syntax keyword altFunctionArgumentList option
    syntax keyword altFunctionArgumentList layerHandle_out
syntax keyword altFunctionList precondition
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList precondition_table
    syntax keyword altFunctionArgumentList clean
    syntax keyword altFunctionArgumentList fixcornerjog
    syntax keyword altFunctionArgumentList jogsize_a
    syntax keyword altFunctionArgumentList jogsize_b
    syntax keyword altFunctionArgumentList jog_fill
    syntax keyword altFunctionArgumentList fixn45
    syntax keyword altFunctionArgumentList n45_len
    syntax keyword altFunctionArgumentList ang_tol
    syntax keyword altFunctionArgumentList fixn90
    syntax keyword altFunctionArgumentList n90_len
    syntax keyword altFunctionArgumentList fixacuteangle
    syntax keyword altFunctionArgumentList fixacutelength
    syntax keyword altFunctionArgumentList fixnonrectsbar
syntax keyword altFunctionList make_figure
    syntax keyword altFunctionArgumentList layer
syntax keyword altFunctionList clean_figure
    syntax keyword altFunctionArgumentList layer
syntax keyword altFunctionList reset
    syntax keyword altFunctionArgumentList flag
    syntax keyword altFunctionArgumentList ftype_list
syntax keyword altFunctionList add_defect
    syntax keyword altFunctionArgumentList layerObj
    syntax keyword altFunctionArgumentList detectorHdl
    syntax keyword altFunctionArgumentList mode
    syntax keyword altFunctionArgumentList option
syntax keyword altFunctionList get_carearea
    syntax keyword altFunctionArgumentList careareaoption
syntax keyword altFunctionList in_hotspot
    syntax keyword altFunctionArgumentList defloctxt
    syntax keyword altFunctionArgumentList layer
    syntax keyword altFunctionArgumentList size
    syntax keyword altFunctionArgumentList repair_mark
syntax keyword altFunctionList compare_contours
    syntax keyword altFunctionArgumentList hdet1 hdet2 hdet3 hdet4 hdet5
    syntax keyword altFunctionArgumentList hdetstat1
    syntax keyword altFunctionArgumentList hdetstat2
    syntax keyword altFunctionArgumentList hdetstat3
    syntax keyword altFunctionArgumentList hdetstat4
    syntax keyword altFunctionArgumentList hdetstat5
    syntax keyword altFunctionArgumentList model_index1
    syntax keyword altFunctionArgumentList model_index2
    syntax keyword altFunctionArgumentList ptable
    syntax keyword altFunctionArgumentList grid_resolution
    syntax keyword altFunctionArgumentList onedef_per_polygon
    syntax keyword altFunctionArgumentList report_mode
    syntax keyword altFunctionArgumentList care_area
    syntax keyword altFunctionArgumentList cubic_spline_fit
    syntax keyword altFunctionArgumentList dark_field
    syntax keyword altFunctionArgumentList show_stat_info
    syntax keyword altFunctionArgumentList step_size
    syntax keyword altFunctionArgumentList hdet
    syntax keyword altFunctionArgumentList tolerance
syntax keyword altFunctionList send_message
    syntax keyword altFunctionArgumentList msgtype
    syntax keyword altFunctionArgumentList data
syntax keyword altFunctionList bbox
    syntax keyword altFunctionArgumentList layerHandle_in
    syntax keyword altFunctionArgumentList b1 b2
syntax keyword altFunctionList get_cell_bbox
    syntax keyword altFunctionArgumentList gdslayer_hdl
    syntax keyword altFunctionArgumentList b1
syntax keyword altFunctionList in_text
    syntax keyword altFunctionArgumentList inGdsHdl
    syntax keyword altFunctionArgumentList logPrint
syntax keyword altFunctionList get_user_text
    syntax keyword altFunctionArgumentList ftype
    syntax keyword altFunctionArgumentList level
syntax keyword altFunctionList search_text
    syntax keyword altFunctionArgumentList inTxtHdl
    syntax keyword altFunctionArgumentList content
syntax keyword altFunctionList out_text
    syntax keyword altFunctionArgumentList txtHdl
    syntax keyword altFunctionArgumentList outGDSHdl
syntax keyword altFunctionList write
    syntax keyword altFunctionArgumentList layer_hdl
    syntax keyword altFunctionArgumentList gp_file_path
    syntax keyword altFunctionArgumentList assign_hole
    syntax keyword altFunctionArgumentList global
syntax keyword altFunctionList read
    syntax keyword altFunctionArgumentList gp_file_path
    syntax keyword altFunctionArgumentList layer_hdl
syntax keyword altFunctionList get_patchsize
syntax keyword altFunctionList get_patchbox
syntax keyword altFunctionList get_patchptable

"Tachyon Lua Commands -- Commands for AppStage
syntax keyword altFunctionList run_stage
    syntax keyword altFunctionArgumentList jobType
    syntax keyword altFunctionArgumentList stageName
    syntax keyword altFunctionArgumentList stageParams
    syntax keyword altFunctionArgumentList options
    syntax keyword altFunctionArgumentList stageResult
syntax keyword altFunctionList get_patchinfo

"Tachyon Lua Commands -- Commands for GDS Merge and Crop
syntax keyword altTableList MERGE_GDS_TABLE
    syntax keyword altTableOptionList MERGETOP
    syntax keyword altTableOptionList OPCTOP
    syntax keyword altFunctionArgumentList input_handle
    syntax keyword altFunctionArgumentList output_handle
    syntax keyword altFunctionArgumentList input_file
    syntax keyword altFunctionArgumentList output_file
    syntax keyword altFunctionArgumentList prefix
    syntax keyword altFunctionArgumentList postfix
    syntax keyword altFunctionArgumentList topcell
syntax keyword altTableList CROP_GDS_TABLE
    syntax keyword altTableOptionList input
    syntax keyword altTableOptionList output
    syntax keyword altFunctionArgumentList crop
    syntax keyword altFunctionArgumentList handle
    syntax keyword altFunctionArgumentList offset

"Tachyon Lua Commands -- Special Lua Utility Commands
syntax keyword altFunctionList Util_fix_jog
    syntax keyword altFunctionArgumentList layer
    syntax keyword altTableOptionList JOG_PARAMS
    syntax keyword altFunctionArgumentList fixcornerjog
    syntax keyword altFunctionArgumentList jogsize_a
    syntax keyword altFunctionArgumentList jogsize_b
    syntax keyword altFunctionArgumentList job_fill
    syntax keyword altTableOptionList JOG_MODE
syntax keyword altFunctionList deepcopy
    syntax keyword altFunctionArgumentList Table
    syntax keyword altFunctionArgumentList NewTable

"Tachyon Lua Commands -- Booleans
syntax keyword altBooleanList AND and 
syntax keyword altBooleanList NOT not
syntax keyword altBooleanList OR or
syntax keyword altBooleanList XOR xor

"Tachyon Lua Commands -- Binary Parameters Used in Lua
syntax keyword altVariableList CORRECTION_GRID
syntax keyword altVariableList CORRECTION_MARGIN
syntax keyword altVariableList CORRECTION_EROSION
syntax keyword altVariableList RULE_MARGIN
syntax keyword altVariableList RULE_EROSION
syntax keyword altVariableList SKIP_MARK_VERTEX
syntax keyword altVariableList MAX_NUMBER_VERTICES
syntax keyword altVariableList DRC_EROSION
syntax keyword altVariableList DRC_GC_THRES
syntax keyword altVariableList SELECT_CROSS_PATCH
syntax keyword altVariableList VERSION
syntax keyword altVariableList BUGS
syntax keyword altVariableList VERBOSE_LEAF_LOG
syntax keyword altVariableList ALIGNMENT_GRID
syntax keyword altVariableList EBH_LEVEL
syntax keyword altVariableList PATCH_ID
syntax keyword altVariableList ITERATION
syntax keyword altVariableList API_WARNING_LEVEL
syntax keyword altVariableList MODEL_EVAL_MODE
syntax keyword altVariableList DISSECT_TARGET_LAYER
syntax keyword altVariableList MODEL_SYMMETRY
syntax keyword altVariableList MODEL_RANGEADJ
syntax keyword altVariableList MODEL_EVAL_CHECK
syntax keyword altVariableList CHECK_MODEL_SYMMETRY
syntax keyword altVariableList BOOLEAN_ANGLE_TOL

"C-API Functions -- Lua Script-Related Functions
syntax keyword altFunctionList dtExecuteScriptFunct
syntax keyword altFunctionList dtSetParameterTable
syntax keyword altFunctionList dtSetParameterTable2
syntax keyword altFunctionList dtSetParameter
syntax keyword altFunctionList dtSetParameterNil
syntax keyword altFunctionList dtSetParameterArray
syntax keyword altFunctionList dtSetParameterArrayArray
syntax keyword altFunctionList dtSetParameterArrayEmpty
syntax keyword altFunctionList dtSetParameterStr
syntax keyword altFunctionList dtSetParameterStrArray
syntax keyword altFunctionList dtSetParameterStrArrayArray
syntax keyword altFunctionList dtGetExecFuncName
syntax keyword altFunctionList dtGetTopTableName
syntax keyword altFunctionList dtGetCurrentTableName
syntax keyword altFunctionList dtGetParameter
syntax keyword altFunctionList dtGetModelParameter
syntax keyword altFunctionList dtGetParameterType
syntax keyword altFunctionList dtGetParameterInt
syntax keyword altFunctionList dtGetModelParameterInt
syntax keyword altFunctionList dtGetParameterArray
syntax keyword altFunctionList dtGetParameterMDArray
syntax keyword altFunctionList dtGetParameterStr
syntax keyword altFunctionList dtGetParameterString
syntax keyword altFunctionList dtGetModelParameterString
syntax keyword altFunctionList dtGetParameterStrArray
syntax keyword altFunctionList dtGetParameterArrayArray
syntax keyword altFunctionList dtGetParameterIntArray
syntax keyword altFunctionList dtGetParameterIntArrayArray
syntax keyword altFunctionList dtGetParameterStrArrayArray
syntax keyword altFunctionList dtGetParameterTable
syntax keyword altFunctionList dtGetParameterLuaModel
syntax keyword altFunctionList dtSendMessage
syntax keyword altFunctionList dtSetOutputTable

"C-API Functions -- Segment Loop Control Functions
syntax keyword altFunctionList dtSetSegmentFunct
syntax keyword altFunctionList dtSetSegmentFunctWithName
syntax keyword altFunctionList dtExecuteSegmentFunct
syntax keyword altFunctionList dtSetSegmentFuncOption
syntax keyword altVariableList DT_LOOP_CENTER_TO_ENDS
syntax keyword altVariableList DT_LOOP_INDEX
syntax keyword altVariableList DT_LOOP_END_BACKWARD
syntax keyword altVariableList DT_LOOP_END_FORWARD
syntax keyword altVariableList DT_MAIN_POLYGON
syntax keyword altVariableList DT_MAIN_SEGMENT
syntax keyword altVariableList DT_SEGMENTFUNC_FMASK
syntax keyword altVariableList DT_SEGMENTFUNC_KEEP_PRIORITY_CORRECTED
syntax keyword altVariableList DT_SEGMENTFUNC_LEVEL_MASK
syntax keyword altVariableList DT_SEGMENTFUNC_POLY_ORDER
syntax keyword altVariableList DT_SEGMENTFUNC_RUNONCE
syntax keyword altVariableList DT_SEGMENTFUNC_SEG_ORDER
syntax keyword altVariableList DT_SEGMENTFUNC_SKIP_IGNORE
syntax keyword altVariableList DT_SPT_IGNORE
syntax keyword altVariableList DT_SPT_NUMBER_SEGMENTS

"C-API Functions Segment Property Functions
syntax keyword altFunctionList dtGetSegmentBoxIntersectDistance
syntax keyword altFunctionList dtGetSegmentProperty
syntax keyword altFunctionList dtGetSegmentPropertyInt
syntax keyword altFunctionList dtGetSegmentPropertyArray
syntax keyword altFunctionList dtSetPropertyAccessOption
syntax keyword altFunctionList dtSetSegmentProperty
syntax keyword altFunctionList dtSetSegmentPropertyInt
syntax keyword altFunctionList dtGetSegmentOffset
syntax keyword altFunctionList dtSetAttachmentCopy
syntax keyword altFunctionList dtGetSegmentAttachment
syntax keyword altFunctionList dtResetSegmentAttachment
syntax keyword altFunctionList dtResetSegmentAttachmentSize
syntax keyword altFunctionList dtGetSegmentAttachmentSize
syntax keyword altFunctionList dtConvertSegmentOffset
syntax keyword altFunctionList dtGetBBoxRelation
syntax keyword altVariableList DT_SPT_ACCESS_ISEG
syntax keyword altVariableList DT_ACCESS_SEGMENT
syntax keyword altVariableList DT_SPT_ACCESS_INDEX
syntax keyword altVariableList DT_ACCESSORIG_SEGMENT
syntax keyword altVariableList DT_SPT_PRIORITY_AREA_INTERSECTION

"C-API Functions -- Segment Corner-Related Functions
syntax keyword altFunctionList dtCornerType
syntax keyword altFunctionList dtGetLengthCorner

"C-API Functions -- Segment Dissection and Correction Functions
syntax keyword altFunctionList dtMakeSegment
syntax keyword altFunctionList dtMakeSegmentByLength
syntax keyword altFunctionList dtMakeSegment3
syntax keyword altFunctionList dtMakeCornerSegment
syntax keyword altFunctionList dtSetSegmentTag
syntax keyword altFunctionList dtMakeSegmentByProjection
syntax keyword altFunctionList dtMakeSegmentByProjectionMultiLevel
syntax keyword altFunctionList dtProjectionDissectionByFreePriorityMultiLevel
syntax keyword altFunctionList dtRoundSegment
syntax keyword altFunctionList dtRetargetCorner
syntax keyword altFunctionList dtRetargetSegment4
syntax keyword altFunctionList dtApplyDissectionOption
syntax keyword altFunctionList dtApplyDissection
syntax keyword altFunctionList dtAlignSegment
syntax keyword altFunctionList dtDeleteSegment
syntax keyword altFunctionList dtClearProximitySegment
syntax keyword altFunctionList dtApplyCorrection

"C-API Functions -- Segment Context Query Functions
syntax keyword altFunctionList dtSetSegmentQueryOption
syntax keyword altFunctionList dtQuerySegmentContext
syntax keyword altFunctionList dtQuerySegmentContextMinSW
syntax keyword altFunctionList dtQuerySegmentContextMinSWMultiLevel
syntax keyword altFunctionList dtQuerySegmentContextMinSW2
syntax keyword altFunctionList dtQuerySegmentContextMinSW2MultiLevel
syntax keyword altFunctionList dtQuerySegmentContextMaxSW
syntax keyword altFunctionList dtQuerySegmentContextMaxSWMultiLevel
syntax keyword altFunctionList dtQuerySegmentContextEnclosure
syntax keyword altFunctionList dtQueryLayerRelation

"C-API Functions -- Segment DRC Functions
syntax keyword altFunctionList dtSetSegmentDRCFlag
syntax keyword altFunctionList dtClearSegmentDRCFlag
syntax keyword altFunctionList dtTestSegmentDRCFlag
syntax keyword altFunctionList dtAddDRCRegister
syntax keyword altFunctionList dtClearDRCRegister
syntax keyword altFunctionList dtSetSegmentDRCRegister
syntax keyword altFunctionList dtGetSegmentDRCRegister

"C-API Functions -- Modeling-Related Functions
syntax keyword altFunctionList dtEvaluateModel
syntax keyword altFunctionList dtEvaluateModelSbar
syntax keyword altFunctionList dtTestEvaluateModelOption

"C-API Functions -- Segment Bit Manipulation Functions
syntax keyword altFunctionList dtSetSegmentFlag
syntax keyword altFunctionList dtClearSegmentFlag
syntax keyword altFunctionList dtTestSegmentFlag

"C-API Functions -- Defect-Related Functions
syntax keyword altFunctionList dtCreateDefect
syntax keyword altFunctionList dtAddDefectProp
syntax keyword altFunctionList dtGetDetectorParam

"C-API Functions -- Priority Correction-Related Functions
syntax keyword altFunctionList dtSetPriorityCorrectionKeepMargin
syntax keyword altFunctionList dtSetPriorityKeepOption
syntax keyword altFunctionList dtApplyPriorityDissectionOption
syntax keyword altFunctionList dtApplyPriorityDissection
syntax keyword altFunctionList dtApplyPriorityKeep
syntax keyword altFunctionList dtSetUpdateGraphicsLayer
syntax keyword altFunctionList dtSetUpdateGraphicsOption
syntax keyword altFunctionList dtUpdateGraphics
syntax keyword altFunctionList dtGetEBHLevel
syntax keyword altFunctionList dtGetEBHMode

"C-API Functions -- Super Symmetry-Related Functions
syntax keyword altFunctionList dtSetSUSYOption 
syntax keyword altFunctionList dtSetSUSYOptionTypeLevel
syntax keyword altFunctionList dtSetSUSYRegroupOption
syntax keyword altFunctionList dtDetectSymmetry
syntax keyword altFunctionList dtRebuildSymmetry 

"C-API Functions -- Repair-Related Functions
syntax keyword altFunctionList dtSetRepairOption
syntax keyword altFunctionList dtRepairSetup
syntax keyword altFunctionList dtRepairPrepare
syntax keyword altFunctionList dtSetApplyCorrectionOption
syntax keyword altFunctionList dtRepairUpdateGraphics

"C-API Functions -- Jacobian-Related Functions
syntax keyword altFunctionList dtApplyJacobianInit
syntax keyword altFunctionList dtSetApplyJacobianOption
syntax keyword altFunctionList dtSetModelEvalPoint
syntax keyword altFunctionList dtSetModelEvalList
syntax keyword altFunctionList dtClearModelEvalList
syntax keyword altFunctionList dtQueryModelEvalPoint
syntax keyword altFunctionList dtGetModelEvalProperty
syntax keyword altFunctionList dtGetModelEvalPropertyByIndex
syntax keyword altFunctionList dtSetModelEvalPropertyByIndex
syntax keyword altFunctionList dtApplyJacobian
syntax keyword altFunctionList dtApplyJacobianNew
syntax keyword altFunctionList dtGetJacobian

"C-API Functions -- Others
syntax keyword altFunctionList dtMergeSbar
syntax keyword altFunctionList dtSplitSbar
syntax keyword altFunctionList dtDeriveBox
syntax keyword altFunctionList dtDeriveBoxAccessID
syntax keyword altFunctionList dtIsFigureContainerEmpty
syntax keyword altFunctionList dtAddPolygon
syntax keyword altFunctionList dtConvertSTtoXY
syntax keyword altFunctionList dtConvertXYtoST
syntax keyword altFunctionList dtLogPrintf
syntax keyword altFunctionList dtFatal
syntax keyword altFunctionList dtMalloc
syntax keyword altFunctionList dtFree
syntax keyword altFunctionList dtGetBinaryVersion
syntax keyword altFunctionList dtGetJobType
syntax keyword altFunctionList dtGetJobOption
syntax keyword altFunctionList dtGetJobOptionInt
syntax keyword altFunctionList dtSetSUSYEstablish
syntax keyword altFunctionList dtGetSUSYEstablish
syntax keyword altFunctionList dtResetErrorInfo
syntax keyword altFunctionList dtIsValidOption
syntax keyword altFunctionList dtQueryFigureContainer
syntax keyword altFunctionList dtSetCorrectionGrid
syntax keyword altFunctionList dtGetBoundingBox
syntax keyword altFunctionList dtAddText
syntax keyword altFunctionList dtClearUserText
syntax keyword altFunctionList dtTestBug
syntax keyword altFunctionList dtGetSegmentHVBias
syntax keyword altFunctionList dtSelectHotspotBin
syntax keyword altFunctionList dtGetArrayCellPitchSize
syntax keyword altFunctionList dtGetArrayCenterCellXY
syntax keyword altFunctionList dtSetLayerSkipBit
syntax keyword altFunctionList dtClearLayerSkipBit
syntax keyword altFunctionList dtCheckLayerSkipBit

"C-API Function -- Supported Math Functions
syntax keyword altFunctionList dtMathAbs
syntax keyword altFunctionList dtMathAcos
syntax keyword altFunctionList dtMathAsin
syntax keyword altFunctionList dtMathAtan
syntax keyword altFunctionList dtMathAtan2
syntax keyword altFunctionList dtMathCeil
syntax keyword altFunctionList dtMathCos
syntax keyword altFunctionList dtMathExp
syntax keyword altFunctionList dtMathFloor
syntax keyword altFunctionList dtMathLog
syntax keyword altFunctionList dtMathLog10
syntax keyword altFunctionList dtMathPow
syntax keyword altFunctionList dtMathSin
syntax keyword altFunctionList dtMathSqrt
syntax keyword altFunctionList dtMathTan
syntax keyword altFunctionList dtMathRound

"Properties Table -- Global Properties
syntax keyword altVariableList DT_SPT_CORRECTION_MARGIN
syntax keyword altVariableList DT_SPT_CORRECTION_EROSION

"Properties Table -- Segment Properties Table -- Segment Geometry Properties
syntax keyword altVariableList DT_SPT_GRAPHICS_INDEX
syntax keyword altVariableList DT_SPT_NUMBER_POLYGONS
syntax keyword altVariableList DT_SPT_POLYGON_INDEX
syntax keyword altVariableList DT_SPT_NUMBER_SEGMENTS
syntax keyword altVariableList DT_SPT_SEGMENT_INDEX

"Properties Table -- Segment Properties Table -- Polygon Bounding Box Properties
syntax keyword altVariableList DT_SPT_BBOX_WIDTH
syntax keyword altVariableList DT_SPT_BBOX_HEIGHT

"Properties Table -- Segment Properties Table -- Segment Physical Properties
syntax keyword altVariableList DT_SPT_GX
syntax keyword altVariableList DT_SPT_GY
syntax keyword altVariableList DT_SPT_LENGTH
syntax keyword altVariableList DT_SPT_MAJOR_LENGTH
syntax keyword altVariableList DT_SPT_LAYER
syntax keyword altVariableList DT_SPT_DIRECTION
syntax keyword altVariableList DT_SPT_DELTA_DIRECTION
syntax keyword altVariableList DT_SPT_ANGLE
syntax keyword altVariableList DT_SPT_DELTA_ANGLE
syntax keyword altVariableList DT_SPT_PATCHRELATION
syntax keyword altVariableList DT_SPT_PBOX_XDISTANCE
syntax keyword altVariableList DT_SPT_PBOX_YDISTANCE
syntax keyword altVariableList DT_SPT_POLYGON_MASSCENTER_X
syntax keyword altVariableList DT_SPT_POLYGON_MASSCENTER_Y
syntax keyword altVariableList DT_SPT_POLYGON_AREA
syntax keyword altVariableList DT_SPT_POLYGON_WITHHOLE
syntax keyword altVariableList DT_SPT_PATCH_INTERSECTION_S1
syntax keyword altVariableList DT_SPT_PATCH_INTERSECTION_S2
syntax keyword altVariableList DT_SPT_CBOX_INTERSECTION_S1
syntax keyword altVariableList DT_SPT_CBOX_INTERSECTION_S2
syntax keyword altVariableList DT_SPT_SB_EVAL_MDL_IDX
syntax keyword altVariableList DT_SPT_SB_EVAL_RI
syntax keyword altVariableList DT_SPT_SB_EVAL_LOC_S
syntax keyword altVariableList DT_SPT_SB_EVAL_LOC_T
syntax keyword altVariableList DT_SPT_HOLE
syntax keyword altVariableList DT_SPT_HOLE_PARENT_POLYGON_INDEX

"Properties Table -- Segment Properties Table -- Segment Correction Properties
syntax keyword altVariableList DT_SPT_CORRECTION_VALUE
syntax keyword altVariableList DT_SPT_CORRECTION_DELTA
syntax keyword altVariableList DT_SPT_STITCH

"Properties Table -- Segment Properties Table -- Context Segment Properties
syntax keyword altVariableList DT_SPT_CONTEXT_ISEG
syntax keyword altVariableList DT_SPT_CONTEXT_NSEG
syntax keyword altVariableList DT_SPT_CONTEXT_DELTA_ANGLE
syntax keyword altVariableList DT_SPT_PROXIMITY_SEGMENT
syntax keyword altVariableList DT_SPT_PROMIXITY_NSEG
syntax keyword altVariableList DT_SPT_PROXIMITY_ISEG
syntax keyword altVariableList DT_SPT_MINWIDTH_ISEG
syntax keyword altVariableList DT_SPT_MINSPACE_ISEG
syntax keyword altVariableList DT_SPT_MINWIDTH_NSEG
syntax keyword altVariableList DT_SPT_MINSPACE_NSEG
syntax keyword altVariableList DT_SPT_PROJECTION_S
syntax keyword altVariableList DT_SPT_PROJECTION_T
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_X0
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_X1
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_Y0
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_Y1
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_S
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_X
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_T
syntax keyword altVariableList DT_SPT_C2C_PROJECTION_Y
syntax keyword altVariableList DT_SPT_OVERLAP_PROJECTION_LENGTH
syntax keyword altVariableList DT_SPT_INTERSECTION_S
syntax keyword altVariableList DT_SPT_MINDISTANCE
syntax keyword altVariableList DT_SPT_SORT_CONTEXT1
syntax keyword altVariableList DT_SPT_SORT_CONTEXT2
syntax keyword altVariableList DT_SPT_POLYGON_RELATION

"Properties Table -- Segment Properties Table -- Dissected Segment Properties
syntax keyword altVariableList DT_SPT_DISSECT_NSEG
syntax keyword altVariableList DT_SPT_DISSECT_ISEG
syntax keyword altVariableList DT_SPT_STITCH_POINT_S
syntax keyword altVariableList DT_SPT_STITCH_POINT
syntax keyword altVariableList DT_SPT_CONTROL_S
syntax keyword altVariableList DT_SPT_CONTROL_T
syntax keyword altVariableList DT_SPT_TAG
syntax keyword altVariableList DT_SPT_GROUP
syntax keyword altVariableList DT_SPT_FLOOR_STITCH_ISEG
syntax keyword altVariableList DT_SPT_DUMMY_DISSECT
syntax keyword altVariableList DT_SPT_RESET_SEGMENT_END

"Properties Table -- Segment Properties Table -- Segment Attachment Properties
syntax keyword altVariableList DT_SPT_ATTACHMENT_INDEX
syntax keyword altVariableList DT_SPT_ATTACHMENT_COUNT

"Properties Table -- Segment Properties Table -- User Data Properties
syntax keyword altVariableList DT_SPT_USER_DATA_0
syntax keyword altVariableList DT_SPT_USER_DATA_1
syntax keyword altVariableList DT_SPT_USER_DATA_2
syntax keyword altVariableList DT_SPT_USER_DATA_3
syntax keyword altVariableList DT_SPT_USER_DATA_4
syntax keyword altVariableList DT_SPT_USER_DATA_5
syntax keyword altVariableList DT_SPT_USER_DATA_6
syntax keyword altVariableList DT_SPT_USER_DATA_7
syntax keyword altVariableList DT_SPT_USER_DATA_8
syntax keyword altVariableList DT_SPT_USER_DATA_9
syntax keyword altVariableList DT_SPT_USER_DATA_10
syntax keyword altVariableList DT_SPT_USER_DATA_11
syntax keyword altVariableList DT_SPT_USER_DATA_12
syntax keyword altVariableList DT_SPT_USER_DATA_13
syntax keyword altVariableList DT_SPT_USER_DATA_14
syntax keyword altVariableList DT_SPT_USER_DATA_15
syntax keyword altVariableList DT_SPT_USER_DATA_16
syntax keyword altVariableList DT_SPT_USER_DATA_17
syntax keyword altVariableList DT_SPT_USER_DATA_18
syntax keyword altVariableList DT_SPT_USER_DATA_19
syntax keyword altVariableList DT_SPT_USER_DATA_20
syntax keyword altVariableList DT_SPT_USER_DATA_21
syntax keyword altVariableList DT_SPT_USER_DATA_22
syntax keyword altVariableList DT_SPT_USER_DATA_23
syntax keyword altVariableList DT_SPT_USER_DATA_24
syntax keyword altVariableList DT_SPT_USER_DATA_25
syntax keyword altVariableList DT_SPT_USER_DATA_26
syntax keyword altVariableList DT_SPT_USER_DATA_27
syntax keyword altVariableList DT_SPT_USER_DATA_28
syntax keyword altVariableList DT_SPT_USER_DATA_29
syntax keyword altVariableList DT_SPT_USER_DATA_30
syntax keyword altVariableList DT_SPT_USER_DATA_31
syntax keyword altVariableList DT_SPT_USER_DATA_32
syntax keyword altVariableList DT_SPT_USER_DATA_33
syntax keyword altVariableList DT_SPT_USER_DATA_34
syntax keyword altVariableList DT_SPT_USER_DATA_35
syntax keyword altVariableList DT_SPT_USER_DATA_36
syntax keyword altVariableList DT_SPT_USER_DATA_37
syntax keyword altVariableList DT_SPT_USER_DATA_38
syntax keyword altVariableList DT_SPT_USER_DATA_39

"Properties Table -- Segment Properties Table -- Segment Access Properties
syntax keyword altVariableList DT_SPT_LOOP_INDEX

"Properties Table -- Segment Properties Table -- Priority Correction Segment Properties
syntax keyword altVariableList DT_SPT_PRIORITY_CORRECTED
syntax keyword altVariableList DT_SPT_PRIORITY_CORRECTION_VALUE
syntax keyword altVariableList DT_SPT_PRIORITY_KEEP
syntax keyword altVariableList DT_SPT_KEEP_AREA_RELATION
syntax keyword altVariableList DT_SPT_PRIORITY_AREA_RELATION
syntax keyword altVariableList DT_SPT_PRIORITY_AREA_INTERSECTION
syntax keyword altVariableList DT_SPT_KEEP_AREA_XDISTANCE
syntax keyword altVariableList DT_SPT_KEEP_AREA_YDISTANCE
syntax keyword altVariableList DT_SPT_EBH_LEVEL
syntax keyword altVariableList DT_SPT_PRIORITY_HEALING
syntax keyword altVariableList DT_SPT_PRIORITY_HEALING_DISTANCE

"Properties Table -- Segment Properties Table -- Super Symmetry-Related Properties
syntax keyword altVariableList DT_SPT_SUSY_CHECK_CBOX
syntax keyword altVariableList DT_SPT_SUSY_GID
syntax keyword altVariableList DT_NO_SUSY_REP
syntax keyword altVariableList DT_SPT_SUSY_NGROUP
syntax keyword altVariableList DT_SUSY_REP_SEGMENT
syntax keyword altVariableList DT_SUSY_REP_SEGMENT_PREFIX
syntax keyword altVariableList DT_SPT_SUSY_GID_RESET

"Properties Table -- Segment Properties Table -- Update Graphics-Related Properties
syntax keyword altVariableList DT_SPT_UPDATE_GRAPHICS_NEW
syntax keyword altVariableList DT_SPT_UPDATE_GRAPHICS_POLYGON_NEW
syntax keyword altVariableList DT_SPT_UPDATE_GRAPHICS_PARENT_POLYGON_NUMBER
syntax keyword altVariableList DT_SPT_UPDATE_GRAPHICS_PARENT_POLYGON_INDEX

"Properties Table -- Segment Properties Table -- Hotspot-Related Properties
syntax keyword altVariableList DT_SPT_HOTSPOT_INDEX
syntax keyword altVariableList DT_SPT_HOTSPOT_COUNT
syntax keyword altVariableList DT_SPT_HOTSPOT_X1
syntax keyword altVariableList DT_SPT_HOTSPOT_Y1
syntax keyword altVariableList DT_SPT_HOTSPOT_X2
syntax keyword altVariableList DT_SPT_HOTSPOT_Y2
syntax keyword altVariableList DT_SPT_HOTSPOT_RANGE
syntax keyword altVariableList DT_SPT_HOTSPOT_MINDISTANCE
syntax keyword altVariableList DT_SPT_HOTSPOT_POINT_MINDIST
syntax keyword altVariableList DT_SPT_HOTSPOT_MINDISTANCE_MAX_NORM
syntax keyword altVariableList DT_SPT_HOTSPOT_POINT_MINDIST_MAX_NORM
syntax keyword altVariableList DT_SPT_HOTSPOT_MAX_LINE_MINDIST

"Properties Table -- Segment Properties Table -- Cell Box Properties
syntax keyword altVariableList DT_SPT_CELLBOX_MINDISTANCE
syntax keyword altVariableList DT_SPT_CELLBOX_POINT_MINDIST
syntax keyword altVariableList DT_SPT_CELLBOX_MINDISTANCE_MAX_NORM
syntax keyword altVariableList DT_SPT_CELLBOX_POINT_MINDIST_MAX_NORM
syntax keyword altVariableList DT_SPT_CELLBOX_MAX_LINE_MINDIST

"Properties Table -- Segment Properties Table -- Other Segment Properties
syntax keyword altVariableList DT_SPT_ERROR_CODE
syntax keyword altVariableList DT_SPT_SEGMENT_REMOVED
syntax keyword altVariableList DT_SPT_IGNORE
syntax keyword altVariableList DT_SPT_PROXIMITY_INVALID

"if-then-elseif-end
syntax keyword altLogicKeywordList if
syntax keyword altLogicKeywordList then
syntax keyword altLogicKeywordList else
syntax keyword altLogicKeywordList elseif
syntax keyword altLogicKeywordList end

"lua general keywords
syntax keyword altFunctionList function

"AppMain, AppInit...
syntax keyword altAppList AppInit
syntax keyword altAppList AppMain
syntax keyword altAppList AppDone
syntax keyword altAppList AppClean
syntax keyword altAppList AppMerge
syntax keyword altAppList AppMergeCell
syntax keyword altAppList AppMessage
syntax keyword altAppList AppModel
syntax keyword altAppList AppStage

"Special objects (e.g. DT)
syntax keyword altSpecialObjectList DT
syntax keyword altSpecialObjectList TAGS

"Special Table Keywords
syntax keyword altSpecialObjectList DEFAULT
syntax keyword altSpecialObjectList RULESET0
syntax keyword altSpecialObjectList RULESET1
syntax keyword altSpecialObjectList RULESET2
syntax keyword altSpecialObjectList RULESET_INDEX_MAP
syntax keyword altSpecialObjectList CORNER_INDEX_MAP
syntax keyword altSpecialObjectList TAG
"Make sure the value of tag >= 1 (see p.685 of Tachyon OPC+ Software Guide)
syntax match altSpecialObjectList /\vPARAM[1-9]\d*/
syntax keyword altSpecialObjectList TOP_TABLE
syntax keyword altSpecialObjectList GENERAL_TABLE
syntax keyword altSpecialObjectList DISSECT_TABLE
syntax keyword altSpecialObjectList CORRECT_TABLE
syntax keyword altSpecialObjectList EPE_TABLE
syntax keyword altSpecialObjectList PW_TABLE
syntax keyword altSpecialObjectList SBGEN_TABLE
syntax keyword altSpecialObjectList SB_TABLE
syntax keyword altSpecialObjectList MRC_TABLE
syntax keyword altSpecialObjectList MRCCHECKFIX_TABLE
syntax keyword altSpecialObjectList RULE_TABLE
syntax keyword altSpecialObjectList REPAIR_TABLE
syntax keyword altSpecialObjectList PARAMETER_TABLE

"Miscellaneous functions?
syntax keyword altFunctionList set_model_options
    syntax keyword altFunctionArgumentList flaremap
    syntax keyword altFunctionArgumentList ShadowCorrection
    syntax keyword altFunctionArgumentList SlitDiffTolerance
    syntax keyword altFunctionArgumentList skiphvbias
syntax keyword altFunctionList operationTAG

"EUV Variables
syntax keyword altVariableList EUV_OPTIONS
    syntax keyword altFunctionArgumentList flare_pixel_number
    syntax keyword altFunctionArgumentList flare_tolerance
    syntax keyword altFunctionArgumentList hvblockinglayer
    syntax keyword altFunctionArgumentList userdefinedbias
    syntax keyword altFunctionArgumentList model_map
    syntax keyword altFunctionArgumentList compute_flare_info

"TOP Table Parameter
syntax keyword altTableOptionlist alignSegmentMaxSkew1
syntax keyword altTableOptionlist alignSegmentMaxSkew2
syntax keyword altTableOptionlist alignSegmentMaxSkew3
syntax keyword altTableOptionlist alignSegmentMode
syntax keyword altTableOptionlist applyPWModelfromIter
syntax keyword altTableOptionlist checkContactAwareBeforeStop
syntax keyword altTableOptionlist checkSBprintBeforeStop
syntax keyword altTableOptionlist modelApplyFlow
syntax keyword altTableOptionlist modelMemoryPriority
syntax keyword altTableOptionlist numberOfIterations
syntax keyword altTableOptionlist rulePriorityCorrectionMargin
syntax keyword altTableOptionlist runAlignDissection
syntax keyword altTableOptionlist runApplyPriorityCorrectionAtIter
syntax keyword altTableOptionlist runBiasSmall45DegreeSegment
syntax keyword altTableOptionlist runContactAwarefromIter
syntax keyword altTableOptionlist runDeepSpEndEnhancement
syntax keyword altTableOptionlist runDefectRepair
syntax keyword altTableOptionlist runDissectByModel
syntax keyword altTableOptionlist runDissectByOD
syntax keyword altTableOptionlist runDissectOnPatchBoundary
syntax keyword altTableOptionlist runGatePositiveEPECorrectionfromIter
syntax keyword altTableOptionlist runIterStop
syntax keyword altTableOptionlist runIterStopEndIter
syntax keyword altTableOptionlist runIterStopfromIter
syntax keyword altTableOptionlist runLMVSfromIter
syntax keyword altTableOptionlist runMRC
syntax keyword altTableOptionlist runMRCForPerturbation
syntax keyword altTableOptionlist runMRCForRuleRetargeting
syntax keyword altTableOptionlist runMRCfromIter
syntax keyword altTableOptionlist runMRCfromIterMode
syntax keyword altTableOptionlist runMultiEval
syntax keyword altTableOptionlist runOPCDissection
syntax keyword altTableOptionlist runPreProjDissection
syntax keyword altTableOptionlist runPWCDSolver
syntax keyword altTableOptionlist runPWSolver
syntax keyword altTableOptionlist runPWSolverfromIter
syntax keyword altTableOptionlist runRetarget
syntax keyword altTableOptionlist runRetargetByLayer
syntax keyword altTableOptionlist runRetargetCBoxSegment
syntax keyword altTableOptionlist runRippleControl
syntax keyword altTableOptionlist runRippleControlfromIter
syntax keyword altTableOptionlist runRoundTarget
syntax keyword altTableOptionlist runRuleContactAware
syntax keyword altTableOptionlist runSBchoppingSusyHandling
syntax keyword altTableOptionlist runSBprint
syntax keyword altTableOptionlist runSBprintfromIter
syntax keyword altTableOptionlist runSBprintProjectionDissection
syntax keyword altTableOptionlist runShortEndEnhancement
syntax keyword altTableOptionlist runSpacerAwareChecker
syntax keyword altTableOptionlist runStrictMRC
syntax keyword altTableOptionlist runStrictMRCMode
syntax keyword altTableOptionlist runSusyDeltacAlignfromIter
syntax keyword altTableOptionlist runSusyDeltacFilterfromIter
syntax keyword altTableOptionlist runSusyFilterfromIter
syntax keyword altTableOptionlist runSUSYWithPriorityOptions
syntax keyword altTableOptionlist susyExtraIteration
syntax keyword altTableOptionlist susyMaxExtraIteration

"General Table Parameters
syntax keyword altTableOptionList checkParamSetting
syntax keyword altTableOptionList contactFigureLevel
syntax keyword altTableOptionList contactFigureType
syntax keyword altTableOptionList dummyFigureLevel
syntax keyword altTableOptionList dummyFigureType
syntax keyword altTableOptionList endMaxWidth
syntax keyword altTableOptionList endMinLength
syntax keyword altTableOptionList iterationCorrectionGrid
syntax keyword altTableOptionList jacFigureHole
syntax keyword altTableOptionList jacFigureLevel
syntax keyword altTableOptionList jacFigureType
syntax keyword altTableOptionList jacModel
syntax keyword altTableOptionList jogSize
syntax keyword altTableOptionList mainFigureLevel
syntax keyword altTableOptionList mainFigureType
syntax keyword altTableOptionList mainFigureTypePi
syntax keyword altTableOptionList maskPolarity
syntax keyword altTableOptionList maxCorrection
syntax keyword altTableOptionList maxCorrectionPerIteration
syntax keyword altTableOptionList minCorrection
syntax keyword altTableOptionList minFeature
syntax keyword altTableOptionList mrcCheckerProtectionFigureLevel
syntax keyword altTableOptionList mrcSBTargetFigureLevel
syntax keyword altTableOptionList mrcTargetFigureLevel
syntax keyword altTableOptionList ODFigureLevel
syntax keyword altTableOptionList outputGrid
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList priorityCorrectionMargin
syntax keyword altTableOptionList protectionFigureLevel
syntax keyword altTableOptionList protectionHandleMode
syntax keyword altTableOptionList repairSBFigureLevel
syntax keyword altTableOptionList repairSBFigureType
syntax keyword altTableOptionList retargetFigureLevel
syntax keyword altTableOptionList retargetFigureType
syntax keyword altTableOptionList retargetLayer
syntax keyword altTableOptionList roundedLayerFigureTypeLevel
syntax keyword altTableOptionList ruleContactFigureLevel
syntax keyword altTableOptionList sbFigureLevel
syntax keyword altTableOptionList sbFigureType
syntax keyword altTableOptionList smallSegment
syntax keyword altTableOptionList snapfromIter
syntax keyword altTableOptionList spendMaxWidth
syntax keyword altTableOptionList spendMinLength
syntax keyword altTableOptionList stitchEndMaxWidth
syntax keyword altTableOptionList stitchEndMinLength
syntax keyword altTableOptionList stitchMaxExtendLength
syntax keyword altTableOptionList stitchMaxOverlapDepth
syntax keyword altTableOptionList stitchMaxOverlapLength
syntax keyword altTableOptionList stitchMaxOverlapWidth
syntax keyword altTableOptionList stitchMinOverlapDepth
syntax keyword altTableOptionList stitchMinOverlapLength
syntax keyword altTableOptionList stitchMinOverlapWidth
syntax keyword altTableOptionList targetFigureLevel
syntax keyword altTableOptionList zLength

"Dissect Table Parameters
syntax keyword altTableOptionList adaptiveTStitchEndEpe
syntax keyword altTableOptionList advancedRetarget
syntax keyword altTableOptionList alignDissectSearchRange
syntax keyword altTableOptionList alignNoGate
syntax keyword altTableOptionList alignPriorityODSegment
syntax keyword altTableOptionList contactBiasMode
syntax keyword altTableOptionList contactCoverage
syntax keyword altTableOptionList contactCoverageMode
syntax keyword altTableOptionList contactCoverageWeight
syntax keyword altTableOptionList contactDebugFigureLevel
syntax keyword altTableOptionList contactDebugFigureType
syntax keyword altTableOptionList contactExclosureDistance
syntax keyword altTableOptionList contactExclosureMinProjection
syntax keyword altTableOptionList contactExclosureMode
syntax keyword altTableOptionList contactExclosurePoint
syntax keyword altTableOptionList contactExcludeWeight
syntax keyword altTableOptionList contactExtRatio
syntax keyword altTableOptionList contactMode
syntax keyword altTableOptionList contactModelID
syntax keyword altTableOptionList contactOutSearchDist
syntax keyword altTableOptionList contactRound
syntax keyword altTableOptionList contactRoundDegree
syntax keyword altTableOptionList contactSearchDist
syntax keyword altTableOptionList cornerControlPoint
syntax keyword altTableOptionList cornerControlPointMode
syntax keyword altTableOptionList cornerDissectByRule
syntax keyword altTableOptionList cornerJogRetargetWeightedMode
syntax keyword altTableOptionList cornerMultiEvalExclusion
syntax keyword altTableOptionList cornerMultiEvalExclusionRatio
syntax keyword altTableOptionList cornerRadius
syntax keyword altTableOptionList cornerSegmentLength
syntax keyword altTableOptionList deepEndDepth
syntax keyword altTableOptionList deepEndEPE
syntax keyword altTableOptionList deepEndWidth
syntax keyword altTableOptionList dissectByODHonorCorner
syntax keyword altTableOptionList dissectPointInsideOD
syntax keyword altTableOptionList endEpeInside
syntax keyword altTableOptionList endEpeOutside
syntax keyword altTableOptionList endSideEpeFactor
syntax keyword altTableOptionList endSideEpeInside
syntax keyword altTableOptionList endSideEpeOutside
syntax keyword altTableOptionList furtherDissectionDueToSbarChop
syntax keyword altTableOptionList gateTolIn
syntax keyword altTableOptionList gateTolOut
syntax keyword altTableOptionList inCornerEpeInside
syntax keyword altTableOptionList inCornerEpeOutside
syntax keyword altTableOptionList jogControlPoint
syntax keyword altTableOptionList jogRetargetAdjust
syntax keyword altTableOptionList jogRetargetFactor
syntax keyword altTableOptionList jogShiftFactor
syntax keyword altTableOptionList jogSideSegmentLength
syntax keyword altTableOptionList lineEndRadiusTable
syntax keyword altTableOptionList lineTolIn
syntax keyword altTableOptionList lineTolOut
syntax keyword altTableOptionList makeSegmentByProjection
syntax keyword altTableOptionList maxRunSegmentLength
syntax keyword altTableOptionList maxShiftJogSegLength
syntax keyword altTableOptionList modelAcuteAngleTol
syntax keyword altTableOptionList modelCornerSegmentMaxLength
syntax keyword altTableOptionList modelCornerSegmentMinLength
syntax keyword altTableOptionList modelDissectExtension
syntax keyword altTableOptionList modelDissectMode
syntax keyword altTableOptionList modelDissectNoise
syntax keyword altTableOptionList modelDissectPeakDistance
syntax keyword altTableOptionList modelDissectRI
syntax keyword altTableOptionList modelDissectRunLengthToleranceRatio
syntax keyword altTableOptionList modelDissectSampleGrid
syntax keyword altTableOptionList modelPerturbCornerDeltaC
syntax keyword altTableOptionList modelPerturbCornerDeltaCFactor
syntax keyword altTableOptionList modelPerturbDeltaC
syntax keyword altTableOptionList modelPerturbMaxLineEnd
syntax keyword altTableOptionList modelPerturbMinSideLineEnd
syntax keyword altTableOptionList multiEpeFigureLevelIn
syntax keyword altTableOptionList multiEpeFigureLevelOut
syntax keyword altTableOptionList multiEpeFigureType
syntax keyword altTableOptionList multiEval1Option
syntax keyword altTableOptionList multiEval2Option
syntax keyword altTableOptionList noEpeSegAlignOnGate
syntax keyword altTableOptionList numCornerRunSegmentInAlignDissect
syntax keyword altTableOptionList numRunSegmentInAlignDissect
syntax keyword altTableOptionList outCornerEpeInside
syntax keyword altTableOptionList outCornerEpeOutside
syntax keyword altTableOptionList ppsExtension
syntax keyword altTableOptionList ppsNumOfRunSegments
syntax keyword altTableOptionList ppsProjectionFtype
syntax keyword altTableOptionList ppsSearchRange
syntax keyword altTableOptionList ppsShadowByMain
syntax keyword altTableOptionList ppsShadowRange
syntax keyword altTableOptionList preProjMaxSegLength
syntax keyword altTableOptionList preProjNRunSegment
syntax keyword altTableOptionList preProjSearchShadow
syntax keyword altTableOptionList preProjSearchSpace
syntax keyword altTableOptionList preProjSearchWidth
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList radiusInside
syntax keyword altTableOptionList radiusJog
syntax keyword altTableOptionList radiusLineEnd
syntax keyword altTableOptionList radiusOutside
syntax keyword altTableOptionList ratioSegment45
syntax keyword altTableOptionList retargetCornerNoTol
syntax keyword altTableOptionList retargetDegree
syntax keyword altTableOptionList retargetDegreeDecodeBehavior
syntax keyword altTableOptionList retargetEvalPointDist
syntax keyword altTableOptionList retargetJog
syntax keyword altTableOptionList retargetOption
syntax keyword altTableOptionList retargetRadius
syntax keyword altTableOptionList retargetRange
syntax keyword altTableOptionList runEpeInside
syntax keyword altTableOptionList runEpeOutside
syntax keyword altTableOptionList runSegmentLength
syntax keyword altTableOptionList segAlignEpeInside
syntax keyword altTableOptionList segAlignEpeOutside
syntax keyword altTableOptionList segAlignGateEpeInside
syntax keyword altTableOptionList segAlignGateEpeOutside
syntax keyword altTableOptionList segmentLengthToleranceRatio
syntax keyword altTableOptionList shiftJogControlT
syntax keyword altTableOptionList shortEndEvalDistance
syntax keyword altTableOptionList shortEndEvalMode
syntax keyword altTableOptionList shortEndExtension
syntax keyword altTableOptionList shortEndSideEPE
syntax keyword altTableOptionList shortEndWidth
syntax keyword altTableOptionList spaceC2CEnd
syntax keyword altTableOptionList spaceC2CStart
syntax keyword altTableOptionList spaceEndRadiusTable
syntax keyword altTableOptionList spendEpeInside
syntax keyword altTableOptionList spendEpeOutside
syntax keyword altTableOptionList spendSideEpeFactor
syntax keyword altTableOptionList spendSideEpeInside
syntax keyword altTableOptionList spendSideEpeOutside
syntax keyword altTableOptionList stitchEndEpe
syntax keyword altTableOptionList stitchSideEpe
syntax keyword altTableOptionList suppressJogShiftRange
syntax keyword altTableOptionList useRadiusFromDissectLayer
syntax keyword altTableOptionList widthC2CEnd
syntax keyword altTableOptionList widthC2CStart
syntax keyword altTableOptionList zlengthEpe
syntax keyword altTableOptionList zSegmentRetargetAdjust

"Correct Table
syntax keyword altTableOptionList adaptiveDampingEPE
syntax keyword altTableOptionList adaptiveDampingEPE1
syntax keyword altTableOptionList adaptiveDampingEPE2
syntax keyword altTableOptionList adaptiveDampingfromIter
syntax keyword altTableOptionList adaptiveDampingMode
syntax keyword altTableOptionList adaptiveDampingMultiEpe
syntax keyword altTableOptionList adaptiveDampingRatioDown
syntax keyword altTableOptionList adaptiveDampingRatioUp
syntax keyword altTableOptionList adaptiveDampingPosition
syntax keyword altTableOptionList contactAware
syntax keyword altTableOptionList contactMultiEval
syntax keyword altTableOptionList contactPriority
syntax keyword altTableOptionList cornerCorrectControl
syntax keyword altTableOptionList cornerDeltaControl
syntax keyword altTableOptionList cornerDeltaIncrementTable
syntax keyword altTableOptionList cornerDeltaMax
syntax keyword altTableOptionList cornerDeltaStepTable
syntax keyword altTableOptionList cornerDeltaTrigger
syntax keyword altTableOptionList cornerEPEControl
syntax keyword altTableOptionList cornerEPEDeltaTol
syntax keyword altTableOptionList cornerEPETol
syntax keyword altTableOptionList cornerMultiPointSignalDampingFactor
syntax keyword altTableOptionList cornerSignalDampingFactor
syntax keyword altTableOptionList correctRestrictByModelOnly
syntax keyword altTableOptionList correctZShape
syntax keyword altTableOptionList dampingFactor1
syntax keyword altTableOptionList deltaControlRelaxRatio
syntax keyword altTableOptionList gateNegativeEPECorrectDampingFactor
syntax keyword altTableOptionList gatePositiveEPECorrectDampingFactor
syntax keyword altTableOptionList initialBias
syntax keyword altTableOptionList initialStepSize
syntax keyword altTableOptionList initialStepSizeNeg
syntax keyword altTableOptionList lineEndFlexControlPointEvalfromIter
syntax keyword altTableOptionList lineEndFlexControlPointEvalRange
syntax keyword altTableOptionList localMVSAccurateJac
syntax keyword altTableOptionList localMVSAdaptiveDampingEPE1
syntax keyword altTableOptionList localMVSAdaptiveDampingEPE2
syntax keyword altTableOptionList localMVSAdaptiveDampingMultiEpe
syntax keyword altTableOptionList localMVSAdaptiveDampingPosition
syntax keyword altTableOptionList localMVSAdaptiveWeight
syntax keyword altTableOptionList localMVSAlphaIter
syntax keyword altTableOptionList localMVSCaViolationWeight
syntax keyword altTableOptionList localMVSContactAllowDissect
syntax keyword altTableOptionList localMVSContactAllowRunSeg
syntax keyword altTableOptionList localMVSContactAllowZSeg
syntax keyword altTableOptionList localMVSContactMaxSegNum
syntax keyword altTableOptionList localMVSContactSideRatio
syntax keyword altTableOptionList localMVSContactSolver
syntax keyword altTableOptionList localMVSCornerWeight
syntax keyword altTableOptionList localMVSDampingFactor1
syntax keyword altTableOptionList localMVSDeviatedSignal
syntax keyword altTableOptionList localMVSDirPerturbIter
syntax keyword altTableOptionList localMVSEpeModefromIter
syntax keyword altTableOptionList localMVSImprovedSignal
syntax keyword altTableOptionList localMVSJacSimpleModelStopIter
syntax keyword altTableOptionList localMVSLESolver
syntax keyword altTableOptionList localMVSLooseWeight
syntax keyword altTableOptionList localMVSMaxCoupledGroupNum
syntax keyword altTableOptionList localMVSNcEpefromIter
syntax keyword altTableOptionList localMVSNSide
syntax keyword altTableOptionList localMVSOrthPerturbIter
syntax keyword altTableOptionList localMVSPVSolver
syntax keyword altTableOptionList localMVSPwLooseRatio
syntax keyword altTableOptionList localMVSPwViolationWeight
syntax keyword altTableOptionList localMVSSlopeWeightIter
syntax keyword altTableOptionList localMVSSlowDownDeltaC
syntax keyword altTableOptionList localMVSUseSVSfromIter
syntax keyword altTableOptionList localMVSUseSVSStopIter
syntax keyword altTableOptionList meWtCenter
syntax keyword altTableOptionList meWtEdge
syntax keyword altTableOptionList modelRetargetControl
syntax keyword altTableOptionList modelRetargetfromIter
syntax keyword altTableOptionList modelRetargetIncRatio
syntax keyword altTableOptionList modelRetargetLongShort
syntax keyword altTableOptionList modelRetargetMaxShiftIter
syntax keyword altTableOptionList modelRetargetSampleStep
syntax keyword altTableOptionList modelRetargetStopIter
syntax keyword altTableOptionList modelRetargetUpBound
syntax keyword altTableOptionList multiEval_debugTypeLevel
syntax keyword altTableOptionList multiEval_s
syntax keyword altTableOptionList multiEval_wn
syntax keyword altTableOptionList multiEval_wp
syntax keyword altTableOptionList multiEvalfromIter
syntax keyword altTableOptionList multiEvalMetric
syntax keyword altTableOptionList mvsAdaptiveDampingEPE1
syntax keyword altTableOptionList mvsAdaptiveDampingEPE2
syntax keyword altTableOptionList ncModelID
syntax keyword altTableOptionList neighborDeltaControl
syntax keyword altTableOptionList neighborDeltaIncrementTable
syntax keyword altTableOptionList neighborDeltaMax
syntax keyword altTableOptionList neighborDeltaStepTable
syntax keyword altTableOptionList neighborDeltaTrigger
syntax keyword altTableOptionList numberOfIterationsByTag
syntax keyword altTableOptionList ODAware
syntax keyword altTableOptionList perturbationMode
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList rippleControlE2E
syntax keyword altTableOptionList rippleControlMode
syntax keyword altTableOptionList rippleExcludeEnd
syntax keyword altTableOptionList rippleExcludeEndSide
syntax keyword altTableOptionList rippleExcludeIn
syntax keyword altTableOptionList rippleExcludeOut
syntax keyword altTableOptionList rippleExcludeSpend
syntax keyword altTableOptionList rippleExcludeSpendSide
syntax keyword altTableOptionList rippleMaxWidth
syntax keyword altTableOptionList rippleMinLength
syntax keyword altTableOptionList rippleSearchDist
syntax keyword altTableOptionList rippleTol
syntax keyword altTableOptionList rippleWeight
syntax keyword altTableOptionList signalConst
syntax keyword altTableOptionList signalConstInIter
syntax keyword altTableOptionList signalConstIter
syntax keyword altTableOptionList signalConstLEIter
syntax keyword altTableOptionList signalConstOutIter
syntax keyword altTableOptionList signalConstSEIter
syntax keyword altTableOptionList signalConstZIter
syntax keyword altTableOptionList slopeThreshold
syntax keyword altTableOptionList spacerAware
syntax keyword altTableOptionList stopCornerDistance
syntax keyword altTableOptionList stopDeltaCtol
syntax keyword altTableOptionList stopDeltaCtolSB
syntax keyword altTableOptionList stopEndDistance
syntax keyword altTableOptionList stopEPEEvalMode
syntax keyword altTableOptionList stopEPEtolGate1D
syntax keyword altTableOptionList stopEPEtolGate2D
syntax keyword altTableOptionList stopEPEtolLine
syntax keyword altTableOptionList stopGate2Ddistance
syntax keyword altTableOptionList stopJogDistance
syntax keyword altTableOptionList stopPW
syntax keyword altTableOptionList susyDeltacThreshold
syntax keyword altTableOptionList susyEpeThreshold
syntax keyword altTableOptionList wtNTable
syntax keyword altTableOptionList wtPTable

"EPE Table Parameters
syntax keyword altTableOptionList epeCheckDetector
syntax keyword altTableOptionList epeCheckEvalPoint
syntax keyword altTableOptionList epeCheckModelID
syntax keyword altTableOptionList epeCheckTolerance
syntax keyword altTableOptionList finalIterCheck
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList stopGate1Det
syntax keyword altTableOptionList stopGate2Det
syntax keyword altTableOptionList stopLineDet
syntax keyword altTableOptionList stopPwCDDet

"PW Table Parameters
syntax keyword altTableOptionList outputPWResolveMarker
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList pvCostMode
syntax keyword altTableOptionList pvSkipExcludeSeg
syntax keyword altTableOptionList pvSolver
syntax keyword altTableOptionList pvViolationWeight
syntax keyword altTableOptionList pwAddEvalPointAtExclude
syntax keyword altTableOptionList pwBoundarySkipRatio
syntax keyword altTableOptionList pwBridging
syntax keyword altTableOptionList pwBridgingC2C
syntax keyword altTableOptionList pwBridgingE2E
syntax keyword altTableOptionList pwBridgingE2L
syntax keyword altTableOptionList pwBridgingFirstLESide
syntax keyword altTableOptionList pwBridgingFirstSESide
syntax keyword altTableOptionList pwBridgingLESide
syntax keyword altTableOptionList pwBridgingSecondLESide
syntax keyword altTableOptionList pwBridgingSecondSESide
syntax keyword altTableOptionList pwBridgingSESide
syntax keyword altTableOptionList pwBridgingThirdLESide
syntax keyword altTableOptionList pwBridgingThirdSESide
syntax keyword altTableOptionList pwBrMarkerFigureLevel
syntax keyword altTableOptionList pwCD2EpeWeight
syntax keyword altTableOptionList pwCD2HighPriorityOnWorst
syntax keyword altTableOptionList pwCD2MarginAdjustment
syntax keyword altTableOptionList pwCD2MarginAdjustMode
syntax keyword altTableOptionList pwCD2MarginFactor
syntax keyword altTableOptionList pwCD2MarginSpaceScale
syntax keyword altTableOptionList pwCD2MarginWidthScale
syntax keyword altTableOptionList pwCD2NeighborWeight
syntax keyword altTableOptionList pwCD2NkBrWeight
syntax keyword altTableOptionList pwCD2NumOfPass
syntax keyword altTableOptionList pwCD2SpacerAwareWeight
syntax keyword altTableOptionList pwCDAccurateGrade_C2C
syntax keyword altTableOptionList pwCDAdaptiveGridfromLastIter
syntax keyword altTableOptionList pwCDAdjustMaxAmount
syntax keyword altTableOptionList pwCDEstimateTol
syntax keyword altTableOptionList pwCDLargeMarginSpace
syntax keyword altTableOptionList pwCDLargeMarginWidth
syntax keyword altTableOptionList pwCDMarginSpaceMinTol
syntax keyword altTableOptionList pwCDMarginWidthMinTol
syntax keyword altTableOptionList pwCDMarginYieldSpace
syntax keyword altTableOptionList pwCDMarginYieldWidth
syntax keyword altTableOptionList pwCDMaxMeef
syntax keyword altTableOptionList pwCDMeefMode
syntax keyword altTableOptionList pwCDMinMeef
syntax keyword altTableOptionList pwCDSearchMode_C2C
syntax keyword altTableOptionList pwCDWidthSpaceMargin
syntax keyword altTableOptionList pwCombinedResolve
syntax keyword altTableOptionList pwDoNotSolveGate
syntax keyword altTableOptionList pwEndEpeInside
syntax keyword altTableOptionList pwEndEpeOutside
syntax keyword altTableOptionList pwEndSideEpeInside
syntax keyword altTableOptionList pwEndSideEpeOutside
syntax keyword altTableOptionList pwEpeInside
syntax keyword altTableOptionList pwEpeOutside
syntax keyword altTableOptionList pwEvalPointExt_C2C
syntax keyword altTableOptionList pwExcludeEnd
syntax keyword altTableOptionList pwExcludeEndSide
syntax keyword altTableOptionList pwExcludeIn
syntax keyword altTableOptionList pwExcludeJog
syntax keyword altTableOptionList pwExcludeOut
syntax keyword altTableOptionList pwExcludeSpend
syntax keyword altTableOptionList pwExcludeSpendSide
syntax keyword altTableOptionList pwExcludeTStitch
syntax keyword altTableOptionList pwFieldSearchDist
syntax keyword altTableOptionList pwFieldSearchDist_C2C
syntax keyword altTableOptionList pwHighPriorityOnWorst
syntax keyword altTableOptionList pwImaxThresh
syntax keyword altTableOptionList pwIminThresh
syntax keyword altTableOptionList pwInCornerEpeInside
syntax keyword altTableOptionList pwInCornerEpeOutside
syntax keyword altTableOptionList pwInterColorBridging
syntax keyword altTableOptionList pwInterColorBridgingC2C
syntax keyword altTableOptionList pwInterColorBridgingCondition
syntax keyword altTableOptionList pwInterColorBridgingE2E
syntax keyword altTableOptionList pwInterColorBridgingE2L
syntax keyword altTableOptionList pwInterColorNecking
syntax keyword altTableOptionList pwInterColorNeckingCondition
syntax keyword altTableOptionList pwIs
syntax keyword altTableOptionList pwLESearchDist_C2C
syntax keyword altTableOptionList pwLocation
syntax keyword altTableOptionList pwMarkerFigureType
syntax keyword altTableOptionList pwModelID
syntax keyword altTableOptionList pwNecking
syntax keyword altTableOptionList pwNeckingC2C
syntax keyword altTableOptionList pwNeckingCDV
syntax keyword altTableOptionList pwNeckingE2E
syntax keyword altTableOptionList pwNeckingE2L
syntax keyword altTableOptionList pwNeckingFirstLESide
syntax keyword altTableOptionList pwNeckingFirstSESide
syntax keyword altTableOptionList pwNeckingLESide
syntax keyword altTableOptionList pwNeckingSecondLESide
syntax keyword altTableOptionList pwNeckingSecondSESide
syntax keyword altTableOptionList pwNeckingSESide
syntax keyword altTableOptionList pwNeckingThirdLESide
syntax keyword altTableOptionList pwNeckingThirdSESide
syntax keyword altTableOptionList pwNkMarkerFigureLevel
syntax keyword altTableOptionList pwOutCornerEpeInside
syntax keyword altTableOptionList pwOutCornerEpeOutside
syntax keyword altTableOptionList pwPolySearchDist
syntax keyword altTableOptionList pwPolySearchDist_C2C
syntax keyword altTableOptionList pwPriorityChoice
syntax keyword altTableOptionList pwRelaxCornerEpeInside
syntax keyword altTableOptionList pwRelaxCornerEpeOutside
syntax keyword altTableOptionList pwRelaxEndEpeInside
syntax keyword altTableOptionList pwRelaxEndEpeOutside
syntax keyword altTableOptionList pwRelaxEndSideEpeInside
syntax keyword altTableOptionList pwRelaxEndSideEpeOutside
syntax keyword altTableOptionList pwRelaxEpeInside
syntax keyword altTableOptionList pwRelaxEpeOutside
syntax keyword altTableOptionList pwRelaxSpEndEpeInside
syntax keyword altTableOptionList pwRelaxSpEndEpeOutside
syntax keyword altTableOptionList pwRelaxSpEndSideEpeInside
syntax keyword altTableOptionList pwRelaxSpEndSideEpeOutside
syntax keyword altTableOptionList pwSearchMinLen_C2C
syntax keyword altTableOptionList pwSearchProjLen_C2C
syntax keyword altTableOptionList pwSearchSkipJog
syntax keyword altTableOptionList pwSESearchDist_C2C
syntax keyword altTableOptionList pwSkipMode
syntax keyword altTableOptionList pwSolverMetric
syntax keyword altTableOptionList pwSpacerCoverage
syntax keyword altTableOptionList pwSpacerInnerDistance
syntax keyword altTableOptionList pwSpacerInSearchDist
syntax keyword altTableOptionList pwSpacerOuterDistance
syntax keyword altTableOptionList pwSpacerOutSearchDist
syntax keyword altTableOptionList pwSpEndEpeInside
syntax keyword altTableOptionList pwSpEndEpeOutside
syntax keyword altTableOptionList pwSpEndSideEpeInside
syntax keyword altTableOptionList pwSpEndSideEpeOutside
syntax keyword altTableOptionList pwStitchAwareRange
syntax keyword altTableOptionList pwWeight
syntax keyword altTableOptionList stitchAware_debugTypeLevel

"SBGEN Table Parameters
syntax keyword altTableOptionList cornerSegmentLengthForExtraction
syntax keyword altTableOptionList ctmMainRunLength
syntax keyword altTableOptionList endMaxWidth
syntax keyword altTableOptionList endMinLength
syntax keyword altTableOptionList isoMergeLength
syntax keyword altTableOptionList isRuleFreeSB
syntax keyword altTableOptionList lineMaxSpaceSbGeneral
syntax keyword altTableOptionList lineMaxWidthSbFavor
syntax keyword altTableOptionList lineMaxWidthSbGeneral
syntax keyword altTableOptionList makeLineEndSB
syntax keyword altTableOptionList maxMergedRunLength
syntax keyword altTableOptionList maxMergedSWRunLength
syntax keyword altTableOptionList minDraw
syntax keyword altTableOptionList minRunLengthSbFavor
syntax keyword altTableOptionList minRunLengthSbGeneral
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList runSegmentLengthForExtraction
syntax keyword altTableOptionList sbAdditionalMergeLen
syntax keyword altTableOptionList sbAdditionalOffsetForExtension
syntax keyword altTableOptionList sbAdjustCenterBarOption
syntax keyword altTableOptionList sbAdjustCollinearOffset
syntax keyword altTableOptionList sbAlignmentExtension
syntax keyword altTableOptionList sbAlignmentMaxExtraLength
syntax keyword altTableOptionList sbAlignmentMaxGeneralIteration
syntax keyword altTableOptionList sbAlignmentOffsetTolAll
syntax keyword altTableOptionList sbAlignmentOffsetTolerance
syntax keyword altTableOptionList sbAlignmentOption
syntax keyword altTableOptionList sbAlignmentSymPriority
syntax keyword altTableOptionList sbAlignmentWidthTolerance
syntax keyword altTableOptionList sbAllowNonRectSB
syntax keyword altTableOptionList sbC2CTrack
syntax keyword altTableOptionList sbCDLengthForExtension
syntax keyword altTableOptionList sbClipMargin
syntax keyword altTableOptionList sbCollinearExtension
syntax keyword altTableOptionList sbConnect
syntax keyword altTableOptionList sbConnectorWidth
syntax keyword altTableOptionList sbCornerExtension
syntax keyword altTableOptionList sbCornerFillDissectLength
syntax keyword altTableOptionList sbCrossSegmentOption
syntax keyword altTableOptionList sbEndExtension
syntax keyword altTableOptionList sbFavorMarkerExtension
syntax keyword altTableOptionList sbFavorMarkerFigureType
syntax keyword altTableOptionList sbFavorPriorityLevel
syntax keyword altTableOptionList sbGenRuleTable
syntax keyword altTableOptionList sbGenTableType
syntax keyword altTableOptionList sbHonorFavor
syntax keyword altTableOptionList sbHonorMinSQWidth
syntax keyword altTableOptionList sbHonorSmallSpace
syntax keyword altTableOptionList sbHonorSmallWidth
syntax keyword altTableOptionList sbHonorSpace
syntax keyword altTableOptionList sbHVPriorityOption
syntax keyword altTableOptionList sbLineEndExtension
syntax keyword altTableOptionList sbLongSegmentLen
syntax keyword altTableOptionList sbMaxCollinearAlignRange
syntax keyword altTableOptionList sbMaxS2SAlignLimit
syntax keyword altTableOptionList sbMaxWidth
syntax keyword altTableOptionList sbMergeCollinearOption
syntax keyword altTableOptionList sbMin2Main
syntax keyword altTableOptionList sbMin2MainEnd
syntax keyword altTableOptionList sbMin2SB
syntax keyword altTableOptionList sbMinC2C
syntax keyword altTableOptionList sbMinC2F
syntax keyword altTableOptionList sbMinEnd2Main
syntax keyword altTableOptionList sbMinEnd2MainEnd
syntax keyword altTableOptionList sbMinEnd2Side
syntax keyword altTableOptionList sbMinEndSpace
syntax keyword altTableOptionList sbMinLength
syntax keyword altTableOptionList sbMinOffset
syntax keyword altTableOptionList sbMinProjectionTol
syntax keyword altTableOptionList sbMinSBC2C
syntax keyword altTableOptionList sbMinSBC2F
syntax keyword altTableOptionList sbMinSide2Side
syntax keyword altTableOptionList sbMinSQWidth
syntax keyword altTableOptionList sbMinWidth
syntax keyword altTableOptionList sbNoSBMarkerFigureType
syntax keyword altTableOptionList sbParameterSetRule
syntax keyword altTableOptionList sbPlacementTable
syntax keyword altTableOptionList sbPriorityJogSize
syntax keyword altTableOptionList sbPriorityKeepMargin
syntax keyword altTableOptionList sbPriorityMaxShifting
syntax keyword altTableOptionList sbPriorityOption
syntax keyword altTableOptionList sbS2MEndCutRatio
syntax keyword altTableOptionList sbSGM1Dmode
syntax keyword altTableOptionList sbSGMCenterSB
syntax keyword altTableOptionList sbSGMCenterSBSpacing
syntax keyword altTableOptionList sbSGMCenterSBTol
syntax keyword altTableOptionList sbSGMCurvThresWeight
syntax keyword altTableOptionList sbSGMCutoffThresWeight
syntax keyword altTableOptionList sbSGMDiagSquareBox
syntax keyword altTableOptionList sbSGMExtractDistance
syntax keyword altTableOptionList sbSGMExtractThresWeight
syntax keyword altTableOptionList sbSGMGen
syntax keyword altTableOptionList sbSGMParallelRidge
syntax keyword altTableOptionList sbSGMRidgePointGridImprovement
syntax keyword altTableOptionList sbSGMRidgeSlope
syntax keyword altTableOptionList sbSGMRidgeThresWeight
syntax keyword altTableOptionList sbSGMSignalLostTol
syntax keyword altTableOptionList sbSGMSignalTol
syntax keyword altTableOptionList sbSGMSmallSegment
syntax keyword altTableOptionList sbSGMSquareLikeMode
syntax keyword altTableOptionList sbSGMSquareLikeRatio
syntax keyword altTableOptionList sbSGMSquarePriority
syntax keyword altTableOptionList sbSGMWeight
syntax keyword altTableOptionList sbSGMWidthDiff
syntax keyword altTableOptionList sbSGMZeroCrossingAdjustMinSpace
syntax keyword altTableOptionList sbSkipRuleCheck
syntax keyword altTableOptionList sbSymmetryStrengthenOption
syntax keyword altTableOptionList sgmModelID
syntax keyword altTableOptionList sbAdaptiveMerge

"SB Table Parameters
syntax keyword altTableOptionList deleteInputSmallSbar
syntax keyword altTableOptionList isRuleFreeSB
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList sbAIthres
syntax keyword altTableOptionList sbAllowNonRectPreSB
syntax keyword altTableOptionList sbAllowNonRectSB
syntax keyword altTableOptionList sbApplyPriorityCorrectionAtIter
syntax keyword altTableOptionList sbChopAIthres
syntax keyword altTableOptionList sbChoppingRatioAboveThreshold
syntax keyword altTableOptionList sbChopRIthres
syntax keyword altTableOptionList sbDampingFactor1Multiplier
syntax keyword altTableOptionList sbDepartShape
syntax keyword altTableOptionList sbEnhancePrintability
syntax keyword altTableOptionList sbKeepMinLengthAtLowerLevel
syntax keyword altTableOptionList sbMaxCorrection
syntax keyword altTableOptionList sbMaxCorrectionPerIteration
syntax keyword altTableOptionList sbMaxSQWidth
syntax keyword altTableOptionList sbMaxWidth
syntax keyword altTableOptionList sbMin2Main
syntax keyword altTableOptionList sbMin2SB
syntax keyword altTableOptionList sbMinC2C
syntax keyword altTableOptionList sbMinC2F
syntax keyword altTableOptionList sbMinCorrection
syntax keyword altTableOptionList sbMinEnd2Main
syntax keyword altTableOptionList sbMinEnd2Side
syntax keyword altTableOptionList sbMinEndSpace
syntax keyword altTableOptionList sbMinLength
syntax keyword altTableOptionList sbMinLengthRelaxRatio
syntax keyword altTableOptionList sbMinOffset
syntax keyword altTableOptionList sbMinSBC2C
syntax keyword altTableOptionList sbMinSBC2F
syntax keyword altTableOptionList sbMinSide2Side
syntax keyword altTableOptionList sbMinSQWidth
syntax keyword altTableOptionList sbMinWidth
syntax keyword altTableOptionList sbMinWidthC2C
syntax keyword altTableOptionList sbModelID
syntax keyword altTableOptionList sbNumNeighborSeg
syntax keyword altTableOptionList sbNumSamplesS
syntax keyword altTableOptionList sbNumSamplesT
syntax keyword altTableOptionList sbNumUpdateWorstLocT
syntax keyword altTableOptionList sbPolarity
syntax keyword altTableOptionList sbPrintChopIterStart
syntax keyword altTableOptionList sbPrintChopIterStop
syntax keyword altTableOptionList sbPrintChopPasses
syntax keyword altTableOptionList sbPrintChopRemoveSbar
syntax keyword altTableOptionList sbPrintHeadExt
syntax keyword altTableOptionList sbPrintProtectionDilate
syntax keyword altTableOptionList sbPrintSpaceSearch
syntax keyword altTableOptionList sbPrintSusyChopPasses
syntax keyword altTableOptionList sbPrintTailExt
syntax keyword altTableOptionList sbPriorityAlign
syntax keyword altTableOptionList sbPriorityAlignAtIter
syntax keyword altTableOptionList sbPriorityCorrectionMargin
syntax keyword altTableOptionList sbProjDissectionAdjustOption
syntax keyword altTableOptionList sbProjDissectionEnableShadow
syntax keyword altTableOptionList sbProjSearchRange
syntax keyword altTableOptionList sbProjSegmentLength
syntax keyword altTableOptionList sbRIthres
syntax keyword altTableOptionList sbSampleDistS
syntax keyword altTableOptionList sbSampleDistT
syntax keyword altTableOptionList sbSampleGrid
syntax keyword altTableOptionList sbSegmentLength
syntax keyword altTableOptionList sbShapeChange
syntax keyword altTableOptionList sbUseAI
syntax keyword altTableOptionList srifRIthres

"MRC Table Parameters
syntax keyword altTableOptionList allowDeletingSBInMRC
syntax keyword altTableOptionList allowDeletingSRIFInMRC
syntax keyword altTableOptionList checkC2CfromIter
syntax keyword altTableOptionList checkSB2MainMRC
syntax keyword altTableOptionList cornerRepairWt
syntax keyword altTableOptionList doLPLRatioInterpolation
syntax keyword altTableOptionList endMaxWidth
syntax keyword altTableOptionList endMinLength
syntax keyword altTableOptionList endRepairWt
syntax keyword altTableOptionList endSideRepairWt
syntax keyword altTableOptionList extendedNotchNubCoSolverfromIter
syntax keyword altTableOptionList fillNotchDepth
syntax keyword altTableOptionList fillNotchNubFactor
syntax keyword altTableOptionList fillNotchNubfromIter
syntax keyword altTableOptionList fillNotchNubMode
syntax keyword altTableOptionList fixProjFactor
syntax keyword altTableOptionList flexMRCcvWeight
syntax keyword altTableOptionList flexMRCEPEtol
syntax keyword altTableOptionList flexMRCEPEtol_corner
syntax keyword altTableOptionList flexMRCEPEtol_end
syntax keyword altTableOptionList flexMRCEPEtol_inside
syntax keyword altTableOptionList flexMRCEPEtol_inside_corner
syntax keyword altTableOptionList flexMRCEPEtol_inside_end
syntax keyword altTableOptionList flexMRCEPEtol_inside_line
syntax keyword altTableOptionList flexMRCEPEtol_line
syntax keyword altTableOptionList flexMRCEPEtol_outside
syntax keyword altTableOptionList flexMRCEPEtol_outside_corner
syntax keyword altTableOptionList flexMRCEPEtol_outside_end
syntax keyword altTableOptionList flexMRCEPEtol_outside_line
syntax keyword altTableOptionList flexMRCepeWeight
syntax keyword altTableOptionList flexMRCfromIter
syntax keyword altTableOptionList flexMRCmaxRelaxSpace
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_C2C
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_C2F
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_corner2corner
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_corner2line
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_end2corner
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_end2end
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_end2line
syntax keyword altTableOptionList flexMRCmaxRelaxSpace_line2line
syntax keyword altTableOptionList flexMRCmaxRelaxWidth
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_C2C
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_C2F
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_corner2corner
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_corner2line
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_end2corner
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_end2end
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_end2line
syntax keyword altTableOptionList flexMRCmaxRelaxWidth_line2line
syntax keyword altTableOptionList flexMRCMode
syntax keyword altTableOptionList flexMRCmrcWeight
syntax keyword altTableOptionList flexMRCResolveMode
syntax keyword altTableOptionList flexMRCStopRelaxFromIter
syntax keyword altTableOptionList hammerHeadControl
syntax keyword altTableOptionList lineRepairWt
syntax keyword altTableOptionList LPLCornerRelaxRatio
syntax keyword altTableOptionList LPLCornerSpaceRelaxRatio
syntax keyword altTableOptionList LPLCornerWidthRelaxRatio
syntax keyword altTableOptionList LPLEndRelaxRatio
syntax keyword altTableOptionList LPLEndSideRelaxRatio
syntax keyword altTableOptionList LPLEndSideSpaceRelaxRatio
syntax keyword altTableOptionList LPLEndSideWidthRelaxRatio
syntax keyword altTableOptionList LPLEndSpaceRelaxRatio
syntax keyword altTableOptionList LPLEndWidthRelaxRatio
syntax keyword altTableOptionList LPLJogSize
syntax keyword altTableOptionList LPLSpaceRelaxRatio
syntax keyword altTableOptionList LPLWidthRelaxRatio
syntax keyword altTableOptionList maxJogHeight
syntax keyword altTableOptionList maxJogLength
syntax keyword altTableOptionList maxNotchDepth
syntax keyword altTableOptionList maxNotchWidth
syntax keyword altTableOptionList maxNubHeight
syntax keyword altTableOptionList maxNubWidth
syntax keyword altTableOptionList maxSpaceProjectionLength
syntax keyword altTableOptionList maxWidthProjectionLength
syntax keyword altTableOptionList minAcuteAngle
syntax keyword altTableOptionList minJogHeight
syntax keyword altTableOptionList minNotchDepth
syntax keyword altTableOptionList minNubHeight
syntax keyword altTableOptionList minSpace
syntax keyword altTableOptionList minSpace_C2C
syntax keyword altTableOptionList minSpace_C2F
syntax keyword altTableOptionList minSpace_corner2corner
syntax keyword altTableOptionList minSpace_corner2line
syntax keyword altTableOptionList minSpace_end2corner
syntax keyword altTableOptionList minSpace_end2end
syntax keyword altTableOptionList minSpace_end2line
syntax keyword altTableOptionList minSpace_line2line
syntax keyword altTableOptionList minWidth
syntax keyword altTableOptionList minWidth_C2C
syntax keyword altTableOptionList minWidth_C2F
syntax keyword altTableOptionList minWidth_corner2corner
syntax keyword altTableOptionList minWidth_corner2line
syntax keyword altTableOptionList minWidth_end2corner
syntax keyword altTableOptionList minWidth_end2end
syntax keyword altTableOptionList minWidth_end2line
syntax keyword altTableOptionList minWidth_line2line
syntax keyword altTableOptionList mrcEPEevalMode
syntax keyword altTableOptionList mrcGridConsideration
syntax keyword altTableOptionList mrcModelAware
syntax keyword altTableOptionList mrcPriorityAdjustTargetEdge
syntax keyword altTableOptionList mrcRepairMetric
syntax keyword altTableOptionList mrcSkipCleanCorGraph
syntax keyword altTableOptionList mrcSpaceRepairBeyondTargetEdge
syntax keyword altTableOptionList mrcStitchCheckMode
syntax keyword altTableOptionList mrcWidthRepairBeyondTargetEdge
syntax keyword altTableOptionList noDeleteSBfromIter
syntax keyword altTableOptionList noDeleteSRIFfromIter
syntax keyword altTableOptionList noSbSidePullBackfromIter
syntax keyword altTableOptionList onlyUsingMinSpace
syntax keyword altTableOptionList onlyUsingMinWidth
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList projectionLengthBasedMRC
syntax keyword altTableOptionList removeNubHeight
syntax keyword altTableOptionList repairLargeCD
syntax keyword altTableOptionList repairLargeSpace
syntax keyword altTableOptionList repairSmallCD
syntax keyword altTableOptionList repairSmallSpace
syntax keyword altTableOptionList runSBfixWidth
syntax keyword altTableOptionList sb2MainSideFixMaxOrigPL
syntax keyword altTableOptionList sbSidePullBack
syntax keyword altTableOptionList skipStitchedC2C
syntax keyword altTableOptionList spaceRepairWtContactCorner
syntax keyword altTableOptionList spaceRepairWtContactEnd
syntax keyword altTableOptionList spaceRepairWtContactEndSide
syntax keyword altTableOptionList spaceRepairWtContactLine
syntax keyword altTableOptionList spaceRepairWtCorner
syntax keyword altTableOptionList spaceRepairWtEnd
syntax keyword altTableOptionList spaceRepairWtEndSide
syntax keyword altTableOptionList spaceRepairWtGate
syntax keyword altTableOptionList spaceRepairWtLargeLine
syntax keyword altTableOptionList spaceRepairWtMidsizeLine
syntax keyword altTableOptionList spaceRepairWtSmallLine
syntax keyword altTableOptionList strictPriorityMRC
syntax keyword altTableOptionList SUSYdist2KeepArea
syntax keyword altTableOptionList widthRepairWtCorner
syntax keyword altTableOptionList widthRepairWtEnd
syntax keyword altTableOptionList widthRepairWtEndSide
syntax keyword altTableOptionList widthRepairWtLargeSpace
syntax keyword altTableOptionList widthRepairWtMidsizeSpace
syntax keyword altTableOptionList widthRepairWtSmallSpace

"MRCCHECKFIX Table Parameters
syntax keyword altTableOptionList allowMainMoveInSB2MainFix
syntax keyword altTableOptionList fillNotchAspect
syntax keyword altTableOptionList fillNotchAspect_psm0
syntax keyword altTableOptionList fillNotchAspect_psm180
syntax keyword altTableOptionList fixContactMergeRange
syntax keyword altTableOptionList fixCornerJogFillOnly
syntax keyword altTableOptionList fixCornerJogMaxIterations
syntax keyword altTableOptionList fixCornerJogRemoveOnly
syntax keyword altTableOptionList fixDissectSegmentLength
syntax keyword altTableOptionList fixNotchNubMaxIterations
syntax keyword altTableOptionList fixPriorityC2CSpace
syntax keyword altTableOptionList fixPriorityF2FSpace
syntax keyword altTableOptionList fixPriorityNotch
syntax keyword altTableOptionList fixPriorityOutJog
syntax keyword altTableOptionList fixSB2Main
syntax keyword altTableOptionList fixSB2SB
syntax keyword altTableOptionList fixSBLengthAspect
syntax keyword altTableOptionList fixSBWidthAspect
syntax keyword altTableOptionList growC2CWidthAspect
syntax keyword altTableOptionList growC2CWidthAspect_psm00
syntax keyword altTableOptionList growC2CWidthAspect_psm180180
syntax keyword altTableOptionList growWidthAspect
syntax keyword altTableOptionList growWidthAspect_psm00
syntax keyword altTableOptionList growWidthAspect_psm180180
syntax keyword altTableOptionList hasPreLayer
syntax keyword altTableOptionList mark45Edge
syntax keyword altTableOptionList markNon45Edge
syntax keyword altTableOptionList markNonRectangleSB
syntax keyword altTableOptionList maxCorrectionValue
syntax keyword altTableOptionList maxStitchLength
syntax keyword altTableOptionList mergeAlignMode
syntax keyword altTableOptionList mergeLengthRatio
syntax keyword altTableOptionList minPolygonDropRange
syntax keyword altTableOptionList minPolygonExtraRange
syntax keyword altTableOptionList minRectCenterDist
syntax keyword altTableOptionList mrcCheckerID_aAngle
syntax keyword altTableOptionList mrcCheckerID_e45
syntax keyword altTableOptionList mrcCheckerID_eNon45
syntax keyword altTableOptionList mrcCheckerID_inCornerJog
syntax keyword altTableOptionList mrcCheckerID_inCornerJog_psm0
syntax keyword altTableOptionList mrcCheckerID_inCornerJog_psm180
syntax keyword altTableOptionList mrcCheckerID_notch
syntax keyword altTableOptionList mrcCheckerID_notch_psm0
syntax keyword altTableOptionList mrcCheckerID_notch_psm180
syntax keyword altTableOptionList mrcCheckerID_nub
syntax keyword altTableOptionList mrcCheckerID_nub_psm0
syntax keyword altTableOptionList mrcCheckerID_nub_psm180
syntax keyword altTableOptionList mrcCheckerID_outCornerJog
syntax keyword altTableOptionList mrcCheckerID_outCornerJog_psm0
syntax keyword altTableOptionList mrcCheckerID_outCornerJog_psm180
syntax keyword altTableOptionList mrcCheckerID_polygonDrop
syntax keyword altTableOptionList mrcCheckerID_polygonExtra
syntax keyword altTableOptionList mrcCheckerID_postPolygonConnect
syntax keyword altTableOptionList mrcCheckerID_postPolygonSplit
syntax keyword altTableOptionList mrcCheckerID_rectCenterDist
syntax keyword altTableOptionList mrcCheckerID_sb_area
syntax keyword altTableOptionList mrcCheckerID_sb_C2C
syntax keyword altTableOptionList mrcCheckerID_sb_end2end
syntax keyword altTableOptionList mrcCheckerID_sb_end2main
syntax keyword altTableOptionList mrcCheckerID_sb_end2side
syntax keyword altTableOptionList mrcCheckerID_sb_length
syntax keyword altTableOptionList mrcCheckerID_sb_main_C2C
syntax keyword altTableOptionList mrcCheckerID_sb_main_C2F
syntax keyword altTableOptionList mrcCheckerID_sb_max_SQ_width
syntax keyword altTableOptionList mrcCheckerID_sb_max_width
syntax keyword altTableOptionList mrcCheckerID_sb_min_SQ_width
syntax keyword altTableOptionList mrcCheckerID_sb_min_width
syntax keyword altTableOptionList mrcCheckerID_sb_nonRect
syntax keyword altTableOptionList mrcCheckerID_sb_side2main
syntax keyword altTableOptionList mrcCheckerID_sb_side2side
syntax keyword altTableOptionList mrcCheckerID_sb_space_C2F
syntax keyword altTableOptionList mrcCheckerID_sb_space2main
syntax keyword altTableOptionList mrcCheckerID_sb_space2sb
syntax keyword altTableOptionList mrcCheckerID_sb_width_C2C
syntax keyword altTableOptionList mrcCheckerID_sb_width_C2F
syntax keyword altTableOptionList mrcCheckerID_space
syntax keyword altTableOptionList mrcCheckerID_space_C2C
syntax keyword altTableOptionList mrcCheckerID_space_C2C_psm00
syntax keyword altTableOptionList mrcCheckerID_space_C2C_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_C2C_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_C2F
syntax keyword altTableOptionList mrcCheckerID_space_C2F_psm00
syntax keyword altTableOptionList mrcCheckerID_space_C2F_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_C2F_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_corner2corner
syntax keyword altTableOptionList mrcCheckerID_space_corner2corner_psm00
syntax keyword altTableOptionList mrcCheckerID_space_corner2corner_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_corner2corner_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_corner2line
syntax keyword altTableOptionList mrcCheckerID_space_corner2line_psm00
syntax keyword altTableOptionList mrcCheckerID_space_corner2line_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_corner2line_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_end2corner
syntax keyword altTableOptionList mrcCheckerID_space_end2corner_psm00
syntax keyword altTableOptionList mrcCheckerID_space_end2corner_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_end2corner_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_end2end
syntax keyword altTableOptionList mrcCheckerID_space_end2end_psm00
syntax keyword altTableOptionList mrcCheckerID_space_end2end_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_end2end_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_end2line
syntax keyword altTableOptionList mrcCheckerID_space_end2line_psm00
syntax keyword altTableOptionList mrcCheckerID_space_end2line_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_end2line_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_line2line
syntax keyword altTableOptionList mrcCheckerID_space_line2line_psm00
syntax keyword altTableOptionList mrcCheckerID_space_line2line_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_line2line_psm180180
syntax keyword altTableOptionList mrcCheckerID_space_psm00
syntax keyword altTableOptionList mrcCheckerID_space_psm0180
syntax keyword altTableOptionList mrcCheckerID_space_psm180180
syntax keyword altTableOptionList mrcCheckerID_width
syntax keyword altTableOptionList mrcCheckerID_width_C2C
syntax keyword altTableOptionList mrcCheckerID_width_C2C_psm0
syntax keyword altTableOptionList mrcCheckerID_width_C2C_psm180
syntax keyword altTableOptionList mrcCheckerID_width_C2F
syntax keyword altTableOptionList mrcCheckerID_width_C2F_psm0
syntax keyword altTableOptionList mrcCheckerID_width_C2F_psm180
syntax keyword altTableOptionList mrcCheckerID_width_corner2corner
syntax keyword altTableOptionList mrcCheckerID_width_corner2corner_psm0
syntax keyword altTableOptionList mrcCheckerID_width_corner2corner_psm180
syntax keyword altTableOptionList mrcCheckerID_width_corner2line
syntax keyword altTableOptionList mrcCheckerID_width_corner2line_psm0
syntax keyword altTableOptionList mrcCheckerID_width_corner2line_psm180
syntax keyword altTableOptionList mrcCheckerID_width_end2corner
syntax keyword altTableOptionList mrcCheckerID_width_end2corner_psm0
syntax keyword altTableOptionList mrcCheckerID_width_end2corner_psm180
syntax keyword altTableOptionList mrcCheckerID_width_end2end
syntax keyword altTableOptionList mrcCheckerID_width_end2end_psm0
syntax keyword altTableOptionList mrcCheckerID_width_end2end_psm180
syntax keyword altTableOptionList mrcCheckerID_width_end2line
syntax keyword altTableOptionList mrcCheckerID_width_end2line_psm0
syntax keyword altTableOptionList mrcCheckerID_width_end2line_psm180
syntax keyword altTableOptionList mrcCheckerID_width_line2line
syntax keyword altTableOptionList mrcCheckerID_width_line2line_psm0
syntax keyword altTableOptionList mrcCheckerID_width_line2line_psm180
syntax keyword altTableOptionList mrcCheckerID_width_psm0
syntax keyword altTableOptionList mrcCheckerID_width_psm180
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList pullBackC2CSpaceAspect
syntax keyword altTableOptionList pullBackC2CSpaceAspect_psm00
syntax keyword altTableOptionList pullBackC2CSpaceAspect_psm0180
syntax keyword altTableOptionList pullBackC2CSpaceAspect_psm180180
syntax keyword altTableOptionList pullBackSpaceAspect
syntax keyword altTableOptionList pullBackSpaceAspect_psm00
syntax keyword altTableOptionList pullBackSpaceAspect_psm0180
syntax keyword altTableOptionList pullBackSpaceAspect_psm180180
syntax keyword altTableOptionList removeNubAspect
syntax keyword altTableOptionList removeNubAspect_psm0
syntax keyword altTableOptionList removeNubAspect_psm180
syntax keyword altTableOptionList sbHasPreLayer
syntax keyword altTableOptionList sbMaxWidth
syntax keyword altTableOptionList sbMinC2C
syntax keyword altTableOptionList sbMinLength
syntax keyword altTableOptionList sbMinSBC2C
syntax keyword altTableOptionList sbMinWidth

"Rule Table Parameters
syntax keyword altTableOptionList alignInCornerInCornerBias
syntax keyword altTableOptionList allowBigMaxRedissectionMove
syntax keyword altTableOptionList biasDifferenceTable
syntax keyword altTableOptionList biasTable
syntax keyword altTableOptionList doSpaceInterpolation
syntax keyword altTableOptionList endBiasTable
syntax keyword altTableOptionList endDistanceTable
syntax keyword altTableOptionList endOutCornerPrebiasMinusStep
syntax keyword altTableOptionList endOutCornerPrebiasPlusStep
syntax keyword altTableOptionList endRetargetOption
syntax keyword altTableOptionList endSizeTable
syntax keyword altTableOptionList endSpaceTable
syntax keyword altTableOptionList endSpMeasureExtension
syntax keyword altTableOptionList extension
syntax keyword altTableOptionList freezeSegments
syntax keyword altTableOptionList generateExSegment
syntax keyword altTableOptionList honorMaxInCornerBias
syntax keyword altTableOptionList inCornerBiasAdjust
syntax keyword altTableOptionList inSpMeasureExtension
syntax keyword altTableOptionList inSpMeasureExtensionV
syntax keyword altTableOptionList inSpMeasureRange
syntax keyword altTableOptionList inWdMeasureExtension
syntax keyword altTableOptionList inWdMeasureExtensionV
syntax keyword altTableOptionList inWdMeasureRange
syntax keyword altTableOptionList islandMaxArea
syntax keyword altTableOptionList islandMaxWidth
syntax keyword altTableOptionList islandMinSpace1
syntax keyword altTableOptionList islandMinSpace2
syntax keyword altTableOptionList isoAspectRatio
syntax keyword altTableOptionList largeBiasWt
syntax keyword altTableOptionList largeBiasWt1
syntax keyword altTableOptionList largeBiasWt1Table
syntax keyword altTableOptionList largeBiasWt2
syntax keyword altTableOptionList largeBiasWt2Table
syntax keyword altTableOptionList largeBiasWtTable
syntax keyword altTableOptionList maxAddLength
syntax keyword altTableOptionList maxInCornerBias
syntax keyword altTableOptionList maxRedissectionMove
syntax keyword altTableOptionList maxRuleRunSegmentLength
syntax keyword altTableOptionList minAddLength
syntax keyword altTableOptionList minInCornerBias
syntax keyword altTableOptionList minRedissectionMove
syntax keyword altTableOptionList minRuleSegmentLen
syntax keyword altTableOptionList minRuleSegmentLenMargin
syntax keyword altTableOptionList noSuppressIncornerBiasIfNegative
syntax keyword altTableOptionList outCornerPreBiasMinusStep
syntax keyword altTableOptionList outCornerPreBiasPlusStep
syntax keyword altTableOptionList outCornerPrebiasReadjust
syntax keyword altTableOptionList outSpMeasureExtension
syntax keyword altTableOptionList outSpMeasureExtensionV
syntax keyword altTableOptionList outSpMeasureRange
syntax keyword altTableOptionList outWdMeasureExtension
syntax keyword altTableOptionList outWdMeasureExtensionV
syntax keyword altTableOptionList outWdMeasureRange
syntax keyword altTableOptionList padInCornerOption
syntax keyword altTableOptionList padInCornerReadjust
syntax keyword altTableOptionList printParams
syntax keyword altTableOptionList respectMinMove
syntax keyword altTableOptionList ruleAlignSegment
syntax keyword altTableOptionList ruleContactExtension
syntax keyword altTableOptionList ruleContactMargin
syntax keyword altTableOptionList ruleCornerDissectionPriority
syntax keyword altTableOptionList ruleCornerDummyLen
syntax keyword altTableOptionList ruleCornerSegLen
syntax keyword altTableOptionList ruleCornerSegmentTable
syntax keyword altTableOptionList ruleDissectionAdjustOption
syntax keyword altTableOptionList ruleEndMaxWidth
syntax keyword altTableOptionList ruleEndMinLength
syntax keyword altTableOptionList ruleIgnoreEnd_endDistance
syntax keyword altTableOptionList ruleIgnoreEnd_endMaxWidth
syntax keyword altTableOptionList ruleIgnoreEnd_endMinLength
syntax keyword altTableOptionList ruleIgnoreEnd_lineMaxWidth
syntax keyword altTableOptionList ruleRedissectionOption
syntax keyword altTableOptionList ruleRedissectionSpace
syntax keyword altTableOptionList ruleRedissectionWidth
syntax keyword altTableOptionList ruleSegLenTolRatio
syntax keyword altTableOptionList ruleSmallSegment
syntax keyword altTableOptionList ruleSpendMaxWidth
syntax keyword altTableOptionList ruleSpendMinLength
syntax keyword altTableOptionList runSpMeasureExtension
syntax keyword altTableOptionList runWdMeasureExtension
syntax keyword altTableOptionList smallBiasWt
syntax keyword altTableOptionList smallBiasWt1
syntax keyword altTableOptionList smallBiasWt1Table
syntax keyword altTableOptionList smallBiasWt2
syntax keyword altTableOptionList smallBiasWt2Table
syntax keyword altTableOptionList smallBiasWtTable
syntax keyword altTableOptionList spaceMeasure45Degree
syntax keyword altTableOptionList spacePriorityHigh
syntax keyword altTableOptionList spaceTable
syntax keyword altTableOptionList spendBiasTable
syntax keyword altTableOptionList spendDistanceTable
syntax keyword altTableOptionList spendRetargetOption
syntax keyword altTableOptionList spendSizeTable
syntax keyword altTableOptionList spendWdMeasureExtension
syntax keyword altTableOptionList spendWidthTable
syntax keyword altTableOptionList sProjMoveTable
syntax keyword altTableOptionList sProjSpaceTable
syntax keyword altTableOptionList sProjWidthTable
syntax keyword altTableOptionList suppressIncornerBiasSpace
syntax keyword altTableOptionList suppressIncornerBiasWidth
syntax keyword altTableOptionList usingMaxSpace
syntax keyword altTableOptionList widthTable
syntax keyword altTableOptionList wProjMoveTable
syntax keyword altTableOptionList wProjSpaceTable
syntax keyword altTableOptionList wProjWidthTable
syntax keyword altTableOptionList zSegSpMeasureRange
syntax keyword altTableOptionList zSegWdMeasureRange

"Repair Table
syntax keyword altTableOptionlist averageRecoverCVSearchDistance
syntax keyword altTableOptionlist defectEffectDistance
syntax keyword altTableOptionlist defectEffectDistanceSbGen
syntax keyword altTableOptionlist defectEffectDistanceSraf
syntax keyword altTableOptionlist defectEffectDistanceSrif
syntax keyword altTableOptionlist effectDistanceRatioSraf
syntax keyword altTableOptionlist effectDistanceRatioSrif
syntax keyword altTableOptionlist printParams
syntax keyword altTableOptionlist recoverCVInRepair
syntax keyword altTableOptionlist redissectInRepair
syntax keyword altTableOptionlist repairInsideHS

"Parameter Table Parameters (for Co-Optimization)
syntax keyword altTableOptionList adaptiveBridgingNecking
syntax keyword altTableOptionList alignmentfromIter
syntax keyword altTableOptionList alignmentfromSeg
syntax keyword altTableOptionList alignmentJogSize
syntax keyword altTableOptionList alignmentWeight
syntax keyword altTableOptionList bridgingSize
syntax keyword altTableOptionList bridgingWeight
syntax keyword altTableOptionList checkParamSetting
syntax keyword altTableOptionList contactCheckCoverage
syntax keyword altTableOptionList contactCheckDebugFigureLevel
syntax keyword altTableOptionList contactCornerEvalNum
syntax keyword altTableOptionList contactCoverage
syntax keyword altTableOptionList contactCoverageWeight
syntax keyword altTableOptionList contactEvalSampleGrid
syntax keyword altTableOptionList contactExclosureCheckDistance
syntax keyword altTableOptionList contactExclosureDistance
syntax keyword altTableOptionList contactExcludeWeight
syntax keyword altTableOptionList contactOutSearchDist
syntax keyword altTableOptionList contactRetargetDegree
syntax keyword altTableOptionList cornerEpeInside
syntax keyword altTableOptionList cornerEpeOutside
syntax keyword altTableOptionList cornerEvalNum
syntax keyword altTableOptionList cornerRadius
syntax keyword altTableOptionList cornerSegmentLength
syntax keyword altTableOptionList cornerWeight
syntax keyword altTableOptionList costFunction
syntax keyword altTableOptionList dampingFactor1
syntax keyword altTableOptionList debugLayerOffset
syntax keyword altTableOptionList debugxy
syntax keyword altTableOptionList defectEffectDistance
syntax keyword altTableOptionList defectEffectDistanceSraf
syntax keyword altTableOptionList defectEffectDistanceSrif
syntax keyword altTableOptionList dissectRule
syntax keyword altTableOptionList edge45Weight
syntax keyword altTableOptionList edgeWeight
syntax keyword altTableOptionList endEpeInside
syntax keyword altTableOptionList endEpeOutside
syntax keyword altTableOptionList endMaxWidth
syntax keyword altTableOptionList endMinLength
syntax keyword altTableOptionList epeTolerancefromIter
syntax keyword altTableOptionList epeToleranceInsideWeight
syntax keyword altTableOptionList epeToleranceOutsideWeight
syntax keyword altTableOptionList epeToleranceThreshold
syntax keyword altTableOptionList evalOnTargetSampleGrid
syntax keyword altTableOptionList evalSearch
syntax keyword altTableOptionList inSidelobeThreshold
syntax keyword altTableOptionList jogEvalNum
syntax keyword altTableOptionList jogRetargetDegree
syntax keyword altTableOptionList jogSize
syntax keyword altTableOptionList jogWeight
syntax keyword altTableOptionList key
syntax keyword altTableOptionList lineEndWeight
syntax keyword altTableOptionList M2SEvalSearch
syntax keyword altTableOptionList makeSegmentByProjection
syntax keyword altTableOptionList makeUniformDissection
syntax keyword altTableOptionList maskPolarity
syntax keyword altTableOptionList maxCorrection
syntax keyword altTableOptionList maxCorrectionPerIteration
syntax keyword altTableOptionList maxJogLength
syntax keyword altTableOptionList maxNotchWidth
syntax keyword altTableOptionList maxNubWidth
syntax keyword altTableOptionList maxPolygonOffsetPerIter
syntax keyword altTableOptionList maxSegmentLengthUniform
syntax keyword altTableOptionList minC2CS2MSpace
syntax keyword altTableOptionList minC2CS2MWidth
syntax keyword altTableOptionList minC2CS2SSpace
syntax keyword altTableOptionList minC2CS2SWidth
syntax keyword altTableOptionList minC2CSpace
syntax keyword altTableOptionList minC2CWidth
syntax keyword altTableOptionList minCorrection
syntax keyword altTableOptionList minS2MSpace
syntax keyword altTableOptionList minS2MWidth
syntax keyword altTableOptionList minS2SSpace
syntax keyword altTableOptionList minS2SWidth
syntax keyword altTableOptionList minSegmentLength
syntax keyword altTableOptionList minSpace
syntax keyword altTableOptionList minWidth
syntax keyword altTableOptionList MODULE_FUNC_TABLE
syntax keyword altTableOptionList mrcDummyCheck
syntax keyword altTableOptionList mrcWeight
syntax keyword altTableOptionList ncCVDirectionConstraintsfromIter
syntax keyword altTableOptionList ncCVDirectionConstraintsStopIter
syntax keyword altTableOptionList neckingSize
syntax keyword altTableOptionList neckingWeight
syntax keyword altTableOptionList neighbourEvalNum
syntax keyword altTableOptionList numberOfIterations
syntax keyword altTableOptionList outputDebugLayerfromIter
syntax keyword altTableOptionList outputDebugLayerPerPatch
syntax keyword altTableOptionList polygonOffsetC2CSpace
syntax keyword altTableOptionList polygonOffsetContourDistance
syntax keyword altTableOptionList polygonOffsetfromIter
syntax keyword altTableOptionList polygonOffsetLoopNumber
syntax keyword altTableOptionList polygonOffsetMode
syntax keyword altTableOptionList polygonOffsetSpace
syntax keyword altTableOptionList polygonOffsetStopIter
syntax keyword altTableOptionList polygonOffsetWeight
syntax keyword altTableOptionList polygonOffsetX
syntax keyword altTableOptionList polygonOffsetY
syntax keyword altTableOptionList protectionHandleMode
syntax keyword altTableOptionList pvBandThreshold
syntax keyword altTableOptionList pvBandWeight
syntax keyword altTableOptionList radiusContact
syntax keyword altTableOptionList radiusJog
syntax keyword altTableOptionList recoverCVInRepair
syntax keyword altTableOptionList redissectInRepair
syntax keyword altTableOptionList repairInsideHS
syntax keyword altTableOptionList runApplyPriorityCorrectionAtIter
syntax keyword altTableOptionList runContactAware
syntax keyword altTableOptionList runContactAwarefromIter
syntax keyword altTableOptionList runDefectRepair
syntax keyword altTableOptionList runEpeInside
syntax keyword altTableOptionList runEpeOutside
syntax keyword altTableOptionList runPriorityHealing
syntax keyword altTableOptionList runSegmentLength
syntax keyword altTableOptionList outputDebugLayerContour
syntax keyword altTableOptionList outputDebugLayerEBHPriority
syntax keyword altTableOptionList outputDebugLayerPerEbhLevel
syntax keyword altTableOptionList outputDebugLayerSbChop
syntax keyword altTableOptionList outputDebugLayerSegType
syntax keyword altTableOptionList outputDebugLayerTag
syntax keyword altTableOptionList outputDebugPatchBoxes
syntax keyword altTableOptionList outSidelobeThreshold
syntax keyword altTableOptionList ppsExtension
syntax keyword altTableOptionList ppsNumOfRunSegments
syntax keyword altTableOptionList ppsSearchRange
syntax keyword altTableOptionList ppsShadowCount
syntax keyword altTableOptionList ppsShadowRange
syntax keyword altTableOptionList priorityCorrectionMargin
syntax keyword altTableOptionList priorityHealingMargin
syntax keyword altTableOptionList retargetDegree
syntax keyword altTableOptionList runEpeInside
syntax keyword altTableOptionList runEpeOutside
syntax keyword altTableOptionList runFinalStrictMRC
syntax keyword altTableOptionList runMRC
syntax keyword altTableOptionList runMRCfromIter
syntax keyword altTableOptionList runSegmentLengthUniform
syntax keyword altTableOptionList S2MEvalSearch
syntax keyword altTableOptionList S2MNeighbourEvalNum
syntax keyword altTableOptionList S2SEvalSearch
syntax keyword altTableOptionList sbChopLength
syntax keyword altTableOptionList sbChopNonRect
syntax keyword altTableOptionList sbCorrectfromIter
syntax keyword altTableOptionList sbMaxCorrection
syntax keyword altTableOptionList sbMaxCorrectionPerIteration
syntax keyword altTableOptionList sbMaxSegmentLength
syntax keyword altTableOptionList sbMaxSQWidth
syntax keyword altTableOptionList sbMaxWidth
syntax keyword altTableOptionList sbMinCorrection
syntax keyword altTableOptionList sbMinLength
syntax keyword altTableOptionList sbMinSQWidth
syntax keyword altTableOptionList sbPrintChopIterStart
syntax keyword altTableOptionList sbPrintChopIterStop
syntax keyword altTableOptionList sbPriorityAdditionalExtension
syntax keyword altTableOptionList sbPriorityAdditionalMargin
syntax keyword altTableOptionList sbPriorityCorrectionMargin
syntax keyword altTableOptionList sbPWCorrectStopIter
syntax keyword altTableOptionList sbRectOnly
syntax keyword altTableOptionList sbSampleGrid
syntax keyword altTableOptionList sbSegmentLength
syntax keyword altTableOptionList sbShortSegment
syntax keyword altTableOptionList sidelobeEvalDynamic
syntax keyword altTableOptionList sidelobeEvalDynamicMoveBySbar
syntax keyword altTableOptionList sidelobeEvalRangeBySbar
syntax keyword altTableOptionList sidelobeEvalRangeByTarget
syntax keyword altTableOptionList sidelobeOnSbar
syntax keyword altTableOptionList sidelobeWeight
syntax keyword altTableOptionList simpleModelStopIter
syntax keyword altTableOptionList smallSegment
syntax keyword altTableOptionList spaceEndWeight
syntax keyword altTableOptionList spendEpeInside
syntax keyword altTableOptionList spendEpeOutside
syntax keyword altTableOptionList spendMaxWidth
syntax keyword altTableOptionList spendMinLength
syntax keyword altTableOptionList srafThreshold
syntax keyword altTableOptionList srifThreshold
syntax keyword altTableOptionList tipMultiEvalExclusionRatio
syntax keyword altTableOptionList tipMultiEvalNum
syntax keyword altTableOptionList tipMultiEvalSampleGrid
syntax keyword altTableOptionList userGeoInside1
syntax keyword altTableOptionList userGeoInside2
syntax keyword altTableOptionList userGeoInside20
syntax keyword altTableOptionList userGeoOutside1
syntax keyword altTableOptionList userGeoOutside2
syntax keyword altTableOptionList userGeoOutside20
syntax keyword altTableOptionList zLength
syntax keyword altTableOptionList zLengthEvalNum
syntax keyword altTableOptionList zLengthWeight

"util.lua functions
syntax keyword altFunctionList utilSetLibVersion
syntax keyword altFunctionList insertTableWithFile
syntax keyword altFunctionList passCareAreaCheck
syntax keyword altFunctionList deepcopy
syntax keyword altFunctionList selectSegmentByLayerWithMinlength
syntax keyword altFunctionList Util_init
syntax keyword altFunctionList Util_fix_jog
syntax keyword altFunctionList readGeoDissect
