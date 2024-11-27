#!/bin/bash                                                                                                          
                                                                                                                     
# Database credentials                                                                                               
USERNAME="jnash"                                                                                                     
PASSWORD="x"                                                                                                         
HOST="localhost"                                                                                                     
DATABASE="xuuki"                                                                                                     
                                                                                                                     
# Project name                                                                                                       
PROJ="My-Test-MMW-Proj"                                                                                              
                                                                                                                     
# Get list of sessions from Google Drive                                                                             
gdrive_sessions=$(rclone lsf "gdrive:Source/audio/$PROJ" | tr -d '/')                                                
                                                                                                                     
# Get list of sessions from the database                                                                             
db_sessions=$(mariadb -u "$USERNAME" -p"$PASSWORD" -h "$HOST" "$DATABASE" -se "SELECT session_date FROM projects WHERE project_name='$PROJ';")                                                                                              
                                                                                                                     
# Compare and delete missing sessions from the database                                                              
for session in $db_sessions; do                                                                                      
  if ! echo "$gdrive_sessions" | grep -q "$session"; then                                                            
    echo "Session $session not found on Google Drive. Removing from database."                                       
    mysql -u "$USERNAME" -p"$PASSWORD" -h "$HOST" "$DATABASE" -e "DELETE FROM projects WHERE project_name='$PROJ' AND session_date='$session';"                                                                                            
  fi                                                                                                                 
done                                                                                                                 
                                                                                                                     

# Instructions:                                                                                                         
# 
#  1 Save the script to a file, e.g., sync_gdrive_db.sh.                                                                
#  2 Make it executable: chmod +x sync_gdrive_db.sh.                                                                    
#  3 Run the script: ./sync_gdrive_db.sh.                                                                               
# 
# This script will check for any sessions in the database that are not present on Google Drive and remove them from the 
# database. Adjust the script as needed for your specific setup.                                                        
