#! /bin/bash

# This script for userutility  
source /home/scripts/welcome.sh
printf '%0.s-' {0..50}

echo
echo -e ">>> Welcome to userutility <<<\n"
echo "(1) -- Useradd [+] "
echo "(2) -- Userremove [-] "
echo "(3) -- List last created 10 users"
echo "(4) -- Exit"
echo 
while true
do 

read -p "Select your choice..." choice

case $choice in 
1)
add
#read -p "Enter the new username >> " username
#grep -w "^$username" /etc/passwd > /dev/null
#if [ $? -eq 0 ]
#then

#echo "This username is already exist"
#else

#read -p "Enter the passwoed of ur user >> " -s pass
#password=$(echo "$pass" |openssl passwd -1 -stdin)
#useradd -md /home/$username -s /bin/bash $username -p $password
#echo
#echo "Loading...."
#sleep 4
#echo "Everthing is done $username"
#fi

break 
;;

2)
read -p "Enter the user you want to delet >> " name
grep -w "^$name" /etc/passwd > /dev/null
if [ $? -eq 0 ] 
then 
userdel -r -f  $name
echo "The user $name has been removed "
else 
echo "The user $name is already doesn't exist "
fi
break 
;;

3)
printf '%.0s-' {0..50}
echo
tail -10 /etc/passwd | cut -f1 -d':' 
printf '%.0s-' {0..50}
echo
break 
;;

4)
echo "Exiting... "
exit 0
;;

*)
echo "Invaild option .. "
;;

esac

done