#Open Redirect Scanner from a list of URLS.

#Credit @ofjaaah on Twitter

#Follow @ofjaaah on Twitter here : https://twitter.com/ofjaaah?s=09

#usage ./open-redirect.sh filename.txt

cat $1 | httpx -silent -threads 200 | gau -subs -retries 2 | anew | rush -j 3 'jaeles scan -s /jaeles-signatures/ -u {}'
