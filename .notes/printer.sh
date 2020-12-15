# 1. install printer packages (.scripts/packages)

# 2. add mdns_minimal and NOTFOUND to hosts in /etc/nsswitch.conf
hosts: ... mdns_minimal [NOTFOUND=return] resolve  dns ...

# 3. start cups and avahi-daemon services
