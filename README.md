[![Build Status](https://secure.travis-ci.org/intuit/aws_alert_monitor-cookbook.png)](http://travis-ci.org/intuit/aws_alert_monitor-cookbook)

# aws_alert_monitor-cookbook cookbook
Installs and configures aws-alert-monitor

# Requirements
* Chef 10.x

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
Add this to your run list

# Attributes
## General
`node['aws_alert_monitor']['access_key']`   - AWS access key. Default is 'changeme'.
`node['aws_alert_monitor']['home']`         - Directory where configuration file can be found. Default is `/home/monitor`.
`node['aws_alert_monitor']['name']`         - Application name. Default is `myapp`.
`node['aws_alert_monitor']['package_name']` - Name of the OS package to install. Default is 'aws-alert-monitor'.
`node['aws_alert_monitor']['region']`       - AWS region. Default is 'us-east-1'.
`node['aws_alert_monitor']['secret_key']`   - AWS secret key. Default is 'changeme'.
`node['aws_alert_monitor']['sqs_endpoint']` - SQS endpoint to monitor. Default is 'changeme'.
`node['aws_alert_monitor']['user']`         - OS user that the process will run as. The default is 'monitor'.
`node['aws_alert_monitor']['version']`      - Version of aws-alert-monitor OS package to install. Currently, you need to have this hosted in your own repository. The default is `nil` (which means the latest available version).

## Events
`node['aws_alert_monitor']['events']` - Hash of event names and address information. The default is an empty hash (`{}`). The schema is the following:
```ruby
{
  'autoscaling:EC2_INSTANCE_LAUNCH' => {
    'source'      => 'admin@example.com',
    'destination' => 'oncall@example.com'
  }
}
```

# Recipes
## default
Installs an OS packaged version of aws-alert-monitor. The OS package and repository are not a part of this cookbook. This also sets up a user and configuration file for aws-alert-monitor.

# Authors

* Thomas Bishop (@thbishop)
