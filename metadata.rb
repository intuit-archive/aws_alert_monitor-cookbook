name             'aws_alert_monitor'
maintainer       'Intuit, Inc.'
maintainer_email 'thomas_bishop@intuit.com'
license          'Apache 2.0'
description      'Installs/Configures aws_alert_monitor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{redhat centos}.each do |os|
  supports os
end

depends 'logrotate'
