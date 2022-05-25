#!/bin/bash
# First argument: Client identifier
KEY_DIR=/home/Menkakusitsu/client-configs/keys
OUTPUT_DIR=/home/Menkakusitsu/client-configs/files
BASE_CONFIG=/home/Menkakusitsu/client-configs/base.conf
EASYRSA_PATH=/home/Menkakusitsu/EasyRSA-3.0.8
CCD_FILES_PATH=/etc/openvpn/ccd
IP=`cat ${CCD_FILES_PATH}/${1}`
cd ${EASYRSA_PATH}
cat ${BASE_CONFIG} ${KEY_DIR}/1.txt ${KEY_DIR}/ca.crt ${KEY_DIR}/2.txt ${KEY_DIR}/${1}.crt ${KEY_DIR}/3.txt ${KEY_DIR}/${1}.key ${KEY_DIR}/4.txt ${KEY_DIR}/ta.key ${KEY_DIR}/5.txt
echo "Assigned network settings for ${1} is ${IP}"
