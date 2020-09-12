#subdomain_takeover.sh can be used to find obsecure CNAMES .

chaos -d $1 -silent | nuclei -t nuclei-templates/dns/dead-host-with-cname.yaml
