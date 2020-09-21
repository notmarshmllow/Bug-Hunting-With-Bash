#The following one liner is from @KingofBugbounty on Twitter. 

#All credits go to @KingofBugbounty

#Follow @KingofBugbounty on Twitter here : https://twitter.com/KingOfBugbounty?s=09

assetfinder $1 | httpx -threads 300 -follow-redirects -silent | rush -j200 'curl -m5 -s -I -H "Origin:http://evil.com" {} |  [[ $(grep -c "http://evil.com") -gt 0 ]] && printf "\n\033[0;32m[VUL TO CORS] - {}\e[m"' 2>/dev/null
