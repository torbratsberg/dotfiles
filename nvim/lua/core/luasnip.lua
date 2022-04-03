local ls = require('luasnip')

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("scss", {
	s("cl", { -- console.log($1);
		t("console.log("),
		i(1, "var"),
		t(");"),
		i(0),
	}),
	s("rc", { -- rem-calc($1)
		t("rem-calc("),
		i(1, ""),
		t(")"),
		i(0),
	}),
	s("bp", { -- @include breakpoint(small down) {...
		t("@include breakpoint("),
		i(1, "small"),
		t(" "),
		i(2, "down"),
		t({") {", "\t"}),
		i(0),
		t({"", "}"}),
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

ls.add_snippets("php", {
	s("vd", { -- var_dump($1);
		t("var_dump("),
		i(1, ""),
		t(");"),
		i(0),
	}),
	s("pp", { -- <?php $1 ?>
		t("<?php "),
		i(1, ""),
		t(" ?>"),
		i(0),
	}),
	s("err", { -- Error log
		t("error_log(print_r("),
		i(1),
		t(", true), 3, '"),
		f(function()
			return vim.fn.getcwd() .. "/error_log.log"
		end, {}),
		t("');"),
		i(0),
	}),
})
