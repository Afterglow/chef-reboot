#
# Author:: Paul Thomas <paul.thomas@livingsocial.com>
# Copyright:: Copyright (c) 2011 LivingSocial
# License:: Apache License, Version 2.0
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

class RebootHandler < Chef::Handler
  include Chef::Mixin::ShellOut

  def initialize(allow_pending_reboots=true, timeout=60, reason="Reboot by Chef")
    @allow_pending_reboots = allow_pending_reboots
    @timeout = timeout
    @reason = reason
  end

  def report
    Chef::Log::warn("Rebooting system from Chef")
    shell_out!("shutdown -r 60 #{reason}")

  def reboot_requested?
    node.run_state[:reboot_requested] == true
  end

  def timeout
    node.run_state[:reboot_timeout] || @timeout
  end

  def reason
    node.run_state[:reboot_reason] || @reason
  end
