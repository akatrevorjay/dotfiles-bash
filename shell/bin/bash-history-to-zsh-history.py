#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# This is how I used it:
# $ cat ~/.bash_history | bash-history-to-zsh-history >> ~/.zsh_history

import sys

DEFAULT_TIMESTAMP = 1454428675

def main():
    timestamp = None
    for line in sys.stdin.readlines():
        line = line.rstrip('\n')
        if line.startswith('#') and timestamp is None:
            t = line[1:]
            if t.isdigit():
                timestamp = t
                continue
        if timestamp is None:
            timestamp = DEFAULT_TIMESTAMP
        print(': %s:0;%s' % (timestamp, line))


if __name__ == '__main__':
    main()
