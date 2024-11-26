# To download your project from Google Drive using rclone, you can use the rclone copy command to transfer files from the remote
# Google Drive path to your local machine. Here's how you can do it:                                                            
# 
#  1 Define the local destination path where you want to download the project. For example:                                     
                                                                                                                               
local_path="$HOME/audio/Test-Artist/$project_name/$session_date/"                                           
                                                                                                                               
#  2 Use rclone copy to download the project:                                                                                   
                                                                                                                               
rclone copy "$gdrive_path" "$local_path"                                                                                  
                                                                                                                               
# 
# This command will copy all files from the specified Google Drive path to your local directory. Make sure the local path exists
# or create it before running the command.                                                                                      
