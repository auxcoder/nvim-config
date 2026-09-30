# Params

```lua
        custom_highlights = function(c)
          local U = require("catppuccin.utils.colors")
          -- U.lighten(source, amount, target)
          return {
            -- 1. The 'function' keyword (e.g., "local function")
            ["@function"] = { fg = c.lavender, style = { "bold" } },
            -- Optional: Function calls (invoking the function later)
            ["@function.call"] = { fg = c.teal },
            -- Bufferline: Strong contrast between active and inactive
            BufferLineBufferSelected = { fg = c.text, bg = c.base, style = { "bold", "italic" } },
            BufferLineIndicatorSelected = { fg = c.mauve, bg = c.base },
            BufferLineBuffer = { fg = c.surface2, bg = c.crust },
            -- Comment = { fg = c.teal },
            Comment = { fg = U.lighten(c.overlay0, 0.85, c.teal), style = { "italic" } },
            CmpBorder = { fg = c.surface2 },
            -- Pmenu = { bg = c.none },
            -- ColorColumn = { bg = c.surface0 }, -- used for the columns set with 'colorcolumn'
            -- Conceal = { fg = c.overlay1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor = { fg = c.base, bg = c.rosewater }, -- character under the cursor
            -- lCursor = { fg = c.base, bg = c.rosewater }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
            -- CursorIM = { fg = c.base, bg = c.rosewater }, -- like Cursor, but used when in IME mode |CursorIM|
            -- CursorColumn = { bg = c.mantle }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine = { bg = U.lighten(c.base, 0.80, c.mauve) }, -- Screen-line at the cursor, when 'cursorline' is set.
            -- Directory = { fg = c.blue }, -- directory names (and other special names in listings)
            -- EndOfBuffer = { fg = c.surface1 }, -- filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
            -- ErrorMsg = { fg = c.red, style = { "bold", "italic" } }, -- error messages on the command line
            -- VertSplit = { fg = O.transparent_background and C.surface1 or C.crust }, -- the column separating vertically split windows
            -- Folded = { fg = c.blue, bg = O.transparent_background and C.none or C.surface1 }, -- line used for closed folds
            -- FoldColumn = { fg = c.overlay0 }, -- 'foldcolumn'
            -- SignColumn = { fg = c.surface1 }, -- column where |signs| are displayed
            -- SignColumnSB = { bg = c.crust, fg = c.surface1 }, -- column where |signs| are displayed
            -- Substitute = { bg = c.surface1, fg = U.vary_color({ latte = c.red }, C.pink) }, -- |:substitute| replacement text highlighting
            LineNr = { fg = U.lighten(c.surface1, 0.85, c.rosewater) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr = { fg = c.lavender }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
            -- MatchParen = { fg = c.peach, bg = U.darken(c.surface1, 0.70, c.base), style = { "bold" } }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            -- ModeMsg = { fg = c.text, style = { "bold" } }, -- 'showmode' message (e.g., "-- INSERT -- ")
            -- -- MsgArea = { fg = c.text }, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832
            -- MsgSeparator = { link = "WinSeparator" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
            -- MoreMsg = { fg = c.blue }, -- |more-prompt|
            -- NonText = { fg = c.overlay0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            -- Normal = { fg = c.text, bg = O.transparent_background and C.none or C.base }, -- normal text
            -- NormalNC = {
            --   fg = c.text,
            --   bg = (O.transparent_background and O.dim_inactive.enabled and C.dim)
            --     or (O.dim_inactive.enabled and C.dim)
            --     or (O.transparent_background and C.none)
            --     or C.base,
            -- }, -- normal text in non-current windows
            -- NormalSB = { fg = c.text, bg = c.crust }, -- normal text in non-current windows
            -- NormalFloat = { fg = c.text, bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.mantle }, -- Normal text in floating windows.
            -- FloatBorder = O.float.solid
            --     and ((O.float.transparent and vim.o.winblend == 0) and { fg = c.surface2, bg = c.none } or {
            --       fg = c.mantle,
            --       bg = c.mantle,
            --     })
            --   or { fg = c.blue, bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.mantle },
            -- FloatTitle = O.float.solid and {
            --     fg = c.crust,
            --     bg = c.lavender,
            --   }
            --   or { fg = c.subtext0, bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.mantle }, -- Title of floating windows
            -- FloatShadow = { bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.overlay0, blend = 80 },
            -- FloatShadowThrough = {
            --   bg = (O.float.transparent and vim.o.winblend == 0) and C.none or C.overlay0,
            --   blend = 100,
            -- },
            -- Pmenu = {
            --   bg = (O.transparent_background and vim.o.pumblend == 0) and C.none or C.mantle,
            --   fg = c.overlay2,
            -- }, -- Popup menu: normal item.
            -- PmenuSel = { bg = c.surface0, style = { "bold" } }, -- Popup menu: selected item.
            -- PmenuMatch = { fg = c.text, style = { "bold" } }, -- Popup menu: matching text.
            -- PmenuMatchSel = { style = { "bold" } }, -- Popup menu: matching text in selected item; is combined with |hl-PmenuMatch| and |hl-PmenuSel|.
            -- PmenuSbar = { bg = c.surface0 }, -- Popup menu: scrollbar.
            -- PmenuThumb = { bg = c.overlay0 }, -- Popup menu: Thumb of the scrollbar.
            -- PmenuExtra = { fg = c.overlay0 }, -- Popup menu: normal item extra text.
            -- PmenuExtraSel = {
            --   bg = c.surface0,
            --   fg = c.overlay0,
            --   style = { "bold" },
            -- }, -- Popup menu: selected item extra text.
            -- ComplMatchIns = { link = "PreInsert" }, -- Matched text of the currently inserted completion.
            -- PreInsert = { fg = c.overlay2 }, -- Text inserted when "preinsert" is in 'completeopt'.
            -- ComplHint = { fg = c.subtext0 }, -- Virtual text of the currently selected completion.
            -- ComplHintMore = { link = "Question" }, -- The additional information of the virtual text.
            -- Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
            -- QuickFixLine = { bg = U.darken(C.surface1, 0.70, C.base), style = { "bold" } }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            -- Search = { bg = U.darken(C.sky, 0.30, C.base), fg = c.text }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
            -- IncSearch = { bg = U.darken(C.sky, 0.90, C.base), fg = c.mantle }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            -- CurSearch = { bg = c.red, fg = c.mantle }, -- 'cursearch' highlighting: highlights the current search you're on differently
            -- SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
            -- SpellBad = { sp = c.red, style = { "undercurl" } }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            -- SpellCap = { sp = c.yellow, style = { "undercurl" } }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
            -- SpellLocal = { sp = c.blue, style = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
            -- SpellRare = { sp = c.green, style = { "undercurl" } }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
            -- StatusLine = { fg = c.text, bg = O.transparent_background and c.none or c.mantle }, -- status line of current window
            -- StatusLineNC = { fg = c.surface1, bg = O.transparent_background and c.none or c.mantle }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            -- TabLine = { bg = c.crust, fg = c.overlay0 }, -- tab pages line, not active tab page label
            -- TabLineFill = { bg = O.transparent_background and C.none or C.mantle }, -- tab pages line, where there are no labels
            -- TabLineSel = { link = "Normal", bg = c.pink }, -- tab pages line, active tab page label
            -- TermCursor = { fg = c.base, bg = c.rosewater }, -- cursor in a focused terminal
            -- TermCursorNC = { fg = c.base, bg = c.overlay2 }, -- cursor in unfocused terminals
            -- Title = { fg = c.blue, style = { "bold" } }, -- titles for output from ":set all", ":autocmd" etc.
            -- Visual = { bg = c.surface1, style = { "bold" } }, -- Visual mode selection
            -- VisualNOS = { bg = c.surface1, style = { "bold" } }, -- Visual mode selection when vim is "Not Owning the Selection".
            -- WarningMsg = { fg = c.yellow }, -- warning messages
            -- Whitespace = { fg = c.surface1 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
            -- WildMenu = { bg = c.overlay0 }, -- current match in 'wildmenu' completion
            -- WinBar = { fg = c.rosewater },
            -- WinBarNC = { link = "WinBar" },
            -- WinSeparator = { fg = O.transparent_background and c.surface1 or c.crust },
          }
        end,

```
