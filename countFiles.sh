
if [ ! -d $1 ] ; then
  echo "$1 is not a directory"  1>&2
  exit 1
fi

if [ "$1" = "" ]; then
    echo "usage: $0 directory(compulsory) file_extension" 1>&2
    exit 1
fi


count=0
if [ "$2" = "" ];then

  for filename in $1/* ; do
      fn=$(basename "$filename")
      if [ -f  "$filename" ] ; then
          echo " $fn "
          count=$((count+1))
      fi
  done
  echo "num files: $count"

else

  for filename in $1/*$2 ; do
      fn=$(basename "$filename")
      if [ -f  "$filename" ] ; then
          echo "$fn"
          count=$((count+1))
      fi
  done
  echo "num files: $count"

fi
