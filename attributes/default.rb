#work around wrong package selection in java cookbook (called by maven cookbook)
case node['platform']
when "debian"
  case
  when node['platform_version'].to_f >= 8.0 # Jessie
    default['java']['jdk_version'] = "7"
  end
end
