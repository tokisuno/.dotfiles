-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
    s({trig="-rpr", dscr="report"},
        fmta(
            [[
                % ------- %
                % PREFACE %
                % ------- %
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
                
                \title{Finnish Tense-Aspect}
                \author{FULL_NAME --- STUDENT_NUMBER}
            ]]
        )
    ),
    s({trig="-tris", dscr="syntax report"},
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
