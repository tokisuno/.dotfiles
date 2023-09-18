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
    -- more of shortform aliases
    s("hi",
        {t("Hello World")}),
    s("foo",
        {t("another snippet")}),

    -- snippet for writing snippets LMAO
    s({trig="snip", dscr="for writing snippets"},
        fmta(
        [[
            s({trig="<>", dscr="<>"},
                fmta(
                    \[\[
                        <>
                    \]\]
                )
            ),
        ]],
        {i(1, "trigger"), i(2, "description"), i(3, "function")}
        )
    ),
}
