#!/binstall

# azz
red() {
	echo -e "\033[31m\033[01m$1\033[0m"
}

green() {
	echo -e "\033[32m\033[01m$1\033[0m"
}

yellow() {
	echo -e "\033[33m\033[01m$1\033[0m"
}

# azz
REGEX=("debian" "ubuntu" "centos|red hat|kernel|oracle linux|alma|rocky" "'amazon linux'")
RELEASE=("Debian" "Ubuntu" "CentOS" "CentOS" "Alpine")
PACKAGE_UPDATE=("apt -y update" "apt -y update" "yum -y update" "yum -y update")
PACKAGE_INSTALL=("apt -y install" "apt -y install" "yum -y install" "yum -y install" "apk add -f")
PACKAGE_REMOVE=("apt -y remove" "apt -y remove" "yum -y remove" "yum -y remove")

CMD=("$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)" "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)" "$(lsb_release -sd 2>/dev/null)" "$(grep -i description /etc/lsb-release 2>/dev/null | cut -d \" -f2)" "$(grep . /etc/redhat-release 2>/dev/null)" "$(grep . /etc/issue 2>/dev/null | cut -d \\ -f1 | sed '/^[ ]*$/d')")

for i in "${CMD[@]}"; do
	SYS="$i" && [[ -n $SYS ]] && break
done

for ((int = 0; int < ${#REGEX[@]}; int++)); do
	[[ $(echo "$SYS" | tr '[:upper:]' '[:lower:]') =~ ${REGEX[int]} ]] && SYSTEM="${RELEASE[int]}" && [[ -n $SYSTEM ]] && break
done

[[ -z $SYSTEM ]] && red "ẻ e" && exit 1

archAffix() {
	case "$(uname -m)" in
  x86_64 | x64 | amd64) return 0 ;;
	aarch64 | arm64) return 0 ;;
	*) red "ẻ e k việt sub！" ;;
	esac

	return 0
}

install() {
	install_XrayR
	clear
	makeConfig
}

install_XrayR() {
	[[ -z $(type -P curl) ]] && ${PACKAGE_UPDATE[int]} && ${PACKAGE_INSTALL[int]} curl
	[[ -z $(type -P socat) ]] && ${PACKAGE_UPDATE[int]} && ${PACKAGE_INSTALL[int]} socat
	bash <(curl -Ls https://raw.githubusercontent.com/longyi8/XrayR/master/install.sh)
}

makeConfig() {
  echo "----PhamDung----"
	echo "---------------"
	read -p "Node ID 80: " NodeID80
	echo -e "Node 80 là: ${NodeID80}"
	echo "---------------"
  read -p "Nhập Device Limit: " device
  echo -e "Nhập Số Thiết Bị: ${device}"
  echo "---------------"
	read -p "Nhập CertDomain port 80: " CertDomain80
  echo -e "CertDomain là: ${CertDomain80}"
	echo "---------------"
  read -p "Nhập Node ID 443:" NodeID443
  echo -e "Node 443 Là ${NodeID443}"
  echo "---------------"
  read -p "Nhập CertDomain port 443:" CertDomain80
  echo -e "CertDomain là: ${CertDomain443}"

	rm -f /etc/XrayR/config.yml
	if [[ -z $(~/.acme.sh/acme.sh -v 2>/dev/null) ]]; then
		curl https://get.acme.sh | sh -s email=script@github.com
		source ~/.bashrc
		bash ~/.acme.sh/acme.sh --upgrade --auto-upgrade
	fi
 cat >/etc/XrayR/key.pem<<EOF
 -----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCnHAwO5DDbbYo1
c+6y1WxZw+sNQ+QQE5A+9ILKfvcbZYScXycapRqkbpq/1VmZXYnpyNCWkmO1BZsH
AYq9WV7kavDJVC6ur49FoPKYffnkrwj568b4Nm32Hqjf1aN6HPNfzqcvG31FGj7m
M+lD6St9Es+m1ViYi/nIckhwrUcEiehdPq7mEnEJF4JaxaJ0fQhqDjUiN9MXblaK
5fQBuxEdqRYXEsSq+tBNeq0OZxaXu8qN5p/UmnmXpXk2rmERcnrzz28G9PI5gZn4
yL6WMH2rCnVAvIoXQHKizZ7mrB8v/X2uZAR+G3g0TarFmBo7glVkEZhX/PN0puAq
d7ZtgS8FAgMBAAECggEABlxQby6rV2bLeG5huwfZmG8XHsmjQCNmfabz5X5ArJfI
HOWYSPDY20JkfIHD580CJ1Zf7iNDTUwZ0wHxhHSG4p3ZbWhZYIfJJcbTBQ/id5xb
9JtPVvpHZDNVjTOGBetdLhvhDC95LKyrkTqPmeihoaCaK8j6FtBZIRKMhFFsHxWK
9FD3Jblk0o0xVnzTHCt0Kzlne4Wq53O2dbBARnR5hIWXZeK44M2BF45ad5kdMAq+
iRtDC3iw2LaTnHy+gQ92lMo7WzMIRZg+51tb8Z7XLEx4B1gJvcmU+cc40QaZy1P2
F/vP5o8C6G4MPQByB6A0ISXDLogh3W95vVPEqOx2cQKBgQDVdWQKlcX9yHhbsKZp
kzSTYbgmJ6Cn2BNrisV7hi8bqWSN++RUBql610K8HMWljax2T0qNQIGFSvgYIIyl
KEHWIaun4j1CWCgsV5sDA9LVmEtXPRwOb/+63YHeI/UV4ljFsmeEa3MA4PCSXyNv
UnPbhhNa0ABfZP5zbQKqsCzOvQKBgQDIafDC7ZGDN2JBBVbwHnECyrOu7b8zV7d+
19MYMs+KanSr36VoU51WyiwIwg4k7SBbZHKy6Ecab1JD/EjwHbzeD2AOOAXJx74N
j7SNV0aJHgVUu6DIOuXrGRHPnazyOEVjK3Xd/R2d60EcztvNpFMbQu/JovHqdxHa
05KAMzvp6QKBgQCdzhVRhfxDbCseje/Y6QzbUEjVXEJ3E1T4EjWA5mh5KLfAB9J7
FBnDSNR7QUIU7DHtnRzeZCvcoNnc7GNNzf8uEOJYUPc8zvOUJIfiqLb7VYWNTw4o
1j/Wo99YnHiZ3yYFsai5yr3QjnsLmu4VZH1mcy5n2pIL9BvwtUxdZ7UYeQKBgQC7
YKGj/q5f+nY4yJ9CHZQXwiFBWjO78zUyuOM66ra0eVfgIlfqNNMUhC2repPy3mm0
STQcJaPlCVPnEIe5SHR/QezTHnn68G+3CjcLNyBRrunZERwAWWEB8AyBCrDaPtZR
JB8tkCwSrBPStW041XyGLo02/swkJXNiHxIIHt7TkQKBgBb8lEbQU2zftOmd4HUR
Wvj5suqb2PhGYJy2gLGmUrxJ9+yx973gWI+MjlgxRn9zRa5+5Gb2mPNU74Um1he3
/mM/8lEN1vZMUMLjwsJ3IXAP1HCDpdMKgcMpOqsizL02f7UXzVfotxVdStQWvCz1
0Zc42JvGZ6axOf+lvtpB2fTN
-----END PRIVATE KEY-----

EOF
   cat >/etc/XrayR/crt.pem<<EOF
-----BEGIN CERTIFICATE-----
MIIEFTCCAv2gAwIBAgIUKFbiqs2EStdfhBIFv4J/arJjOmwwDQYJKoZIhvcNAQEL
BQAwgagxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBDbG91ZGZsYXJlLCBJbmMuMRswGQYD
VQQLExJ3d3cuY2xvdWRmbGFyZS5jb20xNDAyBgNVBAMTK01hbmFnZWQgQ0EgMGVh
Yjk2NDhkMDFhN2U3YTk2ZDI0YzI2ZmUzZjc1MzUwHhcNMjMwODIxMDQwMjAwWhcN
MzMwODE4MDQwMjAwWjAiMQswCQYDVQQGEwJVUzETMBEGA1UEAxMKQ2xvdWRmbGFy
ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKccDA7kMNttijVz7rLV
bFnD6w1D5BATkD70gsp+9xtlhJxfJxqlGqRumr/VWZldienI0JaSY7UFmwcBir1Z
XuRq8MlULq6vj0Wg8ph9+eSvCPnrxvg2bfYeqN/Vo3oc81/Opy8bfUUaPuYz6UPp
K30Sz6bVWJiL+chySHCtRwSJ6F0+ruYScQkXglrFonR9CGoONSI30xduVorl9AG7
ER2pFhcSxKr60E16rQ5nFpe7yo3mn9SaeZeleTauYRFyevPPbwb08jmBmfjIvpYw
fasKdUC8ihdAcqLNnuasHy/9fa5kBH4beDRNqsWYGjuCVWQRmFf883Sm4Cp3tm2B
LwUCAwEAAaOBuzCBuDATBgNVHSUEDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAA
MB0GA1UdDgQWBBTAvYfLTQobg7CYhMlb8/2LHTkSKjAfBgNVHSMEGDAWgBRxnXMz
CA3Bo0Cm0vuwy5mkkYa0czBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vY3JsLmNs
b3VkZmxhcmUuY29tLzllMmIxZDI1LTIyMmMtNDcxNi1iODRjLTE4Mzc5NTVkZmIy
OS5jcmwwDQYJKoZIhvcNAQELBQADggEBAGp7VqUs98JASMQ/6ADi3btK1funJG1m
oGx5IdaolyxujhjzbF6EHSY6pPEudMQX52P1oAX8QI4DyAZ1hTRN57FjeCgp50VY
Pbx2sZR0VgD0IJThFaHF3IkTFmmZWCQbZUe01sqsS2viKARUiCz+oZpUkkEXNaNP
b2C9fZmXiKCKp78OV66JNHRpSRho/AkfdBhYE3jyYmFJ04QXYHGGGcHXcsqQKS1h
yfMA06/8Vgfk+qiy8Dk9l9a+n9RFQwCnH/rSTrOomx4SAoenh+bfnauAhuM6OnsA
QvWErTQcC/QN9fB3IrP/IBTwCMd35By044bisNsNQZ+uOfq8rEDknBc=
-----END CERTIFICATE-----

EOF
         cat <<EOF >/etc/XrayR/config.yml
Log:
  Level: none 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json
InboundConfigPath: # /etc/XrayR/custom_inbound.json
RouteConfigPath: # /etc/XrayR/route.json
OutboundConfigPath: # /etc/XrayR/custom_outbound.json
ConnetionConfig:
  Handshake: 4 
  ConnIdle: 30 
  UplinkOnly: 2 
  DownlinkOnly: 4 
  BufferSize: 64 
Nodes:
  -
    PanelType: "V2board" 
    ApiConfig:
      ApiHost: "vpnone.shop"
      ApiKey: "vpnoneshoprenhatvn"
      NodeID: $NodeID80
      NodeType: V2ray 
      Timeout: 30 
      EnableVless: false 
      EnableXTLS: false 
      SpeedLimit: 0 
      DeviceLimit: $device 
      RuleListPath: # /etc/XrayR/rulelist
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: false 
      DNSType: AsIs 
      EnableProxyProtocol: false 
      EnableFallback: false 
      FallBackConfigs:  
        -
          SNI: 
          Path: 
          Dest: 80 
          ProxyProtocolVer: 0 
      CertConfig:
        CertMode: file
        CertDomain: "$CertDomain80" 
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
      ApiKey: "vpnoneshoprenhatvn"
      NodeID: $NodeID443
      NodeType: V2ray 
      Timeout: 30 
      EnableVless: false 
      EnableXTLS: false 
      SpeedLimit: 0 
      DeviceLimit: $device 
      RuleListPath: # /etc/XrayR/rulelist
    ControllerConfig:
      DisableSniffing: True
      ListenIP: 0.0.0.0 
      SendIP: 0.0.0.0 
      UpdatePeriodic: 60 
      EnableDNS: false 
      DNSType: AsIs 
      EnableProxyProtocol: false 
      EnableFallback: false 
      FallBackConfigs:  
        -
          SNI: 
          Path: 
          Dest: 80 
          ProxyProtocolVer: 0 
      CertConfig:
        CertMode: file 
        CertDomain: "$CertDomain443"
        CertFile: /etc/XrayR/crt.pem
        KeyFile: /etc/XrayR/key.pem
        Provider: cloudflare 
        Email: test@me.com
        DNSEnv: 
          CLOUDFLARE_EMAIL: 
          CLOUDFLARE_API_KEY: 
EOF
	cd /etc/XrayR
	XrayR restart
	green "Đã xong, reboot nếu k thành công！"
	exit 1
}

install
