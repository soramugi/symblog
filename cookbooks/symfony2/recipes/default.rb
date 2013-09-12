#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(
httpd
php54 php54-devel php54-common php54-cli php54-pear php54-xml
php54-mbstring php54-intl php54-posix php54-mysql
php-pecl-apc
).each do |pkg|
  package pkg
end

template '/etc/httpd/conf/httpd.conf' do
  notifies :restart, "service[httpd]"
end

template '/etc/php.ini' do
  notifies :restart, "service[httpd]"
end

service "httpd" do
  action [ :enable, :restart ]
end
service "iptables" do
  action [ :disable, :stop ]
end
