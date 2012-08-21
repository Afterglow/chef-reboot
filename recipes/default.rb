#
# Cookbook Name:: reboot
# Recipe:: default
#
# Copyright 2012, LivingSocial
# Author: Paul Thomas <paul.thomas@livingsocial.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

chef_handler "Reboot" do
  source "#{node['chef_handler']['handler_path']}/reboot_handler.rb"
  if node.has_key? :bootstrap
    if node[:bootstrap].has_key? :auto_reboot && node[:bootstrap][:auto_reboot] == 0
      action :disable
    else
      action :enable
    end
  else
    action :enable
  end
end

cookbook_file "#{node['chef_handler']['handler_path']}/reboot_handler.rb" do
  source "reboot_handler.rb"
  owner "root"
  group "root"
  mode "0644"
  action :create_if_missing
end
