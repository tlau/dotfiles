#!/usr/bin/env python

import time, string, os

KEYLOG = []
KEYLOG_MAXLEN = 500

def save_if_necessary():
     global KEYLOG
     dumpfile = os.environ['HOME'] + '/keylog-vi.dump'
     if len(KEYLOG) >= 500:
          out = string.join(KEYLOG, '\n') + '\n'
          f = open(dumpfile, 'a')
          f.write(out)
          f.close()
          KEYLOG = []

def log_insert(key):
     global KEYLOG

     d = time.time()
     d3 = d - int(d)
     d2 = int(d) & 0xffff
     d1 = int(d) >> 16
     KEYLOG.append('%s (%i %i %i)' % (key, d1, d2, d3))
     save_if_necessary()

def make_mapfile():
     print '" This file automatically generated by keylog.py'
     print
     print 'python import keylog'
     for i in map(None, string.letters + string.digits) +\
		['<Tab>', '<CR>', '<Space>']:
          print 'ino %s %s<C-o>:py keylog.log_insert("%s")<CR>' % (i,i,i)

if __name__ == '__main__':
     make_mapfile()