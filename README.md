# README

This is a DomainPOP or MultiPOP email retriever for [mailu.io](http://mailu.io). It use getmail to retrieve emails and ssmtp to send it via smtp. All because Fetchmail sucks.

## Configuration

You should look now at docker-compose.yml file. All is environment variables as usual in docker.

   - **GETMAIL_TYPE** getmail retriever (more information then)
   - **GETMAIL_HOST** you isp pop server
   - **GETMAIL_USERNAME** your isp por server's user name
   - **GETMAIL_PASSWORD** guest what...
   - **GETMAIL_PORT** use this yo specify port number, 110 plain & 995 ssl
   - **GETMAIL_CHECK_INTERVAL** interval in seconds to check email
   - **SSMTP_HOST** smtp host, **ssmtp** will send all mail to this host

Configs are indeed pretty obviously except ***GETMAIL_TYPE**. Value for this can be:

   - **MultidropPOP3Retriever** for domain mailbox (multidrop) POP3 mail accounts.
   - **MultidropPOP3SSLRetriever** same as MultidropPOP3Retriever, but uses SSL encryption.

[More information here](http://pyropus.ca/software/getmail/configuration.html#retriever-multidroppop3). You will see some IMAP retriever, I did not test it but should work to.