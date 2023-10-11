-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


return {
    s({trig="tt", dscr="tt into texttt"},
        fmta(
        "\\texttt{<>}",
        {i(1)}
        )
    ),
    s({trig="ff", dscr="ff into frac"},
        fmta(
        "\\frac{<>}{<>}",
        {i(1), i(2)}
        )
    ),
    s({trig="eq", dscr="eq into equation env"},
        fmta(
            [[
                \begin{equation*}
                    <>
                \end{equation*}
            ]],
        {i(1)}
        )
    ),
    s({trig="env", snippetType="autosnippet"},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
        {i(1), i(2), rep(1)}
        )
    ),
    s({trig="hr", dscr="latex link", snippetType='autosnippet'},
        fmta(
        [[\href{<>}{<>}]],
        {i(1, "url"), i(2, "display name")}
        )
    ),
    s({trig="gls", dscr="fast glossing"},
        fmta(
            [[
                \ex
                \gll~<>\\
                    <>\\
                    \trans`<>'
            ]],
            {i(1, "raw"), i(2, "gloss"), i(3, "translation")}
        )
    ),

    -- autosnippets (examples from tutorial, might be useful one day)
    s({trig=";a", snippetType="autosnippet"},
    {
        t("\\alpha"),
    }),
    s({trig=";b", snippetType="autosnippet"},
    {
        t("\\beta"),
    }),
    s({trig=";g", snippetType="autosnippet"},
    {
        t("\\gamma"),
    }),
    -- labelling
    s({trig=";l", dscr="label", snippetType="autosnippet"},
        fmta(
            [[
                \label{<>}
            ]],
        {i(1)}
        )
    ),
}
