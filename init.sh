#! /bin/bash

# yum update
#yum -y update

# Auto Shutdown
#echo "0 22 * * * root yum -y update && /sbin/shutdown -h now" >> /etc/crontab

# Install SSM (Please note: amazon-ssm-ap-northeast-1 is for the resion)
#yum -y update
#curl https://amazon-ssm-ap-northeast-1.s3.amazonaws.com/latest/linux_amd64/amazon-ssm-agent.rpm -o amazon-ssm-agent.rpm
#yum install -y amazon-ssm-agent.rpm

#yum install -y git

# Japan Timezone
#sed -i -e "/ZONE=/s/.*/ZONE=\"Asia\/Tokyo\"/g" /etc/sysconfig/clock
#ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Reboot for the timezone change
#shutdown -r now

#Use ntpd instead of chrony
#And Use Amazon Time Sync Service mainly - https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/set-time.html
function setup_chrony_w_amazon_time_sync() {
  yum erase -y ntp
  yum install -y chrony
  sed -i -e '/^server/d' /etc/chrony.conf
  echo "server 169.254.169.123 prefer iburst" >> /etc/chrony.conf
  echo "server 169.254.169.254 iburst" >> /etc/chrony.conf
  echo "server time.google.com iburst" >> /etc/chrony.conf
  cat /etc/chrony.conf
  service ntpd stop
  systemctl stop chronyd
  systemctl start chronyd
  systemctl status chronyd

  chronyc tracking
  chronyc sources
  chronyc sourcestats
}

#setup_chrony_w_amazon_time_sync
