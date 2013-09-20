#!/uns/bin/python

import os, sys, vim

# Also I want to trap quits and do something---either pop up the whatnow
# window, or prompt inside vim, or default to send...

def nobuffers():
	numbufs = len(vim.buffers)
	if numbufs == 1 and len(vim.buffers[0]) == 1:
		return 1
	else:
		return 0

def send(filename):
	vim.command('w')
	sendcmd = "send -push -forward %s"
	# TODO: check for errors
	os.system(sendcmd % filename)
	# What I want to do here is quit vim if it only has this one buffer,
	# but otherwise leave it open (in case it's in use for other files)
	vim.command('bd')
	if nobuffers():
		vim.command('q!')

def abort(filename):
	vim.command('bd!')
	rmcmd = "rm -f %s" % filename
	# TODO: check for errors
	os.system(rmcmd)
	if nobuffers():
		vim.command('q!')
