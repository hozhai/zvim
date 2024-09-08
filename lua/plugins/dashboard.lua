return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function()
            -- 	local logo = [[
            --  		      ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::
            --   	     :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:
            -- 	      :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+
            -- 	   +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+
            -- 	  +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+
            -- 	 #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#
            -- ###    #### ########## ########      ###     ########### ###       ###
            -- 	        ]]
            -- local logo = [[
            -- L.                     ,;    t#,
            -- EW:        ,ft       f#i    ;##W.              t
            -- E##;       t#E     .E#t    :#L:WE              Ej            ..       :
            -- E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et
            -- E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t
            -- E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t
            -- E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t
            -- E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t
            -- E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t
            -- E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t
            -- E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t
            -- ..         G#E        tt      t     t          E#t ...      #G      ..
            --             fE                                 ,;.          j
            --              ,
            -- ]]
            local logo = [[
                                       d8,
                                      `8P

   88bd88b  d8888b d8888b ?88   d8P  88b  88bd8b,d88b
  88P' ?8bd8b_,dPd8P' ?88d88  d8P'  88P  88P'`?8P'?8b
 d88   88P88b    88b  d88?8b ,88'  d88  d88  d88  88P
d88'   88b`?888P'`?8888P'`?888P'  d88' d88' d88'  88b
			      ]]
            logo = string.rep("\n", 8) .. logo .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        {
                            action = "ene | startinsert",
                            desc = " New File",
                            icon = " ",
                            key = "n",
                        },
                        {
                            action = "Telescope oldfiles",
                            desc = " Recent Files",
                            icon = " ",
                            key = "r",
                        },
                        {
                            action = "Telescope find_files",
                            desc = " Find Files",
                            icon = " ",
                            key = "f",
                        },
                        {
                            action = "qa",
                            desc = " Quit",
                            icon = " ",
                            key = "q",
                        },
                    },
                    footer = function()
                        return {
                            '"life is hard, but remember; you are harder." - Sun Tzu, The Art of War',
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            return opts
        end,
    },
}
