#!/bin/bash
# List workspaces
# By th3gr00t

#get real path of symlink gilr
real_path=$( dirname "$(realpath "$0")" )

# present menu for user to list workspaces to open
PS3=$'\n'$'\e[95m'"Please choose your workspace: "$'\033[0m'

options=("AppSec" "Scan Boxes" "Anything Can Go Here" "Automation Lab" "Analyze" "Exit Program")
echo -e "\e[0;34m---------------\033[0m"
echo -e "\e[0;35mTmux Workspaces\033[0m"
echo -e "\e[0;34m---------------\033[0m"
echo " "
select opt in "${options[@]}"; do
	case $opt in
	"AppSec")
		printf "\033c"
		sh "$real_path"/appsec.sh
		break
		;;
	"Scan Boxes")
		printf "\033c"
		sh "$real_path"/scan_boxes.sh
		break
		;;
	"Anything Can Go Here")
		printf "\033c"
		sh "$real_path"/AnythingCanGoHere.sh
		break
		;;
	"Automation Lab")
		printf "\033c"
		sh "$real_path"/AutomationLab.sh
		break
		;;
	"Analyze")
		printf "\033c"
		sh "$real_path"/analyze.sh
		break
		;;
	"Exit Program")
		printf "\033c"
		exit
		break
		;;
	esac
done

printf "\033c"