#!/bin/sh

# crea el fichero
mkdir -p -m 0700 ~/.getmail

# genera el rcfile
echo 'generando fichero de configuración'
echo """
[retriever]
type = $GETMAIL_TYPE
server = $GETMAIL_HOST
port = $GETMAIL_PORT
username = $GETMAIL_USERNAME
password = $GETMAIL_PASSWORD

[destination]
type = MDA_external
path = /usr/sbin/ssmtp
arguments = (\"-v %(recipient)\",)

[options]
verbose = 3
delete = false

""" > ~/.getmail/getmailrc


# genera la configuración de ssmtp
echo 'generando configuración de ssmtp'
echo """
mailhub=$SSMTP_HOST
root=postmaster
rewriteDomain=
hostname=
UseTLS=No
UseSTARTTLS=No
""" > /etc/ssmtp/ssmtp.conf


# fuego
echo "intervalor de chequeo $GETMAIL_CHECK_INTERVAL segundos"
while true
do
   date '+%d/%m/%Y %H:%M:%S'
	getmail
   sleep $GETMAIL_CHECK_INTERVAL
done