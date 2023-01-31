#!/bin/bash
function try(){
echo "$(ls -ltr)" > list
}

function itra(){
whiptail --title "CONFIRMATION" --yesno "Should I proceed" 8 78 
if [[ $? -eq 0 ]]; then 
  advancedMenu 
elif [[ $? -eq 1 ]]; then 
  whiptail --title "MESSAGE" --msgbox "Cancelling Process since user pressed <NO>." 8 78 
elif [[ $? -eq 255 ]]; then 
  whiptail --title "MESSAGE" --msgbox "User pressed ESC. Exiting the script" 8 78 
fi 
}
function changeMod(){
Adv=$(whiptail --title "chmod menu" --fb --menu "select options" 17 60 4 \
"1" "change owner permission" \
"2" "change group permission" \
"3" "change other permission" 3>&1 1>&2 2>&3)

case $Adv in

1)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "use rwx as read,write,execute right to owner (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod u-$permission $File_Name)
whiptail --title "make fiel" --msgbox "$permission given to owner for $File_Name" 10 45
itra
;;

2)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "enter rwx to give read write and execute right to group (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod g-$permission $File_Name)
whiptail --title "make fiel" --msgbox "$permission given to group for $File_Name" 10 45
itra
;;

3)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "enter rwx to give read write and execute right to other (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod o-$permission $File_Name)
whiptail --title "result" --msgbox "$permission given to other for $File_Name" 10 45
itra
;;

esac
}

function changeModAdd(){
Adv=$(whiptail --title "chmod menu" --fb --menu "select options" 17 60 4 \
"1" "change owner permission" \
"2" "change group permission" \
"3" "change other permission" 3>&1 1>&2 2>&3)

case $Adv in

1)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "enter rwx to give read write and execute right to owner (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod u+$permission $File_Name)
whiptail --title "make fiel" --msgbox "$permission given to owner for $File_Name" 10 45
itra
;;

2)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "enter rwx to give read write and execute right to group (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod g+$permission $File_Name)
whiptail --title "make fiel" --msgbox "$permission given to group for $File_Name" 10 45
itra
;;

3)
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
permission=$(whiptail --title "permission type" --inputbox "enter rwx to give read write and execute right to other (if no right is to be given put (-))" 12 50 3>&1 1>&2 2>&3)
$(chmod o+$permission $File_Name)
whiptail --title "result" --msgbox "$permission given to other for $File_Name" 10 45
itra
;;

esac
}


function advancedMenu() {
ADVSEL=$(whiptail --title "Menu"--fb  --menu "Select options" 17 60 6 \
"1" "list file" \
"2" "ip address" \
"3" "user" \
"4" "pwd" \
"5" "login user" \
"6" "make file" \
"7" "make directory" \
"8" "remove file" \
"9" "remove directory" \
"10" "file detail" \
"11" "host name" \
"12" "number of line in file" \
"13" "change owner" \
"14" "change group" \
"15" "change file permission" 3>&1 1>&2 2>&3)

case $ADVSEL in 

1)
echo "Options 1"
try
whiptail --textbox --scrolltext list 20 80
itra
;;

2)
echo "Option 2"
whiptail --title "ip address" --msgbox "$(ip addr |grep "dynamic enp0s3" | awk '{print $2}')" 8 45
itra
;;

3)
echo "Option 3"
NEW_USER=$(whiptail --title "name" --inputbox "enter your name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "user" --msgbox "$NEW_USER" 8 45
itra
;;

4)
echo "Option 4"
whiptail --title "Option 4" --msgbox "$(pwd)" 8 45
itra
;;

5)
echo "Option 5"
whiptail --title "login user" --msgbox "$(whoami)" 8 45
itra
;;

6)
echo "Option 6"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "make fiel" --msgbox "$(touch $File_Name) created file $File_Name" 8 45
itra
;;

7)
echo "Option 7"
File_Name=$(whiptail --title "directory name" --inputbox "enter directory name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "make fiel" --msgbox "$(mkdir $File_Name) created directory $File_Name" 8 45
itra
;;

8)
echo "Option 8"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "make fiel" --msgbox "$(rm $File_Name)removed $File_Name" 8 45
itra
;;

9)
echo "Option 9"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "make fiel" --msgbox "$(rm -r $File_Name)removed $File_Name" 8 45
itra
;;

10)
echo "Option 10"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
detail=$(getfacl $File_Name)
whiptail --title "make fiel" --msgbox "$detail" 20 45
itra
;;

11)
echo "Option 11"
whiptail --title "Option 4" --msgbox "name of the host computer is $(hostname)" 8 45
itra
;;

12)
echo "Option 12"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
detail=$(wc -l $File_Name)
whiptail --title "make fiel" --msgbox "no of line = $detail" 10 45
itra
;;

13)
echo "Option 13"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
Owner=$(whiptail --title "Owner name" --inputbox "enter Owner name" 8 40 3>&1 1>&2 2>&3)
$(chown $Owner $File_Name)
whiptail --title "change owner" --msgbox "owner of $File_Name is $Owner" 10 45
itra
;;

14)
echo "Option 14"
File_Name=$(whiptail --title "file name" --inputbox "enter file name" 8 40 3>&1 1>&2 2>&3)
group=$(whiptail --title "group name" --inputbox "enter group name" 8 40 3>&1 1>&2 2>&3)
whiptail --title "make fiel" --msgbox "changed group to $group" 10 45
itra
;;

15)
TEST=$(whiptail --title "Menu"--fb  --menu "Select options" 17 60 6 \
"1" "add permission" \
"2" "remove permission"  3>&1 1>&2 2>&3)

case $TEST in 

1)
changeModAdd
;;

2)
changeMod
;;

esac

esac
}
advancedMenu
