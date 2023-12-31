-- Requires
local ls = require('luasnip')
local util = require('custom.snippets.util')
local fmt = require('luasnip.extras.fmt').fmt
local partial = require('luasnip.extras').partial

local function rec_ls()
	return ls.c(1, {
		ls.t({ '' }),
		ls.sn(
			nil,
			fmt('{}{}={}{}', {
				ls.t(' '),
				ls.i(1, 'k'),
				ls.i(2, 'v'),
				ls.d(3, rec_ls, {}),
			})
		),
	})
end

return {
	-- Modeline
	ls.s(
		{ trig = 'modeline', dscr = 'Add modeline to the file' },
		fmt('vim: {}={}{}', {
			ls.i(1, 'k'),
			ls.i(2, 'v'),
			ls.d(3, rec_ls, {}),
		})
	),

	-- System https://github.com/arsham/shark/blob/ac9d63013b4613944afe8339e8a4adffa266b7c5/lua/settings/luasnip/all.lua
	ls.s('time', partial(vim.fn.strftime, '%H:%M:%S')),
	ls.s('date', partial(vim.fn.strftime, '%Y-%m-%d')),
	ls.s('pwd', { partial(util.shell, 'pwd') }),
	ls.s({ trig = 'uuid', wordTrig = true }, { ls.f(util.uuid), ls.i(0) }),
	-- ls.s(
	-- 	{ trig = 'rstr(%d+)', regTrig = true },
	-- 	{ ls.f(function(_, snip)
	-- 		util.random_string(snip.captures[1])
	-- 	end), ls.i(0) }
	-- ),

	-- Misc
	ls.s('shrug', { ls.t('¯\\_(ツ)_/¯') }),
	ls.s('angry', { ls.t('(╯°□°）╯︵ ┻━┻') }),
	ls.s('happy', { ls.t('ヽ(´▽`)/') }),
	ls.s('sad', { ls.t('(－‸ლ)') }),
	ls.s('confused', { ls.t('(｡･ω･｡)') }),
}

-- vim: fdm=marker fdl=0
