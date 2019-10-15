function! Folds()
	let thisline = getline(v:lnum)
	if match(thisline, '^\\section{') >= 0
		return ">1"
	elseif match(thisline, '^\\subsection{') >= 0
		return ">2"
	elseif match(thisline, '^\\subsubsection{') >= 0
		return ">3"
	elseif match(thisline, '\\column{') >= 0
		return ">0"
	elseif match(thisline, '\\block{') >= 0
		return ">1"
	elseif match(thisline, '^\\section\*{') >= 0
		return ">1"
	elseif match(thisline, '^\\subsection\*{') >= 0
		return ">2"
	elseif match(thisline, '^\\subsubsection\*{') >= 0
		return ">3"
	elseif match(thisline, '^\\documentclass') >= 0
		return ">1"
	elseif match(thisline, '^\\begin{document}') >= 0
		return ">0"
	elseif match(thisline, '^\\end{document}') >= 0
		return ">0"
	elseif match(thisline, '^\\begin{columns}') >= 0
		return ">0"
	elseif match(thisline, '^\\end{columns}') >= 0
		return ">0"
"	elseif match(thisline, '^\\begin{multicols}') >= 0
"		return ">0"
"	elseif match(thisline, '^\\end{multicols}') >= 0
"		return ">0"
	elseif match(thisline, '^\\printbibliography') >= 0
		return ">0"
	elseif match(thisline, '^\\tableofcontents') >= 0
		return ">0"
	elseif match(thisline, '^\\appendix') >= 0
		return ">0"
	elseif match(thisline, '% ━━') >= 0
		return ">2"
	elseif match(thisline, '% >>') >= 0
		return ">1"
	else
		return "="
	endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=Folds()
setlocal foldtext=FoldText()

function FoldText()
	let nucolwidth = &fdc + &number * &numberwidth
	let windowwidth = winwidth(0) - nucolwidth - 3
	let foldsize = (v:foldend-v:foldstart)
	let foldline = getline(v:foldstart)
	let foldline = substitute(foldline, '% ',                 "",          "")
	let foldline = substitute(foldline, '^>>',                "╢  ",       "")
	let foldline = substitute(foldline, '^━━',                "╫  ",       "")
	let foldline = substitute(foldline, '\\documentclass',    "┫ PAmble ", "")
	let foldline = substitute(foldline, '\\section{',         "┫  ",       "")
	let foldline = substitute(foldline, '\\subsection{',      "╋━ ",       "")
	let foldline = substitute(foldline, '\\subsubsection{',   "╋━━━ ",     "")
	let foldline = substitute(foldline, '\\section\*{',       "┫  ",       "")
	let foldline = substitute(foldline, '\\subsection\*{',    "╋┅ ",       "")
	let foldline = substitute(foldline, '\\subsubsection\*{', "╋┅┅┅ ",     "")
	let foldline = substitute(foldline, '\\block{',           "┫  ",       "")
	let foldline = substitute(foldline, '\\column{',          "Column:",   "")
	let foldline = substitute(foldline, '\[',                        "",   "")
	let foldline = substitute(foldline, '\]',                       ",",   "")
	let foldline = substitute(foldline, '{',                         "",   "")
	let foldline = substitute(foldline, '}.*',                       "",   "")
	let text = foldline.foldsize.'line     '
	let barcharcount = ((windowwidth * 2)/ 3) - strdisplaywidth(foldsize.'lines     ')
	let spacecharcount = windowwidth - strdisplaywidth(text) - barcharcount
	return ' '.foldline.repeat(" ",spacecharcount).'┣'.repeat("━",barcharcount).'  ('.foldsize.' lines)'
endfunction

setlocal spell spelllang=en_gb
setlocal nonumber norelativenumber laststatus=0 textwidth=80
"filetype plugin on
