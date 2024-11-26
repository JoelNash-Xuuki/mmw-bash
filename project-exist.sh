# To query the database and check if the project name and session date already exist, you   
# can use a SQL SELECT statement. Here's an example of how you might do this in your script:
                                                                                           
PROJ="My-Test-MMW-Proj"                                                                  
project_name="$PROJ" 
HOST="localhost"                                                                         
DATABASE="xuuki"                                                                         
session_date="20241126-125801"

# SQL command to check for existing project                                              
CHECK_SQL="SELECT COUNT(*) FROM projects WHERE project_name='$project_name' AND session_date='$session_date';"                                                           
                                                                                         
# Execute the SQL command and capture the result                                         
EXISTING_COUNT=$(echo "$CHECK_SQL" | mariadb -u "$USERNAME" -p"$PASSWORD" -h "$HOST" "$DATABASE" -N -B)                                                                       
                                                                                         
# Check if the project already exists                                                    
if [ "$EXISTING_COUNT" -gt 0 ]; then 
    echo "Project already exists in the database."                                       
    exit 1                                                                               
else                                                                                     
    echo "Project does not exist. Proceeding with creation."                             
fi                                                                                       
                                                                                         
# 
#                                        Explanation:                                       
# 
#  • SQL Command: The SELECT COUNT(*) query checks for existing entries with the same       
#    project_name and session_date.                                                         
#  • Execution: The result is captured using mariadb with options -N (no column names) and  
#    -B (batch mode) for clean output.                                                      
#  • Condition: If the count is greater than zero, the project already exists, and the      
#    script exits early. Otherwise, it proceeds.                                            
