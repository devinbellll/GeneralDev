" Vimball Archiver by Charles E. Campbell
UseVimball
finish
doc/syn-preproc.txt	[[[1
106
*syn-preproc.txt*       C preprocessor syntax on top of other syntaxes.

		       PREPROC SYNTAX    by Ingo Karkat
							     *syn-preproc.vim*
description			|syn-preproc-description|
usage				|syn-preproc-usage|
installation			|syn-preproc-installation|
configuration			|syn-preproc-configuration|
integration			|syn-preproc-integration|
limitations			|syn-preproc-limitations|
known problems			|syn-preproc-known-problems|
todo				|syn-preproc-todo|
history				|syn-preproc-history|

==============================================================================
DESCRIPTION					     *syn-preproc-description*

This syntax extension highlights C preprocessor directives and (optionally)
folds preprocessor conditions. You can use this as a standalone syntax, or add
this on top of another filetype.

==============================================================================
USAGE							   *syn-preproc-usage*

If you have certain files of a particular filetype (e.g. Tcl) that contain
preprocessing directives, you can add a custom filetype detection (here: for a
"Tcl template" .tclt file extension; cp. |new-filetype|), and set a compound
filetype: >
    autocmd BufNewFile,BufRead *.tclt setf tcl.preproc
<
To add the highlighting to the file's existing syntax, use: >
    :setf <C-R>=&filetype<CR>.preproc
<
To just have preprocessing highlighting (and no other syntax), use: >
    :setlocal syntax=preproc
<
Note: This script supports both the normal "#..." syntax as well as the
alternative "%:..." digraph (or alternative token) for the '#' punctuator.

==============================================================================
INSTALLATION					    *syn-preproc-installation*

This script is packaged as a |vimball|. If you have the "gunzip" decompressor
in your PATH, simply edit the *.vmb.gz package in Vim; otherwise, decompress
the archive first, e.g. using WinZip. Inside Vim, install by sourcing the
vimball or via the |:UseVimball| command. >
    vim syn-preproc*.vmb.gz
    :so %
To uninstall, use the |:RmVimball| command.

DEPENDENCIES					    *syn-preproc-dependencies*

- Requires Vim 7.0 or higher.

==============================================================================
CONFIGURATION					   *syn-preproc-configuration*

For a permanent configuration, put the following commands into your |vimrc|:

C/C++-style comments are typically removed by the preprocessor and thus
highlighted as other comments. You can define a different highlighting if you
want to visually distinguish them from the default comments of that filetype: >
    hi link preprocComment NonText
Or turn highlighting of comments off: >
    let preproc_no_comments = 1
Multi-line C-style comments are folded; if you do not want this, use: >
    let preproc_no_comment_fold = 1

To turn off folding of #if ... #endif conditions, use: >
    :let preproc_no_fold_conditions = 1
Lines commented out via #if 0 will still be folded. To turn that of, too,
use: >
    :let preproc_no_if0_fold = 1
To completely turn off highlighting (as comments) of #if 0 blocks, use: >
    :let preproc_no_if0 = 1

==============================================================================
LIMITATIONS					     *syn-preproc-limitations*

- Highlighting does not work with all syntax scripts; some syntax groups may
  obscure preprocessing matches, and preprocessing directives can negatively
  impact the matching of the original syntax.

KNOWN PROBLEMS					  *syn-preproc-known-problems*

TODO							    *syn-preproc-todo*

IDEAS							   *syn-preproc-ideas*

==============================================================================
HISTORY							 *syn-preproc-history*

1.00	17-Nov-2016
First published version.

0.01	24-Mar-2010
Started development.

==============================================================================
Copyright: (C) 2010-2016 Ingo Karkat
Based on the C Vim syntax file by Bram Moolenaar
The VIM LICENSE applies to this plugin; see |copyright|.

Maintainer:	Ingo Karkat <ingo@karkat.de>
==============================================================================
 vim:tw=78:ts=8:ft=help:norl:
syntax/preproc.vim	[[[1
147
" Vim syntax extension file
" Language:	C preprocessor syntax on top of c, cpp, ...
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" Copyright: (C) 2010-2016 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" REVISION	DATE		REMARKS
"   1.00.004	17-Nov-2016	Prepare for publishing.
"	003	10-Feb-2011	BUG: No comment highlighting of #if 0 block.
"				Fixed by syncing with syntax/c.vim from 2009 Nov
"				17.
"				FIX: Syncing also found double "end=" in
"				preprocPreCondit.
"	002	25-Mar-2010	Added highlighting preprocessor comments.
"	001	24-Mar-2010	file creation

if exists('b:current_syntax') && b:current_syntax =~# 'preproc'
    finish
endif

function! s:AlreadyHasCComments()
    let l:commentGroup = 'cComment'

    " Quickly check with hlexists() whether the "cComment" syntax group exists
    " globally.
    if hlexists(l:commentGroup)
	" Existence of the syntax group is necessary, but not yet sufficient,
	" since this query is global, and the group could have been loaded by
	" another buffer. To check whether this file's syntax includes the
	" syntax group, we need to check the output of :syntax, as
	" :syntax list {group-name} also shows non-active groups.
	redir => l:syntaxGroupsOutput
	silent! syn list
	redir END

	let l:syntaxGroups = split(l:syntaxGroupsOutput, "\n")
	let l:commentGroups = filter(l:syntaxGroups, "v:val =~# '^\\V" . escape(l:commentGroup, '\') . "'")
	if ! empty(l:commentGroups)
	    " The syntax group is used in the current filetype.
"****D echomsg '**** C/C++ style comments already defined'
	    return 1
	endif
    endif

    return 0
endfunction

syn region	preprocIncluded	display start=+"+ skip=+\\\\\|\\"+ end=+"+ contained
syn match	preprocIncluded	display "<[^>]*>" contained
syn match	preprocInclude	display "^\s*\%(%:\|#\)\s*include\>\s*["<]" contains=preprocIncluded
syn cluster	preprocPreProcGroup	contains=preprocIncluded,preprocInclude,preprocDefine

" Use matchgroup here to have the preprocessor directive always highlighted as
" such, regardless of any native matching after that.
syn region	preprocDefine		matchgroup=preprocDefine start="^\s*\%(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@preprocPreProcGroup,@Spell
syn region	preprocPreProc		matchgroup=preprocPreProc start="^\s*\%(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@preprocPreProcGroup,@Spell

syn region	preprocPreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=preprocCommentError
syn match	preprocPreCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"

if ! exists('preproc_no_comments') && ! s:AlreadyHasCComments()
    syn region	preprocCommentL	start="//" skip="\\$" end="$" keepend contains=@preprocCommentGroup,@Spell
    if exists('preproc_no_comment_fold')
	syn region	preprocComment	matchgroup=preprocCommentStart start="/\*" end="\*/" contains=@preprocCommentGroup,preprocCommentStartError,@Spell extend
    else
	syn region	preprocComment	matchgroup=preprocCommentStart start="/\*" end="\*/" contains=@preprocCommentGroup,preprocCommentStartError,@Spell fold extend
    endif
    " keep a // comment separately, it terminates a preproc. conditional
    syn match	preprocCommentError	display "\*/"
    syn match	preprocCommentStartError display "/\*"me=e-1 contained
endif

if ! exists('preproc_no_if0')
    if ! exists('preproc_no_if0_fold') && exists('preproc_no_fold_conditions')
	syn region	preprocCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=preprocCppOut2 fold
    else
	syn region	preprocCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=preprocCppOut2
    endif
    syn region	preprocCppOut2	contained start="0" end="^\s*\(%:\|#\)\s*\(endif\>\|else\>\|elif\>\)" contains=preprocCppSkip
    syn region	preprocCppSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=preprocCppSkip
endif

if ! exists('preproc_no_fold_conditions')
    " Source: http://groups.google.com/group/vim_use/browse_thread/thread/49ed223185b6cb07
    " fold #if...#else...#endif constructs
    syn region preprocIfFoldContainer
	\ start="^\s*\%(%:\|#\)\s*if\(n\?def\)\?\>"
	\ end="#\s*endif\>"
	\ skip=+"\%(\\"\|[^"]\)\{-}\\\@<!"\|'[^']\{-}'\|'\\''\|//.*+
	\ transparent
	\ keepend extend
	\ containedin=NONE
	\ contains=preprocSynFoldIf,preprocSynFoldElif,preprocSynFoldElse
    syn region preprocSynFoldIf
	\ start="^\s*\%(%:\|#\)\s*if\(n\?def\)\?\>"
	\ end="^\s*\%(%:\|#\)\s*el\(se\|if\)\>"ms=s-1,me=s-1
	\ skip=+"\%(\\"\|[^"]\)\{-}\\\@<!"\|'[^']\{-}'\|'\\''\|//.*+
	\ fold transparent
	\ keepend
	\ contained
	\ nextgroup=preprocSynFoldElif,preprocSynFoldElse
	\ contains=TOP
    syn region preprocSynFoldElif
	\ start="^\s*\%(%:\|#\)\s*elif\>"
	\ end="^\s*\%(%:\|#\)\s*el\(se\|if\)\>"ms=s-1,me=s-1
	\ skip=+"\%(\\"\|[^"]\)\{-}\\\@<!"\|'[^']\{-}'\|'\\''\|//.*+
	\ fold transparent
	\ keepend
	\ contained
	\ nextgroup=preprocSynFoldElse
	\ contains=TOP
    syn region preprocSynFoldElse
	\ start="^\s*\%(%:\|#\)\s*else\>"
	\ end="^\s*\%(%:\|#\)\s*endif\>"
	\ skip=+"\%(\\"\|[^"]\)\{-}\\\@<!"\|'[^']\{-}'\|'\\''\|//.*+
	\ fold transparent
	\ keepend
	\ contained
	\ contains=TOP
endif


hi def link preprocDefine	Macro
hi def link preprocInclude	Include
hi def link preprocIncluded	String
hi def link preprocPreProc	PreProc
hi def link preprocPreCondit	PreCondit

hi def link preprocCommentL	preprocComment
hi def link preprocCommentStart	preprocComment
hi def link preprocComment	Comment
hi def link preprocCommentError	preprocError
hi def link preprocError	Error

hi def link preprocCppSkip	preprocCppOut
hi def link preprocCppOut2	preprocCppOut
hi def link preprocCppOut	Comment


if ! exists('b:current_syntax')
    let b:current_syntax = 'preproc'
else
    let b:current_syntax .= '.preproc'
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
