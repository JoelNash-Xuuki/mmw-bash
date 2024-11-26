
# Define variables                                                                       
PROJ="My-Test-MMW-Proj"                                                                  
project_name="$PROJ"                                                                     
session_date="$(date +"%Y%m%d-%H%M%S")"                                                  
gdrive_path="gdrive:Source/audio/$project_name/$session_date/"                           

# Create the directory structure on Google Drive                                         
rclone mkdir "$gdrive_path"                                                              
rclone copy "$HOME/audio/Test-Artist/$PROJ" "$gdrive_path"                         
rclone ls "$gdrive_path"                                                                 
 
# Database credentials                                                                   
USERNAME="jnash"                                                                         
PASSWORD="x"                                                                             
HOST="localhost"                                                                         
DATABASE="xuuki"                                                                         
                                                                                           
# SQL command                                                                            
SQL_COMMAND="INSERT INTO projects (project_name, session_date, gdrive_path) VALUES       
('$project_name', '$session_date', '$gdrive_path');"                                     
                                                                                         
# Execute SQL command                                                                    
echo "$SQL_COMMAND" | mariadb -u "$USERNAME" -p"$PASSWORD" -h "$HOST" "$DATABASE"        
