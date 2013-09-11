#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(httpd php).each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/httpd/conf/httpd.conf' do
  notifies :restart, "service[httpd]"
end

template '/etc/php.ini' do
  notifies :restart, "service[httpd]"
end

service "httpd" do
  action [ :enable, :start ]
end
service "iptables" do
  action [ :disable, :stop ]
end
