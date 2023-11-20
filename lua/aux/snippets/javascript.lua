-- Load LuaSnip
local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt -- helper
local s = ls.s --
local i = ls.insert_node --
local t = ls.text_node --
local c = ls.c -- c(1, {'a', ' b'}) c(<position>, {'optionA', 'optionB'})
local rep = require('luasnip.extras').rep -- rep(<position>)
local parse = require('luasnip.util.parser').parse_snippet

function getFileName()
	local _, _, filename = vim.fn.expand('%:p'):find('([^/\\]*)$')
	return filename or ''
end

-- A snippet consists of three parts:
-- s(<trigger|trigger table>, <nodes>, <condition,callbacks>)
-- Trigger: Denote the key combination to get to expand the snippet.
-- Nodes: The body of the snippet - what the snippet returns, in terms of nodes.
-- Condition/Callbacks: Determines the conditions on which the snippet expands and any other actions.

return {
	s( -- Console log {{{
		{
			trig = 'log',
			name = 'Do console Log',
			dscr = 'Select text, press <C-s>, type log.',
		},
		fmt('console.log("log {} >> ", {}) // eslint-disable-line', {
			i(1, 'Label'),
			rep(1),
		})
	), --}}}

	s( -- Console log {{{
		{
			trig = 'log',
			name = 'Do console Log with options',
			dscr = 'Select text, press <C-s>, type log.',
		},
		fmt('console.log("{} >> ", {}) // eslint-disable-line', {
			c(1, t('log '), t('')),
			rep(1),
			i(0),
		})
	), --}}}

	-- Ng Component from VSCode
	parse(
		{
			trig = 'ngcmp',
			wordTrig = true,
			desc = 'New Ng Component',
		},
		'// import "./${1:file-name}.scss");\n'
			.. 'import ${2:componentName}Tpl from "./${1:file-name}.html";\n'
			.. 'const compConfig = {\n'
			.. '\ttemplate: ${2:componentName}Tpl,\n'
			.. '\tcontroller: ${2:componentName}Controller,\n'
			.. '\tbindings: {\n'
			.. '\t\t${3:bindProp}: "<?",\n'
			.. '\t\tonUpdateFn: "&"",\n'
			.. '\t},\n'
			.. '};\n'
			.. '/** @ngInject */\n'
			.. 'function ${2:componentName}Controller() {\n'
			.. '\tconst \\$ctrl = this;\n'
			.. '\t\\$ctrl.\\$onInit = () => {\n'
			.. '\t\t init()\n'
			.. '\t};\n'
			.. '\t\\$ctrl.\\$onChanges = (changesObj) => {\n'
			.. '\t\tif (changesObj.${3:bindProp}) {\n'
			.. '\t\t\tconsole.log(changesObj) // eslint-disable-line\n'
			.. '\t\t\t// onBindingChange();\n'
			.. '\t\t}\n'
			.. '\t};\n'
			.. '\t\\$ctrl.\\$onDestroy = () => { };\n'
			.. '\n'
			.. '\tfunction init() {\n'
			.. "\t\tconsole.log('from init >') // eslint-disable-line\n"
			.. '\t}\n'
			.. '\n'
			.. '\t// function onBindingChange(params) {\n'
			.. '\t// \tconsole.log(changesObj)\n'
			.. '\t// }\n'
			.. '}\n'
			.. 'let compMod = angular.module("mod.cmp.${2:componentName}", []).component("${2:componentName}", compConfig);\n'
			.. 'export default compMod = compMod.name;'
	),

	-- Ng Promise
	parse(
		{
			trig = 'ngpm',
			wordTrig = true,
			desc = 'New Ng Promise',
		},
		'/**'
			.. '*\t@param {any} ${2:argument}'
			.. '* @returns Promise'
			.. '*/'
			.. 'function ${1:methodName}Action (${2:argument}) {'
			.. "\tconst _errMsg = {display: 'Rejected reason should be updated'};"
			.. '\tconst _def = \\$q.defer();'
			.. '\t${3:gateway}.${4:methodName}({'
			.. '\t\t${param}: ${2:argument}'
			.. '\t})'
			.. '\t.then(resObj => {'
			.. '\t\tconst {data} = resObj;'
			.. '\t\t\tif (data?.success) _def.resolve(data.payLoad);'
			.. '\t\t\tif (data?.error) _def.reject(Object.assign(data.error, _errMsg))'
			.. '\t\t})'
			.. '\t\t.catch(resObj => _def.reject(Object.assign(resObj.data.error, _errMsg)));'
			.. '\treturn _def.promise();'
			.. '}'
	),

	-- Ng Class
	parse(
		{
			trig = 'ngcls',
			wordTrig = true,
		},
		"// import {x} from 'x-module'"
			.. '//'
			.. '/**'
			.. ' * @description'
			.. '**/'
			.. 'export class ${1:className} {'
			.. '\tconstructor (${2:classDep}){'
			.. "\t\t'ngInject';"
			.. '\t\tthis.$2 = $2;'
			.. '\t}'
			.. '}'
			.. "let compMod = angular.module('mod.svc.${1:className}', []).service('${1:className}Svc', ${1:className});"
			.. 'export default compMod = compMod.name;'
	),

	-- Ng Svc Class
	parse(
		{
			trig = 'ngsvc',
			wordTrig = true,
		},
		'/**'
			.. ' * @description'
			.. '**/'
			.. 'export class ${1:className} {'
			.. '\tconstructor (\\$http, API){'
			.. "\t\t'ngInject';"
			.. '\t\tthis.http = \\$http;'
			.. '\t\tthis.path = `\\${API}/v1/${2:gateway}`;'
			.. '\t}'
			.. ''
			.. '\t${3:methodname}(params, cache = false) {'
			.. '\t\treturn this.http.get(`${this.path}/${3:methodname}`, {params, cache});'
			.. '\t}'
			.. '}'
			.. "let compMod = angular.module('mod.svc.${1:className}', []).service('${1:className}Svc', ${1:className});"
			.. 'export default compMod = compMod.name;'
	),

	-- Ng Factory
	parse(
		{
			trig = 'ngfct',
			wordTrig = true,
		},
		'/** @ngInject */'
			.. 'function ${2:factoryName}(\\$http, \\$q, API) {'
			.. '\treturn {'
			.. '\t\t${3:methodName}: ${3:methodName},'
			.. '\t};'
			.. ''
			.. '\tfunction ${3:methodName}(params) {'
			.. '\t\tconst _def = \\$q.defer();'
			.. "\t\t\\$http({method: '${4:GET}', url: API + '/${5:method/path}', params: params})"
			.. '\t\t\t.then(resObj => _def.resolve(resObj))'
			.. '\t\t\t.catch(errObj => _def.reject(errObj));'
			.. '\t\treturn _def.promise;'
			.. '\t}'
			.. '}'
			.. "let compMod = angular.module('mod.fct.${1:factoryName}', []).factory('${1:factoryName}Fct', ${1:factoryName});"
			.. 'export default compMod = compMod.name;'
	),

	-- AngularJS Modal
	parse(
		{
			trig = 'ngm',
			wordTrig = true,
		},
		"import ${1:componentName}Tpl from './${TM_FILENAME_BASE}.html');"
			.. 'const compConfig = {'
			.. '\ttemplate: ${1:componentName}Tpl,'
			.. '\tcontroller: ${1:componentName}Controller,'
			.. '\tbindings: {'
			.. "\t\tmodalInstance: '<',"
			.. "\t\tresolve: '<',"
			.. '\t},'
			.. '};'
			.. '/** @ngInject */'
			.. 'function ${1:componentName}Controller() {'
			.. '\tconst $ctrl = this;'
			.. '\t$ctrl.$onInit = function () {'
			.. '\t\t$ctrl.cancel = cancel;'
			.. '\t\t$ctrl.dismiss = dismiss;'
			.. '\t};'
			.. '\tfunction cancel() {'
			.. "\t\t$ctrl.modalInstance.cancel('cancel');"
			.. '\t}'
			.. '\tfunction dismiss() {'
			.. "\t\t$ctrl.modalInstance.dismiss('dismiss');"
			.. '\t}'
			.. '}'
			.. "let compMod = angular.module('mod.cmp.${1:componentName}', []).component('${1:componentName}', compConfig);"
			.. 'export default compMod = compMod.name;'
	),

	-- Route State
	parse(
		{
			trig = 'ngstt',
			wordTrig = true,
		},
		'// #region ${1:stateName}'
			.. ".state('${1:stateName}', {"
			.. "\turl: '/?param',"
			.. "\ttemplate: '<${2:tpl-name}>',"
			.. '\tparams: {'
			.. '\t\tparam: null,'
			.. '\t},'
			.. '\tresolve: {'
			.. '\t\t/** @ngInject */'
			.. '\t\tloadComponent: (\\$q, \\$ocLazyLoad) => {'
			.. '\t\t\tconst _def = \\$q.defer();'
			.. '\t\t\timport('
			.. "\t\t\t\t/* webpackChunkName: '${1:stateName/(.*)/${1:/pascalcase}/g}' */"
			.. "\t\t\t\t'./app/containers${3}'"
			.. '\t\t\t)'
			.. '\t\t\t\t.then(res => {'
			.. '\t\t\t\t\t\\$ocLazyLoad.load({name: res.default});'
			.. '\t\t\t\t\t_def.resolve(res);'
			.. '\t\t\t\t})'
			.. '\t\t\t\t.catch(err => _def.reject(err));'
			.. '\t\t\treturn _def.promise;'
			.. '\t\t},'
			.. '\t},'
			.. '})'
			.. '// #endregion'
	),

	-- Rejected Handler
	parse(
		{
			trig = 'fnr',
			wordTrig = true,
		},
		'function handle_rejectedPromise(res) {'
			.. '\t\\$log.error(res);'
			.. '\tconst _message = res?.display || null;'
			.. '\tModalHelperService.errorModal(null, _message).result.then(angular.noop).catch(angular.noop);'
			.. '}'
	),

	-- Promise Handler
	parse(
		{
			trig = 'fnr',
			wordTrig = true,
		},
		'function handle_rejectedPromise(res) {'
			.. '\t\\$log.error(res);'
			.. '\tconst _message = res?.display || null;'
			.. '\tModalHelperService.errorModal(null, _message).result.then(angular.noop).catch(angular.noop);'
			.. '}'
	),

	-- Modal Alert
	parse(
		{
			trig = 'fnma',
			wordTrig = true,
		},
		'function ${1:openAlert}() {'
			.. '\tModalHelperService.alertModal('
			.. "\t\t'xs',"
			.. '\t\tfalse,'
			.. '\t\tfalse,'
			.. "\t\t'${2:modalTitle}',"
			.. '\t\t\'<p class="text-center">${3:modalMsg}</p>\','
			.. "\t\t{label: 'No', disabled: false, classes: 'btn-outline-primary'},"
			.. "\t\t{label: 'No', disabled: false, classes: 'btn-primary'},"
			.. "\t\t'static'"
			.. '\t)'
			.. '\t\t.result.then(() => angular.noop)'
			.. '\t\t.catch(() => angular.noop);'
			.. '}'
	),

	-- Modal Error
	parse(
		{
			trig = 'fnme',
			wordTrig = true,
		},
		'function ${1:openAlert}() {'
			.. '\tModalHelperService.errorModal('
			.. "\t\t'xs',"
			.. '\t\tfalse,'
			.. '\t\tfalse,'
			.. "\t\t'${2:modalTitle}',"
			.. '\t\t\'<p class="text-center">${3:modalMsg}</p>\','
			.. "\t\t{label: 'No', disabled: false, classes: 'btn-outline-primary'},"
			.. "\t\t{label: 'No', disabled: false, classes: 'btn-primary'},"
			.. "\t\t'static'"
			.. '\t)'
			.. '\t\t.result.then(() => angular.noop)'
			.. '\t\t.catch(() => angular.noop);'
			.. '}'
	),

	-- Log Stringify
	parse({
		trig = 'logjs',
		wordTrig = true,
	}, 'console.log(`${1:test} > ${JSON.stringify(${1:test})}`); // eslint-disable-line'),
}

-- vim: fdm=marker fdl=0
