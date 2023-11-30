local ls = require('luasnip')

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("svelte", {
    s("cl", { -- console.log($1);
        t("console.log("),
        i(1, "var"),
        t(");"),
        i(0),
    }),
})

ls.add_snippets("typescript", {
    s("cl", { -- console.log($1);
        t("console.log("),
        i(1, "var"),
        t(");"),
        i(0),
    }),
})

ls.add_snippets("javascript", {
    s("cl", { -- console.log($1);
        t("console.log("),
        i(1, "var"),
        t(");"),
        i(0),
    }),
})

ls.add_snippets("go", {
    s("err", { -- if err != nil {...
        t("if "),
        i(1, "err"),
        t(" != nil "),
        t({"{", "\t"}),
        i(0, "panic(err)"),
        t({"", "}"}),
    }),
})

ls.add_snippets("cs", {
    s("cl", { -- Console.WriteLine($1);
        t("Console.WriteLine("),
        i(1, "var"),
        t(");"),
        i(0),
    }),
})
