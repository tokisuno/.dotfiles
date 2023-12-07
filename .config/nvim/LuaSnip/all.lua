local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local extras = require("luasnip.extras")
local rep = extras.rep
return {
    s({trig=";glos", dscr="creating glosses"},
    fmta(
        [[
            \ex\label{<>}
            \gll{<>}\\
            {<>}\\ 
            \trans`<>'
        ]],
        { i(1), i(2), i(3), i(4) }
        )
    ),
    s({trig=";tt", dscr="Expands 'tt' into '\texttt{}'"},
      fmta(
        "\\texttt{<>}",
        { i(1) }
      )
    ),
    s({trig=";tit", dscr="Expands 'tit' into '\textit{}'"},
      fmta(
        "\\textit{<>}",
        { i(1) }
      )
    ),
    s({trig=";tsc", dscr="Expands 'tsc' into '\textsc{}'"},
      fmta(
        "\\textsc{<>}",
        { i(1) }
      )
    ),
    s({trig=";sta", dscr="creates '\begin thing'"},
      fmta(
        [[
            \begin{<>}
                
            \end{<>}
        ]],
        { i(1), rep(1) }
      )
    ),
    s({trig=";sec", dscr="creates section", snippetType="autosnippet"},
      fmta(
        [[
            \section{<>}
        ]],
        { i(1) }
      )
    ),
    s({trig=";f", dscr="quotation marks", snippetType="autosnippet"},
      fmta(
        [[
            ``<>''
        ]],
        { i(1) }
      )
    ),
    s({trig=";ci", dscr="citation", snippetType="autosnippet"},
      fmta(
        [[
            \cite{<>}
        ]],
        { i(1) }
      )
    ),
    s({trig=";art", dscr="citation", snippetType="autosnippet"},
      fmta(
        [[
          @article{<>,
            title={<>},
            author={<>},
            journal={<>},
            volume={<>},
            pages={<>},
            year={<>},
            publisher={<>},
            doi={<>},
          },
        ]],
        { i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9) }
      )
    ),



}

