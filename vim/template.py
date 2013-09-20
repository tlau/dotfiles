#!/usr/bin/env python

from Tkinter import *

class App(Frame):
	def __init__(self, master=None):
		Frame.__init__(self, master)
		self.pack(expand=1, fill=BOTH)
		self._create_widgets()

	def _create_widgets(self):
		pass

def main():
	a = App()
	a.mainloop()

if __name__ == '__main__':
	main()
