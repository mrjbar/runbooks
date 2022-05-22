# SSL/TLS

## List ciphers on local machine
```
openssl ciphers -v
```

## View a remote X.509 certificate
```
echo "" | openssl s_client -connect google.com:443  2>/dev/null | openssl x509 -dates -noout -subject
```

## View a local SSL Certificate
```
openssl x509 -in intermediate.crt -text -noout
```

## Find and view all local SSL/TLS Certificates
```
find /opt /etc -name “*crt” -exec openssl x509 -in {} -text -noout \;
```

## View valid dates in certificate
```
openssl x509 -in intermediate.crt -noout -dates
```

## Display expiration dates for ssl certs
```
sudo find /opt /etc -name ‘*crt’ -exec openssl x509 -in {} -text -noout -dates\;
```

## View pkcs12 Keystore
```
keytool -list -v -keystore keystore.pkcs12
```

## Check who has issued the SSL certificate
```
openssl x509 -in intermediate.crt -noout -subject
```

## Check whom the SSL certificate is issued to
```
openssl x509 -in intermediate.crt -noout -subject
```

## Show SSL issuer, subject, and expiration dates
```
 openssl x509 -in intermediate.crt -noout -issuer -subject -dates
```

## Show fingerprint of the SSL certificate

```
openssl x509 -in intermediate.crt -noout -fingerprint
```

## Check if cert is in /etc/ssl/certs
```
openssl s_client -showcerts -connect google.com:443 -CApath /etc/ssl/certs
```

## List CA in the TrustStore or Keystore
```
keytool -list -v -keystore keystore.jks
```

## Remove a certificate from the TrustStore
```
keytool -delete -alias <alias-name> -keystore/trust/key/store/path.jks -storepass <password>
```

## Add a certificate to the TrustStore
```
keytool -import -alias <alias-name> -keystore /trust/key/store/path.jks-file example.crt
```

## Find expiration date on all certificates
```
for item in $(grep crt /etc/apache2/sites-enabled/* | awk '{print $3}'); do echo $item; sudo openssl x509 -in $item -noout -dates; echo -e " "; done
```

## Extract ssl certificate and write to file
```
echo | openssl s_client -connect www.google.com:443 2>&1 | sed -n -e '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > example.crt
```

## Extract ssl certificate
```
echo | openssl s_client -connect www.google.com:443 2>&1 | sed -n -e '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
```

## Extract entire ssl certificate chain
```
echo | openssl s_client -showcerts -connect www.google.com:443 2>&1 | sed -n -e '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
```

## Read a crl
```
openssl crl -in crl.pem -text -noout
```

## Extract certificate and add to pkcs12
```
 echo | openssl s_client -showcerts -connect google.com:443 2>&1 | sed -n -e '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sudo openssl pkcs12 -export -nokeys -out truststore.pkcs12 -passout pass:changeit
```

## View pkcs12 expiration date
```
openssl pkcs12 -info -in truststore.pkcs12 | openssl x509 -noout -dates
```

## Convert p23 into pem for pubnub
```
openssl pkcs12 -in my_cert.p12 -out my_cert.pem -nodes -clcerts
```

## Validate public key from private key
```
PKEY="##" && openssl pkey -in $PKEY -pubout -outform pem | shasum -a 256
```

## Extract a pem from pkcs12
```
openssl pkcs12 -in my_cert.p12 -out my_cert.pem -nodes -clcerts
```

## Create a PEM from pkcs12
```
openssl pkcs12 -in my_cert.p12 -out my_cert.pem -nodes -clcerts
```

## Create a pkcs7
```
openssl crl2pkcs7 -certfile local.pem -nocrl -outform PEM -out chain.pem
```

## Create a pkcs7
```
openssl pkcs7 -in chain.pem -print_certs
```

## Test apns certifcate
```
 openssl s_client -connect gateway.push.apple.com:2195 -cert client_cert.pem -key client_key.pem
```
