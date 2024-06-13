return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      agents = {
        {
          name = "GPT-4o",
          chat = true,
          command = true,
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          system_prompt = "You are a helpful assistant. Keep your answers concise. When providing code snippets, always leave comments for lines changed or added. Provide only the relevant parts of the code unless explicitly asked for the complete code. Format code in triple backticks. Use 'typescript' for tsx and ts code, never 'typescriptreact'.",
        },
      },
      hooks = {
        -- explains the selected code
        Explain = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by explaining the code above."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
        end,

        -- opens new chat with the entire current buffer as a context
        BufferChatNew = function(gp, _)
          -- call GpChatNew command in range mode on whole buffer
          vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        end,
      },
      chat_confirm_delete = false,
    })
  end,
}
