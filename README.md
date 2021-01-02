# Lets Encrypt OVH docker container

## DEPRECATED
We recommend to use the official certbot that now supports OVH. see [ovh-plugin](https://certbot-dns-ovh.readthedocs.io/en/stable/)


A Container to automate Lets encrypt certificate creation, renewal and revoke using ACME challenge on OVH API


## tldr:
[create your application token](https://eu.api.ovh.com/createApp/)
request your consumer key:
```
curl -XPOST -H"X-Ovh-Application: <ApplicationKey>" -H "Content-type: application/json" https://eu.api.ovh.com/1.0/auth/credential  -d '{"accessRules": [{"method": "GET", "path": "/domain/*"},{"method": "POST", "path": "/domain/*"},{"method": "PUT", "path": "/domain/*"},{"method": "DELETE", "path": "/domain/*"}], "redirection":"<yourDomain>"}'
```
you get your ConumerKey and the validation Url in response.
```
docker run lerignoux/lets-encrypt-ovh-container
```


## Description:
This Container enables you to automate your let's encrypt certificate using Let's encrypt ACME challenge and the OVH API.

## Create your API credentials:
got to [OVH application token creation page](https://eu.api.ovh.com/createApp/) to create your key and secret
request your Consumer key:
```
curl -XPOST -H"X-Ovh-Application: <ApplicationKey>" -H "Content-type: application/json" https://eu.api.ovh.com/1.0/auth/credential  -d '{"accessRules": [{"method": "GET", "path": "/domain/*"},{"method": "POST", "path": "/domain/*"},{"method": "PUT", "path": "/domain/*"},{"method": "DELETE", "path": "/domain/*"}], "redirection":"<yourDomain>"}'
```
you get in the response:
- Your Consumer Key <ConsumerKey>
- the validation URL

Validate the request using the validation URL


## Create your configuration:
Fill your OVH configuration <ConfigFile> using the template `ovh.conf.tpl` provided:


## Run your container:
```
docker run --env DOMAIN=<Domain> -v <CertificateFolder>:/dehydrated/certs :-v <ConfigFile>:/root/.ovh.conf lerignoux/lets-encrypt-ovh-container
```

This will create your certificates in `<CertificateFolder>`
