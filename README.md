Description
===========
Provides a very simple way to trigger a reboot at the end of a chef run fron a cookbook run using chef_handler.

Attributes
==========
`node[:boostrap][:auto_reboot]` defaults to 1. Define and set to 0 if you don't want a node to auto reboot when the recipe is included.

Usage
=====
Add `recipe[reboot]` to your runlist. Set `node[:boostrap][:auto_reboot]` to 0 to prevent reboot from occuring.
