#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
# Modify default IP
# sed -i 's/192.168.1.1/192.168.177.97/g' package/base-files/files/bin/config_generate

# Change ash to bash
sed -i 's/ash/bash/g' package/base-files/files/etc/passwd

# Change language=auto to zh_cn
sed -i 's/lang="auto"/lang="zh_cn"/g' package/emortal/default-settings/files/99-default-settings

# Change luci list name
sed -i 's/"Argon 主题设置"/"主题设置"/g' feeds/ace8/luci-app-argon-config/po/zh_Hans/argon-config.po

# change some tips
sed -i 's/nas/services/g' feeds/luci/applications/luci-app-samba4/root/usr/share/luci/menu.d/luci-app-samba4.json

# ttyd terminal patch
sed -i '/interface}/d' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config
sed -i 's/"终端"/"TTYD 终端"/g' feeds/luci/applications/luci-app-ttyd/po/zh_Hans/ttyd.po

# dnscrypt-proxy2 patch
#sed -i 's/START=18/START=99/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/timeout:-5/timeout:-120/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/ipv6_servers = false/ipv6_servers = true/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/odoh_servers = false/odoh_servers = true/g' /feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/http3 = false/http3 = true/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/cache_size = 4096/cache_size = 8000/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/127.0.0.1:9050/127.0.0.1:1070/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/# proxy/proxy/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/# blocked_names_file/blocked_names_file/g' feeds/packages/net/dnscrypt-proxy2/files/dnscrypt-proxy.init
#sed -i 's/127.0.0.53:53/127.0.0.1:5335/g' /etc/dnscrypt-proxy2/dnscrypt-proxy.toml
#sed -i 's/127.0.0.1:8888/127.0.0.1:1101/g' /etc/dnscrypt-proxy2/dnscrypt-proxy.toml
#sed -i 's/# http_proxy/http_proxy/g' /etc/dnscrypt-proxy2/dnscrypt-proxy.toml
#wget --no-check-certificate https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md -O feeds/packages/net/dnscrypt-proxy2/files/public-resolvers.md
#wget --no-check-certificate https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md.minisig -O feeds/packages/net/dnscrypt-proxy2/files/public-resolvers.md.minisig
#wget --no-check-certificate https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md -O feeds/packages/net/dnscrypt-proxy2/files/relays.md
#wget --no-check-certificate https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md.minisig -O feeds/packages/net/dnscrypt-proxy2/files/relays.md.minisig

# DHCP
#mkdir -p package/base-files/files/etc/dnsmasq.d
#wget --no-check-certificate -O package/base-files/files/etc/dnsmasq.d/accelerated-domains.china.conf "https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"

# Boost UDP
echo '# optimize udp' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.rmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_max=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.wmem_default=26214400' >>package/base-files/files/etc/sysctl.d/10-default.conf
echo 'net.core.netdev_max_backlog=2048' >>package/base-files/files/etc/sysctl.d/10-default.conf

# argon icon flush new desgin
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/favicon.ico "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/favicon.ico"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/img/argon.svg"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/img/bg1.jpg"
rm -rf feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/*.png
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/android-icon-192x192.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/apple-icon-60x60.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/apple-icon-72x72.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/apple-icon-144x144.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/favicon-16x16.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/favicon-32x32.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/favicon-96x96.png"
wget --no-check-certificate -O feeds/ace8/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png "https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/argon/icon/ms-icon-144x144.png"

#rm -rf include/target.mk
#wget --no-check-certificate -O include/target.mk "https://raw.githubusercontent.com/immortalwrt/immortalwrt/master/include/target.mk"

# Change to my banner
#sudo rm package/base-files/files/etc/banner
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/banner -O package/base-files/files/etc/banner

# upgrade config
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/99-init-settings -O package/base-files/files/etc/uci-defaults/99-init-settings
#wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/zzz-updata-settings -O package/base-files/files/etc/uci-defaults/zzz-updata-settings
wget --no-check-certificate https://raw.githubusercontent.com/0xACE8/0n3cl0ud/main/30-sysinfo.sh -O feeds/packages/utils/bash/files/etc/profile.d/30-sysinfo.sh

echo "diy-part2.sh is done."
