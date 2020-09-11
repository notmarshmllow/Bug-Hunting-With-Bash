#recon_web_app_testing_basic.sh can be used when you are finding Vulnerabilities manually by visiting every subdomain. 


#Tools used : Sublist3r , Assetfinder , Subfinder , httpx
#Credit for tools goes to their respective owners.


#Task 1 : Find all Subdomains using Sublist3r , Assetfinder , Subfinder - Sort them uniquely
#Task 2 : Find Live Subdomains using httpx - sort 2xx , 3xx and 4xx seperately in different files for better manual analysis.

#Use the 404.txt file to easily find SUBDOMAIN TAKEOVER.

#Now you can manually go through 200.txt file and , cool Vulnerabilities and Report them.

#NOTE : PLEASE SET YOUR PATH FOR SUBLIST3R IN THE COMMAND below in olace of "/path/to/sublist3r.py"

#How to use ?
#Clone the Repository and run the following command : ./recon_web_app_testing_basic.sh example.com


echo "
_ __ ___  ___ ___  _ __

| '__/ _ \/ __/ _ \| '_ \

| | |  __/ (_| (_) | | | |

|_|  \___|\___\___/|_| |_|"
echo "Basic Recon just for enumerating subdomains and finding status codes."
sleep 2
echo "Enumerating Subdomains and Seperating them according to their Status Codes."

echo "Running Sublist3r"

python3 /path/to/sublist3r.py -d $1 -o subs_sublist3r.txt;echo "Running Subfinder";subfinder -d $1 -o subs_subfinder.txt;echo "Runninga Assetfinder";assetfinder $1 > subs_assetfinder.txt;echo "[*] Sorting Uniquely";cat *.txt | sort -u > subs_final.txt;echo "[*] Finding Status Codes";cat subs_final.txt | httpx -status-code -o httpx_status_code.txt;cat httpx_status_code.txt | grep -iE "[200]" > 200.txt;cat httpx_status_code.txt | grep -iE "[400]" > 400.txt;cat httpx_status_code.txt | grep -iE "[401]" > 401.txt;cat httpx_status_code.txt | grep -iE "[301]" > 301.txt;cat httpx_status_code.txt | grep -iE "[302]" > 302.txt
