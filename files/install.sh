#!/bin/bash
#Install script for applications
#Gourmet

#####################################
#	Install dependencies		        	#
#							                  		#
#####################################

apt-get update -qq
apt-get install -qy gourmet

#####################################
#	Fix keyboard mappings rdp	      	#
#						                  			#
#####################################
sed -i.bak '/[default_rdp_layouts]/ a rdp_layout_no=0x00000414' /etc/xrdp/xrdp_keyboard.ini
sed -i.bak '/[default_layouts_map]/ a rdp_layout_no=no' /etc/xrdp/xrdp_keyboard.ini
cp /files/keymaps/*.ini /etc/xrdp/

#####################################
#	Add configs and needed stuff    	#
#								                  	#
#####################################
cp /files/startapp.sh /startapp.sh
chmod +x /startapp.sh

exit
