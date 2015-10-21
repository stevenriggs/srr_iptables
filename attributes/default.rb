#
# Cookbook Name:: srr_iptables
# Attributes:: default
#

default['srr_iptables']['rules']="*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT

#Tomcat
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8005 -j ACCEPT

#Tomcat JMX monitoring
-A INPUT -m state --state NEW -m tcp -p tcp --dport 10080 -j ACCEPT

#Tomcat multicast
-A INPUT -m state --state NEW -m tcp -p tcp --dport 45564 -j ACCEPT
-A INPUT -m state --state NEW -m udp -p udp --dport 45564 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 4000:4100 -j ACCEPT

#Zabbix agent
-A INPUT -m state --state NEW -m tcp -p tcp --dport 10050 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 10051 -j ACCEPT

#Jenkins
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 8443 -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 8009 -j ACCEPT

-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited

##  uncomment below to turn on iptables logging
##  you should comment out the two REJECT items above while you test
##  look at /var/log/messages for IPTables-Dropped:
#-N LOGGING
#-A INPUT -j LOGGING
#-A LOGGING -m limit --limit 20/min -j LOG --log-prefix \"IPTables-Dropped: \" #--log-level 4
#-A LOGGING -j DROP

COMMIT


#*nat
#:PREROUTING ACCEPT [0:0]
#:OUTPUT ACCEPT [0:0]
#:POSTROUTING ACCEPT [0:0]

#Redirects
#-A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
#-A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

#COMMIT
"
