#/bin/bash

conky -d
result=$?
while [ $result -neq 0 ]
do
    conky -d
    result=$?
done

