return {
  "robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      agents = {
        -- Disable default agents
        { name = "ChatGPT4" },
        { name = "ChatGPT3-5" },
        { name = "CodeGPT4" },
        { name = "CodeGPT3-5" },

        -- Enable only GPT4o agent
        {
          name = "GPT-4o",
          chat = true,
          command = true,
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          system_prompt = "You are a helpful assistant. Keep your answers concise. When providing code, put the code in triple backticks for markdown formatting.",
        },
      },
      hooks = {
        -- explains the selected code
        Explain = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by explaining the code above."
          local agent = gp.get_chat_agent()
          if agent then
            gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
          else
            print("No chat agent configured")
          end
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
