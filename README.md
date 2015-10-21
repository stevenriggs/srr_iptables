srr_iptables Cookbook
=======================
This cookbook maintains the rules for the iptables service.

Requirements
------------
A redhat linux or variant OS

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### srr_iptables::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['srr_iptables']['rules']</tt></td>
    <td>String</td>
    <td>the entire list of rules for the iptables firewall</td>
    <td><tt>"*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 10050 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 10051 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT"</tt></td>
  </tr>
</table>

Usage
-----
#### srr_iptables::default
## Use a wrapper cookbook ##
In your metadata.rb: add the line 'depends srr_iptables'
In your recipes/default.rb: add the line 'include_recipe srr_iptables'
In your attributes/default.rb: Override any attributes you like.

e.g.
Or just include `srr_iptables` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[srr_iptables]"
  ]
}
```


License and Authors
-------------------
Authors: Steven Riggs
