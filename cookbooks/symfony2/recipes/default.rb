#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#DocumentRoot "/vagrant/web"
%w(httpd php).each do |pkg|
  package pkg
end

service "httpd" do
  action [ :enable, :start ]
end
service "iptables" do
  action [ :disable, :stop ]
end
