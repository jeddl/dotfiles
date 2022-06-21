-- TagBar YAML file settings
vim.cmd(
	[[
		let g:tagbar_type_yaml = {
			\ 'ctagstype' : 'yaml',
			\ 'kinds' : [
				\ 'a:anchors',
				\ 's:section',
				\ 'e:entry'
			\ ],
		  \ 'sro' : '.',
			\ 'scope2kind': {
			  \ 'section': 's',
			  \ 'entry': 'e'
			\ },
			\ 'kind2scope': {
			  \ 's': 'section',
			  \ 'e': 'entry'
			\ },
			\ 'sort' : 0
		\ }
	]]
)
