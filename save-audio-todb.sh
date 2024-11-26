# Recording this information in a database can be beneficial for tracking and 
# managing your projects. You can store details such as the project name, session  
# date, file paths, and any relevant metadata. This can help in organizing your    
# projects, making it easier to retrieve and manage them later.                    

#!/bin/bash                                                                     
                                                                                
# Create or open the database                                                   
sqlite3 projects.db <<EOF                                                       
CREATE TABLE IF NOT EXISTS projects (                                           
    id INTEGER PRIMARY KEY,                                                     
    project_name TEXT,                                                          
    session_date TEXT,                                                          
    gdrive_path TEXT                                                            
);                                                                              
                                                                                
INSERT INTO projects (project_name, session_date, gdrive_path)                  
VALUES ('$project_name', '$session_date',                                       
'gdrive:Source/audio/$project_name/$session_date/');                            
EOF                                                                             
                                                                                
# 
# This script creates a table if it doesn't exist and inserts a new record with the
# project details. Adjust the database schema and fields as needed for your        
# specific requirements.                                                           
