require 'spec_helper'

master_tests('9.3')
create_users_tests('9.3')
create_database_tests('9.3')
install_extension_tests('9.3')
slave_tests('9.3')
cloud_backup_tests
