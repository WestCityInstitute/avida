# SAMPLE ORGANISM:
#
Search       #  1:  Find organism end.
Nop-C        #  2:  - Match CD:AB
Nop-D
#ThreadFork   #  3:
#Nop-D	     #  4:
Push-Prev    #  5:  Move end position to Stack-A
SetMemory    #  6:  Place FLOW-head in memory space for offspring
Head-Move    #  7:  Move Write head to flow head position
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Nop-C        #  8:
Search       #  9:  Drop flow head at start of copy loop
Inst-Read    # 10:
Inst-Write   # 11: 
Head-Push    # 12:  Get current position of...
Nop-C        # 13:  - Read-Head
If-Equal     # 14:  Test if we are done copying...
Divide       # 15:  ...If so, divide.
Head-Move    # 16:  ...If not, continue with loop.
Nop-A        # 17:
Nop-B		