# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "svantil"
client_key               "#{current_dir}/svantil.pem"
validation_client_name   "scrippsdemo-validator"
validation_key           "#{current_dir}/scrippsdemo-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/scrippsdemo"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor] = "/usr/bin/vim"
