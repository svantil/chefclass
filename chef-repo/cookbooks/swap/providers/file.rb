use_inline_resources

action :create do

  resource_name = new_resource.file_name.gsub('/', '_')

  execute "create#{resource_name}" do
    command "dd if=/dev/zero of=#{new_resource.file_name} bs=1024 count=#{new_resource.blocks}"
    not_if { ::File.exists?(new_resource.file_name) }
    notifies :run, "execute[mkswap#{resource_name}]", :immediately
  end

  execute "mkswap#{resource_name}" do
    command "mkswap #{new_resource.file_name}"
    action :nothing
  end

  execute "swapon#{resource_name}" do
    command "swapon #{new_resource.file_name}"
    not_if "grep -q #{new_resource.file_name} /proc/swaps"
  end
end
