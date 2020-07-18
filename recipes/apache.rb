#
# Cookbook:: webmd-wordpress
# Recipe:: apache
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Install Apache server
package 'httpd' do
  action :install
end
 
# Create the root directory and set the permissions and owners
directory node['webmd-wordpress']['document_root'] do
  owner 'apache'
  group 'apache'
  mode '0755'
  recursive true
end
 
# Create the Apache log directory
directory node['webmd-wordpress']['log_dir'] do
  recursive true
end
 
# Create the default httpd.conf file
template node['webmd-wordpress']['default_conf'] do
  source "httpd.conf.erb"
end
 
# Enable start on boot and start Apache
service 'httpd' do
  action [:enable, :start]
end

package 'firewalld'

service 'firewalld' do
  action [:enable, :start]
end

 
# Allow HTTP to pass on the firewall
execute 'httpd_firewall' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service https'
  ignore_failure true
end

 
# Reload the firewall rules
execute 'reload_firewall' do
  command '/usr/bin/firewall-cmd --reload'
  ignore_failure true
end
