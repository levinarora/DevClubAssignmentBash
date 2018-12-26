if [ "$1" = "" ]; then
    echo "usage: $0 input_file(compulsory) " 1>&2
    exit 1
fi
if [[ $1 == *.txt ]]; then
  sed -i '' 's/\*/\\*/g' "$1"
  result=0
  var1="+"
  count=0
  for word in $(cat "$1") ; do
    count=$(($count + 1))
    if [ $((count%2)) == 0 ] ; then
      case "$var1" in
        "+" | "-" | "/" )
          result=$(($result $var1 $var2))
          ;;
        * )
          result=$(($result * $var2))
          ;;
      esac
      var1=$word
    else
      var2=$word
    fi
  done
  case "$var1" in
    "+" | "-" | "/" )
      result=$(($result $var1 $var2))
      ;;
    * )
      result=$(($result * $var2))
      ;;
  esac
  echo "final result is $result"
else
  echo "$1 is not a text file" 1>&2
  exit 1
fi
