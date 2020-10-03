#cors.sh can be used to find Cross Origin Resource Sharing Vulnerability of all Subdomaims enumerated.

#Replace "/path/to/sublist3r.py" with your path to Sublist3r tool.

echo "Initialising Subdomain Enumeration.";python3 /path/to/sublist3r.py -d $1 -o subs_sublist3r.txt;subfinder -d $1 -o subs_subfinder.txt;assetfinder $1 > subs_assetfinder.txt;cat *.txt | sort -u > subs_final.txt;echo "Finding Live Subdomains";cat subs_final.txt | httprobe > subs_live.txt;echo "Initialising gau";cat sub_live.txt | gau > gau.txt;cat sub_live.txt | waybackurls > waybackurls.txt;cat gau.txt waybackurls.txt | sort -u > gau_waybackurls.txt;echo "\n CORS TEST INITIALISATION";cat gau_waybackurls.txt | while read url;do target=$(curl -s -I -H "Origin: https://bing.com" -X GET $url) | if grep 'https://bing.com'; then "[Potentional CORS Found]" $url;else echo "Nothing on" $url;fi;done

