#js_endpoints.sh can be used to find juicy endpoints from JS files.

#Replace "/path/to/sublist3r.py" with your path to Sublist3r tool.

#Replace "/path/to/linkfinder.py" with your path to LinkFinder tool.

echo "Analysing Javascript Files of your target for Endpoints"

sleep 2

python3 /path/to/sublist3r.py -d $1 -o subs_sublist3r.txt;subfinder -d $1 -o subs_subfinder.txt;assetfinder $1 > subs_assetfinder.txt;cat *.txt | sort -u > subs_final.txt;cat subs_final.txt | httprobe > subs_live.txt;cat subs_live.txt | while read url;do python3 /path/to/linkfinder.py -d -i $url -o cli;done > js_endpoints.txt;ls
