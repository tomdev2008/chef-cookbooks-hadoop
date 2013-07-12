#
# Cookbook Name:: cloudera
# Recipe:: hadoop_namenode
#
# Author:: Cliff Erson (<cerson@me.com>)
# Author:: Istvan Szukacs (<istvan.szukacs@gmail.com>)
# Copyright 2012, Riot Games
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

include_recipe "cloudera"

if node['hadoop']['cdh_major_version'] == '3'
  package "hadoop-#{node['hadoop']['version']}-namenode"
else
  package "hadoop-hdfs-namenode"
end

node['hadoop']['hdfs_site']['dfs.name.dir'].split(',').each do |dir|
  directory dir do
    mode 0700
    owner "hdfs"
    group "hdfs"
    action :create
    recursive true
  end
end

