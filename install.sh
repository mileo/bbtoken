#!/bin/bash
###############################################################################
#                                                                             #
#          Description: BB Token Tool for Linux  Kernel > 3.5                 #
#          Copyright (c) 1994-2011 by Watchdata Technologies Pte., Ltd.       #
#                                                                             #
###############################################################################
cd /tmp/
wget http://www.watchdata.com/brazil/BBtoken/bbtokentool_1.0.0-3_all.deb
sudo dpkg -i bbtokentool_1.0.0-3_all.deb
sudo sed -i 's|interruptible_sleep_on_timeout.*|msleep_interruptible (RETRY_TIMEOUT);|g' /usr/src/wdtoken-1.0.0/wdtoken.c
sudo /usr/src/wdtoken-1.0.0/dkmsinstaller uninstall
sudo /usr/src/wdtoken-1.0.0/dkmsinstaller install
sudo /etc/init.d/wd_udk restart
