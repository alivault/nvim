return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = os.getenv("OPENAI_API_KEY"),
        },
      },
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
          gp.Prompt(params, gp.Target.popup, agent, template)
        end,

        -- opens new chat with the entire current buffer as a context
        BufferChatNew = function(gp, _)
          -- call GpChatNew command in range mode on whole buffer
          vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        end,
      },
      chat_confirm_delete = false,
    }
    require("gp").setup(conf)

    require("which-key").add({
      -- VISUAL mode mappings
      -- s, x, v modes are handled the same way by which_key
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        { "<leader>i<C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "ChatNew tabnew" },
        { "<leader>i<C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
        { "<leader>i<C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
        { "<leader>ia", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
        { "<leader>ib", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)" },
        { "<leader>ic", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
        { "<leader>ig", group = "generate into new .." },
        { "<leader>ige", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
        { "<leader>ign", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
        { "<leader>igp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
        { "<leader>igt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" },
        { "<leader>igv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
        { "<leader>ii", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
        { "<leader>in", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ip", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
        { "<leader>ir", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
        { "<leader>is", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>it", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
        { "<leader>iw", group = "Whisper" },
        { "<leader>iwa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append" },
        { "<leader>iwb", ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend" },
        { "<leader>iwe", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<leader>iwn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<leader>iwp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        { "<leader>iwr", ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite" },
        { "<leader>iwt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        { "<leader>iwv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<leader>iww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
        { "<leader>ix", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
        { "<leader>ie", ":<C-u>'<,'>GpExplain<cr>", desc = "Explain Selection" },
      },

      -- NORMAL mode mappings
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<leader>i", group = "gp-nvim" },
        { "<leader>i<C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
        { "<leader>i<C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<leader>i<C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<leader>ia", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<leader>ib", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<leader>ic", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<leader>if", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        { "<leader>ig", group = "generate into new .." },
        { "<leader>ige", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        { "<leader>ign", "<cmd>GpNew<cr>", desc = "GpNew" },
        { "<leader>igp", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<leader>igt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
        { "<leader>igv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<leader>in", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ir", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<leader>is", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>it", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<leader>iw", group = "Whisper" },
        { "<leader>iwa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
        { "<leader>iwb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
        { "<leader>iwe", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<leader>iwn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<leader>iwp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        { "<leader>iwr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
        { "<leader>iwt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        { "<leader>iwv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<leader>iww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
        { "<leader>ix", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
        { "<leader>igb", "<cmd>GpBufferChatNew<cr>", desc = "Buffer Chat New" },
      },

      -- INSERT mode mappings
      {
        mode = { "i" },
        nowait = true,
        remap = false,
        { "<leader>i<C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
        { "<leader>i<C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<leader>i<C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<leader>ia", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<leader>ib", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<leader>ic", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<leader>if", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        { "<leader>ig", group = "generate into new .." },
        { "<leader>ige", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        { "<leader>ign", "<cmd>GpNew<cr>", desc = "GpNew" },
        { "<leader>igp", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<leader>igt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
        { "<leader>igv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<leader>in", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ir", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<leader>is", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>it", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<leader>iw", group = "Whisper" },
        { "<leader>iwa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
        { "<leader>iwb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
        { "<leader>iwe", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
        { "<leader>iwn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
        { "<leader>iwp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
        { "<leader>iwr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
        { "<leader>iwt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
        { "<leader>iwv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
        { "<leader>iww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
        { "<leader>ix", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },
    })
  end,
}
