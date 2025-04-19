local util = require("conform.util")

---@type conform.FileFormatterConfig
return {
  meta = {
    url = "https://www.jetbrains.com/resharper/",
    description = "JetBrains ReSharper code formatter",
  },
  command = "jb",
  args = function(self, ctx)
    local dot_settings = util.root_file({ ".dotSettings" })
    if not dot_settings then
      return nil
    end
    return {
      "cleanupcode",
      '--profile="Built-in: Reformat Code"',
      "--settings=" .. dot_settings,
      ctx.filename,
    }
  end,
  stdin = false,
  require_cwd = true,
  cwd = util.root_file({ ".dotSettings" }),
}

