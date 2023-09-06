#!/bin/bash
##this script will only work if package SSHPass is downloaded. 
#for this to work. You would need to go into the config file to ensure that it works and that password is required
#additionally, I have to  be mindful about the public key  as well
#creating a page that allows the users to select SSH or SCP

echo '1 - ssh'
echo '2 - scp'
echo 'Select an option to continue'
read varname #reading the user input

#creating a condition statement to see if it equal 1 or 2
#if the user want ssh then it would start this if loop
if [[ $varname -eq 1 ]] 
then
        echo 'Please enter remote system ip address'
        read ipaddress
        echo 'Please enter the user name'
        read username
        echo $username'@'$ipaddress"'s password:"
        read -s password
        #this would ssh with the password into another user
        sshpass -p $password ssh $username@$ipaddress
#if user want SCP then this would start        
elif [[ $varname -eq 2 ]] 
then
        echo 'Please enter remote system ip address'
        read ipaddress
        echo 'Please enter the user name'
        read username
        echo -e '1 - local \U2192 remote'
        echo -e '2 - remote \U2192 local'
        echo 'Please choose an option'
        read option
        #put 2 option here for each different source and destination
        if [[ $option -eq 1 ]]
        then 
                echo 'Please enter source file location and file name'
                read sfile
                echo 'Please enter destination file location'
                read dfile
                echo $username'@'$ipaddress"'s password:"
                read -s password
                scp sfile $username'@'$ipaddress':'dfile
        elif [[ $option -eq 2]]
        then 
                echo 'Please enter source file location and file name'
                read sfile
                echo 'Please enter destination file location'
                read dfile
                echo $username'@'$ipaddress"'s password:"
                read -s password
                scp $username'@'$ipaddress':'sfile dfile 
        else 
                echo 'N/A'
        fi
else 
        echo 'N/A'
fi
