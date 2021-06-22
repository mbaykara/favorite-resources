1. Check signing request
openssl req -text -noout -verify -in CSR.csr
These commands allow you to generate CSRs, Certificates, Private Keys and do other miscellaneous tasks.

2. Generate a new private key and Certificate Signing Request
openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key
3. Generate a self-signed certificate (see How to Create and Install an Apache Self Signed Certificate for more info)
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt
4. Generate a certificate signing request (CSR) for an existing private key
openssl req -out CSR.csr -key privateKey.key -new
5. Generate a certificate signing request based on an existing certificate
openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key
6. Remove a passphrase from a private key
openssl rsa -in privateKey.pem -out newPrivateKey.pem
7. Checking Using OpenSSL
If you need to check the information within a Certificate, CSR or Private Key, use these commands. You can also check CSRs and check certificates using our online tools.

Check a Certificate Signing Request (CSR)
openssl req -text -noout -verify -in CSR.csr
Check a private key
openssl rsa -in privateKey.key -check
Check a certificate
openssl x509 -in certificate.crt -text -noout
Check a PKCS#12 file (.pfx or .p12)
openssl pkcs12 -info -in keyStore.p12
