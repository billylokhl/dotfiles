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
syntax match  altComment1 "\v--.*$"
syntax region altComment2 start=/\v--\[\[/ end=/\v--\]\]/ contains=@Spell

highlight default link altComment1 Comment3
highlight default link altComment2 Comment

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

highlight default link altFunctionList Function
highlight default link altBinaryParamList Keyword
highlight default link altLogicKeywordList Keyword
highlight default link altAppList Preproc
highlight default link altSpecialObjectList Ifdef

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

"Tachyon Lua Commands -- Commands for AppMain or AppModel
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

"Tachyon Lua Commands -- Commands for AppStage
syntax keyword altFunctionList run_stage
syntax keyword altFunctionList get_patchinfo

"Tachyon Lua Commands -- Commands for GDS Merge and Crop
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

"Tachyon Lua Commands -- Special Lua Utility Commands
syntax keyword altFunctionList Util_fix_jog
syntax keyword altFunctionList deepcopy

"Tachyon Lua Commands -- Booleans
syntax keyword altBooleanList AND
syntax keyword altBooleanList NOT
syntax keyword altBooleanList OR
syntax keyword altBooleanList XOR

"Tachyon Lua Commands -- Binary Parameters Used in Lua
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
syntax keyword altBinaryParamList DT_SPT_ACCESS_ISEG
syntax keyword altBinaryParamList DT_ACCESS_SEGMENT
syntax keyword altBinaryParamList DT_SPT_ACCESS_INDEX
syntax keyword altBinaryParamList DT_ACCESSORIG_SEGMENT
syntax keyword altBinaryParamList DT_SPT_PRIORITY_AREA_INTERSECTION

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

"C-AI Functions -- Others
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
syntax keyword altBinaryParamList DT_SPT_CORRECTION_MARGIN
syntax keyword altBinaryParamList DT_SPT_CORRECTION_EROSION

"Properties Table -- Segment Properties Table -- Segment Geometry Properties
syntax keyword altBinaryParamList DT_SPT_GRAPHICS_INDEX
syntax keyword altBinaryParamList DT_SPT_NUMBER_POLYGONS
syntax keyword altBinaryParamList DT_SPT_POLYGON_INDEX
syntax keyword altBinaryParamList DT_SPT_NUMBER_SEGMENTS
syntax keyword altBinaryParamList DT_SPT_SEGMENT_INDEX

"Properties Table -- Segment Properties Table -- Polygon Bounding Box Properties
syntax keyword altBinaryParamList DT_SPT_BBOX_WIDTH
syntax keyword altBinaryParamList DT_SPT_BBOX_HEIGHT

"Properties Table -- Segment Properties Table -- Segment Physical Properties
syntax keyword altBinaryParamList DT_SPT_GX
syntax keyword altBinaryParamList DT_SPT_GY
syntax keyword altBinaryParamList DT_SPT_LENGTH
syntax keyword altBinaryParamList DT_SPT_MAJOR_LENGTH
syntax keyword altBinaryParamList DT_SPT_LAYER
syntax keyword altBinaryParamList DT_SPT_DIRECTION
syntax keyword altBinaryParamList DT_SPT_DELTA_DIRECTION
syntax keyword altBinaryParamList DT_SPT_ANGLE
syntax keyword altBinaryParamList DT_SPT_DELTA_ANGLE
syntax keyword altBinaryParamList DT_SPT_PATCHRELATION
syntax keyword altBinaryParamList DT_SPT_PBOX_XDISTANCE
syntax keyword altBinaryParamList DT_SPT_PBOX_YDISTANCE
syntax keyword altBinaryParamList DT_SPT_POLYGON_MASSCENTER_X
syntax keyword altBinaryParamList DT_SPT_POLYGON_MASSCENTER_Y
syntax keyword altBinaryParamList DT_SPT_POLYGON_AREA
syntax keyword altBinaryParamList DT_SPT_POLYGON_WITHHOLE
syntax keyword altBinaryParamList DT_SPT_PATCH_INTERSECTION_S1
syntax keyword altBinaryParamList DT_SPT_PATCH_INTERSECTION_S2
syntax keyword altBinaryParamList DT_SPT_CBOX_INTERSECTION_S1
syntax keyword altBinaryParamList DT_SPT_CBOX_INTERSECTION_S2
syntax keyword altBinaryParamList DT_SPT_SB_EVAL_MDL_IDX
syntax keyword altBinaryParamList DT_SPT_SB_EVAL_RI
syntax keyword altBinaryParamList DT_SPT_SB_EVAL_LOC_S
syntax keyword altBinaryParamList DT_SPT_SB_EVAL_LOC_T
syntax keyword altBinaryParamList DT_SPT_HOLE
syntax keyword altBinaryParamList DT_SPT_HOLE_PARENT_POLYGON_INDEX

"Properties Table -- Segment Properties Table -- Segment Correction Properties
syntax keyword altBinaryParamList DT_SPT_CORRECTION_VALUE
syntax keyword altBinaryParamList DT_SPT_CORRECTION_DELTA
syntax keyword altBinaryParamList DT_SPT_STITCH

"Properties Table -- Segment Properties Table -- Context Segment Properties
syntax keyword altBinaryParamList DT_SPT_CONTEXT_ISEG
syntax keyword altBinaryParamList DT_SPT_CONTEXT_NSEG
syntax keyword altBinaryParamList DT_SPT_CONTEXT_DELTA_ANGLE
syntax keyword altBinaryParamList DT_SPT_PROXIMITY_SEGMENT
syntax keyword altBinaryParamList DT_SPT_PROMIXITY_NSEG
syntax keyword altBinaryParamList DT_SPT_PROXIMITY_ISEG
syntax keyword altBinaryParamList DT_SPT_MINWIDTH_ISEG
syntax keyword altBinaryParamList DT_SPT_MINSPACE_ISEG
syntax keyword altBinaryParamList DT_SPT_MINWIDTH_NSEG
syntax keyword altBinaryParamList DT_SPT_MINSPACE_NSEG
syntax keyword altBinaryParamList DT_SPT_PROJECTION_S
syntax keyword altBinaryParamList DT_SPT_PROJECTION_T
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_X0
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_X1
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_Y0
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_Y1
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_S
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_X
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_T
syntax keyword altBinaryParamList DT_SPT_C2C_PROJECTION_Y
syntax keyword altBinaryParamList DT_SPT_OVERLAP_PROJECTION_LENGTH
syntax keyword altBinaryParamList DT_SPT_INTERSECTION_S
syntax keyword altBinaryParamList DT_SPT_MINDISTANCE
syntax keyword altBinaryParamList DT_SPT_SORT_CONTEXT1
syntax keyword altBinaryParamList DT_SPT_SORT_CONTEXT2
syntax keyword altBinaryParamList DT_SPT_POLYGON_RELATION

"Properties Table -- Segment Properties Table -- Dissected Segment Properties
syntax keyword altBinaryParamList DT_SPT_DISSECT_NSEG
syntax keyword altBinaryParamList DT_SPT_DISSECT_ISEG
syntax keyword altBinaryParamList DT_SPT_STITCH_POINT_S
syntax keyword altBinaryParamList DT_SPT_STITCH_POINT
syntax keyword altBinaryParamList DT_SPT_CONTROL_S
syntax keyword altBinaryParamList DT_SPT_CONTROL_T
syntax keyword altBinaryParamList DT_SPT_TAG
syntax keyword altBinaryParamList DT_SPT_GROUP
syntax keyword altBinaryParamList DT_SPT_FLOOR_STITCH_ISEG
syntax keyword altBinaryParamList DT_SPT_DUMMY_DISSECT
syntax keyword altBinaryParamList DT_SPT_RESET_SEGMENT_END

"Properties Table -- Segment Properties Table -- Segment Attachment Properties
syntax keyword altBinaryParamList DT_SPT_ATTACHMENT_INDEX
syntax keyword altBinaryParamList DT_SPT_ATTACHMENT_COUNT

"Properties Table -- Segment Properties Table -- User Data Properties
syntax keyword altBinaryParamList DT_SPT_USER_DATA_0
syntax keyword altBinaryParamList DT_SPT_USER_DATA_1
syntax keyword altBinaryParamList DT_SPT_USER_DATA_2
syntax keyword altBinaryParamList DT_SPT_USER_DATA_3
syntax keyword altBinaryParamList DT_SPT_USER_DATA_4
syntax keyword altBinaryParamList DT_SPT_USER_DATA_5
syntax keyword altBinaryParamList DT_SPT_USER_DATA_6
syntax keyword altBinaryParamList DT_SPT_USER_DATA_7
syntax keyword altBinaryParamList DT_SPT_USER_DATA_8
syntax keyword altBinaryParamList DT_SPT_USER_DATA_9
syntax keyword altBinaryParamList DT_SPT_USER_DATA_10
syntax keyword altBinaryParamList DT_SPT_USER_DATA_11
syntax keyword altBinaryParamList DT_SPT_USER_DATA_12
syntax keyword altBinaryParamList DT_SPT_USER_DATA_13
syntax keyword altBinaryParamList DT_SPT_USER_DATA_14
syntax keyword altBinaryParamList DT_SPT_USER_DATA_15
syntax keyword altBinaryParamList DT_SPT_USER_DATA_16
syntax keyword altBinaryParamList DT_SPT_USER_DATA_17
syntax keyword altBinaryParamList DT_SPT_USER_DATA_18
syntax keyword altBinaryParamList DT_SPT_USER_DATA_19
syntax keyword altBinaryParamList DT_SPT_USER_DATA_20
syntax keyword altBinaryParamList DT_SPT_USER_DATA_21
syntax keyword altBinaryParamList DT_SPT_USER_DATA_22
syntax keyword altBinaryParamList DT_SPT_USER_DATA_23
syntax keyword altBinaryParamList DT_SPT_USER_DATA_24
syntax keyword altBinaryParamList DT_SPT_USER_DATA_25
syntax keyword altBinaryParamList DT_SPT_USER_DATA_26
syntax keyword altBinaryParamList DT_SPT_USER_DATA_27
syntax keyword altBinaryParamList DT_SPT_USER_DATA_28
syntax keyword altBinaryParamList DT_SPT_USER_DATA_29
syntax keyword altBinaryParamList DT_SPT_USER_DATA_30
syntax keyword altBinaryParamList DT_SPT_USER_DATA_31
syntax keyword altBinaryParamList DT_SPT_USER_DATA_32
syntax keyword altBinaryParamList DT_SPT_USER_DATA_33
syntax keyword altBinaryParamList DT_SPT_USER_DATA_34
syntax keyword altBinaryParamList DT_SPT_USER_DATA_35
syntax keyword altBinaryParamList DT_SPT_USER_DATA_36
syntax keyword altBinaryParamList DT_SPT_USER_DATA_37
syntax keyword altBinaryParamList DT_SPT_USER_DATA_38
syntax keyword altBinaryParamList DT_SPT_USER_DATA_39

"Properties Table -- Segment Properties Table -- Segment Access Properties
syntax keyword altBinaryParamList DT_SPT_LOOP_INDEX

"Properties Table -- Segment Properties Table -- Priority Correction Segment Properties
syntax keyword altBinaryParamList DT_SPT_PRIORITY_CORRECTED
syntax keyword altBinaryParamList DT_SPT_PRIORITY_CORRECTION_VALUE
syntax keyword altBinaryParamList DT_SPT_PRIORITY_KEEP
syntax keyword altBinaryParamList DT_SPT_KEEP_AREA_RELATION
syntax keyword altBinaryParamList DT_SPT_PRIORITY_AREA_RELATION
syntax keyword altBinaryParamList DT_SPT_PRIORITY_AREA_INTERSECTION
syntax keyword altBinaryParamList DT_SPT_KEEP_AREA_XDISTANCE
syntax keyword altBinaryParamList DT_SPT_KEEP_AREA_YDISTANCE
syntax keyword altBinaryParamList DT_SPT_EBH_LEVEL
syntax keyword altBinaryParamList DT_SPT_PRIORITY_HEALING
syntax keyword altBinaryParamList DT_SPT_PRIORITY_HEALING_DISTANCE

"Properties Table -- Segment Properties Table -- Super Symmetry-Related Properties
syntax keyword altBinaryParamList DT_SPT_SUSY_CHECK_CBOX
syntax keyword altBinaryParamList DT_SPT_SUSY_GID
syntax keyword altBinaryParamList DT_NO_SUSY_REP
syntax keyword altBinaryParamList DT_SPT_SUSY_NGROUP
syntax keyword altBinaryParamList DT_SUSY_REP_SEGMENT
syntax keyword altBinaryParamList DT_SUSY_REP_SEGMENT_PREFIX
syntax keyword altBinaryParamList DT_SPT_SUSY_GID_RESET

"Properties Table -- Segment Properties Table -- Update Graphics-Related Properties
syntax keyword altBinaryParamList DT_SPT_UPDATE_GRAPHICS_NEW
syntax keyword altBinaryParamList DT_SPT_UPDATE_GRAPHICS_POLYGON_NEW
syntax keyword altBinaryParamList DT_SPT_UPDATE_GRAPHICS_PARENT_POLYGON_NUMBER
syntax keyword altBinaryParamList DT_SPT_UPDATE_GRAPHICS_PARENT_POLYGON_INDEX

"Properties Table -- Segment Properties Table -- Hotspot-Related Properties
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_INDEX
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_COUNT
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_X1
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_Y1
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_X2
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_Y2
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_RANGE
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_MINDISTANCE
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_POINT_MINDIST
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_MINDISTANCE_MAX_NORM
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_POINT_MINDIST_MAX_NORM
syntax keyword altBinaryParamList DT_SPT_HOTSPOT_MAX_LINE_MINDIST

"Properties Table -- Segment Properties Table -- Cell Box Properties
syntax keyword altBinaryParamList DT_SPT_CELLBOX_MINDISTANCE
syntax keyword altBinaryParamList DT_SPT_CELLBOX_POINT_MINDIST
syntax keyword altBinaryParamList DT_SPT_CELLBOX_MINDISTANCE_MAX_NORM
syntax keyword altBinaryParamList DT_SPT_CELLBOX_POINT_MINDIST_MAX_NORM
syntax keyword altBinaryParamList DT_SPT_CELLBOX_MAX_LINE_MINDIST

"Properties Table -- Segment Properties Table -- Other Segment Properties
syntax keyword altBinaryParamList DT_SPT_ERROR_CODE
syntax keyword altBinaryParamList DT_SPT_SEGMENT_REMOVED
syntax keyword altBinaryParamList DT_SPT_IGNORE
syntax keyword altBinaryParamList DT_SPT_PROXIMITY_INVALID




"if-then-elseif-end
syntax keyword altLogicKeywordList if
syntax keyword altLogicKeywordList then
syntax keyword altLogicKeywordList elseif
syntax keyword altLogicKeywordList end

"AppMain, AppInit...
syntax keyword altAppList AppInit
syntax keyword altAppList AppMain
syntax keyword altAppList AppMerge
syntax keyword altAppList AppMergeCell
syntax keyword altAppList AppModel

"Special objects (e.g. DT)
syntax keyword altSpecialObjectList DT
