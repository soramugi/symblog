#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(apache php php-apache).each do |pkg|
  package pkg
end

service "apache" do
  action [ :enable, :start ]
end
