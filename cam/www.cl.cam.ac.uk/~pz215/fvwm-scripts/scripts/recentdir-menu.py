#!/usr/bin/python

import sys
import os
import os.path
import optparse

usage = """

   %prog [options] icon1 icon2 ...

This scripts generates a tree-like FVWM menu containing recently
visited directories.  More precisely, it takes a list of files from
the standard input (one file per line) and outputs an FVWM menu
containing the tree of directories containing those files (the files
themselves are ignored).  The icons are used for corresponding levels
of the directory tree; icon1 for the first level, icon2 for the
second, and so on."""

parser = optparse.OptionParser(usage=usage)
parser.add_option("-e", "--exec", dest="exec_command", type="string",
                  default="Exec cd '%s' ; exec xterm",
                  help="FVWM command executed for a directory \
                  [Exec cd '%s' ; exec xterm]")
parser.add_option("-m", "--max-width", dest="max_width", type="int",
                  default=25,
                  help="Maximum width of the menu (in letters) [25]")
parser.add_option("-s", "--separator", action="store_true", dest="sep",
                  default=False,
                  help="Separate top branches of the tree [False]")
parser.add_option("-f", "--files", action="store_true", dest="files",
                  default=False,
                  help="Don't ignore files [False]")


options, levelicons = parser.parse_args()

prettydots = "..."
left = int((options.max_width - len(prettydots)) / 2)
right = options.max_width - left - len(prettydots)

def prettyname(text):
    if len(text) <= options.max_width:
        return text
    else:
        return text[:left] + prettydots + text[-right:]


def geticon(level):
    if len(levelicons) > 0:
        return "%%%s%%" % levelicons[min(level, len(levelicons) - 1)]
    else:
        return ""

def getnodename(path):
    if options.files:
        return path
    else:
        return os.path.dirname(path)

tree = {}                               # mapping from names to trees


dirs = []
for filename in sys.stdin:
    node = tree
    for name in getnodename(filename).split(os.sep):
        node[name] = node.get(name, {})
        node = node[name]

def outputtree(node, fullpath=[], lastpath=[], level=0):
    if len(node.items()) == 1:
        child, subnode = node.items()[0]
        outputtree(subnode, fullpath + [child], lastpath + [child], level)
    else:
        print ('+ "%s/%s" ' + options.exec_command) % \
              ("  " * level + prettyname(os.sep.join(lastpath)),
               geticon(level),
               os.sep.join(fullpath))
        children = node.items()
        children.sort()
        for child, subnode in children:
            outputtree(subnode, fullpath + [child], [child], level+1)
            if options.sep and (level == 0):
                print '+ "" Nop'

outputtree(tree)

