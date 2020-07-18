#
# Cookbook:: webmd-wordpress
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'firewalld'

service 'firewalld' do
  action [:enable, :start]
end

include_recipe 'webmd-wordpress::apache'
#include_recipe 'webmd-wordpress::php'
#include_recipe 'webmd-wordpress::mysql'
include_recipe 'webmd-wordpress::wordpressrecipe'