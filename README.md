Description
===========
Provides a very simple way to trigger a reboot at the end of a chef run fron a cookbook run using chef_handler.

Attributes
==========
`node[reboot][auto_reboot]` defaults to 1, define and set to 0 if you don't want node to auto reboot when recipe is included

Usage
=====
Add `recipe[reboot]` to your runlist, set `node[reboot][auto_reboot]` to 0 to prevent reboot from occuring
