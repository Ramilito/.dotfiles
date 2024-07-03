return {
  {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
    config = function()
      require("gen").prompts["DevOpsEngineer"] = {
        prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, python. You answer with code examples when possible:\n$input",
        -- replace = true
      }
    end,
  },
}
