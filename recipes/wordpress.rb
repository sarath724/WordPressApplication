#
# Cookbook:: webmd-wordpress
# Recipe:: wordpress
#
# Copyright:: 2020, The Authors, All Rights Reserved.

ruby_block "Install_wordpress" do
  block do
    require 'fileutils'
    FileUtils.cd node['webmd-wordpress']['document_root']
    system 'curl -o latest.tar.gz https://wordpress.org/latest.tar.gz'
    system 'tar -xzvf latest.tar.gz'
    system 'mkdir /var/www/html/wp-content/uploads'
    system 'sudo chown -R apache:apache /var/www/html/*'
    
    FileUtils.cd node['webmd-wordpress']['document_press']
    system 'cp wp-config-sample.php wp-config.php'
    system 'yum install epel-release yum-utils -y'
    system 'yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm'
    system 'yum-config-manager --enable remi-php74'
    system 'yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql -y'
  end
  not_if { ::File.exist?(File.join(node['webmd-wordpress']['document_root'], 'wp-settings.php')) }
  action :create
end



template node['webmd-wordpress']['document_word'] do
  source "wp-config.php.erb"
end



