#!/usr/bin/env python

import tasklib

tw = tasklib.TaskWarrior()
result = set(tw.execute_command(["+PROJECT", "+PENDING", "+READY", "-waiting", "_projects", "rc.gc=off"])) - set(tw.execute_command(["+PENDING", "+next", "_projects"]))
for i in result:
    print(i)
