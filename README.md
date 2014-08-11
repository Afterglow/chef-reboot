Description
===========
Provides a very simple way to trigger a reboot at the end of a chef run fron a cookbook run using chef_handler.

Attributes
==========
`node[:reboot][:auto_reboot]` defaults to 0. Override or set to 1 if you want a node to auto reboot when the recipe is included.

Usage
=====
Add `recipe[reboot]` to your runlist. Set `node[:reboot][:auto_reboot] = 1` to trigger a reboot at the end of the run.
