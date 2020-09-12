#sub_gau.sh can be used to find waybackurls of all Subdomaims enumerated.

#Replace "/path/to/sublist3r.py" with your path to Sublist3r tool.


echo "Initialising Subdomain Enumeration."
sleep 2


python3 /path/to/sublist3r.py -d $1 -o subs_sublist3r.txt;subfinder -d $1 -o subs_subfinder.txt;assetfinder $1 > subs_assetfinder.txt;cat *.txt | sort -u > subs_final.txt;echo "Finding Live Subdomains";cat subs_final.txt | httprobe > subs_live.txt;echo "Initialising gau";cat sub_live.txt | gau > gau.txt;ls
