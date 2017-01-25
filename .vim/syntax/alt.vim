" Vim syntax file
" Language: ALT

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "calibrecolor"

" Ignore case
"syntax case ignore


"syntax keyword example SIZE EXTENT

" Comment
syntax region calibreComment1 start=/--[[/ end=/]]--/ contains=@Spell
syntax region calibreComment2 start=/--/ contains=@Spell
"syntax match  calibreComment3 /\v\/\/.*/ contains=@Spell

highlight default link calibreComment1 Comment
highlight default link calibreComment2 Comment
"highlight default link calibreComment3 Comment3

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

highlight default link altFunctionList Keyword
highlight default link altBinaryParamList Keyword

"   Exception

" PreProc
"   Include
syntax match calibreIncludePreProc /\v^\s*include(\s+\S+){1}/

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


syntax keyword altKeywordList DT


"Commands for Both AppInit and AppMain
syntax keyword altFunctionList execute_function
syntax keyword altFunctionList get_option
syntax keyword altFunctionList get_memory
syntax keyword altFunctionList get_releasedir
syntax keyword altFunctionList get_job_id
syntax keyword altFunctionList get_job_dir
syntax keyword altFunctionList get_database
syntax keyword altFunctionList test_bug

"Commands for AppInit
syntax keyword altFunctionList get_gdslayer
syntax keyword altFunctionList get_topcell_name
syntax keyword altFunctionList attach_oasis_comments
syntax keyword altFunctionList get_topcell_bbox
syntax keyword altFunctionList set_patchinfo
syntax keyword altFunctionList get_gdsdbu
syntax keyword altFunctionList get_gds
syntax keyword altFunctionList get_model
syntax keyword altFunctionList load_module
syntax keyword altFunctionList load_file
syntax keyword altFunctionList set_mergeboundary_param
syntax keyword altFunctionList create_detector
syntax keyword altFunctionList add_detectorparam

"Commands for AppMain or AppModel
syntax keyword altFunctionList apply_model
syntax keyword altFunctionList set_deltadose
syntax keyword altFunctionList add_model_output
syntax keyword altFunctionList save_model_output
syntax keyword altFunctionList invalidate_model_output
syntax keyword altFunctionList in_layer
syntax keyword altFunctionList new
syntax keyword altFunctionList add
syntax keyword altFunctionList array
syntax keyword altFunctionList get
syntax keyword altFunctionList add_figure
syntax keyword altFunctionList size
syntax keyword altFunctionList get_figure
syntax keyword altFunctionList out_layer
syntax keyword altFunctionList free_layer
syntax keyword altFunctionList clone
syntax keyword altFunctionList precondition
syntax keyword altFunctionList make_figure
syntax keyword altFunctionList clean_figure
syntax keyword altFunctionList reset
syntax keyword altFunctionList add_defect
syntax keyword altFunctionList get_carearea
syntax keyword altFunctionList in_hotspot
syntax keyword altFunctionList compare_contours
syntax keyword altFunctionList send_message
syntax keyword altFunctionList bbox
syntax keyword altFunctionList get_cell_bbox
syntax keyword altFunctionList in_text
syntax keyword altFunctionList get_user_text
syntax keyword altFunctionList search_text
syntax keyword altFunctionList out_text
syntax keyword altFunctionList write
syntax keyword altFunctionList read
syntax keyword altFunctionList get_patchsize
syntax keyword altFunctionList get_patchbox
syntax keyword altFunctionList get_patchptable

"Commands for AppStage
syntax keyword altFunctionList run_stage
syntax keyword altFunctionList get_patchinfo

"Commands for GDS Merge and Crop
syntax keyword altTableList MERGE_GDS_TABLE
    syntax keyword altTableOptionList input_file
    syntax keyword altTableOptionList MERGETOP
    syntax keyword altTableOptionList OPCTOP
    syntax keyword altTableOptionList output_file
    syntax keyword altTableOptionList postfix
    syntax keyword altTableOptionList prefix
    syntax keyword altTableOptionList topcell
syntax keyword altTableList CROP_GDS_TABLE
    syntax keyword altTableOptionList crop
    syntax keyword altTableOptionList handle
    syntax keyword altTableOptionList input
    syntax keyword altTableOptionList offset
    syntax keyword altTableOptionList output

"Special Lua Utility Commands
syntax keyword altFunctionList Util_fix_jog
syntax keyword altFunctionList deepcopy

"Booleans
syntax keyword altBooleanList AND
syntax keyword altBooleanList NOT
syntax keyword altBooleanList OR
syntax keyword altBooleanList XOR

"Binary Parameters Used in Lua
syntax keyword altBinaryParamList CORRECTION_GRID
syntax keyword altBinaryParamList CORRECTION_MARGIN
syntax keyword altBinaryParamList CORRECTION_EROSION
syntax keyword altBinaryParamList RULE_MARGIN
syntax keyword altBinaryParamList RULE_EROSION
syntax keyword altBinaryParamList SKIP_MARK_VERTEX
syntax keyword altBinaryParamList MAX_NUMBER_VERTICES
syntax keyword altBinaryParamList DRC_EROSION
syntax keyword altBinaryParamList DRC_GC_THRES
syntax keyword altBinaryParamList SELECT_CROSS_PATCH
syntax keyword altBinaryParamList VERSION
syntax keyword altBinaryParamList BUGS
syntax keyword altBinaryParamList VERBOSE_LEAF_LOG
syntax keyword altBinaryParamList ALIGNMENT_GRID
syntax keyword altBinaryParamList EBH_LEVEL
syntax keyword altBinaryParamList PATCH_ID
syntax keyword altBinaryParamList ITERATION
syntax keyword altBinaryParamList API_WARNING_LEVEL
syntax keyword altBinaryParamList MODEL_EVAL_MODE
syntax keyword altBinaryParamList DISSECT_TARGET_LAYER
syntax keyword altBinaryParamList MODEL_SYMMETRY
syntax keyword altBinaryParamList MODEL_RANGEADJ
syntax keyword altBinaryParamList MODEL_EVAL_CHECK
syntax keyword altBinaryParamList CHECK_MODEL_SYMMETRY
syntax keyword altBinaryParamList BOOLEAN_ANGLE_TOL

"Lua Script-Related Functions
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

"Segment Loop Control Functions
syntax keyword altFunctionList dtSetSegmentFunct
syntax keyword altFunctionList dtSetSegmentFunctWithName
syntax keyword altFunctionList dtExecuteSegmentFunct
syntax keyword altFunctionList dtSetSegmentFuncOption
syntax keyword altBinaryParamList DT_LOOP_CENTER_TO_ENDS
syntax keyword altBinaryParamList DT_LOOP_INDEX
syntax keyword altBinaryParamList DT_LOOP_END_BACKWARD
syntax keyword altBinaryParamList DT_LOOP_END_FORWARD
syntax keyword altBinaryParamList DT_MAIN_POLYGON
syntax keyword altBinaryParamList DT_MAIN_SEGMENT
syntax keyword altBinaryParamList DT_SEGMENTFUNC_FMASK
syntax keyword altBinaryParamList DT_SEGMENTFUNC_KEEP_PRIORITY_CORRECTED
syntax keyword altBinaryParamList DT_SEGMENTFUNC_LEVEL_MASK
syntax keyword altBinaryParamList DT_SEGMENTFUNC_POLY_ORDER
syntax keyword altBinaryParamList DT_SEGMENTFUNC_RUNONCE
syntax keyword altBinaryParamList DT_SEGMENTFUNC_SEG_ORDER
syntax keyword altBinaryParamList DT_SEGMENTFUNC_SKIP_IGNORE
syntax keyword altBinaryParamList DT_SPT_IGNORE
syntax keyword altBinaryParamList DT_SPT_NUMBER_SEGMENTS

"Segment Property Functions
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
syntax keyword altBinaryParamList DT_SPT_ACCESS_ISEG
syntax keyword altBinaryParamList DT_ACCESS_SEGMENT
syntax keyword altBinaryParamList DT_SPT_ACCESS_INDEX
syntax keyword altBinaryParamList DT_ACCESSORIG_SEGMENT
syntax keyword altBinaryParamList DT_SPT_PRIORITY_AREA_INTERSECTION






