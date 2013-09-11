#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(httpd php).each do |pkg|
  package pkg
end

file '/etc/httpd/conf/httpd.conf' do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace('/var/www/html', "/vagrant/web")
  content _file.send(:contents).join
  only_if "grep 'DocumentRoot \"/var/www/html\"' /etc/httpd/conf/httpd.conf"
  notifies :restart, "service[httpd]"
end

file '/etc/php.ini' do
  _file = Chef::Util::FileEdit.new(path)
  _file.search_file_replace(';date.timezone =', "date.timezone = Asia/Tokyo")
  content _file.send(:contents).join
  only_if "grep ';date.timezone' /etc/php.ini"
  notifies :restart, "service[httpd]"
end

service "httpd" do
  action [ :enable, :start ]
end
service "iptables" do
  action [ :disable, :stop ]
end
