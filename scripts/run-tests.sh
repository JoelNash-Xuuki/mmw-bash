#!/bin/bash                                                                           
                                                                                      
# Define an array of test files                                                       

tests=("test/mmw-config/mmw-config.bats" 
       "test/mmw/mmw.bats"                            
       "test/mmw/mmw-score.bats" 
       "test/mmw/mmw-sound-design.bats"
       "test/ip/ip.bats"
       "test/ip/random-images.bats"
       "test/ip/moving-image.bats"
)
                                                                                      
# Loop through each test file and run it                                              
for test in "${tests[@]}"; do                                                         
  echo "Running $test..."                                                             
  bats "$test"                                                                        
done                                                                                  
