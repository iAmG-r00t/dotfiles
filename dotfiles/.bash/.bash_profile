# Tools aliases
# Recon Oneliners

# Colours have names too. Stolen from @tomnomnom who stole it from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;93m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;96m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Export Personal Binaries
export PATH=${PATH}:~/bin:~/.local/bin:~/Scripts

# Scan for open ports using naabu go tool
Naabu(){

if [ $# -eq 1 ]; then

sudo ./Gotools/bin/naabu -silent -host $1

elif [ $# -eq 2 ]; then

sudo ./Gotools/bin/naabu -silent -host $1 -o $2 ; alert
echo "${txtgrn}Saved output file as: ${undpur}${2}${txtrst}"

else

echo "${txtred}Kindly provide one argument as host or two arguments one as host and the other as name of output file.${txtrst}"

fi

}

# Find domains and subdomains from certificates using certspotter
certspotter(){ 
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | uniq
}

# Find ip's of domain using dig
domainsip(){
dig a $1 +short ; alert
}

# Find sub-domains from crtsh
crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

# Discover domains ips from crtsh and scan with nmap
certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | uniq | dig +short -f - | uniq | sudo nmap -A -sS -sV -i - --open -n ; alert
}

# Runs httprobe on all the hosts from certspotter
certprobe(){ 
if [ -d "$HOME/Drugery/engagements/$1" ]; then

curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a $HOME/Drugery/engagements/$1/httprobes.txt

else

mkdir -p $HOME/Drugery/engagements/$1
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a $HOME/Drugery/engagements/$1/httprobes.txt

fi
}

# Start sublister in its virtual env
sublist3r(){
inenv=$(python -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')
if [ inenv==0 ]; then

source ~/Gitools/Sublist3r/sublist3r/bin/activate
python ~/Gitools/Sublist3r/sublist3r.py -d $1

else

python ~/Gitools/Sublist3r/sublist3r.py -d $1

fi
}

alias out='deactivate'
