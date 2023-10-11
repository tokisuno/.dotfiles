-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    s({trig="zrpr", dscr="report"},
        fmta(
            [[
                \documentclass[12pt]{report} 
                \usepackage[yyyymmdd]{datetime} 
                \renewcommand{\dateseparator}{-}
                \usepackage{fullpage, amsthm, natbib, gb4e}
                \newtheorem{example}{Example}
                \usepackage{fancyhdr}
                \pagestyle{fancy}
                \fancyhf{}
                \makeatletter
                \makeatother
                \setlength\headheight{16pt}
                \setlength\headsep{3pt}
                \addtolength\topmargin{-15pt}
                \AtBeginDocument{\thispagestyle{empty}}
                \fancyhead[L]{STUDENT_NUMBER --- SURNAME}
                \bibliographystyle{abbrvnat}
                \setcitestyle{authoryear, aysep{comma}}
                \title{<>}
                \author{FULL_NAME --- STUDENT_NUMBER}
            ]],
            {i(1)}
        )
    ),
    s({trig="ztris", dscr="syntax report"},
        fmta(
            [[
                \documentclass[12pt]{report}
                \usepackage[yyyymmdd]{datetime}
                \renewcommand{\dateseparator}{-}
                \usepackage{silence}
                \usepackage[linguistics]{forest}
                \usepackage[backend=biber,style=numeric]{biblatex} 
                \usepackage{adjustbox}
                \usepackage{multicol}
                \usepackage{expex}
                \usepackage{fullpage, amsthm}
                \usepackage{soul}
                \usepackage{gb4e}
                \newtheorem{example}{Example}
                \usepackage{fancyhdr}
                \pagestyle{fancy}
                \WarningFilter{biblatex}{Patching footnotes failed}
                \fancyhf{}
                \makeatletter
                \makeatother
                \setlength\headheight{16pt}
                \setlength\headsep{3pt}
                \addtolength\topmargin{-15pt}
                \AtBeginDocument{\thispagestyle{empty}}
                \fancyhead[L]{STUDENT_NUMBER --- SURNAME}
                
                \title{<>}
                \author{FULL_NAME --- STUDENT_NUMBER\thanks{Thank you PROFESSOR}
            ]],
            {i(1, "title")}
        )
    ),
}
