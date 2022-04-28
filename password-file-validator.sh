#!/bin/bash
option=$1
FILE=$2
password=$1
if [ option="-f" ]
  then
   password= source $FILE
fi
len="${#password}"
int=1

echo -e "\e[1;31m"
if test $len -ge 10 ; then

    echo "$password" | grep -q [0-9]

     if test $? -eq 0 ; then
           echo "$password" | grep -q [A-Z]

                if test $? -eq 0 ; then

                    echo "$password" | grep -q [a-z]
                       if test $? -eq 0 ; then 
                            echo -e "\e[1;32m Strong password"                              
                            int=0
                       else

                         echo "weak password include lower case char"

                       fi
                   else

                     echo "weak password include capital char" 
                 fi
          else

       echo "please include the numbers in password it is weak password"   
     fi

else

    echo "password length should be greater than or equal 10 hence weak password"
fi
echo "exit code = $int"
read
exit int