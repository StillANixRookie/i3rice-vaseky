function! Folds()
	let thisline = getline(v:lnum)
	if match(thisline, '^[') >= 0
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
	let foldline = substitute(foldline, '\t', repeat("┈",&tabstop), "g")
	let foldline = substitute(foldline, '^[bar/',    "┫BAR ",   "")
	let foldline = substitute(foldline, '^[module/', "┫MOD    ", "")
	let foldline = substitute(foldline, '^[global/', "┫GBL    ", "")
	let foldline = substitute(foldline, ']$',        " ",        "")
	let foldline = substitute(foldline, '^[',        "┫",        "")
	let text = foldline.foldsize.'line    '
	let barcharcount = ((windowwidth * 2)/ 3) - strdisplaywidth(foldsize.'lines     ')
	let spacecharcount = windowwidth - strdisplaywidth(text) - barcharcount
	return foldline.repeat(" ",spacecharcount).'┣'.repeat("━",barcharcount).'  ('.foldsize.' lines)'
endfunction
