if [ "$1" = "" ]; then
    echo "usage: $0 input_file(compulsory) username(compulsory)" 1>&2
    exit 1
fi
if [ "$2" = "" ]; then
    echo "usage: $0 input_file(compulsory) username(compulsory)" 1>&2
    exit 1
fi
if [[ $1 == *.txt ]]; then

  grep -w "$2" $1 | while IFS=':' read USR PSWD USRID GRPID DESC HOMEDIR SHL
  do
          echo -e "\tFull Name : $DESC"

  done

else
  
  echo "$1 is not a text file" 1>&2
  exit 1

fi
