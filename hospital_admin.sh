#!/bin/bash

# KNH Admin setup script
# Members 1(David), 2(Bill), 3(Neema)

dir_active_logs="active_logs"
dir_archived_logs="archived_logs"
dir_reports="reports"

create_if_missing(){
# helper function to check if the arguments passed (the directories) exists if not tell the user and then create them 1 by 1

if [ -d "$1" ]; then
   echo "$1 already exists."
else
   echo "Creating $1 directory."
   mkdir -p "$1"
   if [ -d "$1" ]; then
       echo "$1 has been created."    
   else
       echo "Process not complete: an error occurred while creating $1."
   fi
fi       
}

initialize_system() {
    create_if_missing "$dir_active_logs"
    create_if_missing "$dir_archived_logs"
    create_if_missing "$dir_reports"
}

initialize_system

#Member 2 Security Lead
secure_data() {
   echo ""
   echo "== Securing active_logs =="

   chmod 700 active_logs

   if [ -n "$(ls -A active_logs 2>/dev/null)" ]; then
       chmod 600 active_logs/*
   fi

   echo "Updated permissions for active_logs:"
   ls -ld active_logs
   ls -l active_logs

