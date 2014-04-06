#FIREWALL_URL ?= https://github.com/bmaeser/iptables-boilerplate.git

.PHONY: install firewall

install: firewall
	mkdir -p /var/lib/vpc
	cp vpc /usr/local/bin
	chmod a+x /usr/local/bin/vpc

firewall:
	mkdir -p /etc/firewall
	mkdir -p /etc/firewall/custom
	#rm -rf /tmp/iptables-boilerplate
	#cd /tmp && git clone ${FIREWALL_URL}
	#cp /tmp/iptables-boilerplate/firewall /etc/init.d/firewall
	cp -f ./firewall /etc/init.d/firewall
	cp -f etc/firewall/*.conf /etc/firewall
	chmod 755 /etc/init.d/firewall
	update-rc.d firewall defaults