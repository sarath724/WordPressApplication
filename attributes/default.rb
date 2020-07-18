# The name of your site
default['webmd-wordpress']['server_name'] ='ti'
# The root directory of your site, it will be /var/www/yoursitename.com
default['webmd-wordpress']['document_root'] = "/var/www/#{node['webmd-wordpress']['server_name']}"
# The default config file
default['webmd-wordpress']['default_conf'] = '/etc/httpd/conf/httpd.conf'
# The webmd-wordpress directory for creating config file
default['webmd-wordpress']['document_word'] = "/var/www/#{node['webmd-wordpress']['server_name']}/wp-config.php"
default['webmd-wordpress']['document_press'] = "/var/www/#{node['webmd-wordpress']['server_name']}/"

# e-mail for the server admin
default['webmd-wordpress']['server_admin'] =''
# log dir for the site
default['webmd-wordpress']['log_dir'] = '/var/log/www'
# Error log for the site, it will be /var/log/wwwyoursitename-error.log
default['webmd-wordpress']['error_log'] = "#{node['webmd-wordpress']['log_dir']}/""#{node['webmd-wordpress']['server_name']}-error.log"
# Access log for the site, it will be /var/log/wwwyoursitename-access.log
default['webmd-wordpress']['custom_log'] = "#{node['webmd-wordpress']['log_dir']}/""#{node['webmd-wordpress']['server_name']}-access.log"
# The name of the webmd-wordpress database
default['webmd-wordpress']['wordpress_db_name'] = 'tidb'
# The username  for MySQL
default['webmd-wordpress']['wordpress_db_user'] = 'tidb'
# The root password for MySQL
default['webmd-wordpress']['wordpress_db_password'] = 'tidb'
# The root password for MySQL
default['webmd-wordpress']['wordpress_db_hostname'] = 'tidb'

# The default username for the webmd-wordpress database
#default['webmd-wordpress']['webmd-wordpress_username'] = 'adminuser'
# The default password for the webmd-wordpress database
#default['webmd-wordpress']['webmd-wordpress_password'] = 'user@123'


default['webmd-wordpress']['apache']['apache_conf'] = '/etc/httpd/conf/httpd.conf'
default['webmd-wordpress']['apache']['apache-logs-dir'] = '/var/log/httpd/'
default['webmd-wordpress']['apache']['auth_override_type'] = 'None'

default['webmd-wordpress']['python']['packages'] = [
'python34',
'python34-requests',
'python34-chardet',
'python34-idna',
'python34-pysocks',
'python34-six',
'python34-urllib3',
'python-pathlib'
]

default['webmd-wordpress']['varnish']['version'] = '6.2.2-1.el7'
default['webmd-wordpress']['varnish']['log_daemon'] = true

default['webmd-wordpress']['nodejs']['version'] = '10.9.0-1'

default['webmd-wordpress']['java-openjdk']['version'] = 'java-11-openjdk'
