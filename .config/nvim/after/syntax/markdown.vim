syntax match mkdCheckBoxChar /[ xX]/ contained
syntax match mkdListItem /^\s*\%([-*+]\|\d\+\.\)\%(\s\[[ xX]\]\)\?\ze\%(\s.*\)\?$/ contained contains=mkdCheckBoxChar

highlight link mkdCheckBox mkdListItem
highlight link mkdCheckBoxChar SpecialKey
