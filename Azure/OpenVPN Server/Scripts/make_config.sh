#!/bin/bash
# First argument: Client identifier
KEY_DIR=/home/Menkakusitsu/client-configs/keys
OUTPUT_DIR=/home/Menkakusitsu/client-configs/files
BASE_CONFIG=/home/Menkakusitsu/client-configs/base.conf
EASYRSA_PATH=/home/Menkakusitsu/EasyRSA-3.0.8
CCD_FILES_PATH=/etc/openvpn/ccd
IP_LAST=`cat /home/Menkakusitsu/client-configs/client-ip-conf/ip_last`
IP_THIS=`expr ${IP_LAST} + 4`
GATE_THIS=`expr ${IP_THIS} - 1`
cd ${EASYRSA_PATH}
sudo bash ${EASYRSA_PATH}/easyrsa gen-req ${1} nopass
sudo cp ${EASYRSA_PATH}/pki/private/${1}.key ${KEY_DIR}
sudo bash ${EASYRSA_PATH}/easyrsa sign-req client ${1}
sudo cp ${EASYRSA_PATH}/pki/issued/${1}.crt ${KEY_DIR}
#cat ${BASE_CONFIG} ${KEY_DIR}/1.txt ${KEY_DIR}/ca.crt ${KEY_DIR}/2.txt ${KEY_DIR}/${1}.crt ${KEY_DIR}/3.txt ${KEY_DIR}/${1}.key ${KEY_DIR}/4.txt ${KEY_DIR}/ta.key ${KEY_DIR}/5.txt
echo "ifconfig-push 10.8.0.${IP_THIS} 10.8.0.${GATE_THIS}" > ${CCD_FILES_PATH}/${1}
echo "${IP_THIS}" > /home/Menkakusitsu/client-configs/client-ip-conf/ip_last
echo "Assigned ip for ${1} is 10.8.0.${IP_THIS}"
echo "OpenVPN needs restart after assigning static ip"
