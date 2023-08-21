yum install nano -y
systemctl stop firewalld
systemctl disable firewalld

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 80
sudo ufw allow 443

clear
read -p " NODE ID  vmess 80: " node_id1
  [ -z "${node_id1}" ] && node_id1=0
  


read -p " NODE ID  vmess 443: " node_id2
  [ -z "${node_id2}" ] && node_id2=0



bash <(curl -ls https://raw.githubusercontent.com/AZZ-vopp/XrayR-bk/master/install.sh)

cd /etc/XrayR
EOF
  cat >key.pem <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDgkXl5xfRgBarb
7Rft4OS2rxgYy3b9cchIUl9HRKX+V+S67HtJf4L6HNq6kCkLA2/7YPYhRZt2jc9T
rsMV+LcR+i6iCrGS89Qt/Vuv8AgYxbByF2b4ZGFS4BUakCPeSubOaNEfTuBbJngO
f2PFmFCz+3rhBXF+buOsviDp2TUjIufC6KYTD8zXzz+VLjcqhTLNSapWe7jBzgjM
EMxbfGr+7XTFYlA3aEMy7onoBb6FIIvCo9ZWohcpJ2HeiLOlLq105au/+wt5WAbe
V9vjRkVo9qNTzzsyXjkfwxWYYyrBO9iEWVRYXPBC6vle9D2FBAerr+J1+eoCtGol
wAuTUMRlAgMBAAECggEAB+NkSVTTsn5ZnQXsGnmCzOcfMlqgcHVdp3QgIfKsKATN
pWb5Sxwiv5lhuvU309wjjRG/7LVqKTmS/uCW4P/FWVbPoT+rDnIxv3eG61MfXa/4
BsjLOxdtScDk3yqjb+gFgDXqNXevd/jEvrGf2qRejDUUk0MQVHRm22J0VxcbEfF4
KqtrwVmFZ8PRijfRGZyaXxXNhC6SSctANxKJ0YV06s56WBEX6ydxb/FANJVDOtvt
T+aCYvCMO5vQ1nj8UjiGUTcYmVHpk8TKwtJYI6R28k7Ei9v/haU5qw75te1fAXPs
DAgFKGMVL+7xTeDO3luPLka+R7+tCC9OwJTxT2kPcwKBgQDzOQauNG4TiE/98K/Y
uaIEOMn4npGP7DldhV4uu7O6fY7E9J0wmZsK1Md/MA/Vp8XibGg0mkWUHTiD47bF
KutgGZiimwHx5P8assBmMfzN7Z5CIZNwLTZf84mNQxexi8GWkZ6fn1rTSxldRBMw
6O13NMBCwqPWBW0JGhKiUF9e7wKBgQDsXZLvKmcNGlUdp+7dPtrPziOIzAZihkek
q9VlIjxPF80UdVHIVVPo+xCFwLOc7jEr1JCbh6hr3fHaDDACaGhupMDDrMq1Giwc
pIW+LumPIU02QdxacxvuNNnV0lGnG6+s5F5aidjI2y1d1a6E7BNoF4gByp1UKWeu
1llkfPVR6wKBgAZXrVnrmhc+Tb+0gBFpvdTYWkP2dptHMLPEn5EeafBqB8gRDOxQ
hR+CLvWdHjyXFGz0IL+GalwTav7deE2p8dter4FGA4X4T8K1eJjxosMH+EGHOJ4L
P8i+xA5/+mUx3Ml9YKKO+EJcSfwJo2p6GH8sS/sxsi4JlC9Rk7zR1brXAoGAbMDZ
PGXcKHE3PH/qLa4f64FDZEvLnEWAbUoK04+fBB1FZOZeDLkF9Kqf/YqemdQWl74k
Ewul+IuUHemBpXn4ov/3GZFFa3JxXXRtfQYEvLBr4E0JYCyaa02x9OniW+snN3uT
1kCamEAQbZ5FwC8G9tvs3jYlkXXDmPRTCSNdlKUCgYEAxwLJ8AiEzIe0zydK3dCg
6IgErkG2u6DjV3pzVIdeksLa6jVyMsfdLMIZ/AJbgoQnmFJN9WiHpWzyYUv6ca7n
obucTAJwVr4JxqVJCyNLA7twkgCPzapRtdQQPxy/gaYdkhTkwd/mIOBq28JgTKzC
IKEKa9dCgWgqowAPN2gqTZg=
-----END PRIVATE KEY-----
EOF
  cat >crt.pem <<EOF
-----BEGIN CERTIFICATE-----
MIIEnjCCA4agAwIBAgIUFgeVVxMGr2Orx/lwMANt0l6KmmQwDQYJKoZIhvcNAQEL
BQAwgYsxCzAJBgNVBAYTAlVTMRkwFwYDVQQKExBDbG91ZEZsYXJlLCBJbmMuMTQw
MgYDVQQLEytDbG91ZEZsYXJlIE9yaWdpbiBTU0wgQ2VydGlmaWNhdGUgQXV0aG9y
aXR5MRYwFAYDVQQHEw1TYW4gRnJhbmNpc2NvMRMwEQYDVQQIEwpDYWxpZm9ybmlh
MB4XDTIzMDcyODA2MzcwMFoXDTM4MDcyNDA2MzcwMFowYjEZMBcGA1UEChMQQ2xv
dWRGbGFyZSwgSW5jLjEdMBsGA1UECxMUQ2xvdWRGbGFyZSBPcmlnaW4gQ0ExJjAk
BgNVBAMTHUNsb3VkRmxhcmUgT3JpZ2luIENlcnRpZmljYXRlMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4JF5ecX0YAWq2+0X7eDktq8YGMt2/XHISFJf
R0Sl/lfkuux7SX+C+hzaupApCwNv+2D2IUWbdo3PU67DFfi3EfouogqxkvPULf1b
r/AIGMWwchdm+GRhUuAVGpAj3krmzmjRH07gWyZ4Dn9jxZhQs/t64QVxfm7jrL4g
6dk1IyLnwuimEw/M188/lS43KoUyzUmqVnu4wc4IzBDMW3xq/u10xWJQN2hDMu6J
6AW+hSCLwqPWVqIXKSdh3oizpS6tdOWrv/sLeVgG3lfb40ZFaPajU887Ml45H8MV
mGMqwTvYhFlUWFzwQur5XvQ9hQQHq6/idfnqArRqJcALk1DEZQIDAQABo4IBIDCC
ARwwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcD
ATAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBRTsdlpoRK+HKf9oyDrpt9SMqyCLTAf
BgNVHSMEGDAWgBQk6FNXXXw0QIep65TbuuEWePwppDBABggrBgEFBQcBAQQ0MDIw
MAYIKwYBBQUHMAGGJGh0dHA6Ly9vY3NwLmNsb3VkZmxhcmUuY29tL29yaWdpbl9j
YTAhBgNVHREEGjAYggsqLnRuZXR6Lm5ldIIJdG5ldHoubmV0MDgGA1UdHwQxMC8w
LaAroCmGJ2h0dHA6Ly9jcmwuY2xvdWRmbGFyZS5jb20vb3JpZ2luX2NhLmNybDAN
BgkqhkiG9w0BAQsFAAOCAQEAQtaxmxgZiM6/9/xeNVO8UyQZKqqrvvJZ4doszYkb
G3SEPD3kAqnrEC7eKSU2jJUHCgNEvtR8XmkK7ls18jiVLhcoRnMVYtl917SFOuNt
mPtic5nb1ohlC9exBGu3J5VfMzXXh0xjR/UpTb6dkNkRJIo0x2gZafH8HtrPBsO4
MbY5mujwtfB74VpmN2plSMLrWEZ87FZXb9LI4UQ1h4ORLk4Uwz1iLHRXfw2dQ1bU
dZvNhR/nwPPVMok1Up2s50bDRmAJIX7v+FlSvH7t9ecN+T9O6J/zaa924UgOgR5L
hdZ1TdSkjjQY2kBLRP1R0kVBcM5VgxZHcmI6zGiTQyOJEw==
-----END CERTIFICATE-----

EOF

cat >config.yml <<EOF
Log:
  Level: none 
  AccessPath: 
  ErrorPath: 
DnsConfigPath: 
RouteConfigPath: 
InboundConfigPath: 
OutboundConfigPath: 
ConnectionConfig:
  Handshake: 4 
  ConnIdle: 86
  UplinkOnly: 2
  DownlinkOnly: 4
  BufferSize: 64
Nodes:
  -
    PanelType: "V2board"
    ApiConfig:
      ApiHost: "https://vpnone.shop
      ApiKey: ""
      NodeID: $node_id1
      NodeType: V2ray
      Timeout: 30
      EnableVless: false 
      EnableXTLS: false 
      SpeedLimit: 0 
      DeviceLimit: 0
      RuleListPath: 
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: false 
      DNSType: AsIs
      EnableProxyProtocol: false
      AutoSpeedLimitConfig:
        Limit: 0 
        WarnTimes: 0 .
        LimitSpeed: 0 
        LimitDuration: 0 
      GlobalDeviceLimitConfig:
        Enable: false 
        RedisAddr: 127.0.0.1:6379 
        RedisPassword:
        RedisDB: 0 
        Timeout: 5 
        Expiry: 60 
      EnableFallback: false 
      FallBackConfigs: 
        -
          SNI: 
          Alpn: 
          Path:
          Dest: 80 
          ProxyProtocolVer: 0
      CertConfig:
        CertMode: file
        CertDomain: "vip.tnetz.net"
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare
        Email: test@me.com
        DNSEnv: 
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
  -
    PanelType: "V2board"
    ApiConfig:
      ApiHost: "https://vpnone.shop"
      ApiKey: "5gsinhviengiarekhongcantien"
      NodeID: $node_id2
      NodeType: V2ray
      Timeout: 30 
      EnableVless: false 
      EnableXTLS: false
      SpeedLimit: 0 
      DeviceLimit: 0 
      RuleListPath: 
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: false 
      DNSType: AsIs 
      EnableProxyProtocol: false
      AutoSpeedLimitConfig:
        Limit: 0 
        WarnTimes: 0 
        LimitSpeed: 0
        LimitDuration: 0 
      GlobalDeviceLimitConfig:
        Enable: false
        RedisAddr: 127.0.0.1:6379
        RedisPassword: 
        RedisDB: 0
        Timeout: 5
        Expiry: 60 
      EnableFallback: false 
      FallBackConfigs:  
        -
          SNI: 
          Alpn: 
          Path: 
          Dest: 80 
          ProxyProtocolVer: 0 
      CertConfig:
        CertMode: file 
        CertDomain: "vip.tnetz.net" 
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
EOF

xrayr restart
