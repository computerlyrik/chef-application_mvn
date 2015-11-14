#
# Cookbook Name:: application_mvn
# Provider:: application_mvn
#
# Copyright 2015, computerlyrik
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


#require 'chef/mixin/shell_out'
#include Chef::Mixin::ShellOut
include Chef::DSL::IncludeRecipe
#::Chef::Recipe.send(:include, Opscode::Maven::Default)
#include_recipe "maven"

action :before_compile do
  include_recipe "maven"
end

action :before_deploy do
  call_maven("install")
end

action :before_migrate do
end

action :before_symlink do
end

action :before_restart do
  call_maven("clean")
end

action :after_restart do
  call_maven("install")
end

protected

def call_maven(goals)
  cmd = Mixlib::ShellOut.new("mvn", goals, :env => nil, :cwd => new_resource.path)
  cmd.run_command
  cmd
end

