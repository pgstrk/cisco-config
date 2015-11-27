#!/bin/bash
ORGIFS=$IFS
IFS=$'\n'
sayi=`date "+%H"`
tarih1=`date "+%Y-%m-%d"`
tarih2=`date "+%m-%Y"`
mkdir /tftpboot/swconfig/$tarih2
#List of SW IP's is at the path: /tftpboot/swconfig/canli_cihaz_ip
for i in \ `cat /tftpboot/swconfig/canli_cihaz_ip`;
do
/tftpboot/swconfig/ssh-ile-config-topla $i > /tftpboot/swconfig/$tarih2/$tarih1-$i-ssh.conf ;
sed '1,/Building/ d' /tftpboot/swconfig/$tarih2/$tarih1-$i-ssh.conf >> /tftpboot/swconfig/$tarih2/conf-$i-ssh.conf;
rm /tftpboot/swconfig/$tarih2/$tarih1-$i-ssh.conf
done

