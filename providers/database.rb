#
# Cookbook Name:: postgresql_lwrp
# Provider:: database
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) 2014 LLC Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
#

include Chef::Postgresql::Helpers

provides :postgresql_database if defined? provides

action :create do
  options = {}

  options['OWNER'] = "\\\"#{new_resource.owner}\\\"" if new_resource.owner
  options['TABLESPACE'] = "'#{new_resource.tablespace}'" if new_resource.tablespace
  options['TEMPLATE'] = "'#{new_resource.template}'" if new_resource.template
  options['ENCODING'] = "'#{new_resource.encoding}'" if new_resource.encoding
  options['CONNECTION LIMIT'] = new_resource.connection_limit if new_resource.connection_limit

  if create_database(new_resource.in_version, new_resource.in_cluster, new_resource.name, options)
    new_resource.updated_by_last_action(true)
  end
end
