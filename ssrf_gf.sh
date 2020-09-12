#ssrf_gf.sh can be used to find ssrf parameters easily.

#Replace "/path/to/sublist3r.py" with your path to Sublist3r tool.


echo "Initialising Subdomain Enumeration."
sleep 2


python3 /path/to/sublist3r.py -d $1 -o subs_sublist3r.txt;subfinder -d $1 -o subs_subfinder.txt;assetfinder $1 > subs_assetfinder.txt;cat *.txt | sort -u > subs_final.txt;echo "Finding Live Subdomains";cat subs_final.txt | httprobe > subs_live.txt;echo "Initialising gau";cat subs_live.txt | gau > gau_url.txt;echo "Initialising gf";cat gau_url.txt | gf ssrf > ssrf_gf.txt;ls 
