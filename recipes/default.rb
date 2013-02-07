package node['aws_alert_monitor']['package_name'] do
  version node['aws_alert_monitor']['version']
end

user node['aws_alert_monitor']['user'] do
  home node['aws_alert_monitor']['home']
end

template File.join node['aws_alert_monitor']['home'], '.aws-alert-monitor.yml' do
  source 'aws-alert-monitor.yml.erb'
  variables :name         => node['aws_alert_monitor']['name'],
            :access_key   => node['aws_alert_monitor']['access_key'],
            :secret_key   => node['aws_alert_monitor']['secret_key'],
            :events       => node['aws_alert_monitor']['events'],
            :region       => node['aws_alert_monitor']['region'],
            :sqs_endpoint => node['aws_alert_monitor']['sqs_endpoint']
  owner node['aws_alert_monitor']['user']
  mode '0600'
end

cron_authorization node['aws_alert_monitor']['user']

file '/var/log/aws-alert-monitor.log' do
  owner node['aws_alert_monitor']['user']
  mode '0600'
end

logrotate_app 'aws-alert-monitor' do
  cookbook 'logrotate'
  path node['aws_alert_monitor']['log_file']
  frequency 'daily'
  create "600 #{node['aws_alert_monitor']['user']} root"
  rotate 7
end
