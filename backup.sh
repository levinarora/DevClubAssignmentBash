if [ $# -ne 2 ]; then
    echo "usage: $0 directory_1 directory_2" 1>&2
    exit 1
fi
if [ ! -d $1 ]; then
    echo "$1 is not a directory!" 1>&2
    exit 1
fi
if [ ! -d $2 ]; then
    echo "$2 is not a directory!" 1>&2
    exit 1
fi



function rec
 {
  missing=""
  for filename in $dir1/* ; do
      fn=$(basename "$filename")
      if [ -f "$filename" ]; then
          if [ ! -f "$dir2/$fn" ]; then
              missing+= "$fn "
              cp "$filename" "$dir2"
          fi
      elif [ -d "$filename" ]; then
        dir1=$filename
          for each in $dir2/* ; do
            if [ -d "$each" ] ; then
              dir2=$each
              missing=""
              rec $dir1 $dir2
              break
            fi
          done
      fi
  done
}




dir1=$1
dir2=$2
rec $dir1 $dir2
dir1=$2
dir2=$1
rec $dir2 $dir1
