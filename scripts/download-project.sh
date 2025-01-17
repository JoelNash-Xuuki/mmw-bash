#!/bin/bash                                                                           
                                                                                      
# Prompt for project name and session date                                            
read -p "Enter project name: " project_name                                           
read -p "Enter session date (format: YYYYMMDD-HHMMSS): " session_date                 
                                                                                      
# Define local path                                                                   
local_path="$HOME/audio/Test-Artist/$project_name/$session_date/"                     
                                                                                      
# Define Google Drive path                                                            
gdrive_path="gdrive:Source/audio/$project_name/$session_date/"                        
                                                                                      
# Create local directory if it doesn't exist                                          
mkdir -p "$local_path"                                                                
                                                                                      
# Use rclone to copy files from Google Drive to local path                            
rclone copy "$gdrive_path" "$local_path"                                              
                                                                                      
echo "Download complete: $local_path"                                                 
