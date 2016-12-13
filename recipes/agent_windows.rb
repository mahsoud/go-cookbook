include_recipe "gocd::agent_windows_install"

gocd_agent_autoregister_file 'C:\GoAgent\autoregister.properties' do
  autoregister_key node['gocd']['agent']['autoregister']['key']
  autoregister_hostname node['gocd']['agent']['autoregister']['hostname']
  environments node['gocd']['agent']['autoregister']['environments']
  resources node['gocd']['agent']['autoregister']['resources']
end

service "Go Agent" do
  supports :status => true, :restart => true, :start => true, :stop => true
  action [:enable, :start]
end
