./dehydrated --register --accept-terms
./dehydrated -c -d $DOMAIN -t dns-01 -k 'hooks/ovh/hook.py'
