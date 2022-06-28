sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openvpn
EasyRSA_PATH="~/EasyRSA-3.0.8"
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.8/EasyRSA-3.0.8.tgz
tar xvf EasyRSA-3.0.8.tgz
sudo cp ./assets/vars ${EasyRSA_PATH}/vars
${EasyRSA_PATH}/easyrsa init-pki
