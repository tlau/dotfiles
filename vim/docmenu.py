MAX_DOCUMENTS = 10
DOC_FILE      = '/homes/gws/tlau/.vim/Documents'
MENU_CREATED  = 0

import vim, string, regsub

# fname must not contain a trailing newline
def AddDocument(fname):
	try:
		doclist = map(string.strip, open(DOC_FILE).readlines())
	except:
		doclist = []
	if fname in doclist:
		doclist.remove(fname)
	doclist.insert(0, fname)
	if len(doclist) > MAX_DOCUMENTS:
		doclist = doclist[:MAX_DOCUMENTS]
	f = open(DOC_FILE, 'w')
	f.write(string.join(doclist, '\n') + '\n')
	f.close()

def CreateMenu():
	global MENU_CREATED

	try:
		doclist = map(string.strip, open(DOC_FILE).readlines())
	except:
		doclist = []
	if MENU_CREATED:
		try:
			vim.command('unmenu Documents')
		except:
			pass
	for doc in doclist:
		if not doc: continue
		escdoc = regsub.gsub('\.', '\.', doc)
		cmd1 = 'anoremenu Documents.%s :python docmenu.ShowOrLoad("%s")' % (escdoc, doc)
		vim.command(cmd1)
	MENU_CREATED = 1

#--------------------------------------------------------------------------
# Public interface:
#
# Add the current buffer's filename to the Documents menu, and regenerate
# it.
#
def AddCurBuf():
	curbuf = vim.current.buffer
	fname = string.strip(curbuf.name)
	AddDocument(fname)
	CreateMenu()

def ShowOrLoad(filename):
	if vim.current.buffer.name is None:
		vim.command('n %s' % filename)
	elif filename not in map(lambda x: string.strip(x.buffer.name or ''),
		vim.windows):
		vim.command('new %s' % filename)
