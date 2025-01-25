local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node

return {
  -- frozen_string_literal
  s("frozenstring", t("# frozen_string_literal: true")),
  -- class
  s({ trig="class ", desc="Ruby class" }, {
    t("class "), i(1, "class_name"),
    t({"", "  "}), i(2, "# Add body here"),
    t({"", "end"})
  }),
  -- module
  s({trig="module ", desc="Ruby module"}, {
    t("module "), i(1, "module_name"),
    t({"", "  "}), i(2, "# Add body here"),
    t({"", "end"})
  }),
  -- rspec
  s({trig="rspec ", desc="Rspec definition"}, {
    t("# frozen_string_literal: true"),
    t({"", "", "require \"rails_helper\""}),
    t({"", "", "RSpec.describe "}), i(1, "subject"), t(" do"),
    t({"", "  "}), i(2, "pending \"add some examples to (or delete) #{__FILE__}\""),
    t({"", "end"})
  }),
  -- rspec describe
  s({trig="describe ", desc="rspec describe block"}, {
    t("describe \""), i(1), t("\" do"),
    t({"", "  "}), i(2),
    t({"", "end"})
  }),
  -- rspec it
  s({trig="it ", desc="rspec describe block"}, {
    t("it \""), i(1), t("\" do"),
    t({"", "  "}), i(2),
    t({"", "end"})
  }),
  s({trig="case ", desc="case statement"}, {
    t("case "), i(1, "condition"),
    t({"", "when "}), i(2, "case"),
    t({"", "  "}), i(3, "result"),
    c(4, {
      sn(nil, {t({"", "else", "  "}), i(1, "result")}),
      sn(nil, {t({"", "when "}), i(1, "case"), t({"", "  "}), i(2, "result")}),
      t("")
    }),
    t({"", "end"}),
  })
}
