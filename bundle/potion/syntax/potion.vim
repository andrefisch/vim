if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword

syntax keyword potionKeyword if elsif else
highlight link potionKeyword Conditional

syntax keyword potionFunction print join say
highlight link potionFunction Function

syntax keyword potionKeyword string number
highlight link potionKeyword Type

syntax match potionOperator "\v\+\d"
highlight link potionString Number

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link potionString String

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\."
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
highlight link potionOperator Operator

let b:current_syntax = "potion"
